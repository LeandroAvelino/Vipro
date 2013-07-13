using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using SGELibrary.Data;
using SGELibrary.Objects;

namespace SGELibrary.Businees
{
    public class Cliente
    {
        public List<ObjClienteFantasia> getListaNomeFantasia()
        {
            var lista = new List<ObjClienteFantasia>();

            var db = new DbCliente();
            var tbl = db.getListaNomeFantasia();

            foreach (DataRow row in tbl.Rows)
            {
                var obj = new ObjClienteFantasia();
                obj.CodigoID = int.Parse(row["CODIGO"].ToString());
                obj.NomeFantasia = row["NOME_FANTAZIA"].ToString();
                obj.RazaoSocial = row["RAZAO_SOCIAL"].ToString();

                lista.Add(obj);
            }

            return lista;
        }

        public List<ObjClienteFantasia> getListaNomeFantasia(Tipos.PesquisaTipo psqTipo, string Conteudo)
        {
            var lista = new List<ObjClienteFantasia>();

            var db = new DbCliente();
            var tbl = db.getListaNomeFantasia(psqTipo, Conteudo);

            foreach (DataRow row in tbl.Rows)
            {
                var obj = new ObjClienteFantasia();
                obj.CodigoID = int.Parse(row["CODIGO"].ToString());
                obj.NomeFantasia = row["NOME_FANTAZIA"].ToString();
                obj.RazaoSocial = row["RAZAO_SOCIAL"].ToString();

                lista.Add(obj);
            }

            return lista;
        }

        public ObjClienteFull getDadosByCodigo(int codigo)
        {
            var db = new DbCliente();
            var obj = new ObjClienteFull();

            #region Atribuindo os dados gerais do cliente
            var tbl = db.getDados(codigo);
            if (tbl.Rows.Count > 0)
            {
                var row = tbl.Rows[0];

                obj.CodigoID = int.Parse(row["CODIGO"].ToString());
                obj.NomeFantasia = row["NOME_FANTAZIA"].ToString();
                obj.RazaoSocial = row["RAZAO_SOCIAL"].ToString();
                obj.SituacaoAtivo = (row["SITUACAO"].ToString() == "A");
                obj.Restricao = (row["RESTRICAO"].ToString() == "S");
                obj.RestricaoTxt = row["RESTRICAO_MOTIVO"].ToString().Trim();
                obj.RestricaoTipo = row["RESTRICAO_TIPO"].ToString();
                if (row["ENDERECO"].ToString().Contains(","))
                {
                    obj.Endereco = row["ENDERECO"].ToString().Substring(0, row["ENDERECO"].ToString().IndexOf(","));
                    obj.EnderecoNro = row["ENDERECO"].ToString().Substring(row["ENDERECO"].ToString().IndexOf(",") + 1);
                }
                else
                {
                    obj.Endereco = row["ENDERECO"].ToString();
                    obj.EnderecoNro = "";
                }
                obj.EnderecoBairro = row["BAIRRO"].ToString();
                obj.EnderecoCEP = row["CEP"].ToString();
                obj.EnderecoMunicipio = row["CIDADE"].ToString();
                obj.EnderecoUF = row["ESTADO"].ToString();
                obj.CNPJ = row["CNPJ"].ToString();
                obj.InscricaoEstadual = row["INSCRICAO"].ToString();
                obj.LocalEntrega = row["ENTREGA_ENDERECO"].ToString();
                obj.LocalEntregaBairro = row["ENTREGA_BAIRRO"].ToString();
                obj.LocalEntregaCEP = row["ENTREGA_CEP"].ToString();
                obj.LocalEntregaMunicipio = row["ENTREGA_CIDADE"].ToString();
                obj.LocalEntregaUF = row["ENTREGA_ESTADO"].ToString();
                obj.LocalEntregaFone = row["ENTREGA_FONE"].ToString();
                obj.LocalEntregaContato = row["ENTREGA_CONTATO"].ToString();
                try { obj.TransportadoraCodigoID = int.Parse(row["transp_codigo"].ToString()); } catch { obj.TransportadoraCodigoID = 0; }
                obj.Transportadora = row["TRANSPORTADORA"].ToString();
                obj.TransportadoraBairro = row["transp_bairro"].ToString();
                obj.TransportadoraCEP = row["transp_cep"].ToString();
                obj.TransportadoraCNPJ = row["transp_cnpj"].ToString();
                obj.TransportadoraEndereco = row["transp_endereco"].ToString();
                obj.TransportadoraInscricao = row["transp_inscricao"].ToString();
                obj.TransportadoraMunicipio = row["transp_cidade"].ToString();
                obj.TransportadoraUF = row["transp_estado"].ToString();
                obj.emailNFe = row["email_nfe"].ToString();
                obj.TipoPessoa = row["TIPO_PESSOA"].ToString() == "PJ" ? Tipos.TipoPessoa.Juridica : Tipos.TipoPessoa.Fisica;
                obj.CodigoMunicipioIBGE = row["IBGE_CODCIDADE"].ToString();
                obj.CodigoEstadoIBGE = row["IBGE_CODUF"].ToString();
                
                // telefones
                obj.Telefones.Add(new Tipos.Telefone("", row["FONE_1"].ToString()));
                obj.Telefones.Add(new Tipos.Telefone("", row["FONE_2"].ToString()));
                obj.Telefones.Add(new Tipos.Telefone("", row["FONE_3"].ToString()));
                obj.Telefones.Add(new Tipos.Telefone("", row["FONE_4"].ToString()));
                obj.Telefones.Add(new Tipos.Telefone("", row["FONE_5"].ToString()));
                obj.Telefones.Add(new Tipos.Telefone("", row["FONE_6"].ToString()));
                
                // padrão para faturamento
                var tblPadrao = db.getPadraoVencimentos(codigo);
                if (tblPadrao.Rows.Count > 0)
                {
                    int dia = 0; 
                    
                    int.TryParse(tblPadrao.Rows[0]["VENCTO1"].ToString(), out dia);
                    obj.PadraoFaturamento.Add(dia);
                    int.TryParse(tblPadrao.Rows[0]["VENCTO2"].ToString(), out dia);
                    obj.PadraoFaturamento.Add(dia);
                    int.TryParse(tblPadrao.Rows[0]["VENCTO3"].ToString(), out dia);
                    obj.PadraoFaturamento.Add(dia);
                    int.TryParse(tblPadrao.Rows[0]["VENCTO4"].ToString(), out dia);
                    obj.PadraoFaturamento.Add(dia);
                    int.TryParse(tblPadrao.Rows[0]["VENCTO5"].ToString(), out dia);
                    obj.PadraoFaturamento.Add(dia);
                    int.TryParse(tblPadrao.Rows[0]["VENCTO6"].ToString(), out dia);
                    obj.PadraoFaturamento.Add(dia);
                    int.TryParse(tblPadrao.Rows[0]["VENCTO7"].ToString(), out dia);
                    obj.PadraoFaturamento.Add(dia);
                }
            }
            #endregion

            #region Verificando se existem títulos em atraso
            var tblTitulos = db.getTitulosEmAtraso(codigo);
            if (tblTitulos.Rows.Count > 0)
            {
                var row = tblTitulos.Rows[0];
                obj.PosicaoFinanceiraTituloEmAtraso = (row["DATA_PAGAMENTO"].ToString().Length == 0);
                obj.PosicaoFinanceiraTituloEmAtrasoData = obj.PosicaoFinanceiraTituloEmAtraso ? row["VENCIMENTO"].ToString().Substring(0,10) : "";
            }
            #endregion

            return obj;
        }

        /// <summary>
        /// Verificar se o cliente utiliza um padrão de vencimentos próprio ou se
        /// utiliza o padrão da vipro.
        /// </summary>
        /// <param name="pCodigo">Código do cliente</param>
        /// <returns>true = cliente possui um padrão próprio</returns>
        public bool isPadraoVencimentoProprio(int pCodigo)
        {
            bool result = true;
            var db = new DbCliente();
            var tbl = db.getPadraoVencimentos(pCodigo);

            result = (tbl.Rows.Count > 0);
            if (result)
            {
                result = (tbl.Rows[0]["PADRAO_VIPRO"].ToString() == "N");
            }

            tbl.Dispose();

            return result;
        }

        /// <summary>
        /// Atualizar o cadastro de cliente com os dados de
        /// UF/municipio do IBGE.
        /// </summary>
        /// <param name="p_cod_municipio">Código do municipio do IBGE</param>
        /// <param name="p_cod_cliente">Código do cliente</param>
        public void gravar_municipio_ibge(int p_cod_cliente, int p_cod_municipio)
        {
            var db = new DbCliente();
            db.gravar_municipio_ibge(p_cod_cliente, p_cod_municipio);
        }
    }
}
