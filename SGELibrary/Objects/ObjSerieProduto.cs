using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SGELibrary.Objects
{
    [Serializable]
    public class ObjSerieProduto
    {
        public int CodigoId { get; set; }
        public string Descricao { get; set; }
        public ObjGrupoProduto Grupo { get; set; }

        public ObjSerieProduto()
        {
            this.Grupo = new ObjGrupoProduto();
        }
    }
}
