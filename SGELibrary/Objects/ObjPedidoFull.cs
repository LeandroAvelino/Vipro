using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SGELibrary.Objects
{
    [Serializable]
    public class ObjPedidoFull
    {
        #region propriedades

        public ObjPedido Pedido { get; set; }
        public List<ObjPedidoProduto> Produtos { get; set; }
        public ObjClienteFull Cliente { get; set; }

        #endregion

        // contrutor
        public ObjPedidoFull()
        {
            Pedido = new ObjPedido();
            Produtos = new List<ObjPedidoProduto>();
            Cliente = new ObjClienteFull();
        }
    }
}
