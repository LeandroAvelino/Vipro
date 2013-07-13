using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using MySql.Data.MySqlClient;

namespace SGELibrary.Data
{
    public class DbPedido : conexao
    {
        private StringBuilder qry = new StringBuilder();
        private List<Parametro> par = new List<Parametro>();

        public DataTable getByCliente(int codigo)
        {

            sql.Clear();
            sql.AppendLine("select pv.numero,");
            sql.AppendLine("       pv.data,");
            sql.AppendLine("       pv.VLR_TOTAL_LIQUIDO");
            sql.AppendLine("from   PEDIDO_VENDA pv");
            sql.AppendLine("where  pv.BAIXADO is null");
            sql.AppendLine("       and pv.CLIENTE = ?");

            param.Clear();
            param.Add(new Parametro("cliente", MySqlDbType.Int32, codigo));

            return base.getTbl();
        }

        public DataTable getDados(int numero)
        {
            sql.Clear();
            sql.AppendLine("select pv.*");
            sql.AppendLine("from   PEDIDO_VENDA pv");
            sql.AppendLine("where  pv.numero = ?");

            param.Clear();
            param.Add(new Parametro("numero", MySqlDbType.Int32, numero));

            return base.getTbl();
        }

        public DataTable getProdutos(int pedidoNumero)
        {
            sql.Clear();
            sql.AppendLine("select pvi.PEDIDO_NUMERO,  pvi.ITEM_NUMERO,  pvi.QTDE,  pvi.VLR_UNITARIO,  pvi.VLR_TOTAL,  pvi.BaixadoEstoque,");
            sql.AppendLine("       cp.CODIGO as produto_codigo,  cp.NUMERO,  cp.CCST,  cp.CCF,  cp.TIPO_UNIDADE,  cp.ICMS,  cp.COD_CLASS_FISCAL,");
            sql.AppendLine("       cp.IPI, cp.icms_aliquota,");
            sql.AppendLine("       cg.CODIGO as grupo_codigo, cg.DESCRICAO as grupo_descricao,");
            sql.AppendLine("       cs.CODIGO as serie_codigo, cs.SERIE as serie_descricao,");
            sql.AppendLine("       cm.CODIGO as marca_codigo, cm.DESCRICAO as marca_descricao, cm.MARGEM as marca_margem");
            sql.AppendLine("from   PEDIDO_VENDA_ITENS pvi");
            sql.AppendLine("       inner join CADASTRO_PRODUTOS cp on cp.CODIGO = pvi.PRODUTO_CODIGO");
            sql.AppendLine("       inner join CADASTRO_GRUPOS cg on cg.CODIGO = cp.GRUPO_CODIGO");
            sql.AppendLine("       inner join CADASTRO_SERIES cs on cs.CODIGO = cp.SERIE_CODIGO");
            sql.AppendLine("       inner join CADASTRO_MARCAS cm on cm.CODIGO = cp.MARCA_CODIGO");
            sql.AppendLine("where  pvi.PEDIDO_NUMERO = ?");
            sql.AppendLine("order  by pvi.ITEM_NUMERO");

            param.Clear();
            param.Add(new Parametro("pedido_numero", MySqlDbType.Int32, pedidoNumero));

            return base.getTbl();
        }
    }
}
