using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SGELibrary.Objects
{
    [Serializable]
    public class ObjPedidoProduto
    {
        public int PedidoNumero { get; set; }
        public int ItemSequencial { get; set; }
        public ObjProduto Produto { get; set; }
        public decimal Qtde { get; set; }
        public decimal ValorUnitario { get; set; }
        public decimal ValorTotal { get; set; }
        public bool EstoqueBaixado { get; set; }
        public bool Identico { get; set; }

        public ObjPedidoProduto()
        {
            this.Produto = new ObjProduto();
        }
    }
}
