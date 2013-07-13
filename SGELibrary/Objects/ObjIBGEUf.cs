using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SGELibrary.Objects
{
    public class ObjIBGEUf
    {
        #region Propriedades

        /// <summary>
        /// Código do UF no IBGE
        /// </summary>
        public int Codigo { get; set; }

        /// <summary>
        /// Sigla do UF, ex: SP, RJ, RO...
        /// </summary>
        public string Sigla { get; set; }

        #endregion
    }
}
