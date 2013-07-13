using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SGELibrary.Businees;

namespace SGELibrary.Objects
{
    [Serializable]
    public class ObjProduto
    {
        public int CodigoId { get; set; }
        public ObjGrupoProduto Grupo { get; set; }
        public ObjSerieProduto Serie { get; set; }
        public ObjMarcaProduto Marca { get; set; }
        public string Numero { get; set; }
        public string CCST { get; set; }
        public string CCF { get; set; }
        public string Unidade { get; set; }
        public Tipos.IcmsTipo ICMS { get; set; }
        public int ICMS_Aliquota { get; set; }
        public string CodClassFiscal { get; set; }
        public int IPI_Aliquota { get; set; }
        public ObjSubstituicaoTributaria SubstituicaoTributaria { get; set; }
        public string CFOP { get; set; }

        public ObjProduto()
        {
            this.Grupo = new ObjGrupoProduto();
            this.Serie = new ObjSerieProduto();
            this.Marca = new ObjMarcaProduto();
            this.SubstituicaoTributaria = new ObjSubstituicaoTributaria();
            this.IPI_Aliquota = 0;
            this.ICMS_Aliquota = 0;
        }
    }
}
