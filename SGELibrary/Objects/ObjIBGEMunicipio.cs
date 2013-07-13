using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SGELibrary.Objects
{
    public class ObjIBGEMunicipio
    {

        #region Propriedades

        /// <summary>
        /// Código do município no IBGE
        /// </summary>
        public int Codigo { get; set; }
        
        /// <summary>
        /// Nome do município
        /// </summary>
        public string Descricao { get; set; }

        #endregion
    }
}
