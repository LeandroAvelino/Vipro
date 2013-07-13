using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using SGELibrary.Data;

namespace SGELibrary.Businees
{
    public class Produto
    {
        private DbProduto db = new DbProduto();


        /// <summary>
        /// Verifica se o produto é com substituição tributária.
        /// </summary>
        /// <param name="pCodigo">Código do produto</param>
        /// <returns></returns>
        public bool IsSubstituicaoTributaria(int pCodigo)
        {
            var tbl = db.getDados(pCodigo);
            bool result = (tbl.Rows[0]["TRIBUTA_EXEC_CALCULO"].ToString() == "S");

            tbl.Dispose();

            return result;
        }
    }
}
