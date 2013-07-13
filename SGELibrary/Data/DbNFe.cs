using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using MySql.Data.MySqlClient;
using SGELibrary.Businees;

namespace SGELibrary.Data
{
    public class DbNFe : conexao
    {

        #region GravarTransmitir
        /// <summary>
        /// Grava os dados do processo de transmissão para o SEFAZ.
        /// </summary>
        /// <param name="xmlTransmitido">Estrutura do XML transmitido.</param>
        /// <param name="xmlRetornoSefaz">Estrutura do XML retornado</param>
        /// <param name="numeroProtocolo">Número do protocolo retornado pelo SEFAZ.</param>
        public void GravarTransmitir(string xmlTransmitido, string xmlRetornoSefaz, string numeroProtocolo, int pNumeroNota)
        {
            sql.Clear();
            sql.AppendLine("INSERT INTO NFE_TRANSMITIR");
            sql.AppendLine("(NR_NF_INTERNO, DT_TRANSMISSAO,");
            sql.AppendLine(" HR_TRANSMISSAO, XML_TRANSMITIDO, NR_PROTOCOLO_SEFAZ,");
            sql.AppendLine(" QTD_TENTATIVAS_RETORNO, ST_SUCESSO_RETORNO, XML_RETORNO)");
            sql.AppendLine("VALUES");
            sql.AppendLine("(?, ?,");
            sql.AppendLine(" ?, ?, ?,");
            sql.AppendLine(" ?, ?, ?)");

            param.Clear();
            param.Add(new Parametro("NR_NF_INTERNO", MySqlDbType.Int32, pNumeroNota));
            param.Add(new Parametro("DT_TRANSMISSAO", MySqlDbType.Date, DateTime.Now.Date));
            param.Add(new Parametro("HR_TRANSMISSAO", MySqlDbType.VarChar, DateTime.Now.ToShortTimeString().Substring(0, 5)));
            param.Add(new Parametro("XML_TRANSMITIDO", MySqlDbType.Text, xmlTransmitido));
            param.Add(new Parametro("NR_PROTOCOLO_SEFAZ", MySqlDbType.VarChar, numeroProtocolo));
            param.Add(new Parametro("QTD_TENTATIVAS_RETORNO", MySqlDbType.Int32, 0));
            param.Add(new Parametro("ST_SUCESSO_RETORNO", MySqlDbType.Bit, 0));
            param.Add(new Parametro("XML_RETORNO", MySqlDbType.Text, xmlRetornoSefaz));

            execCommand();
        }
        #endregion

        #region GravarRetorno
        /// <summary>
        /// Grava os dados do XML de retorno do processamento no SEFAZ.
        /// </summary>
        /// <param name="pIdTransmitir"></param>
        /// <param name="pXmlRetornoSefaz"></param>
        public void GravarRetorno(int pIdTransmitir, Tipos.NFeRetornoProcessamentoLote pRetorno)
        {
            sql.Clear();  // limpando o DML anterior.
            param.Clear();  // limpando a lista dos parâmetros.

            // definindo o DML
            sql.AppendLine("INSERT INTO NFE_RETORNO");
            sql.AppendLine("( ID_NFE_TRANSMITIR, DT_RETORNO,");
            sql.AppendLine("  HR_RETORNO, XML_RETORNO,");
            sql.AppendLine("  CODIGO_STATUS, MENSAGEM_STATUS,");
            sql.AppendLine("  NR_CHAVE_ACESSO, NR_PROTOCOLO_AUTORIZACAO,");
            sql.AppendLine("  DT_PROTOCOLO_AUTORIZACAO, HR_PROTOCOLO_AUTORIZACAO )");
            sql.AppendLine("VALUES");
            sql.AppendLine("( ?, ?,");
            sql.AppendLine("  ?, ?,");
            sql.AppendLine("  ?, ?,");
            sql.AppendLine("  ?, ?,");
            sql.AppendLine("  ?, ? )");

            // definindo os parâmetros.
            param.Add(new Parametro("ID_NFE_TRANSMITIR", MySqlDbType.Int32, pIdTransmitir));
            param.Add(new Parametro("DT_RETORNO", MySqlDbType.Date, DateTime.Now));
            param.Add(new Parametro("HR_RETORNO", MySqlDbType.VarChar, DateTime.Now.ToShortTimeString()));
            param.Add(new Parametro("XML_RETORNO", MySqlDbType.Text, pRetorno.XmlRetorno));
            param.Add(new Parametro("CODIGO_STATUS", MySqlDbType.Int32, pRetorno.CodigoStatus));
            param.Add(new Parametro("MENSAGEM_STATUS", MySqlDbType.Text, pRetorno.Mensagem));
            param.Add(new Parametro("NR_CHAVE_ACESSO", MySqlDbType.VarChar, pRetorno.ChaveAcesso));
            param.Add(new Parametro("NR_PROTOCOLO_AUTORIZACAO", MySqlDbType.VarChar, pRetorno.ProtocoloNumero));
            param.Add(new Parametro("DT_PROTOCOLO_AUTORIZACAO", MySqlDbType.Date, DateTime.Now));
            param.Add(new Parametro("HR_PROTOCOLO_AUTORIZACAO", MySqlDbType.VarChar, DateTime.Now.ToShortTimeString()));

            execCommand();
        }
        #endregion

        #region GetNotasTransmitidas
        /// <summary>
        /// Retorna as notas transmitidas para o SEFAZ para
        /// realizar a verificação se já foram processadas.
        /// </summary>
        /// <returns></returns>
        public DataTable GetNotasTransmitidas()
        {
            sql.Clear();
            sql.AppendLine("SELECT T.ID_NFE_TRANSMITIR,");
            sql.AppendLine("       T.NR_NF_INTERNO,");
            sql.AppendLine("       T.NR_PROTOCOLO_SEFAZ");
            sql.AppendLine("  FROM NFE_TRANSMITIR T");
            sql.AppendLine(" WHERE T.ST_SUCESSO_RETORNO=0");

            param.Clear();
            return getTbl();
        }
        #endregion

        #region GravarAtualizarStatusTransmitir
        /// <summary>
        /// Atualizar o status da NFe transmitida.
        /// </summary>
        /// <param name="pIdTransmitir">ID da tabela</param>
        /// <param name="pSucesso"></param>
        public void GravarAtualizarStatusTransmitir(int pIdTransmitir, bool pSucesso)
        {
            sql.Clear();
            sql.AppendLine("UPDATE NFE_TRANSMITIR");
            sql.AppendLine("   SET QTD_TENTATIVAS_RETORNO=QTD_TENTATIVAS_RETORNO+1,");
            sql.AppendLine("       ST_SUCESSO_RETORNO=?");
            sql.AppendLine(" WHERE ID_NFE_TRANSMITIR=?");

            param.Clear();
            param.Add(new Parametro("ST_SUCESSO_RETORNO", MySqlDbType.Int32, pSucesso ? 1 : 0));
            param.Add(new Parametro("ID_NFE_TRANSMITIR", MySqlDbType.Int32, pIdTransmitir));

            execCommand();
        }
        #endregion
    }
}
