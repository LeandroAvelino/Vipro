using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SGELibrary.Objects
{
    [Serializable]
    public class ObjNaturezaOperacao
    {
        public string CodigoId { get; set; }
        public string Descricao { get; set; }
        public string CFOP { get; set; }
        
        /// <summary>
        /// Utilizado para ser visualizado e impresso na NF-e
        /// </summary>
        public string DescricaoNF { get; set; }
    }
}
