using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using SGELibrary.Data;
using SGELibrary.Objects;

namespace SGELibrary.Businees
{
    public class Pedido
    {
        private DbPedido db = new DbPedido();
        private DbProduto dbPrd = new DbProduto();

        #region métodos públicos

        /// <summary>
        /// Retorna uma lista dos pedidos de um cliente específico.
        /// </summary>
        /// <param name="codigo"></param>
        /// <returns></returns>
        public List<ObjPedido> getListaByCliente(int codigo)
        {
            var lst = new List<ObjPedido>();
            var tbl = db.getByCliente(codigo);

            if (tbl.Rows.Count > 0)
            {
                foreach (DataRow row in tbl.Rows)
                {
                    var obj = new ObjPedido();
                    obj.DataEmissao = Convert.ToDateTime(row["data"].ToString());
                    obj.Numero = Convert.ToInt32(row["numero"].ToString());
                    obj.ValorTotalLiquido = Convert.ToDecimal(row["vlr_total_liquido"].ToString());

                    lst.Add(obj);
                }
            }

            tbl.Dispose();

            return lst;
        }

        /// <summary>
        /// Retorna os dados de um pedido.
        /// </summary>
        /// <param name="numero"></param>
        /// <returns></returns>
        public ObjPedidoFull getDados(int numero)
        {
            var tblPedido = db.getDados(numero);
            var tblProdutos = db.getProdutos(numero);
            var cfgParam = ConfiguracoesParametros.getConfiguracoes();
            var obj = new ObjPedidoFull();
            var cliente = new Cliente();

            #region dados do pedido
            var row = tblPedido.Rows[0];
            obj.Pedido.DataEmissao = Convert.ToDateTime(row["data"].ToString());
            obj.Pedido.Numero = Convert.ToInt32(row["numero"].ToString());
            obj.Pedido.NumeroPedidoCliente = row["pedido_cliente"].ToString();
            obj.Pedido.ValorTotalBruto = Convert.ToDecimal(row["vlr_total"].ToString());
            obj.Pedido.ValorTotalLiquido = Convert.ToDecimal(row["vlr_total_liquido"].ToString());
            #endregion

            #region Dados do cliente
            obj.Cliente = cliente.getDadosByCodigo(Convert.ToInt32(row["CLIENTE"].ToString()));
            #endregion

            #region dados dos produtos
            foreach (DataRow rowP in tblProdutos.Rows)
            {
                var prd = new ObjPedidoProduto();
                prd.EstoqueBaixado = (rowP["BaixadoEstoque"].ToString() == "S");
                prd.ItemSequencial = int.Parse(rowP["item_numero"].ToString());
                prd.PedidoNumero = int.Parse(rowP["pedido_numero"].ToString());
                prd.Produto.CCF = rowP["CCF"].ToString();
                prd.Produto.CCST = rowP["CCST"].ToString();
                prd.Produto.CodClassFiscal = rowP["cod_class_fiscal"].ToString();
                prd.Produto.CodigoId = Convert.ToInt32(rowP["produto_codigo"].ToString());
                prd.Produto.Grupo.GrupoCodigoId = Convert.ToInt32(rowP["grupo_codigo"].ToString());
                prd.Produto.Grupo.GrupoDescricao = rowP["grupo_descricao"].ToString();
                prd.Produto.ICMS = rowP["icms"].ToString() == "NAO ISENTO" ? Tipos.IcmsTipo.Tributado : Tipos.IcmsTipo.Isento;
                
                // Regra para identificar a alíquota de ICMS.
                switch (prd.Produto.ICMS)
                {
                    case Tipos.IcmsTipo.Isento:
                        prd.Produto.ICMS_Aliquota = 0;
                        break;

                    case Tipos.IcmsTipo.Tributado:
                        if (cfgParam.VIPRO_UF != obj.Cliente.EnderecoUF)
                        {
                            var result = cfgParam.ListaIcmsAliquotaUF.Find(
                                            delegate(Tipos.IcmsAliquota icm)
                                            {
                                                return icm.UF == obj.Cliente.EnderecoUF;
                                            }
                                        );
                            prd.Produto.ICMS_Aliquota = Convert.ToInt32(result.Aliquota);
                        }
                        else
                        {
                            prd.Produto.ICMS_Aliquota = Convert.ToInt32(rowP["ICMS_ALIQUOTA"].ToString());
                        }
                        break;
                }
                
                prd.Produto.Marca.CodigoId = Convert.ToInt32(rowP["marca_codigo"].ToString());
                prd.Produto.Marca.Descricao = rowP["marca_descricao"].ToString();
                prd.Produto.Marca.Margem = Convert.ToDecimal(rowP["marca_margem"].ToString());
                prd.Produto.Numero = rowP["numero"].ToString();
                prd.Produto.Serie.CodigoId = Convert.ToInt32(rowP["serie_codigo"].ToString());
                prd.Produto.Serie.Descricao = rowP["serie_descricao"].ToString();
                prd.Produto.Serie.Grupo.GrupoCodigoId = prd.Produto.Grupo.GrupoCodigoId;
                prd.Produto.Serie.Grupo.GrupoDescricao = prd.Produto.Grupo.GrupoDescricao;
                prd.Produto.Unidade = rowP["tipo_unidade"].ToString();
                prd.Qtde = Convert.ToDecimal(rowP["qtde"].ToString());
                prd.ValorTotal = Convert.ToDecimal(rowP["vlr_total"].ToString());
                prd.ValorUnitario = Convert.ToDecimal(rowP["vlr_unitario"].ToString());
                prd.Produto.IPI_Aliquota = rowP["IPI"].ToString().Length == 0 ? 0 : int.Parse(rowP["IPI"].ToString());

                var tblPrd = dbPrd.getDados(
                                        Convert.ToInt32(rowP["PRODUTO_CODIGO"].ToString())
                                        );
                prd.Produto.SubstituicaoTributaria.Codigo = tblPrd.Rows[0]["CCST"].ToString();
                prd.Produto.SubstituicaoTributaria.Descricao = tblPrd.Rows[0]["TRIBUTA_DESCR"].ToString();
                prd.Produto.SubstituicaoTributaria.ExecutaCalculoSubstituicao = (tblPrd.Rows[0]["TRIBUTA_EXEC_CALCULO"].ToString() == "S");

                obj.Produtos.Add(prd);
            }
            #endregion

            return obj;
        }

        #endregion
    }
}
