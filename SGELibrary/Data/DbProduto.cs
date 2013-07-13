using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using MySql.Data.MySqlClient;

namespace SGELibrary.Data
{
    public class DbProduto : conexao
    {
        /// <summary>
        /// Retorna os dados do produto
        /// </summary>
        /// <param name="pCodigo">Código do produto</param>
        /// <returns></returns>
        public DataTable getDados(int pCodigo)
        {
            sql.Clear();
            sql.AppendLine("select cp.CODIGO as produto_codigo,  cp.NUMERO,  cp.CCST,  cp.CCF,  cp.TIPO_UNIDADE,  cp.ICMS,  cp.COD_CLASS_FISCAL,");
            sql.AppendLine("       cp.IPI,");
            sql.AppendLine("       cg.CODIGO as grupo_codigo, cg.DESCRICAO as grupo_descricao,");
            sql.AppendLine("       cs.CODIGO as serie_codigo, cs.SERIE as serie_descricao,");
            sql.AppendLine("       cm.CODIGO as marca_codigo, cm.DESCRICAO as marca_descricao, cm.MARGEM as marca_margem,");
            sql.AppendLine("       stB.TRIBUTA_DESCR, stB.TRIBUTA_EXEC_CALCULO");
            sql.AppendLine("from   CADASTRO_PRODUTOS cp");
            sql.AppendLine("       inner join CADASTRO_GRUPOS cg on cg.CODIGO = cp.GRUPO_CODIGO");
            sql.AppendLine("       inner join CADASTRO_SERIES cs on cs.CODIGO = cp.SERIE_CODIGO");
            sql.AppendLine("       inner join CADASTRO_MARCAS cm on cm.CODIGO = cp.MARCA_CODIGO");
            sql.AppendLine("       left join CAD_SUBST_TRIB_A stA on stA.origem_cod = SUBSTRING(cp.CCST,1,1)");
            sql.AppendLine("       left join CAD_SUBST_TRIB_B stB on stB.tributa_cod = SUBSTRING(cp.CCST,2,2)");
            sql.AppendLine("where  cp.codigo = ?");

            param.Clear();
            param.Add(new Parametro("codigo", MySqlDbType.Int32, pCodigo));

            return base.getTbl();
        }

    }
}
