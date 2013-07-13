using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SGELibrary.Objects
{
    [Serializable]
    public class ObjClienteFantasia
    {
        public int CodigoID { get; set; }
        public string NomeFantasia { get; set; }
        public string RazaoSocial { get; set; }
    }
}
