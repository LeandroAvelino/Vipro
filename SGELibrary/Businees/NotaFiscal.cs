using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using SGELibrary.Objects;
using SGELibrary.Data;

namespace SGELibrary.Businees
{
    public class NotaFiscal
    {
        private DbNotaFiscal db = new DbNotaFiscal();

        public void gravar_nova_nota(ObjNotaFiscal nfe)
        {
            db.gravar_nova_nota(nfe);
        }
    }
}
