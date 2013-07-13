using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SGELibrary.Objects
{
    [Serializable]
    public class ObjPedido
    {
        #region propriedades

        public int Numero { get; set; }
        public decimal ValorTotalBruto { get; set; }
        public decimal ValorTotalLiquido { get; set; }
        public DateTime DataEmissao { get; set; }
        public string NumeroPedidoCliente { get; set; }

        #endregion
    }
}
