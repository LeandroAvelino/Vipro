using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using System.Text;
using System.Security.Cryptography.X509Certificates;
using System.Security.Cryptography.Xml;
using SGELibrary.Businees;
using SGELibrary.Objects;

namespace SGEWeb.Forms
{
    public partial class NotaFiscal : System.Web.UI.Page
    {
        #region variáveis locais
        private enum TipoTela { Emissao, Consulta };
        private const string _msgEmissaoDadosOK = "Dados \"OK\" para emissão";
        private const string _msgEmissaoFaltamDados = "Faltam dados obrigatórios para emissão";
        #endregion

        #region métodos privados
        
        private TipoTela getTipoTela()
        {
            var tpTela = TipoTela.Emissao;

            switch (Request.QueryString["tp"].ToUpper())
            {
                case "EMISSAO":
                    tpTela = TipoTela.Emissao;
                    break;
                case "CONSULTA":
                    tpTela = TipoTela.Consulta;
                    break;
            }

            return tpTela;
        }

        private void loadInputNaturezaOperacao()
        {
            var neg = new NaturezaOperacao();
            inputNaturezaOperacao.DataSource = neg.getLista();
            inputNaturezaOperacao.DataBind();
        }

        private void setTelaEmissao()
        {
            inputDadosAdicionais.Text = "";
            pnlInfPrdSubstTrib.Visible = false;

            var _listaProdutosTratar = new List<ObjPedidoProduto>();
            inputNotaDataEmissao.Text = DateTime.Now.ToShortDateString();
            inputNotaDataSaida.Text = DateTime.Now.ToShortDateString();
            inputNotaHoraSaida.Text = DateTime.Now.ToShortTimeString();

            load_cliente();
            var objCliente = (ObjClienteFull)ViewState["ObjCliente"];

            #region carregando os produtos do(s) pedido(s)
            // recuperando a lista dos pedidos
            var negPedido = new Pedido();
            var lstPedidos = (List<string>)Session["ListaPedidos"];
            var listaProdutos = new List<ObjPedidoProduto>();

            string _pedidos_clientes = "";
            for (int i = 0; i <= lstPedidos.Count - 1; i++)
            {
                var pedNumero = lstPedidos[i].ToString();
                var pedido = negPedido.getDados(int.Parse(pedNumero));

                if (pedido.Pedido.NumeroPedidoCliente != "")
                    _pedidos_clientes += " - " + pedido.Pedido.NumeroPedidoCliente;

                foreach (ObjPedidoProduto prd in pedido.Produtos)
                    listaProdutos.Add(prd);
            }

            if (_pedidos_clientes.Length > 0)
                inputDadosAdicionais.Text += " - Pedido do cliente: " + _pedidos_clientes;

            List<ObjPedidoProduto> lstProdutos = (from lst in listaProdutos
                                                  orderby lst.Produto.Grupo.GrupoDescricao + lst.Produto.Numero + lst.Produto.Marca.Descricao + lst.ValorUnitario
                                                  select lst).ToList();
            #endregion

            #region Carregando os dados do transportador
            inputTranspFrete.SelectedIndex = 1;  // DESTINATÁRIO por default
            inputTranspNome.Text = objCliente.Transportadora;
            inputTranspCnpj.Text = objCliente.TransportadoraCNPJ;
            inputTranspEndereco.Text = objCliente.TransportadoraEndereco;
            inputTranspMunicipio.Text = objCliente.TransportadoraMunicipio;
            inputTranspUF.Text = objCliente.TransportadoraUF;
            inputTranspInscricaoEstadual.Text = objCliente.TransportadoraInscricao;
            inputTranspCodigoAntt.Text = "";
            inputTranspPlacaVeiculo.Text = "";
            inputTranspPlacaVeiculoUF.Text = "";
            inputTranspQuantidade.Text = "";
            inputTranspEspecie.Text = "";
            inputTranspMarca.Text = "";
            inputTranspNumeracao.Text = "";
            inputTranspPesoBruto.Text = "";
            inputTranspPesoLiquido.Text = "";

            // regra para checagem dos dados do transportador.
            imgCheckTransportador.ImageUrl = isCheckDadosTransportador() ? "~/Images/Base/check_small.png" : "~/Images/Base/warning_small.png";
            imgCheckTransportador.ToolTip = isCheckDadosTransportador() ? _msgEmissaoDadosOK : _msgEmissaoFaltamDados;
            #endregion

            #region identificando os produtos para unificar
            var lstProdutosIdenticos = new List<ObjPedidoProduto>();
            foreach (ObjPedidoProduto prd in lstProdutos)
            {
                List<ObjPedidoProduto> produtosEncontrados = (from lst in lstProdutos
                                                              where lst.Produto.CodigoId == prd.Produto.CodigoId
                                                              select lst).ToList();
                if (produtosEncontrados.Count > 1)
                {
                    foreach (ObjPedidoProduto pedPrd in produtosEncontrados)
                    {
                        pedPrd.Identico = true;
                        if (!lstProdutosIdenticos.Contains(pedPrd))
                            lstProdutosIdenticos.Add(pedPrd);
                    }
                }
            }
            lstProdutosIdenticos = (from lst in lstProdutosIdenticos
                                    orderby lst.Produto.CodigoId
                                    select lst).ToList();
            #endregion

            #region identificando os produtos idênticos com mesmo preço para ajuntar em 1 item só
            var _lst_prd_mesmo_valor = new List<ObjPedidoProduto>();
            foreach (ObjPedidoProduto prd in lstProdutosIdenticos)
            {
                var _existe = _lst_prd_mesmo_valor.FindIndex(
                                    delegate(ObjPedidoProduto obj)
                                    {
                                        return obj.Produto.CodigoId == prd.Produto.CodigoId;
                                    }
                                );

                if (_existe == -1) // não existe produto na lista tratada
                {
                    _lst_prd_mesmo_valor.Add(prd);
                }
                else
                {
                    _lst_prd_mesmo_valor[_existe].Qtde += prd.Qtde;
                    _lst_prd_mesmo_valor[_existe].ValorTotal = _lst_prd_mesmo_valor[_existe].Qtde * _lst_prd_mesmo_valor[_existe].ValorUnitario;
                }
            }

            // removendo os produtos da lista
            foreach (ObjPedidoProduto prd in _lst_prd_mesmo_valor)
            {
                lstProdutos.RemoveAll(
                    delegate(ObjPedidoProduto obj)
                    {
                        return obj.Produto.CodigoId == prd.Produto.CodigoId;
                    }
                );
            }

            // incluindo na lista os produtos já tratados.
            lstProdutos.AddRange(_lst_prd_mesmo_valor);

            #endregion

            #region identificando os produtos idênticos com preços diferentes
            var lnqProdutosIdenticos = from lst in lstProdutosIdenticos
                                       orderby lst.Produto.CodigoId, lst.ValorUnitario
                                       select lst;

            int _codigoProduto = 0;
            bool _pesquisar = true;
            List<int> _listaTratarProdutos = new List<int>();
            foreach (ObjPedidoProduto prd in lnqProdutosIdenticos)
            {
                if (!_pesquisar && _codigoProduto == prd.Produto.CodigoId)
                    continue;

                _codigoProduto = prd.Produto.CodigoId;

                List<ObjPedidoProduto> lnqPrdDiferente = (from lstDif in lstProdutosIdenticos
                                                          where lstDif.Produto.CodigoId == prd.Produto.CodigoId && lstDif.ValorUnitario != prd.ValorUnitario
                                                          select lstDif).ToList();
                if (lnqPrdDiferente.Count > 0)
                    _listaTratarProdutos.Add(_codigoProduto);

                _pesquisar = (lnqPrdDiferente.Count == 0);
            }
            #endregion

            #region tratando os produtos idênticos com preço diferente.
            foreach (int _codProduto in _listaTratarProdutos)
            {
                _listaProdutosTratar.AddRange(getListaProduto(_codProduto, ref lstProdutosIdenticos));
            }
            #endregion

            #region Listando os produtos
            ViewState["lstProdutos"] = lstProdutos;
            grdProdutos.DataSource = lstProdutos;
            grdProdutos.DataBind();
            checkDadosProdutos();
            #endregion

            #region regra para visualizar o painel de produtos com preço diferente.
            ViewState["listaProdutosTratar"] = _listaProdutosTratar;
            grdPrdDiferente.DataSource = _listaProdutosTratar;
            grdPrdDiferente.DataBind();
            pnlTratarProdutos.Visible = (_listaProdutosTratar.Count > 0);
            #endregion

            #region Regra para visualizar o painel para corrigir UF/Municipio
            var _pnl_ibge = (Panel)IBGE1.FindControl("pnlIBGE");
            _pnl_ibge.Visible = (objCliente.CodigoMunicipioIBGE.Length == 0);
            if (_pnl_ibge.Visible)
            {
                var _inf_uf = (Label)IBGE1.FindControl("inf_cliente_uf");
                var _inf_cidade = (Label)IBGE1.FindControl("inf_cliente_municipio");

                _inf_uf.Text = objCliente.EnderecoUF;
                _inf_cidade.Text = objCliente.EnderecoMunicipio;
            }
            #endregion

            #region Atribuindo os valores de frete, seguro, etc..
            inputImpostoValorFrete.Text = "0,00";
            inputImpostoValorSeguro.Text = "0,00";
            inputImpostoDesconto.Text = "0,00";
            inputImpostoOutrasDespesas.Text = "0,00";
            #endregion

            #region Atribuindo um padrão para o faturamento
            inputFaturamentoForma.SelectedIndex = 1;  // FATURADO
            calcularTotaisNFe();
            inputFaturamentoForma_SelectedIndexChanged(inputFaturamentoForma, new EventArgs());
            calcularFaturamento();
            #endregion
          
        }

        private void load_cliente()
        {
            var negCliente = new Cliente();
            var objCliente = negCliente.getDadosByCodigo(int.Parse(Session["ClienteId"].ToString()));
            ViewState["ObjCliente"] = objCliente;

            inputDestinatarioNome.Text = objCliente.RazaoSocial;
            inputDestinatarioCNPJ.Text = objCliente.CNPJ;
            inputDestinatarioInscricao.Text = objCliente.InscricaoEstadual;
            inputDestinatarioEndereco.Text = objCliente.Endereco;
                inputDestinatarioEndereco.Text += objCliente.EnderecoNro.Length > 0 ? ", " + objCliente.EnderecoNro : "";
            inputDestinatarioBairro.Text = objCliente.EnderecoBairro;
            inputDestinatarioCEP.Text = objCliente.EnderecoCEP;
            inputDestinatarioMunicipio.Text = objCliente.EnderecoMunicipio;
            inputDestinatarioUF.Text = objCliente.EnderecoUF;
            inputDestinatarioFone.Text = objCliente.Telefones[0].Numero;
            inputDestinatarioEmailNFe.Text = objCliente.emailNFe;

            // regra para visualizar imagem de checagem dos dados.
            imgCheckDestinatario.ImageUrl = isCheckDadosDestinatario() ? "~/Images/Base/check_small.png" : "~/Images/Base/warning_small.png";
            imgCheckDestinatario.ToolTip = isCheckDadosDestinatario() ? _msgEmissaoDadosOK : _msgEmissaoFaltamDados;

            // regra para visualizar imagem de checagem do CNPJ.
            imgCheckDestinatarioCNPJ.Visible = (!Regras.ValidarCNPJ(objCliente.CNPJ));

            // regra para identificar o CFOP (venda dentro ou fora do estado)
            string _cfop = (objCliente.EnderecoUF == "SP") ? "5.102" : "6.102";
            inputNaturezaOperacao.SelectedIndex = inputNaturezaOperacao.Items.IndexOf(inputNaturezaOperacao.Items.FindByValue(_cfop));
            inputNaturezaOperacao_SelectedIndexChanged(inputNaturezaOperacao, new EventArgs());
            ViewState["CfopNoEstadoSemST"] = "5.102";
            ViewState["CfopForaEstadoSemST"] = "6.102";
            ViewState["CfopNoEstadoComST"] = "5.405";
            ViewState["CfopForaEstadoComST"] = "6.404";

            // regra para o endereço de entrega
            if (objCliente.LocalEntrega.Length > 0 &&
                objCliente.LocalEntregaBairro.Length > 0 &&
                objCliente.LocalEntregaMunicipio.Length > 0 &&
                objCliente.LocalEntregaUF.Length > 0)
            {
                inputDadosAdicionais.Text += " - Endereço de Entrega: " + objCliente.LocalEntrega + " - " +
                    objCliente.LocalEntregaBairro + " - " + objCliente.LocalEntregaMunicipio + "/" +
                    objCliente.LocalEntregaUF;
            }
        }

        private void calcularFaturamento()
        {
            
            var _listaParcelas = new List<ParcelaFaturamento>();
            var cliente = (ObjClienteFull)ViewState["ObjCliente"];
            
            if (inputImpostoValorTotalNota.Text.Length == 0)
                inputImpostoValorTotalNota.Text = "0";
            decimal _vlrTotalNota = Convert.ToDecimal(inputImpostoValorTotalNota.Text);

            decimal _vlrParcela = 0;

            if (inputFaturamentoForma.SelectedIndex == 0) // A VISTA
            {
                _vlrParcela = _vlrTotalNota;
                _listaParcelas.Add(new ParcelaFaturamento(1, DateTime.Now, _vlrParcela, 0));
            }
            else  // FATURADO
            {
                bool isPadraoCliente = (cliente.PadraoFaturamento.Count > 0);
                int _qtdeParcelas = Convert.ToInt32(inputFaturamentoParcelas.Text);

                #region Calculando o valor das parcelas
                // identificando o valor de cada parcela.
                _vlrParcela = _vlrTotalNota / _qtdeParcelas;
                
                // forçando 2 (duas) casas decimais.
                _vlrParcela = Convert.ToDecimal(_vlrParcela.ToString("F2"));

                // identificando se existe uma diferença na soma das parcelas com o valor total da nota.
                // se existir diferença, a mesma deve ser adicionada na primeira parcela.
                decimal _vlrDiferenca = _vlrTotalNota - (_vlrParcela * _qtdeParcelas);
                #endregion

                // compondo as parcelas.
                var padraoVenctos = Regras.getPadraoVencimentoVipro();
                var padrao = padraoVenctos[padraoVenctos.Count - 1];
                for (int i = 1; i <= _qtdeParcelas; i++)
                {
                    var vencto = DateTime.Now;
                    var dtEmissao = Convert.ToDateTime(inputNotaDataEmissao.Text);
                    int dias = 0;
                    try
                    {
                        dias = padrao.DiasAdd[i - 1];
                    }
                    catch
                    {
                        dias = 0;
                    }
                    
                    vencto = dtEmissao.AddDays(dias);

                    if (i == 1)  // na primeira parcela é aplicada a diferença caso existir.
                        _listaParcelas.Add(new ParcelaFaturamento(i, vencto, _vlrParcela + _vlrDiferenca, dias));
                    else
                        _listaParcelas.Add(new ParcelaFaturamento(i, vencto, _vlrParcela, dias));
                }
            }

            ViewState["FaturamentoParcelas"] = _listaParcelas;
            grdFaturamentoParcelas.DataSource = _listaParcelas;
            grdFaturamentoParcelas.DataBind();

            #region Verificando se o cliente possui um padrão de vencimentos diferente
            pnlFaturamentoClientePadraoVencimento.Visible = (cliente.PadraoFaturamento.Count > 0);
            if (pnlFaturamentoClientePadraoVencimento.Visible)
            {
                infFaturamentoClientePadraoVencimento.Text = "Padrão no dia: ";
                foreach (int i in cliente.PadraoFaturamento)
                {
                    if (i == 0)
                        continue;
                    infFaturamentoClientePadraoVencimento.Text += i.ToString() + ", ";
                }
                string _padrao = infFaturamentoClientePadraoVencimento.Text.Remove(infFaturamentoClientePadraoVencimento.Text.Length - 2);
                infFaturamentoClientePadraoVencimento.Text = _padrao;
            }
            #endregion
        }

        private bool isCheckDadosDestinatario()
        {
            return (inputDestinatarioNome.Text.Trim().Length > 0 &&
                    inputDestinatarioCNPJ.Text.Trim().Length > 0 &&
                    inputDestinatarioInscricao.Text.Trim().Length > 0 &&
                    inputDestinatarioEndereco.Text.Trim().Length > 0 &&
                    inputDestinatarioBairro.Text.Trim().Length > 0 &&
                    inputDestinatarioCEP.Text.Trim().Length > 0 &&
                    inputDestinatarioMunicipio.Text.Trim().Length > 0 &&
                    inputDestinatarioUF.Text.Trim().Length > 0 &&
                    inputDestinatarioEmailNFe.Text.Trim().Length > 0);
        }

        private bool isCheckDadosTransportador()
        {
            var cliente = (ObjClienteFull)ViewState["ObjCliente"];

            if (cliente.TransportadoraCodigoID == 0)
                return true;
            else
            {
                return (inputTranspNome.Text.Trim().Length > 0 &&
                        inputTranspCnpj.Text.Trim().Length > 0 &&
                        inputTranspEndereco.Text.Trim().Length > 0 &&
                        inputTranspMunicipio.Text.Trim().Length > 0 &&
                        inputTranspUF.Text.Trim().Length > 0 &&
                        inputTranspInscricaoEstadual.Text.Trim().Length > 0
                        );
            }

        }

        private bool checkDadosProdutos()
        {
            bool result = true;
            var produtos = (List<ObjPedidoProduto>)ViewState["lstProdutos"];

            foreach (ObjPedidoProduto prd in produtos)
            {
                result = (prd.Qtde > 0 &&
                          prd.Produto.CodClassFiscal.Length > 0 &&
                          prd.Produto.CCST.Length > 0 &&
                          prd.ValorUnitario > 0);
                if (!result)
                    break;
            }

            // regra para visualizar imagem de checagem dos dados.
            imgCheckProdutos.ImageUrl = result ? "~/Images/Base/check_small.png" : "~/Images/Base/warning_small.png";
            imgCheckProdutos.ToolTip = result ? _msgEmissaoDadosOK : _msgEmissaoFaltamDados;

            return result;
        }

        private List<ObjPedidoProduto> getListaProduto(int codigoProduto, ref List<ObjPedidoProduto> lista)
        {

            List<ObjPedidoProduto> result = (from lst in lista
                                             where lst.Produto.CodigoId == codigoProduto
                                             orderby lst.ValorUnitario
                                             select lst).ToList();

            return result;
        }

        private System.Drawing.Color getCorProdutoSubstTributaria()
        {
            return System.Drawing.Color.Orange;
        }

        /// <summary>
        /// Executar os cálculos que somam os totais e os impostos da NF-e.
        /// </summary>
        private void calcularTotaisNFe()
        {
            decimal _vlrTotalProdutos = 0;
            decimal _vlrIpi = 0;
            decimal _vlrTotalNF = 0;
            decimal _vlrBaseIcms = 0;
            decimal _vlrIcms = 0;

            foreach (ObjPedidoProduto prd in (List<ObjPedidoProduto>)ViewState["lstProdutos"])
            {
                _vlrTotalProdutos += prd.ValorTotal;

                // Calculando o valor do IPI
                _vlrIpi += ((prd.ValorTotal * prd.Produto.IPI_Aliquota) / 100);

                // calculando a base de cálculo do ICMS e o valor do ICMS
                _vlrBaseIcms += prd.Produto.ICMS_Aliquota > 0 ? prd.ValorTotal : 0;
                _vlrIcms += ((prd.ValorTotal * prd.Produto.ICMS_Aliquota) / 100);
            }

            // incidindo na base de cálculo do ICMS os demais valores
            _vlrBaseIcms += Convert.ToDecimal(inputImpostoValorFrete.Text) +
                    Convert.ToDecimal(inputImpostoValorSeguro.Text) +
                    Convert.ToDecimal(inputImpostoOutrasDespesas.Text);
            
            // calculando o valor do ICMS conforme as condições dos valores adicionais.
            decimal _AliquotaIcms = Regras.getAliquotaIcms(((ObjClienteFull)ViewState["ObjCliente"]).EnderecoUF);
            if (Convert.ToDecimal(inputImpostoValorFrete.Text) > 0)
                _vlrIcms += ((Convert.ToDecimal(inputImpostoValorFrete.Text) * _AliquotaIcms) / 100);
            if (Convert.ToDecimal(inputImpostoValorSeguro.Text) > 0)
                _vlrIcms += ((Convert.ToDecimal(inputImpostoValorSeguro.Text) * _AliquotaIcms) / 100);
            if (Convert.ToDecimal(inputImpostoOutrasDespesas.Text) > 0)
                _vlrIcms += ((Convert.ToDecimal(inputImpostoOutrasDespesas.Text) * _AliquotaIcms) / 100);

            // apresentando e formatando os valores
            inputImpostoBaseCalculoIcms.Text = String.Format("{0:f2}", _vlrBaseIcms);
            inputImpostoValorIcms.Text = String.Format("{0:f2}", _vlrIcms);
            inputImpostoBaseCalculoIcmsSt.Text = "0,00";
            inputImpostoValorIcmsSt.Text = "0,00";
            inputImpostoValorTotalProdutos.Text = String.Format("{0:f2}", _vlrTotalProdutos);
            inputImpostoValorTotalIpi.Text = String.Format("{0:f2}", _vlrIpi);

            // calculando o valor total da nota.
            _vlrTotalNF += _vlrTotalProdutos +
                Convert.ToDecimal(inputImpostoValorFrete.Text) +
                Convert.ToDecimal(inputImpostoValorSeguro.Text) -
                Convert.ToDecimal(inputImpostoDesconto.Text) +
                Convert.ToDecimal(inputImpostoOutrasDespesas.Text) +
                _vlrIpi +
                Convert.ToDecimal(inputImpostoValorIcmsSt.Text);
            inputImpostoValorTotalNota.Text = String.Format("{0:f2}", _vlrTotalNF);
        }

        /// <summary>
        /// Definir o número da NFe
        /// </summary>
        private void setNumeroNFe()
        {
            // verifica se a NFe já possui um número
            if (inputNotaNumero.Text.Length > 0)
                return;

            // atribuindo um número para a NFe
            var _cfg = ConfiguracoesParametros.getConfiguracoes();
            inputNotaNumero.Text = (_cfg.NumeroUltimaNFeEmitida + 1).ToString();
        }

        /// <summary>
        /// Carregar objeto da nota fiscal.
        /// </summary>
        private void loadObjNFe()
        {
            var _nfe = new ObjNotaFiscal();
            var _cliente = (ObjClienteFull)ViewState["ObjCliente"];

            #region carregando dados base
            _nfe.Base.Representante = 3;  // default EDU
            _nfe.Base.saida_entrada = inputNotaOrigem.SelectedIndex == 0 ? "ENTRADA" : "SAIDA";
            if (inputNotaNumero.Text.Length == 0)
                setNumeroNFe();
            try { _nfe.Base.nota_numero = int.Parse(inputNotaNumero.Text); } catch { _nfe.Base.nota_numero = 0; }
            _nfe.Base.data_emissao = DateTime.Parse(inputNotaDataEmissao.Text);
            _nfe.Base.natureza_operacao = infNaturezaOperacaoNF.Text.ToUpper();
            _nfe.Base.CFOP = inputNaturezaOperacao.SelectedValue;
            _nfe.Base.tipo_pagamento = inputFaturamentoForma.SelectedValue.ToUpper();
            _nfe.Base.tipo_cobranca = inputFaturaTipoCobranca.SelectedValue.ToUpper();
            _nfe.Base.qtd_parcelas_pagamento = int.Parse(inputFaturamentoParcelas.Text);
            _nfe.Base.valor_total_nf = decimal.Parse(inputImpostoValorTotalNota.Text);
            _nfe.Base.tipo_frete = inputTranspFrete.SelectedItem.Text.ToUpper();
            _nfe.Base.volume_quantidade = inputTranspQuantidade.Text;
            _nfe.Base.volume_especie = inputTranspEspecie.Text;
            _nfe.Base.volume_marca = inputTranspMarca.Text;
            _nfe.Base.volume_numero = inputTranspNumeracao.Text;
            _nfe.Base.volume_peso_bruto = inputTranspPesoBruto.Text;
            _nfe.Base.volume_peso_liquido = inputTranspPesoLiquido.Text;
            _nfe.Base.informacoes_adicionais = inputDadosAdicionais.Text;
            #endregion

            #region carregando dados do transportador
            _nfe.Transportador.CodigoID = _cliente.TransportadoraCodigoID;
            #endregion

            #region carregando dados do destinatário.
            _nfe.Destinatario.propCodigoID = _cliente.CodigoID;
            _nfe.Destinatario.propBairro = inputDestinatarioBairro.Text;
            _nfe.Destinatario.propCEP = inputDestinatarioCEP.Text;
            _nfe.Destinatario.propCNPJ = inputDestinatarioCNPJ.Text;
            _nfe.Destinatario.propEmailNFe = inputDestinatarioEmailNFe.Text;
            _nfe.Destinatario.propEndereco = _cliente.Endereco;
            _nfe.Destinatario.propEnderecoNro = _cliente.EnderecoNro;
            _nfe.Destinatario.propInscrEstadual = inputDestinatarioInscricao.Text;
            _nfe.Destinatario.propMunicipio = inputDestinatarioMunicipio.Text;
            _nfe.Destinatario.propMunicipioCodigoIBGE = _cliente.CodigoMunicipioIBGE;
            _nfe.Destinatario.propRazaoSocial = inputDestinatarioNome.Text;
            _nfe.Destinatario.propTelefone = inputDestinatarioFone.Text;
            _nfe.Destinatario.propUF = inputDestinatarioUF.Text;
            _nfe.Destinatario.propTipoPessoa = _cliente.TipoPessoa;
            #endregion

            #region carregando dados dos produtos
            _nfe.Produtos.Clear();
            foreach (ObjPedidoProduto _prd in (List<ObjPedidoProduto>)ViewState["lstProdutos"])
                _nfe.Produtos.Add(_prd);
            #endregion

            #region carregando os totais
            _nfe.Totais.base_icms = decimal.Parse(inputImpostoBaseCalculoIcms.Text);
            _nfe.Totais.icms = decimal.Parse(inputImpostoValorIcms.Text);
            _nfe.Totais.produtos = decimal.Parse(inputImpostoValorTotalProdutos.Text);
            _nfe.Totais.frete = decimal.Parse(inputImpostoValorFrete.Text);
            _nfe.Totais.seguro = decimal.Parse(inputImpostoValorSeguro.Text);
            _nfe.Totais.outros = decimal.Parse(inputImpostoOutrasDespesas.Text);
            _nfe.Totais.ipi = decimal.Parse(inputImpostoValorTotalIpi.Text);
            _nfe.Totais.base_icms_st = decimal.Parse(inputImpostoBaseCalculoIcmsSt.Text);
            _nfe.Totais.icms_st = decimal.Parse(inputImpostoValorIcmsSt.Text);
            #endregion

            #region carregando os dados de cobrança
            _nfe.Cobranca.Clear();
            foreach (GridViewRow row in grdFaturamentoParcelas.Rows)
            {
                string _vlr = ((Label)row.FindControl("infFaturaValor")).Text.Replace("R$ ", "").Replace(".", "");
                var _parc = new ObjNotaFiscalCobrancaParcela();

                _parc.numero = int.Parse(((Label)row.FindControl("infFaturaNumParcela")).Text);
                _parc.letra = Util.get_letra_parcela(_parc.numero);
                _parc.vencimento = DateTime.Parse(((TextBox)row.FindControl("inputFaturaVencimento")).Text);
                _parc.valor = decimal.Parse(_vlr);
                _parc.posicao = 1;

                _nfe.Cobranca.Add(_parc);
            }
            #endregion

            #region carregando os dados do pedidos a serem baixados
            _nfe.ListaPedidos = (List<string>)Session["ListaPedidos"];
            #endregion

            // gravando o obj para recuperação posterior.
            ViewState["ObjNF"] = _nfe;
        }

        /// <summary>
        /// Retornar a quantidade de produtos da NFe que não tem ST.
        /// </summary>
        /// <returns></returns>
        private int get_qtd_produtos_sem_ST()
        {
            var _lst_prd = (List<ObjPedidoProduto>)ViewState["lstProdutos"];
            var _qry = from _lst in _lst_prd
                       where _lst.Produto.CCST.Substring(1, 2) == "00"
                       select _lst;
            return _qry.Count();
        }

        /// <summary>
        /// Gerar a chave de acesso da NFe
        /// </summary>
        /// <returns></returns>
        private string get_chave_acesso()
        {
            string result = "";
            int digito = 0;
            var nfe = (ObjNotaFiscal)ViewState["ObjNF"];

            result = "35";  // código da UF
            result += inputNotaDataEmissao.Text.Substring(8, 2) + inputNotaDataEmissao.Text.Substring(3, 2);  // ano e mês da emissão.
            result += nfe.Emitente.propCNPJ;  // CNPJ do emitente.
            result += "55";  // modelo do documento fiscal.
            result += "000";  // série do documento fiscal.
            result += String.Format("{0:000000000}", int.Parse(inputNotaNumero.Text));  // número da nota fiscal.
            result += "1";  // tipo de emissão 1 = normal.
            result += String.Format("{0:00000000}", int.Parse(inputNotaNumero.Text));  // código númerico.

            digito = geraDigMod11(result);

            result += digito.ToString();

            return result;
        }

        /// <summary>
        /// Gerar o dígito verificador para NFe
        /// </summary>
        /// <param name="strText">Chave de acesso parcial sem o digito.</param>
        /// <returns></returns>
        private int geraDigMod11(string strText)
        {
            int[] intPesos = { 2, 3, 4, 5, 6, 7, 8, 9, 2, 3, 4, 5, 6, 7, 8, 9 };

            int intSoma = 0;
            int intIdx = 0;

            for (int intPos = strText.Length - 1; intPos >= 0; intPos--)
            {
                intSoma += Convert.ToInt32(strText[intPos].ToString()) * intPesos[intIdx];
                if (intIdx == 9)
                {
                    intIdx = 2;
                }
                else
                {
                    intIdx++;
                }
            }

            int intResto = (intSoma * 10) % 11;
            int intDigito = intResto;
            if (intDigito >= 10)
                intDigito = 0;

            return intDigito;
        }
        
        #endregion
       
        protected void Page_Load(object sender, EventArgs e)
        {
            // Adicionando evento ao botão salvar do IBGE para
            // dar refresh nos dados do cliente.
            var _btn = (LinkButton)IBGE1.FindControl("btn_salvar");
            _btn.Click += btn_gravar_municipio_click;

            if (IsPostBack)
                return;

            loadInputNaturezaOperacao();

            if (getTipoTela() == TipoTela.Emissao)
                setTelaEmissao();
        }
        
        protected void grdProdutos_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType != DataControlRowType.DataRow)
                return;

            ((Label)e.Row.FindControl("infGrdProdutoGrupo")).Text = ((ObjProduto)grdProdutos.DataKeys[e.Row.RowIndex]["Produto"]).Grupo.GrupoDescricao;
            ((Label)e.Row.FindControl("infGrdProdutoProduto")).Text = ((ObjProduto)grdProdutos.DataKeys[e.Row.RowIndex]["Produto"]).Numero;
            ((Label)e.Row.FindControl("infGrdProdutoMarca")).Text = ((ObjProduto)grdProdutos.DataKeys[e.Row.RowIndex]["Produto"]).Marca.Descricao;
            ((Label)e.Row.FindControl("infGrdProdutoNCM")).Text = ((ObjProduto)grdProdutos.DataKeys[e.Row.RowIndex]["Produto"]).CodClassFiscal;
            ((Label)e.Row.FindControl("infGrdProdutoSitTrib")).Text = ((ObjProduto)grdProdutos.DataKeys[e.Row.RowIndex]["Produto"]).CCST;
            ((Label)e.Row.FindControl("infGrdProdutoVlrUnitario")).Text = String.Format("{0:C2}", grdProdutos.DataKeys[e.Row.RowIndex]["ValorUnitario"]);
            ((Label)e.Row.FindControl("infGrdProdutoVlrTotal")).Text = String.Format("{0:C2}", grdProdutos.DataKeys[e.Row.RowIndex]["ValorTotal"]);
            ((Label)e.Row.FindControl("infGrdProdutoIPI")).Text = ((ObjProduto)grdProdutos.DataKeys[e.Row.RowIndex]["Produto"]).IPI_Aliquota.ToString();
            
            // Regra para informar o CFOP correto.
            bool _isProdutoComST = ((ObjProduto)grdProdutos.DataKeys[e.Row.RowIndex]["Produto"]).SubstituicaoTributaria.ExecutaCalculoSubstituicao;
            var _lblCfop = (Label)e.Row.FindControl("infGrdProdutoCFOP");
            var objCliente = (ObjClienteFull)ViewState["ObjCliente"];
            if (objCliente.EnderecoUF == "SP" && !_isProdutoComST)
                _lblCfop.Text = ViewState["CfopNoEstadoSemST"].ToString();
            if (objCliente.EnderecoUF == "SP" && _isProdutoComST)
                _lblCfop.Text = ViewState["CfopNoEstadoComST"].ToString();
            if (objCliente.EnderecoUF != "SP" && !_isProdutoComST)
                _lblCfop.Text = ViewState["CfopForaEstadoSemST"].ToString();
            if (objCliente.EnderecoUF != "SP" && _isProdutoComST)
                _lblCfop.Text = ViewState["CfopForaEstadoComST"].ToString();

            ((ObjProduto)grdProdutos.DataKeys[e.Row.RowIndex]["Produto"]).CFOP = _lblCfop.Text;

            // Regra para identificar se aplica a aliquota de ICMS.
            if (_isProdutoComST)
                ((ObjProduto)grdProdutos.DataKeys[e.Row.RowIndex]["Produto"]).ICMS_Aliquota = 0;
            ((Label)e.Row.FindControl("infGrdProdutoICMS")).Text = ((ObjProduto)grdProdutos.DataKeys[e.Row.RowIndex]["Produto"]).ICMS_Aliquota.ToString();

            // mudando a cor de fundo da coluna do grid caso for produto com substituição tributária.
            if (_isProdutoComST)
            {
                e.Row.Cells[5].BackColor = getCorProdutoSubstTributaria();
                e.Row.Cells[6].BackColor = e.Row.Cells[5].BackColor;
                e.Row.Cells[9].BackColor = e.Row.Cells[5].BackColor;
                pnlInfPrdSubstTrib.Visible = true;
            }
        }

        protected void grdPrdDiferente_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType != DataControlRowType.DataRow)
                return;

            // preenchendo os campos com as informações.
            ((Label)e.Row.FindControl("infGrdProdutoPedido")).Text = grdPrdDiferente.DataKeys[e.Row.RowIndex]["PedidoNumero"].ToString();
            ((Label)e.Row.FindControl("infGrdProdutoQtde")).Text = grdPrdDiferente.DataKeys[e.Row.RowIndex]["Qtde"].ToString();
            ((Label)e.Row.FindControl("infGrdProdutoGrupo")).Text = ((ObjProduto)grdPrdDiferente.DataKeys[e.Row.RowIndex]["Produto"]).Grupo.GrupoDescricao;
            ((Label)e.Row.FindControl("infGrdProdutoProduto")).Text = ((ObjProduto)grdPrdDiferente.DataKeys[e.Row.RowIndex]["Produto"]).Numero;
            ((Label)e.Row.FindControl("infGrdProdutoMarca")).Text = ((ObjProduto)grdPrdDiferente.DataKeys[e.Row.RowIndex]["Produto"]).Marca.Descricao;
            ((Label)e.Row.FindControl("infGrdProdutoVlrUnitario")).Text = String.Format("{0:f2}", grdPrdDiferente.DataKeys[e.Row.RowIndex]["ValorUnitario"]);
            ((TextBox)e.Row.FindControl("inputPrdPrecoDifAlterar")).Text = String.Format("{0:f2}", grdPrdDiferente.DataKeys[e.Row.RowIndex]["ValorUnitario"]);
            ((Label)e.Row.FindControl("infGrdProdutoClassFiscal")).Text = ((ObjProduto)grdPrdDiferente.DataKeys[e.Row.RowIndex]["Produto"]).CodClassFiscal;
            ((Label)e.Row.FindControl("infGrdProdutoCCST")).Text = ((ObjProduto)grdPrdDiferente.DataKeys[e.Row.RowIndex]["Produto"]).CCST;
            ((Label)e.Row.FindControl("infGrdProdutoIPI")).Text = ((ObjProduto)grdPrdDiferente.DataKeys[e.Row.RowIndex]["Produto"]).IPI_Aliquota.ToString();

            // mudando a cor de fundo da coluna do grid caso for produto com substituição tributária.
            if (((ObjProduto)grdPrdDiferente.DataKeys[e.Row.RowIndex]["Produto"]).SubstituicaoTributaria.ExecutaCalculoSubstituicao)
                e.Row.Cells[8].BackColor = getCorProdutoSubstTributaria();
        }

        protected void btnFecharPnlPrecoDif_Click(object sender, EventArgs e)
        {
            #region verificando se foi esquecido de corrigir algum produto com preço diferente.
            bool _isExisteProdutoNaoCorrigido = false;
            bool _fecharPainel = true;
            var lstProdutos = (List<ObjPedidoProduto>)ViewState["listaProdutosTratar"];

            foreach (GridViewRow row in grdPrdDiferente.Rows)
            {
                int _codPrd = ((ObjProduto)grdPrdDiferente.DataKeys[row.RowIndex]["Produto"]).CodigoId;
                decimal _vlrCorrigido = decimal.Parse(((TextBox)row.FindControl("inputPrdPrecoDifAlterar")).Text);

                // procurando o produto no grid para verificar se existem valores que não foram corrigidos.
                _isExisteProdutoNaoCorrigido = false;
                foreach (GridViewRow row2 in grdPrdDiferente.Rows)
                {
                    if (_codPrd == ((ObjProduto)grdPrdDiferente.DataKeys[row2.RowIndex]["Produto"]).CodigoId
                         && _vlrCorrigido != decimal.Parse(((TextBox)row2.FindControl("inputPrdPrecoDifAlterar")).Text))
                    {
                        _isExisteProdutoNaoCorrigido = true;
                    }
                }

                var corNormal = System.Drawing.Color.FromName("0");
                if (_isExisteProdutoNaoCorrigido)
                    row.BackColor = System.Drawing.Color.Red;
                else
                    row.BackColor = corNormal;

                if (_isExisteProdutoNaoCorrigido)
                    _fecharPainel = false;
            }

            pnlTratarProdutos.Visible = (!_fecharPainel);
            #endregion

            #region atualizando os valores do grid de produtos se necessário
            if (!pnlTratarProdutos.Visible)
            {
                var lstPrd = (List<ObjPedidoProduto>)ViewState["lstProdutos"];

                // verificando o grid para atualizar o valor unit. na lista dos produtos.
                int _codPrd = 0;
                foreach (GridViewRow row in grdPrdDiferente.Rows)
                {
                    if (_codPrd == ((ObjProduto)grdPrdDiferente.DataKeys[row.RowIndex]["Produto"]).CodigoId)
                        continue;
                    
                    _codPrd = ((ObjProduto)grdPrdDiferente.DataKeys[row.RowIndex]["Produto"]).CodigoId;
                    decimal _vlrCorrigido = decimal.Parse(((TextBox)row.FindControl("inputPrdPrecoDifAlterar")).Text);

                    var result = lstPrd.FindAll(
                        delegate(ObjPedidoProduto obj)
                        {
                            return obj.Produto.CodigoId == _codPrd;
                        }
                    );

                    // atualizando o valor unitário pelo valor corrigido.
                    decimal _qtde = 0;
                    foreach (ObjPedidoProduto prd in result)
                    {
                        _qtde += prd.Qtde;
                    }
                    result[0].Qtde = _qtde;
                    result[0].ValorUnitario = _vlrCorrigido;
                    result[0].ValorTotal = _vlrCorrigido * _qtde;
                }

                _codPrd = 0;
                var lstCheck = new List<ObjPedidoProduto>();
                lstCheck.AddRange(lstPrd);
                foreach(ObjPedidoProduto pedPrd in lstCheck)
                {
                    if (_codPrd == pedPrd.Produto.CodigoId)
                        lstPrd.Remove(pedPrd);
                    else
                        _codPrd = pedPrd.Produto.CodigoId;
                }

                // atualizando o grid dos produtos.
                ViewState["lstProdutos"] = lstPrd;
                grdProdutos.DataSource = lstPrd;
                grdProdutos.DataBind();
            }
            #endregion

            checkDadosProdutos();
            
            calcularTotaisNFe();
            calcularFaturamento();
        }

        protected void inputFaturamentoForma_SelectedIndexChanged(object sender, EventArgs e)
        {
            inputFaturamentoParcelas.Text = "1";
            inputFaturamentoParcelas.Enabled = (inputFaturamentoForma.SelectedIndex == 1);  // libera se for FATURADO.

            #region Verificando a quantidade de parcelas permitidas se for FATURADO
            if (inputFaturamentoForma.SelectedIndex == 1)
            {
                decimal _vlrTotalNota = Convert.ToDecimal(inputImpostoValorTotalNota.Text);
                var padraoVenctos = Regras.getPadraoVencimentoVipro();
                // Identificando o padrão de vencimentos a ser utilizado conforme a faixa de valor da nota fiscal.
                var padrao = padraoVenctos.Find(
                                delegate(Tipos.PadraoVencimentoVipro pd)
                                {
                                    return pd.ValorFaixaDe <= _vlrTotalNota && pd.ValorFaixaAte >= _vlrTotalNota;
                                }
                );
                int _qtdeParcelas = padrao.DiasAdd.Count;
                inputFaturamentoParcelas.Text = _qtdeParcelas.ToString();
            }
            #endregion

            calcularFaturamento();
        }

        protected void btnFaturamentoCalcularParcelas_Click(object sender, EventArgs e)
        {
            calcularTotaisNFe();
            calcularFaturamento();
        }

        protected void grdFaturamentoParcelas_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType != DataControlRowType.DataRow)
                return;

            var grd = (GridView)sender;

            ((TextBox)e.Row.FindControl("inputFaturaVencimentoDias")).Text = grd.DataKeys[e.Row.RowIndex]["DataVencimentoDias"].ToString();
            ((Label)e.Row.FindControl("infFaturaNumParcela")).Text = grd.DataKeys[e.Row.RowIndex]["NumeroParcela"].ToString();
            ((TextBox)e.Row.FindControl("inputFaturaVencimento")).Text = ((DateTime)grd.DataKeys[e.Row.RowIndex]["DataVencimento"]).ToShortDateString();
            ((Label)e.Row.FindControl("infFaturaValor")).Text = String.Format("{0:c2}", grd.DataKeys[e.Row.RowIndex]["ValorParcela"]);
        }

        protected void grdFaturamentoParcelas_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "calcularDias")
            {
                int idx = Convert.ToInt32(e.CommandArgument);
                var row = grdFaturamentoParcelas.Rows[idx];
                var data = Convert.ToDateTime(inputNotaDataEmissao.Text);
                ((TextBox)row.FindControl("inputFaturaVencimento")).Text = data.AddDays(Convert.ToDouble(((TextBox)row.FindControl("inputFaturaVencimentoDias")).Text)).ToShortDateString();

                var vencimento = (DateTime)grdFaturamentoParcelas.DataKeys[idx]["DataVencimento"];
                vencimento = DateTime.Parse(((TextBox)row.FindControl("inputFaturaVencimento")).Text);
            }
        }

        protected void inputNaturezaOperacao_SelectedIndexChanged(object sender, EventArgs e)
        {
            var neg = new NaturezaOperacao();
            infNaturezaOperacaoNF.Text = neg.getDescricaoNf(inputNaturezaOperacao.SelectedValue);
        }

        protected void btnNotaGerarTxtSefaz_Click(object sender, EventArgs e)
        {
            #region variáveis
            string _nomeArquivo = "";
            var _cfg = ConfiguracoesParametros.getConfiguracoes();
            decimal _aliqPIS = decimal.Parse("0,65");
            decimal _aliqCOFINS = decimal.Parse("3");
            var objCliente = (ObjClienteFull)ViewState["ObjCliente"];
            var _nfeNeg = new NFe();
            #endregion

            // carregando os dados da NF
            loadObjNFe();
            setNumeroNFe();  // método que defini o número da NFe se necessário.
            var _nfe = (ObjNotaFiscal)ViewState["ObjNF"];

            #region --XML
            _nomeArquivo = _nfeNeg.prop_path_arquivo_xml + String.Format("{0:00000}", int.Parse(inputNotaNumero.Text)) + "-NFE.XML";
            var _utf8 = new UTF8Encoding();
            var _xml = new XmlTextWriter(_nomeArquivo, _utf8);
            string _chave_acesso = get_chave_acesso();

            _xml.WriteStartDocument();

            _xml.WriteStartElement("enviNFe");
            _xml.WriteAttributeString("xmlns", "http://www.portalfiscal.inf.br/nfe");
            _xml.WriteAttributeString("versao", "2.00");

            _xml.WriteElementString("idLote", inputNotaNumero.Text);

            _xml.WriteStartElement("NFe");
            _xml.WriteAttributeString("xmlns", "http://www.portalfiscal.inf.br/nfe");

            _xml.WriteStartElement("infNFe");
            _xml.WriteAttributeString("Id", "NFe" + _chave_acesso);
            _xml.WriteAttributeString("versao", "2.00");

            #region ide
            _xml.WriteStartElement("ide");
            _xml.WriteElementString("cUF", "35");
            _xml.WriteElementString("cNF", String.Format("{0:00000000}", int.Parse(inputNotaNumero.Text)));
            _xml.WriteElementString("natOp", infNaturezaOperacaoNF.Text);
            _xml.WriteElementString("indPag", inputFaturamentoForma.SelectedIndex.ToString());
            _xml.WriteElementString("mod", "55");
            _xml.WriteElementString("serie", "0");
            _xml.WriteElementString("nNF", inputNotaNumero.Text);
            _xml.WriteElementString("dEmi", DateTime.Parse(inputNotaDataEmissao.Text).ToString("yyyy-MM-dd"));
            _xml.WriteElementString("dSaiEnt", Convert.ToDateTime(inputNotaDataSaida.Text).ToString("yyyy-MM-dd"));
            _xml.WriteElementString("hSaiEnt", inputNotaHoraSaida.Text + ":00");
            _xml.WriteElementString("tpNF", inputNotaOrigem.SelectedIndex.ToString());
            _xml.WriteElementString("cMunFG", "3550308");
            _xml.WriteElementString("tpImp", "1");
            _xml.WriteElementString("tpEmis", "1");
            _xml.WriteElementString("cDV", _chave_acesso.Substring(_chave_acesso.Length-1, 1));
            _xml.WriteElementString("tpAmb", Util.get_settings("nfe_tipo_ambiente"));
            _xml.WriteElementString("finNFe", "1");
            _xml.WriteElementString("procEmi", "0");
            _xml.WriteElementString("verProc", "3.0.0");
            
            _xml.WriteEndElement();  // ide
            #endregion

            #region emit
            _xml.WriteStartElement("emit");
            _xml.WriteElementString("CNPJ", _nfe.Emitente.propCNPJ);
            _xml.WriteElementString("xNome", _nfe.Emitente.propRazaoSocial);
            _xml.WriteStartElement("enderEmit");
            _xml.WriteElementString("xLgr", _nfe.Emitente.propLogradouro);
            _xml.WriteElementString("nro", _nfe.Emitente.propLogradouroNumero);
            _xml.WriteElementString("xBairro", _nfe.Emitente.propLogradouroBairro);
            _xml.WriteElementString("cMun", _nfe.Emitente.propMunicipioIBGE);
            _xml.WriteElementString("xMun", _nfe.Emitente.propMunicipio);
            _xml.WriteElementString("UF", _nfe.Emitente.propUF);
            _xml.WriteElementString("CEP", _nfe.Emitente.propCEP);
            _xml.WriteElementString("cPais", "1058");
            _xml.WriteElementString("xPais", "BRASIL");
            _xml.WriteElementString("fone", "1129660442");
            _xml.WriteEndElement();  // enderEmit
            _xml.WriteElementString("IE", _nfe.Emitente.propInscricaoEstadual);
            _xml.WriteElementString("CRT", "3");            
            _xml.WriteEndElement();  //emit
            #endregion

            #region dest
            _xml.WriteStartElement("dest");
            switch (_nfe.Destinatario.propTipoPessoa)
            {
                case Tipos.TipoPessoa.Juridica:
                    _xml.WriteElementString("CNPJ", _nfe.Destinatario.propCNPJ.Replace(".", "").Replace("/", "").Replace("-", ""));
                    break;
                case Tipos.TipoPessoa.Fisica:
                    _xml.WriteElementString("CPF", _nfe.Destinatario.propCNPJ.Replace(".", ""));
                    break;
            }
            _xml.WriteElementString("xNome", _nfe.Destinatario.propRazaoSocial.Trim());
            _xml.WriteStartElement("enderDest");
            _xml.WriteElementString("xLgr", _nfe.Destinatario.propEndereco.Trim());
            _xml.WriteElementString("nro", _nfe.Destinatario.propEnderecoNro.Trim());
            _xml.WriteElementString("xBairro", _nfe.Destinatario.propBairro.Trim());
            _xml.WriteElementString("cMun", _nfe.Destinatario.propMunicipioCodigoIBGE.Trim());
            _xml.WriteElementString("xMun", _nfe.Destinatario.propMunicipio.Trim());
            _xml.WriteElementString("UF", _nfe.Destinatario.propUF.Trim());
            _xml.WriteElementString("CEP", _nfe.Destinatario.propCEP.Replace("-", "").Trim());
            if (_nfe.Destinatario.propTelefone.Length > 0)
                _xml.WriteElementString("fone", _nfe.Destinatario.propTelefone.Replace("(","").Replace(")","").Replace("-","").Replace(".","").Replace(" ",""));
            if (_nfe.Destinatario.propInscrEstadual.Length == 0)
                _nfe.Destinatario.propInscrEstadual = "ISENTO";
            _xml.WriteEndElement();  // enderDest
            _xml.WriteElementString("IE", _nfe.Destinatario.propInscrEstadual.Replace(".", "").Replace("-", "").Replace("/", "").Trim());
            _xml.WriteElementString("email", _nfe.Destinatario.propEmailNFe.Trim());
            _xml.WriteEndElement();  // dest
            #endregion

            #region entrega
            if (objCliente.LocalEntrega.Length > 0 &&
                objCliente.LocalEntregaBairro.Length > 0 &&
                objCliente.LocalEntregaMunicipio.Length > 0 &&
                objCliente.LocalEntregaUF.Length > 0)
            {
                _xml.WriteStartElement("entrega");
                if (_nfe.Destinatario.propTipoPessoa == Tipos.TipoPessoa.Juridica)
                    _xml.WriteElementString("CNPJ", _nfe.Destinatario.propCNPJ);
                else _xml.WriteElementString("CPF", _nfe.Destinatario.propCNPJ);

                _xml.WriteElementString("xLgr", objCliente.LocalEntrega.Trim());
                _xml.WriteElementString("nro", objCliente.LocalEntregaNro.Trim());
                _xml.WriteElementString("xBairro", objCliente.LocalEntregaBairro.Trim());
                _xml.WriteElementString("cMun", objCliente.LocalEntregaMunicipioIBGE.Trim());
                _xml.WriteElementString("xMun", objCliente.LocalEntregaMunicipio.Trim());
                _xml.WriteElementString("UF", objCliente.LocalEntregaUF.Trim());

                _xml.WriteEndElement();  // entrega
            }
            #endregion

            #region produtos
            
            // calculando o valor do frete por produto sem ST.
            decimal _vlrFreteProduto = 0;
            decimal _vlr_diferenca_frete_produto = 0;
            decimal _vlrFreteNF = decimal.Parse(inputImpostoValorFrete.Text);
            if (_vlrFreteNF > 0)
            {
                _vlrFreteProduto = _vlrFreteNF / get_qtd_produtos_sem_ST();
            }
            // ajustando com 2 casas decimais o valor do frete.
            _vlrFreteProduto = decimal.Parse(_vlrFreteProduto.ToString("f2"));

            // verificando se existe diferença no cálculo do frete por produto.
            if ((_vlrFreteProduto * get_qtd_produtos_sem_ST()) != _vlrFreteNF)
            {
                _vlr_diferenca_frete_produto = _vlrFreteNF - (_vlrFreteProduto * get_qtd_produtos_sem_ST());
            }

            int _qtd_produtos = 0;
            foreach (ObjPedidoProduto _prd in _nfe.Produtos)
            {
                _qtd_produtos++;
                _xml.WriteStartElement("det");
                _xml.WriteAttributeString("nItem", _qtd_produtos.ToString());

                #region prod
                _xml.WriteStartElement("prod");
                _xml.WriteElementString("cProd", _prd.Produto.CodigoId.ToString());
                _xml.WriteElementString("cEAN", "");
                _xml.WriteElementString("xProd", _prd.Produto.Grupo.GrupoDescricao + " " + _prd.Produto.Numero + " " + _prd.Produto.Marca.Descricao);
                _xml.WriteElementString("NCM", _prd.Produto.CodClassFiscal);
                _xml.WriteElementString("CFOP", _prd.Produto.CFOP.Replace(".", ""));
                _xml.WriteElementString("uCom", _prd.Produto.Unidade);
                _xml.WriteElementString("qCom", _prd.Qtde.ToString().Replace(",", "."));
                _xml.WriteElementString("vUnCom", _prd.ValorUnitario.ToString().Replace(",", "."));
                _xml.WriteElementString("vProd", _prd.ValorTotal.ToString().Replace(",", "."));
                _xml.WriteElementString("cEANTrib", "");
                _xml.WriteElementString("uTrib", _prd.Produto.Unidade);
                _xml.WriteElementString("qTrib", _prd.Qtde.ToString().Replace(",", "."));
                _xml.WriteElementString("vUnTrib", _prd.ValorUnitario.ToString().Replace(",", "."));

                if (_vlrFreteProduto != 0 && _prd.Produto.CCST.Substring(1, 2) == "00")
                {
                    // coloca a diferença do frete no primeiro produto.
                    if (_qtd_produtos == 1)
                        _xml.WriteElementString("vFrete", (_vlrFreteProduto + _vlr_diferenca_frete_produto).ToString("f2").Replace(",", "."));
                    else
                        _xml.WriteElementString("vFrete", _vlrFreteProduto.ToString("f2").Replace(",", "."));
                }

                if (decimal.Parse(inputImpostoOutrasDespesas.Text) > 0 && _qtd_produtos == 1)
                {
                    _xml.WriteElementString("vOutro", decimal.Parse(inputImpostoOutrasDespesas.Text).ToString("f2").Replace(",", "."));
                }

                _xml.WriteElementString("indTot", "1");

                _xml.WriteEndElement(); // prod
                #endregion

                #region imposto
                _xml.WriteStartElement("imposto");
                    #region ICMS
                    _xml.WriteStartElement("ICMS");
                    
                    switch (_prd.Produto.CCST.Substring(1, 2))
                    {
                        case "00":

                            decimal _vlrBase = _prd.ValorTotal;
                            // verificando o valor do frete para incidir na base dos produtos sem ST.
                            if (_vlrFreteProduto != 0 && _prd.Produto.CCST.Substring(1, 2) == "00")
                            {
                                // verificando a diferença do frete apenas no primeiro produto.
                                if (_qtd_produtos == 1)
                                    _vlrBase += (_vlrFreteProduto + _vlr_diferenca_frete_produto);
                                else
                                    _vlrBase += _vlrFreteProduto;
                            }

                            decimal _vlrIcms = (_vlrBase * _prd.Produto.ICMS_Aliquota) / 100;

                            _xml.WriteStartElement("ICMS00");
                            _xml.WriteElementString("orig", _prd.Produto.CCST.Substring(0, 1));
                            _xml.WriteElementString("CST", "00");
                            _xml.WriteElementString("modBC", "3");
                            _xml.WriteElementString("vBC", _vlrBase.ToString("f2").Replace(",", "."));
                            _xml.WriteElementString("pICMS", _prd.Produto.ICMS_Aliquota.ToString());
                            _xml.WriteElementString("vICMS", _vlrIcms.ToString("f2").Replace(",", "."));
                            _xml.WriteEndElement();

                            break;
                        case "60":
                            _xml.WriteStartElement("ICMS60");
                            _xml.WriteElementString("orig", _prd.Produto.CCST.Substring(0, 1));
                            _xml.WriteElementString("CST", "60");
                            _xml.WriteEndElement();
                            break;
                    }
                    _xml.WriteEndElement();  // ICMS
                    #endregion

                    #region PIS
                    _xml.WriteStartElement("PIS");
                    _xml.WriteStartElement("PISAliq");
                    _xml.WriteElementString("CST", "01");
                    _xml.WriteElementString("vBC", _prd.ValorTotal.ToString().Replace(",", "."));
                    _xml.WriteElementString("pPIS", _aliqPIS.ToString().Replace(",", "."));
                    _xml.WriteElementString("vPIS", ((_prd.ValorTotal * _aliqPIS) / 100).ToString("f2").Replace(",", "."));
                    _xml.WriteEndElement();  // PISAliq
                    _xml.WriteEndElement();  // PIS
                    #endregion

                    #region PIS ST
                    if (_prd.Produto.CCST.Substring(1, 2) != "00")
                    {
                        _xml.WriteStartElement("PISST");
                        _xml.WriteElementString("vBC", _prd.ValorTotal.ToString().Replace(",", "."));
                        _xml.WriteElementString("pPIS", _aliqPIS.ToString().Replace(",", "."));
                        _xml.WriteElementString("vPIS", ((_prd.ValorTotal * _aliqPIS) / 100).ToString("f2").Replace(",", "."));
                        _xml.WriteEndElement();  // PISST
                    }
                    #endregion

                    #region COFINS
                    _xml.WriteStartElement("COFINS");
                    _xml.WriteStartElement("COFINSAliq");
                    _xml.WriteElementString("CST", "01");
                    _xml.WriteElementString("vBC", _prd.ValorTotal.ToString().Replace(",", "."));
                    _xml.WriteElementString("pCOFINS", _aliqCOFINS.ToString().Replace(",", "."));
                    _xml.WriteElementString("vCOFINS", ((_prd.ValorTotal * _aliqCOFINS) / 100).ToString("f2").Replace(",", "."));
                    _xml.WriteEndElement(); // COFINSAliq
                    _xml.WriteEndElement(); // COFINS
                    #endregion

                    #region COFINS ST
                    if (_prd.Produto.CCST.Substring(1, 2) != "00")
                    {
                        _xml.WriteStartElement("COFINSST");
                        _xml.WriteElementString("vBC", _prd.ValorTotal.ToString().Replace(",", "."));
                        _xml.WriteElementString("pCOFINS", _aliqCOFINS.ToString().Replace(",", "."));
                        _xml.WriteElementString("vCOFINS", ((_prd.ValorTotal * _aliqCOFINS) / 100).ToString("f2").Replace(",", "."));
                        _xml.WriteEndElement();
                    }
                    #endregion

                    _xml.WriteEndElement(); // imposto
                #endregion

                _xml.WriteEndElement(); // det

            }
            #endregion

            #region valores totais da NF-e
            _xml.WriteStartElement("total");
                _xml.WriteStartElement("ICMSTot");
                _xml.WriteElementString("vBC", decimal.Parse(inputImpostoBaseCalculoIcms.Text).ToString("f2").Replace(",", "."));
                _xml.WriteElementString("vICMS", decimal.Parse(inputImpostoValorIcms.Text).ToString("f2").Replace(",", "."));
                _xml.WriteElementString("vBCST", decimal.Parse(inputImpostoBaseCalculoIcmsSt.Text).ToString("f2").Replace(",", "."));
                _xml.WriteElementString("vST", decimal.Parse(inputImpostoValorIcmsSt.Text).ToString("f2").Replace(",", "."));
                _xml.WriteElementString("vProd", decimal.Parse(inputImpostoValorTotalProdutos.Text).ToString("f2").Replace(",", "."));
                _xml.WriteElementString("vFrete", decimal.Parse(inputImpostoValorFrete.Text).ToString("f2").Replace(",", "."));
                _xml.WriteElementString("vSeg", decimal.Parse(inputImpostoValorSeguro.Text).ToString("f2").Replace(",", "."));
                _xml.WriteElementString("vDesc", decimal.Parse(inputImpostoDesconto.Text).ToString("f2").Replace(",", "."));
                _xml.WriteElementString("vII", "0.00");
                _xml.WriteElementString("vIPI", "0.00");
                
                decimal _vlrGenerico = (decimal.Parse(inputImpostoValorTotalProdutos.Text) * _aliqPIS) / 100;
                _xml.WriteElementString("vPIS", _vlrGenerico.ToString("f2").Replace(",", "."));
                
                _vlrGenerico = (decimal.Parse(inputImpostoValorTotalProdutos.Text) * _aliqCOFINS) / 100;
                _xml.WriteElementString("vCOFINS", _vlrGenerico.ToString("f2").Replace(",", "."));

                _xml.WriteElementString("vOutro", decimal.Parse(inputImpostoOutrasDespesas.Text).ToString("f2").Replace(",", "."));
                _xml.WriteElementString("vNF", decimal.Parse(inputImpostoValorTotalNota.Text).ToString("f2").Replace(",", "."));

                _xml.WriteEndElement();  // ICMSTot
            _xml.WriteEndElement();  // total
            #endregion

            #region transporte
            _xml.WriteStartElement("transp");
            _xml.WriteElementString("modFrete", inputTranspFrete.SelectedIndex.ToString());
            if (inputTranspNome.Text.Length > 0)
            {
                _xml.WriteStartElement("transporta");
                _xml.WriteElementString("CNPJ", inputTranspCnpj.Text.Replace(".","").Replace("/","").Replace("-",""));
                _xml.WriteElementString("xNome", inputTranspNome.Text);
                _xml.WriteElementString("IE", inputTranspInscricaoEstadual.Text.Replace(".",""));
                _xml.WriteElementString("xEnder", inputTranspEndereco.Text);
                _xml.WriteElementString("xMun", inputTranspMunicipio.Text);
                _xml.WriteElementString("UF", inputTranspUF.Text);
                _xml.WriteEndElement();  // transporta
            }
            if (inputTranspPlacaVeiculo.Text.Length > 0)
            {
                _xml.WriteStartElement("veicTransp");
                _xml.WriteElementString("placa", inputTranspPlacaVeiculo.Text);
                _xml.WriteElementString("UF", inputTranspPlacaVeiculoUF.Text);
                _xml.WriteElementString("RNTC", inputTranspCodigoAntt.Text);
                _xml.WriteEndElement();  // veicTransp
            }
            if (inputTranspQuantidade.Text.Length > 0)
            {
                _xml.WriteStartElement("vol");
                _xml.WriteElementString("qVol", inputTranspQuantidade.Text);
                _xml.WriteElementString("esp", inputTranspEspecie.Text);
                _xml.WriteElementString("marca", inputTranspMarca.Text);
                _xml.WriteElementString("nVol", inputTranspNumeracao.Text);
                _xml.WriteElementString("pesoL", decimal.Parse(inputTranspPesoLiquido.Text).ToString("f3").Replace(",", "."));
                _xml.WriteElementString("pesoB", decimal.Parse(inputTranspPesoBruto.Text).ToString("f3").Replace(",", "."));
                _xml.WriteEndElement();  // vol
            }
            _xml.WriteEndElement();  // transp
            #endregion

            #region cobrança
            
            _xml.WriteStartElement("cobr");
            foreach (GridViewRow row in grdFaturamentoParcelas.Rows)
            {
                string _vlr = ((Label)row.FindControl("infFaturaValor")).Text.Replace("R$ ", "").Replace(".", "");

                _xml.WriteStartElement("dup");
                _xml.WriteElementString("nDup", inputNotaNumero.Text + "/" + ((Label)row.FindControl("infFaturaNumParcela")).Text);
                _xml.WriteElementString("dVenc", Convert.ToDateTime(((TextBox)row.FindControl("inputFaturaVencimento")).Text).ToString("yyyy-MM-dd"));
                _xml.WriteElementString("vDup", decimal.Parse(_vlr).ToString("f2").Replace(",", "."));
                _xml.WriteEndElement(); // dup
            }
            _xml.WriteEndElement();  // cobr
            
            #endregion

            #region informações adicionais
            if (inputDadosAdicionais.Text.Trim().Length > 0)
            {
                _xml.WriteStartElement("infAdic");
                _xml.WriteElementString("infCpl", inputDadosAdicionais.Text);
                _xml.WriteEndElement(); // infAdic
            }
            #endregion

            _xml.WriteEndElement();  // infNFe

            _xml.WriteEndElement();  // NFe

            _xml.WriteEndElement();  // enviNFe
            _xml.Close();

            #endregion --XML

            _nfeNeg.Assinar(_nomeArquivo, "NFe", "infNFe");
            string numero_recibo = _nfeNeg.Transmitir(_nomeArquivo,
                                                      Convert.ToInt32(inputNotaNumero.Text)
                                                      );

            btnNotaGerarTxtSefaz.Visible = false;
            NotaFiscalAccordion.Visible = false;
            step_gravar_lbl_nome_arquivo.Text = inputNotaNumero.Text;
            step_gravar_panel.Visible = true;

            #region geração do arquivo TXT de integração com o sistema do SEFAZ
            /*
            
            // definindo o nome do arquivo
            _nomeArquivo = "NF" + String.Format("{0:00000}", int.Parse(inputNotaNumero.Text)) + "-NFE.TXT";

            // criando arquivo
            TextWriter _arq = File.CreateText(@_cfg.NfePathExportarArquivo + _nomeArquivo);

            try
            {
                #region cabeçalho
                _arq.WriteLine("NOTA FISCAL|1|");
                _arq.WriteLine("A|2.00|NFe|");
                #endregion

                #region B - identificação da nota
                _txt = "B|35||" + infNaturezaOperacaoNF.Text + "|" +
                        inputFaturamentoForma.SelectedIndex.ToString() + "|55|000|" +
                        inputNotaNumero.Text + "|" +
                        Convert.ToDateTime(inputNotaDataEmissao.Text).ToString("yyyy-MM-dd") + "|"+ 
                        Convert.ToDateTime(inputNotaDataSaida.Text).ToString("yyyy-MM-dd") + "|" +
                        inputNotaHoraSaida.Text +":00" +"|" +
                        inputNotaOrigem.SelectedIndex.ToString() + "|3550308|1|1||1|1|3|2.0.7|";
                _arq.WriteLine(_txt);
                #endregion

                #region C - identificação do emitente
                _txt = "C|" + _nfe.Emitente.propRazaoSocial + "||" +
                        _nfe.Emitente.propInscricaoEstadual + "||||3|";
                _arq.WriteLine(_txt);

                _txt = "C02|" + _nfe.Emitente.propCNPJ + "|";
                _arq.WriteLine(_txt);

                _txt = "C05|" + _nfe.Emitente.propLogradouro + "|" +
                        _nfe.Emitente.propLogradouroNumero + "||" +
                        _nfe.Emitente.propLogradouroBairro + "|" +
                        "3550308|" + _nfe.Emitente.propMunicipio + "|" +
                        _nfe.Emitente.propUF + "|" + _nfe.Emitente.propCEP + "|" +
                        "1058|BRASIL|" + _nfe.Emitente.propFone + "|";
                _arq.WriteLine(_txt);
                #endregion

                #region E - identificação do destinatário
                _txt = "E|" + _nfe.Destinatario.propRazaoSocial +'|';
                
                // regra: apresentar a inscr. est. somente para pessoa jurídica.
                if (_nfe.Destinatario.propTipoPessoa == Tipos.TipoPessoa.Juridica)
                    _txt += Util.getRemoverFormatacao(_nfe.Destinatario.propInscrEstadual);

                _txt += "||" + _nfe.Destinatario.propEmailNFe + "|";
                _arq.WriteLine(_txt);

                if (_nfe.Destinatario.propTipoPessoa == Tipos.TipoPessoa.Juridica)
                    _arq.WriteLine("E02|" + _nfe.Destinatario.propCNPJ.Replace(".","").Replace("/","").Replace("-","") + "|");
                else
                    _arq.WriteLine("E03|" + _nfe.Destinatario.propCNPJ + "|");

                // dados do endereço
                _txt = "E05|" + _nfe.Destinatario.propEndereco + "|" +
                    _nfe.Destinatario.propEnderecoNro + "||" +
                    _nfe.Destinatario.propBairro + "|" +
                    _nfe.Destinatario.propMunicipioCodigoIBGE + "|" +
                    _nfe.Destinatario.propMunicipio + "|" +
                    _nfe.Destinatario.propUF + "|" +
                    _nfe.Destinatario.propCEP.Replace("-", "") + "|" +
                    "1058|BRASIL||";
                _arq.WriteLine(_txt);
                #endregion

                #region H - identificação dos produtos

                // calculando o valor do frete por produto sem ST.
                decimal _vlrFreteProduto = 0;
                decimal _vlr_diferenca_frete_produto = 0;
                decimal _vlrFreteNF = decimal.Parse(inputImpostoValorFrete.Text);
                if (_vlrFreteNF > 0)
                {
                    _vlrFreteProduto = _vlrFreteNF / get_qtd_produtos_sem_ST();
                }
                // ajustando com 2 casas decimais o valor do frete.
                _vlrFreteProduto = decimal.Parse(_vlrFreteProduto.ToString("f2"));
                
                // verificando se existe diferença no cálculo do frete por produto.
                if ((_vlrFreteProduto * get_qtd_produtos_sem_ST()) != _vlrFreteNF)
                {
                    _vlr_diferenca_frete_produto = _vlrFreteNF - (_vlrFreteProduto * get_qtd_produtos_sem_ST());
                }

                int _qtdProdutos = 0;
                _existe_prd_com_st = false;
                foreach (ObjPedidoProduto _prd in _nfe.Produtos)
                {
                    #region dados do produto.
                    _qtdProdutos++;
                    _txt = "H|" + _qtdProdutos.ToString() + "||";
                    _arq.WriteLine(_txt);

                    _txt = "I|" +
                        _prd.Produto.CodigoId.ToString() + "||" +
                        _prd.Produto.Grupo.GrupoDescricao + " " + _prd.Produto.Numero + " " + _prd.Produto.Marca.Descricao + "|" +
                        _prd.Produto.CodClassFiscal + "||" +
                        _prd.Produto.CFOP.Replace(".", "") + "|" +
                        _prd.Produto.Unidade + "|" +
                        _prd.Qtde.ToString().Replace(",", ".") + "|" +
                        _prd.ValorUnitario.ToString().Replace(",", ".") + "|" +
                        _prd.ValorTotal.ToString().Replace(",", ".") + "||" +
                        _prd.Produto.Unidade + "|" +
                        _prd.Qtde.ToString().Replace(",", ".") + "|" +
                        _prd.ValorUnitario.ToString().Replace(",", ".") + "|";

                    if (_vlrFreteProduto != 0 && _prd.Produto.CCST.Substring(1, 2) == "00")
                    {
                        // coloca a diferença do frete no primeiro produto.
                        if (_qtdProdutos == 1)
                            _txt += (_vlrFreteProduto + _vlr_diferenca_frete_produto).ToString("f2").Replace(",", ".");
                        else
                            _txt += _vlrFreteProduto.ToString("f2").Replace(",", ".");
                    }

                    _txt += "|||";
                    
                    if (decimal.Parse(inputImpostoOutrasDespesas.Text) > 0 && _qtdProdutos == 1)
                    {
                        _txt += decimal.Parse(inputImpostoOutrasDespesas.Text).ToString("f2").Replace(",",".");
                    }

                    _txt += "|1|||";
                    _arq.WriteLine(_txt);
                    _arq.WriteLine("M|");
                    _arq.WriteLine("N|");
                    #endregion

                    #region ICSM e ST
                    _txt = "";
                    switch (_prd.Produto.CCST.Substring(1,2))
                    {
                        case "00":
                            decimal _vlrBase = _prd.ValorTotal;
                            
                            // verificando o valor do frete para incidir na base dos produtos sem ST.
                            if (_vlrFreteProduto != 0 && _prd.Produto.CCST.Substring(1, 2) == "00")
                            {
                                // verificando a diferença do frete apenas no primeiro produto.
                                if (_qtdProdutos == 1)
                                    _vlrBase += (_vlrFreteProduto + _vlr_diferenca_frete_produto);
                                else
                                    _vlrBase += _vlrFreteProduto;
                            }

                            decimal _vlrIcms = (_vlrBase * _prd.Produto.ICMS_Aliquota)/100;
                            _txt = "N02|" +
                                _prd.Produto.CCST.Substring(0, 1) + "|00|3|" +
                                _vlrBase.ToString("f2").Replace(",", ".") + "|" +
                                _prd.Produto.ICMS_Aliquota.ToString() + "|" +
                                _vlrIcms.ToString("f2").Replace(",", ".") + "|";
                            break;
                        case "60":
                            _txt = "N08|" +
                                _prd.Produto.CCST.Substring(0, 1) + "|60|||";
                            _existe_prd_com_st = true;
                            break;
                    }
                    _arq.WriteLine(_txt);
                    #endregion

                    #region PIS
                    _arq.WriteLine("Q|");
                    _txt = "Q02|01|" +
                        _prd.ValorTotal.ToString().Replace(",", ".") + "|" +
                        _aliqPIS.ToString().Replace(",", ".") + "|" +
                        ((_prd.ValorTotal * _aliqPIS) / 100).ToString("f2").Replace(",", ".") + "|";
                    _arq.WriteLine(_txt);
                    #endregion

                    #region PIS ST
                    if (_prd.Produto.CCST.Substring(1, 2) != "00")
                    {
                        _arq.WriteLine("R|" + ((_prd.ValorTotal * _aliqPIS) / 100).ToString("f2").Replace(",", ".") + "|");
                        _txt = "R02|" +
                            _prd.ValorTotal.ToString().Replace(",", ".") + "|" +
                            _aliqPIS.ToString().Replace(",", ".") + "|";
                        _arq.WriteLine(_txt);
                    }
                    #endregion

                    #region COFINS
                    _arq.WriteLine("S|");
                    _txt = "S02|01|"+
                        _prd.ValorTotal.ToString().Replace(",", ".") + "|" +
                        _aliqCOFINS.ToString().Replace(",", ".") + "|" +
                        ((_prd.ValorTotal * _aliqCOFINS) / 100).ToString("f2").Replace(",", ".") + "|";
                    _arq.WriteLine(_txt);
                    #endregion

                    #region COFINS ST
                    if (_prd.Produto.CCST.Substring(1, 2) != "00")
                    {
                        _arq.WriteLine("T|" + ((_prd.ValorTotal * _aliqCOFINS) / 100).ToString("f2").Replace(",", ".") + "|");
                        _txt = "T02|" +
                            _prd.ValorTotal.ToString().Replace(",", ".") + "|" +
                            _aliqCOFINS.ToString().Replace(",", ".") + "|";
                        _arq.WriteLine(_txt);
                    }
                    #endregion

                }
                #endregion

                #region W - totais da nf-e
                _arq.WriteLine("W|");
                _txt = "W02|" +
                    decimal.Parse(inputImpostoBaseCalculoIcms.Text).ToString("f2").Replace(",", ".") + "|" +
                    decimal.Parse(inputImpostoValorIcms.Text).ToString("f2").Replace(",", ".") + "|" +
                    decimal.Parse(inputImpostoBaseCalculoIcmsSt.Text).ToString("f2").Replace(",", ".") + "|" +
                    decimal.Parse(inputImpostoValorIcmsSt.Text).ToString("f2").Replace(",", ".") + "|" +
                    decimal.Parse(inputImpostoValorTotalProdutos.Text).ToString("f2").Replace(",", ".") + "|" +
                    decimal.Parse(inputImpostoValorFrete.Text).ToString("f2").Replace(",", ".") + "|" +
                    decimal.Parse(inputImpostoValorSeguro.Text).ToString("f2").Replace(",", ".") + "|" +
                    decimal.Parse(inputImpostoDesconto.Text).ToString("f2").Replace(",", ".") + "|0.00|0.00|";
                _vlrGenerico = (decimal.Parse(inputImpostoValorTotalProdutos.Text) * _aliqPIS) / 100;
                _txt += _vlrGenerico.ToString("f2").Replace(",", ".") + "|";
                _vlrGenerico = (decimal.Parse(inputImpostoValorTotalProdutos.Text) * _aliqCOFINS) / 100;
                _txt += _vlrGenerico.ToString("f2").Replace(",", ".") + "|";
                _txt += decimal.Parse(inputImpostoOutrasDespesas.Text).ToString("f2").Replace(",", ".") + "|" +
                    decimal.Parse(inputImpostoValorTotalNota.Text).ToString("f2").Replace(",", ".") + "|";
                _arq.WriteLine(_txt);
                #endregion

                #region X - transporte
                _arq.WriteLine("X|" + inputTranspFrete.SelectedIndex.ToString() + "|");
                _txt = "X03|" +
                    inputTranspNome.Text + "|" +
                    inputTranspInscricaoEstadual.Text.Replace(".","") + "|" +
                    inputTranspEndereco.Text + "|" +
                    inputTranspUF.Text + "|" +
                    inputTranspMunicipio.Text + "|";
                _arq.WriteLine(_txt);

                if (inputTranspCnpj.Text.Length > 0)
                    _arq.WriteLine("X04|" + inputTranspCnpj.Text.Replace(".","").Replace("/","").Replace("-","") + "|");

                // dados do veículo
                if (inputTranspPlacaVeiculo.Text.Length > 0)
                {
                    _txt = "X18|" +
                        inputTranspPlacaVeiculo.Text + "|" +
                        inputTranspPlacaVeiculoUF.Text + "|" +
                        inputTranspCodigoAntt.Text + "|";
                    _arq.WriteLine(_txt);
                }

                // grupo de volumes
                if (inputTranspQuantidade.Text.Length > 0)
                {
                    _txt = "X26|" +
                        inputTranspQuantidade.Text + "|" +
                        inputTranspEspecie.Text + "|" +
                        inputTranspMarca.Text + "|" +
                        inputTranspNumeracao.Text + "|" +
                        decimal.Parse(inputTranspPesoLiquido.Text).ToString("f3").Replace(",", ".") + "|" +
                        decimal.Parse(inputTranspPesoBruto.Text).ToString("f3").Replace(",", ".") + "|";
                    _arq.WriteLine(_txt);
                }
                #endregion

                #region Y - cobrança
                _arq.WriteLine("Y|");
                foreach (GridViewRow row in grdFaturamentoParcelas.Rows)
                {
                    string _vlr = ((Label)row.FindControl("infFaturaValor")).Text.Replace("R$ ", "").Replace(".", "");

                    _txt = "Y07|" +
                        inputNotaNumero.Text + "/" + ((Label)row.FindControl("infFaturaNumParcela")).Text + "|" +
                        Convert.ToDateTime(((TextBox)row.FindControl("inputFaturaVencimento")).Text).ToString("yyyy-MM-dd") + "|" +
                        decimal.Parse(_vlr).ToString("f2").Replace(",", ".") + "|";
                    _arq.WriteLine(_txt);
                }
                #endregion

                #region Z - informações adicionais
                _txt = "";
                foreach (GridViewRow row in grdFaturamentoParcelas.Rows)
                {
                    _txt += " Num: " + inputNotaNumero.Text + "/" + ((Label)row.FindControl("infFaturaNumParcela")).Text + " - Venc: " +
                        ((TextBox)row.FindControl("inputFaturaVencimento")).Text + " - Vlr: " +
                        ((Label)row.FindControl("infFaturaValor")).Text;
                }
                if (inputDadosAdicionais.Text.Length > 0)
                    _txt += " - " + inputDadosAdicionais.Text;

                if (_existe_prd_com_st)
                    _txt += " - Imposto recolhido por substituição tributária conforme decreto 52804/2008 artigo 313-I do RICMS";

               _arq.WriteLine("Z||" + _txt + "|");

                // email do cliente
               _arq.WriteLine("Z04|Email_Destinatario|" + inputDestinatarioEmailNFe.Text + "|");
                #endregion

            }
            catch (Exception ex)
            {
                _arq.WriteLine(ex.Message);
            }
            finally
            {
                _arq.Flush();
                _arq.Close();

                btnNotaGerarTxtSefaz.Visible = false;
                btnVoltar.Visible = false;
                NotaFiscalAccordion.Visible = false;
                step_gravar_lbl_nome_arquivo.Text = _nomeArquivo;
                step_gravar_panel.Visible = true;
            }
             *
             */
            #endregion
        }

        protected void btn_gravar_municipio_click(object sender, EventArgs e)
        {
            load_cliente();
        }

        protected void step_gravar_btn_gravar_Click(object sender, EventArgs e)
        {
            loadObjNFe();
            var _neg_nfe = new SGELibrary.Businees.NotaFiscal();
            var _obj_nfe = (ObjNotaFiscal)ViewState["ObjNF"];

            _neg_nfe.gravar_nova_nota(_obj_nfe);

            step_gravar_panel.Visible = false;
            step_finalizado_panel.Visible = true;
        }

        protected void step_gravar_btn_voltar_Click(object sender, EventArgs e)
        {
            btnNotaGerarTxtSefaz.Visible = true;
            btnVoltar.Visible = true;
            NotaFiscalAccordion.Visible = true;
            step_gravar_panel.Visible = false;
        }

        protected void step_finalizado_btn_Click(object sender, EventArgs e)
        {
            Response.Redirect("NotaFiscalSelecionarCliente.aspx", true);
        }

        protected void btnVoltar_Click(object sender, EventArgs e)
        {
            Response.Redirect("NotaFiscalSelecionarCliente.aspx", true);
        }
    }
}