using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using MySql.Data.MySqlClient;

namespace SGELibrary.Data
{
    public class DbConfiguracoesParametros : conexao
    {
        /// <summary>
        /// Retorna os parâmetros utilizados referente ao ICMS.
        /// </summary>
        /// <returns></returns>
        public DataTable getParametroIcms()
        {
            sql.Clear();
            sql.AppendLine("SELECT paramIcms.PercentICMS,");
            sql.AppendLine("       paramIcms.TIPO_TRIBUTACAO,");
            sql.AppendLine("       paramIcms.TIPO_TRIBUTACAO");
            sql.AppendLine("FROM   PARAMETRO_ICMS paramIcms");

            param.Clear();

            return base.getTbl();
        }

        /// <summary>
        /// Retorna a lista de aliquotas de ICMS por UF.
        /// </summary>
        /// <returns></returns>
        public DataTable getIcmsAliquotasUF()
        {
            sql.Clear();
            sql.AppendLine("SELECT cia.ICMS_UF,");
            sql.AppendLine("       cia.ICMS_ALIQUOTA");
            sql.AppendLine("FROM   CADASTRO_ICMS_ALIQUOTA cia");
            sql.AppendLine("ORDER  BY cia.ICMS_UF");

            param.Clear();

            return base.getTbl();
        }

        /// <summary>
        /// Retorna os dados das faixas para calcular os vencimentos
        /// no padrão da vipro.
        /// </summary>
        /// <returns></returns>
        public DataTable getVencimentosPadraoVipro()
        {
            sql.Clear();
            sql.AppendLine("select pvv.DE,");
            sql.AppendLine("       pvv.ATE,");
            sql.AppendLine("       pvv.DDL1,");
            sql.AppendLine("       pvv.DDL2,");
            sql.AppendLine("       pvv.DDL3,");
            sql.AppendLine("       pvv.DDL4,"); 
            sql.AppendLine("       pvv.DDL5,");
            sql.AppendLine("       pvv.DDL6");
            sql.AppendLine("  from PARAMETRO_VENCIMENTO_VIPRO pvv");
            sql.AppendLine(" order by pvv.DE");

            param.Clear();

            return getTbl();
        }

        /// <summary>
        /// Retorna os dados gerais de configurações.
        /// </summary>
        /// <returns></returns>
        public DataTable getConfiguracoesGerais()
        {
            sql.Clear();
            sql.AppendLine("select c.NFE_EXPORTAR_ARQUIVO as PathExportarArquivoNFe,");
            sql.AppendLine("       c.UltimaNotaFiscal as UltimaNfeEmitida");
            sql.AppendLine("  from CONFIGURACOES c");

            param.Clear();

            return base.getTbl();
        }

        /// <summary>
        /// Retorna a lista de UF conforme códigos do IBGE.
        /// </summary>
        /// <returns></returns>
        public DataTable getListaIBGEUF()
        {
            sql.Clear();
            sql.AppendLine("select ibge.coduf,  ibge.uf");
            sql.AppendLine("  from CIDADES_IBGE ibge");
            sql.AppendLine(" group by ibge.coduf,  ibge.uf");
            sql.AppendLine(" order by ibge.uf");

            param.Clear();

            return base.getTbl();
        }

        /// <summary>
        /// Retorna a lista de municipios conforme tabela do IBGE.
        /// </summary>
        /// <param name="pUF">Sigla do estado, exemplo: SP</param>
        /// <returns></returns>
        public DataTable getListaIBGEMunicipio(string pUF)
        {
            sql.Clear();
            sql.AppendLine("select ibge.codCidade,  ibge.cidade");
            sql.AppendLine("  from CIDADES_IBGE ibge");
            sql.AppendLine(" where ibge.uf = ?");
            sql.AppendLine(" group by ibge.codCidade,  ibge.cidade");
            sql.AppendLine(" order by ibge.cidade");

            param.Clear();
            param.Add(new Parametro("uf", MySqlDbType.VarChar, pUF));

            return base.getTbl();
        }

        /// <summary>
        /// Retorna a unidade da federação da VIPRO.
        /// </summary>
        /// <returns></returns>
        public DataTable getViproUF()
        {
            sql.Clear();
            sql.AppendLine("SELECT vipro_uf");
            sql.AppendLine("  FROM CONFIGURACOES");

            param.Clear();

            return base.getTbl();
        }
    
    }
}
