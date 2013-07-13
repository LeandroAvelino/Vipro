using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SGELibrary.Objects
{
    [Serializable]
    public class ObjMarcaProduto
    {
        public int CodigoId { get; set; }
        public string Descricao { get; set; }
        public decimal Margem { get; set; }
    }
}
