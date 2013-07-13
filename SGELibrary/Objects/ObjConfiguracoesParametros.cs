using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using SGELibrary.Businees;

namespace SGELibrary.Objects
{
    [Serializable]
    public class ObjConfiguracoesParametros
    {
        /// <summary>
        /// Propriedade que destaca a alíquota de ICMS da VIPRO.
        /// </summary>
        public int ICMS_Aliquota { get; set; }

        /// <summary>
        /// Lista as aliquotas de ICMS por UF.
        /// </summary>
        public List<Tipos.IcmsAliquota> ListaIcmsAliquotaUF { get; set; }

        /// <summary>
        /// Path do local onde o arquivo de exportação da NF-e deve ser gerado.
        /// </summary>
        public string NfePathExportarArquivo { get; set; }

        /// <summary>
        /// Número da última NF-e emitida.
        /// </summary>
        public int NumeroUltimaNFeEmitida { get; set; }

        /// <summary>
        /// Unidade da Federação (Estado) da VIPRO.
        /// </summary>
        public string VIPRO_UF { get; set; }

        /// <summary>
        /// Certificado Digital da VIPRO;
        /// </summary>
        public X509Certificate2 X509Certificado { get; set; }
        
        /// <summary>
        /// Construtor da classe.
        /// </summary>
        public ObjConfiguracoesParametros()
        {
            this.ListaIcmsAliquotaUF = new List<Tipos.IcmsAliquota>();
        }

    }
}
