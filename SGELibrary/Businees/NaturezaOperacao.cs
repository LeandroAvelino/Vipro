using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using SGELibrary.Data;
using SGELibrary.Objects;

namespace SGELibrary.Businees
{
    public class NaturezaOperacao
    {
        private DbNaturezaOperacao db = new DbNaturezaOperacao();

        public List<ObjNaturezaOperacao> getLista()
        {
            var lista = new List<ObjNaturezaOperacao>();
            var tbl = db.getLista();

            foreach (DataRow row in tbl.Rows)
            {
                var obj = new ObjNaturezaOperacao();
                obj.CFOP = row["IDCODIGO"].ToString();
                obj.CodigoId = row["IDCODIGO"].ToString();
                obj.Descricao = row["DESCRICAO"].ToString();
                obj.DescricaoNF = row["DESCRICAO_NATUREZA"].ToString();

                lista.Add(obj);
            }

            return lista;
        }

        /// <summary>
        /// Retornar a descrição utilizada para ser emitida na NF.
        /// </summary>
        /// <param name="pCodigo">Código do CFOP</param>
        /// <returns></returns>
        public string getDescricaoNf(string pCodigo)
        {
            string result = "";
            var tbl = db.getDados(pCodigo);

            if (tbl.Rows.Count > 0)
                result = tbl.Rows[0]["DESCRICAO_NATUREZA"].ToString();

            tbl.Dispose();

            return result;
        }
    }
}
