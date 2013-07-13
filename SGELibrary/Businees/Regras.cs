using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using SGELibrary.Data;
using SGELibrary.Objects;

namespace SGELibrary.Businees
{
    /// <summary>
    /// Classe utilizada para aplicar as regras de negócio.
    /// </summary>
    public class Regras
    {

        /// <summary>
        /// Método para validar o CNPJ
        /// </summary>
        /// <param name="pCNPJ">CNPJ com máscara</param>
        /// <returns></returns>
        public static bool ValidarCNPJ(string pCNPJ)
        {
            if (Regex.IsMatch(pCNPJ, @"(^(\d{2}.\d{3}.\d{3}/\d{4}-\d{2})|(\d{14})$)"))
            {
                return ConsistirCNPJ(pCNPJ);
            }
            else
            {
                return false;
            }
        }

        /// <summary>
        /// Retornar o padrão utilizado para calcular os vencimentos
        /// da nota fiscal no padrão da VIPRO.
        /// </summary>
        /// <returns></returns>
        public static List<Tipos.PadraoVencimentoVipro> getPadraoVencimentoVipro()
        {
            var result = new List<Tipos.PadraoVencimentoVipro>();
            var db = new DbConfiguracoesParametros();
            var tbl = db.getVencimentosPadraoVipro();

            foreach (DataRow row in tbl.Rows)
            {
                var dias = new List<int>();
                dias.Add(int.Parse(row["DDL1"].ToString()));
                if (row["DDL2"].ToString().Length > 0)
                    dias.Add(int.Parse(row["DDL2"].ToString()));
                if (row["DDL3"].ToString().Length > 0)
                    dias.Add(int.Parse(row["DDL3"].ToString()));
                if (row["DDL4"].ToString().Length > 0)
                    dias.Add(int.Parse(row["DDL4"].ToString()));
                if (row["DDL5"].ToString().Length > 0)
                    dias.Add(int.Parse(row["DDL5"].ToString()));
                if (row["DDL6"].ToString().Length > 0)
                    dias.Add(int.Parse(row["DDL6"].ToString()));

                result.Add(new Tipos.PadraoVencimentoVipro(Convert.ToDecimal(row["DE"].ToString()),
                                                           Convert.ToDecimal(row["ATE"].ToString()),
                                                           dias)
                                                           );
            }

            return result;
        }

        /// <summary>
        /// Retornar a alíquota de ICMS do estado.
        /// </summary>
        /// <param name="pUF">Unidade da Federação (Estado)</param>
        /// <returns></returns>
        public static decimal getAliquotaIcms(string pUF)
        {
            var cfg = ConfiguracoesParametros.getConfiguracoes();
            var result = cfg.ListaIcmsAliquotaUF.Find(
                            delegate(Tipos.IcmsAliquota icm)
                            {
                                return icm.UF == pUF;
                            }
                         );
            return result.Aliquota;
        }

        /// <summary>
        /// Retornar a lista dos estados do Brasil no padrão do IBGE.
        /// </summary>
        /// <returns></returns>
        public static List<ObjIBGEUf> getListaIBGEUF()
        {
            var result = new List<ObjIBGEUf>();
            var db = new DbConfiguracoesParametros();
            var tbl = db.getListaIBGEUF();
            ObjIBGEUf obj;

            foreach (DataRow rw in tbl.Rows)
            {
                obj = new ObjIBGEUf();
                obj.Codigo = Convert.ToInt32(rw["CODUF"].ToString());
                obj.Sigla = rw["UF"].ToString();

                result.Add(obj);
            }

            tbl.Dispose();

            return result;
        }

        /// <summary>
        /// Retornar a lista de municípios com base em uma UF.
        /// </summary>
        /// <param name="pUF">Unidade da federação (estado)</param>
        /// <returns></returns>
        public static List<ObjIBGEMunicipio> getListaIBGEMunicipio(string pUF)
        {
            var result = new List<ObjIBGEMunicipio>();
            var db = new DbConfiguracoesParametros();
            var tbl = db.getListaIBGEMunicipio(pUF);
            ObjIBGEMunicipio obj;

            foreach (DataRow rw in tbl.Rows)
            {
                obj = new ObjIBGEMunicipio();
                obj.Codigo = Convert.ToInt32(rw["codCidade"].ToString());
                obj.Descricao = rw["cidade"].ToString();

                result.Add(obj);
            }

            tbl.Dispose();

            return result;
        }

        #region Métodos privados

        private static bool ConsistirCNPJ(string cnpj)
        {

            Int32[] digitos, soma, resultado;
            Int32 nrDig;
            String ftmt;
            Boolean[] cnpjOk;

            cnpj = cnpj.Replace("/", "");
            cnpj = cnpj.Replace(".", "");
            cnpj = cnpj.Replace("-", "");

            if (cnpj == "00000000000000")
            {
                return false;
            }

            ftmt = "6543298765432";
            digitos = new Int32[14];
            soma = new Int32[2];
            soma[0] = 0;
            soma[1] = 0;
            resultado = new Int32[2];
            resultado[0] = 0;
            resultado[1] = 0;
            cnpjOk = new Boolean[2];
            cnpjOk[0] = false;
            cnpjOk[1] = false;

            try
            {
                for (nrDig = 0; nrDig < 14; nrDig++)
                {
                    digitos[nrDig] = int.Parse(cnpj.Substring(nrDig, 1));

                    if (nrDig <= 11)
                        soma[0] += (digitos[nrDig] *
                                    int.Parse(ftmt.Substring(nrDig + 1, 1)));

                    if (nrDig <= 12)
                        soma[1] += (digitos[nrDig] *
                                    int.Parse(ftmt.Substring(nrDig, 1)));
                }

                for (nrDig = 0; nrDig < 2; nrDig++)
                {
                    resultado[nrDig] = (soma[nrDig] % 11);

                    if ((resultado[nrDig] == 0) || (resultado[nrDig] == 1))
                        cnpjOk[nrDig] = (digitos[12 + nrDig] == 0);
                    else
                        cnpjOk[nrDig] = (digitos[12 + nrDig] == (
                                            11 - resultado[nrDig]));
                }

                return (cnpjOk[0] && cnpjOk[1]);
            }
            catch
            {
                return false;
            }
        }

        #endregion

    }
}
