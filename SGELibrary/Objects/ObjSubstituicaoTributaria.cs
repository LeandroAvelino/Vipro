using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SGELibrary.Objects
{
    [Serializable]
    public class ObjSubstituicaoTributaria
    {
        public string Codigo { get; set; }

        public string Descricao { get; set; }

        public bool ExecutaCalculoSubstituicao { get; set; }
    }
}
