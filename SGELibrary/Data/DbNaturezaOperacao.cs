using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using MySql.Data.MySqlClient;

namespace SGELibrary.Data
{
    public class DbNaturezaOperacao : conexao
    {
        public DataTable getLista()
        {
            sql.Clear();
            sql.AppendLine("select cno.IDCODIGO,");
            sql.AppendLine("       cno.DESCRICAO,");
            sql.AppendLine("       cno.DESCRICAO_NATUREZA");
            sql.AppendLine("from   CADASTRO_NATUREZA_OPERACOES cno");
            sql.AppendLine("order  by cno.DESCRICAO");

            param.Clear();

            return base.getTbl();
        }

        public DataTable getDados(string pCodigo)
        {
            sql.Clear();
            sql.AppendLine("SELECT cno.descricao_natureza");
            sql.AppendLine("  FROM CADASTRO_NATUREZA_OPERACOES cno");
            sql.AppendLine(" WHERE cno.idcodigo = ?");

            param.Clear();
            param.Add(new Parametro("idcodigo", MySqlDbType.VarChar, pCodigo));

            return base.getTbl();
        }
    }
}
