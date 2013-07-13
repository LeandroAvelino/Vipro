using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using SGELibrary.Objects;
using SGELibrary.Data;

namespace SGELibrary.Businees
{
    public class ConfiguracoesParametros
    {
        private static ObjConfiguracoesParametros cfgParam;

        public static ObjConfiguracoesParametros getConfiguracoes()
        {
            if (cfgParam == null)
                cfgParam = new ObjConfiguracoesParametros();

            var db = new DbConfiguracoesParametros();

            #region Recuperando informações sobre ICMS
            var tblIcms = db.getParametroIcms();
            cfgParam.ICMS_Aliquota = Convert.ToInt32(tblIcms.Rows[0]["PercentICMS"].ToString());
            tblIcms.Dispose();
            #endregion

            #region Recuperando informações sobre as aliquotas de ICMS.
            cfgParam.ListaIcmsAliquotaUF.Clear();
            var _tblAliquotasIcms = db.getIcmsAliquotasUF();
            foreach (DataRow row in _tblAliquotasIcms.Rows)
            {
                var _aliquota = new Tipos.IcmsAliquota();
                _aliquota.Aliquota = Convert.ToDecimal(row["ICMS_ALIQUOTA"].ToString());
                _aliquota.UF = row["ICMS_UF"].ToString();

                cfgParam.ListaIcmsAliquotaUF.Add(_aliquota);
            }
            _tblAliquotasIcms.Dispose();
            #endregion

            #region Recuperando informações sobre o path para exportar o arquivo NF-e
            var tblConfiguracoes = db.getConfiguracoesGerais();
            cfgParam.NfePathExportarArquivo = tblConfiguracoes.Rows[0]["PathExportarArquivoNFe"].ToString();
            cfgParam.NumeroUltimaNFeEmitida = Convert.ToInt32(tblConfiguracoes.Rows[0]["UltimaNfeEmitida"].ToString());
            tblConfiguracoes.Dispose();
            #endregion

            #region Recuperando UF da VIPRO.
            var tblViproUF = db.getViproUF();
            cfgParam.VIPRO_UF = tblViproUF.Rows[0]["VIPRO_UF"].ToString();
            tblViproUF.Dispose();
            #endregion

            #region Recuperando o certificado digital
            cfgParam.X509Certificado = null;
            var store = new X509Store("MY", StoreLocation.CurrentUser);
            store.Open(OpenFlags.ReadOnly | OpenFlags.OpenExistingOnly);
            X509Certificate2Collection collection = (X509Certificate2Collection)store.Certificates;
            cfgParam.X509Certificado = collection.Find(X509FindType.FindBySubjectName, "JRC CONSULTORIA", true)[0];
            #endregion

            return cfgParam;
        }
    }
}
