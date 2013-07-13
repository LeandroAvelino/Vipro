using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SGELibrary.Businees
{
    /// <summary>
    /// Classe genérica para métodos que auxiliam em diversas finalidades.
    /// </summary>
    public static class Util
    {

        /// <summary>
        /// Remover a formatação.
        /// Remove ".", "/" e "-"
        /// </summary>
        /// <param name="pValue"></param>
        /// <returns></returns>
        public static string getRemoverFormatacao(string pValue)
        {
            string result = pValue.Replace(".", "").Replace("/", "").Replace("-", "");
            return result;
        }

        public static string get_letra_parcela(int numero_parcela)
        {
            List<string> letra = new List<string>();
            letra.Add("A");
            letra.Add("B");
            letra.Add("C");
            letra.Add("D");
            letra.Add("E");
            letra.Add("F");
            letra.Add("G");
            letra.Add("H");
            letra.Add("I");
            letra.Add("J");
            letra.Add("K");
            letra.Add("L");
            letra.Add("M");
            letra.Add("N");
            letra.Add("O");
            letra.Add("P");
            letra.Add("Q");
            letra.Add("R");
            letra.Add("S");
            letra.Add("T");
            letra.Add("U");
            letra.Add("V");
            letra.Add("W");
            letra.Add("X");
            letra.Add("Y");
            letra.Add("Z");

            return letra[numero_parcela - 1];
        }

        /// <summary>
        /// Retornar o valor da chave na seção appSettings.
        /// </summary>
        /// <param name="key">Nome da chave</param>
        /// <returns>Valor da chave</returns>
        public static string get_settings(string key)
        {
            return System.Configuration.ConfigurationManager.AppSettings.Get(key);
        }
    }
}
