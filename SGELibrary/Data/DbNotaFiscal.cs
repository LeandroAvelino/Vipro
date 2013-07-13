using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using SGELibrary.Objects;
using MySql.Data.MySqlClient;

namespace SGELibrary.Data
{
    class DbNotaFiscal : conexao
    {
        public void gravar_nova_nota(ObjNotaFiscal nfe)
        {
            #region gravando dados base da nota
            sql.Clear();
            sql.AppendLine("INSERT INTO NF_VENDAS");
            sql.AppendLine("(REPRESENTANTE, SAIDA_ENTRADA, NOTA, CLIENTE, EMISSAO, NATUREZA, CFOP, PAGAMENTO, QTDE_FATURAMENTO,");
            sql.AppendLine(" VLR_TOTAL_NF, COBRANCA, TRANSPORTADORA, FRETE, QUANTIDADE, ESPECIE, MARCA, NUMERO, PESO_BRUTO,");
            sql.AppendLine(" PESO_LIQUIDO, MEMORANDO, BASE_ICMS, VLR_ICMS, VLR_PRODUTOS, VLR_FRETE, VLR_SEGURO, VLR_OUTROS,");
            sql.AppendLine(" VLR_IPI,  BASE_CALC_IMCS_ST, VLR_ICMS_ST)");
            sql.AppendLine("VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");

            param.Clear();
            param.Add(new Parametro("representante", MySqlDbType.Int32, nfe.Base.Representante));
            param.Add(new Parametro("saida_entrada", MySqlDbType.VarChar, nfe.Base.saida_entrada));
            param.Add(new Parametro("nota", MySqlDbType.Int32, nfe.Base.nota_numero));
            param.Add(new Parametro("cliente", MySqlDbType.Int32, nfe.Destinatario.propCodigoID));
            param.Add(new Parametro("emissao", MySqlDbType.Date, nfe.Base.data_emissao));
            param.Add(new Parametro("natureza", MySqlDbType.VarChar, nfe.Base.natureza_operacao));
            param.Add(new Parametro("cfop", MySqlDbType.VarChar, nfe.Base.CFOP));
            param.Add(new Parametro("pagamento", MySqlDbType.VarChar, nfe.Base.tipo_pagamento));
            param.Add(new Parametro("qtde_faturamento", MySqlDbType.Int32, nfe.Base.qtd_parcelas_pagamento));
            param.Add(new Parametro("vlr_total_nf", MySqlDbType.Double, nfe.Base.valor_total_nf));
            param.Add(new Parametro("cobranca", MySqlDbType.VarChar, nfe.Base.tipo_cobranca));
            param.Add(new Parametro("transportadora", MySqlDbType.Int32, nfe.Transportador.CodigoID));
            param.Add(new Parametro("frete", MySqlDbType.VarChar, nfe.Base.tipo_frete));
            param.Add(new Parametro("quantidade", MySqlDbType.VarChar, nfe.Base.volume_quantidade));
            param.Add(new Parametro("especie", MySqlDbType.VarChar, nfe.Base.volume_especie));
            param.Add(new Parametro("marca", MySqlDbType.VarChar, nfe.Base.volume_marca));
            param.Add(new Parametro("numero", MySqlDbType.VarChar, nfe.Base.volume_numero));
            param.Add(new Parametro("peso_bruto", MySqlDbType.VarChar, nfe.Base.volume_peso_bruto));
            param.Add(new Parametro("peso_liquido", MySqlDbType.VarChar, nfe.Base.volume_peso_liquido));
            param.Add(new Parametro("memorando", MySqlDbType.VarChar, nfe.Base.informacoes_adicionais));
            param.Add(new Parametro("base_icms", MySqlDbType.Double, nfe.Totais.base_icms));
            param.Add(new Parametro("vlr_icms", MySqlDbType.Double, nfe.Totais.icms));
            param.Add(new Parametro("vlr_produtos", MySqlDbType.Double, nfe.Totais.produtos));
            param.Add(new Parametro("vlr_frete", MySqlDbType.Double, nfe.Totais.frete));
            param.Add(new Parametro("vlr_seguro", MySqlDbType.Double, nfe.Totais.seguro));
            param.Add(new Parametro("vlr_outros", MySqlDbType.Double, nfe.Totais.outros));
            param.Add(new Parametro("vlr_ipi", MySqlDbType.Double, nfe.Totais.ipi));
            param.Add(new Parametro("base_calc_icms_st", MySqlDbType.Double, nfe.Totais.base_icms_st));
            param.Add(new Parametro("vlr_icms_st", MySqlDbType.Double, nfe.Totais.icms_st));

            base.execCommand();
            #endregion

            #region gravando dados dos produtos
            foreach (ObjPedidoProduto prd in nfe.Produtos)
            {
                sql.Clear();
                sql.AppendLine("INSERT INTO NF_VENDAS_ITENS");
                sql.AppendLine("(NOTA, PEDIDO_NUMERO, GRUPO, SERIE, PRODUTO, MARCA, QTDE, VLR_UNITARIO, VLR_TOTAL,");
                sql.AppendLine(" PRODUTO_CODIGO, CL_FISCAL, SIT_TRIB, ALIQ_ICMS, ALIQ_IPI)");
                sql.AppendLine("VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");

                param.Clear();
                param.Add(new Parametro("nota", MySqlDbType.Int32, nfe.Base.nota_numero));
                param.Add(new Parametro("pedido_numero", MySqlDbType.Int32, prd.PedidoNumero));
                param.Add(new Parametro("grupo", MySqlDbType.Int32, prd.Produto.Grupo.GrupoCodigoId));
                param.Add(new Parametro("serie", MySqlDbType.Int32, prd.Produto.Serie.CodigoId));
                param.Add(new Parametro("produto", MySqlDbType.VarChar, prd.Produto.Numero));
                param.Add(new Parametro("marca", MySqlDbType.Int32, prd.Produto.Marca.CodigoId));
                param.Add(new Parametro("qtde", MySqlDbType.Double, prd.Qtde));
                param.Add(new Parametro("vlr_unitario", MySqlDbType.Double, prd.ValorUnitario));
                param.Add(new Parametro("vlr_total", MySqlDbType.Double, prd.ValorTotal));
                param.Add(new Parametro("produto_codigo", MySqlDbType.Int32, prd.Produto.CodigoId));
                param.Add(new Parametro("cl_fiscal", MySqlDbType.VarChar, prd.Produto.CCST));
                param.Add(new Parametro("sit_trib", MySqlDbType.VarChar, prd.Produto.CCF));
                param.Add(new Parametro("ALIQ_ICMS", MySqlDbType.Double, prd.Produto.ICMS_Aliquota));
                param.Add(new Parametro("ALIQ_IPI", MySqlDbType.Double, prd.Produto.IPI_Aliquota));

                base.execCommand();
            }
            #endregion

            #region gravando dados de cobrança
            foreach (ObjNotaFiscalCobrancaParcela parc in nfe.Cobranca)
            {
                sql.Clear();
                sql.AppendLine("INSERT INTO NF_VENDAS_VENCIMENTOS");
                sql.AppendLine("(NOTA, PARCELA, PARCELA_LETRA, VENCIMENTO, VALOR, POSICAO)");
                sql.AppendLine("VALUES (?, ?, ?, ?, ?, ?)");

                param.Clear();
                param.Add(new Parametro("nota", MySqlDbType.Int32, nfe.Base.nota_numero));
                param.Add(new Parametro("parcela", MySqlDbType.Int32, parc.numero));
                param.Add(new Parametro("parcela_letra", MySqlDbType.VarChar, parc.letra));
                param.Add(new Parametro("vencimento", MySqlDbType.Date, parc.vencimento));
                param.Add(new Parametro("valor", MySqlDbType.Double, parc.valor));
                param.Add(new Parametro("posicao", MySqlDbType.Int32, parc.posicao));

                base.execCommand();
            }
            #endregion

            #region atualizando o número da última nota gravada
            sql.Clear();
            sql.AppendLine("UPDATE CONFIGURACOES");
            sql.AppendLine("   SET UltimaNotaFiscal = ?");

            param.Clear();
            param.Add(new Parametro("ultima_nota", MySqlDbType.Int32, nfe.Base.nota_numero));

            execCommand();
            #endregion

            #region atualizando o status do pedido como utilizado

            foreach (string _num_pedido in nfe.ListaPedidos)
            {
                sql.Clear();
                sql.AppendLine("UPDATE PEDIDO_VENDA");
                sql.AppendLine("   SET baixado = ?");
                sql.AppendLine("       , baixado_nf = ?");
                sql.AppendLine(" WHERE numero = ?");

                param.Clear();
                param.Add(new Parametro("baixado", MySqlDbType.VarChar, "S"));
                param.Add(new Parametro("baixado_nf", MySqlDbType.VarChar, nfe.Base.nota_numero.ToString()));
                param.Add(new Parametro("numero", MySqlDbType.Int32, Int32.Parse(_num_pedido)));

                execCommand();
            }
            #endregion
        }
    }
}
