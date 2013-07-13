using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using SGELibrary.Businees;
using MySql.Data.MySqlClient;

namespace SGELibrary.Data
{
    class DbCliente : conexao
    {
        private StringBuilder qry = new StringBuilder();

        public DataTable getListaNomeFantasia()
        {
            sql.Clear();
            sql.AppendLine("SELECT C.CODIGO, C.RAZAO_SOCIAL, C.NOME_FANTAZIA");
            sql.AppendLine("FROM   CADASTRO_CLIENTES C");
            sql.AppendLine("ORDER  BY C.NOME_FANTAZIA");

            param.Clear();

            return base.getTbl();
        }

        public DataTable getListaNomeFantasia(Tipos.PesquisaTipo psqTipo, string Conteudo)
        {
            sql.Clear();
            sql.AppendLine("select cc.codigo,");
            sql.AppendLine("       cc.razao_social,");
            sql.AppendLine("       cc.nome_fantazia");
            sql.AppendLine("from   CADASTRO_CLIENTES cc");
            var par = new List<Parametro>();
            switch (psqTipo)
            {
                case Tipos.PesquisaTipo.Nome:
                    sql.AppendLine("where cc.razao_social like ?");
                    par.Add(new Parametro("razao_social", MySqlDbType.VarChar, "%" + Conteudo + "%"));
                    break;
                case Tipos.PesquisaTipo.CNPJ:
                    sql.AppendLine("where cc.cnpj like ?");
                    par.Add(new Parametro("cnpj", MySqlDbType.VarChar, "%" + Conteudo + "%"));
                    break;
                case Tipos.PesquisaTipo.CPF:
                    sql.AppendLine("where cc.cnpj like ?");
                    par.Add(new Parametro("cnpj", MySqlDbType.VarChar, "%" + Conteudo + "%"));
                    break;
            }
            sql.AppendLine("order by cc.nome_fantazia");

            param.Clear();

            return base.getTbl();
        }

        public DataTable getDados(int codigo)
        {
            sql.Clear();
            // dados gerais
            sql.AppendLine("SELECT c.CODIGO, c.NOME_FANTAZIA, c.RAZAO_SOCIAL, c.ENDERECO, c.BAIRRO, c.CIDADE, c.ESTADO,");
            sql.AppendLine("       c.CEP, c.CNPJ, c.INSCRICAO, c.SITUACAO, c.FONE_1, c.FONE_2, c.FONE_3, c.FONE_4, c.FONE_5,");
            sql.AppendLine("       c.FONE_6, c.FAX, c.EMAIL, c.WEB_SITE, c.RESTRICAO, c.RESTRICAO_MOTIVO, c.NIVEL, c.TRANSPORTADORA,");
            sql.AppendLine("       c.REPRESENTANTE, c.DATA_CADASTRO, c.BrindeFolhinha, c.BrindeVinho, c.BrindeChampagne, c.BrindeMaleta,");
            sql.AppendLine("       c.OrcSequencial, c.ULTIMO_ORCAMENTO, c.BrindePosicao, c.RESTRICAO_TIPO, c.CONTATOS, c.OrcMes,");
            sql.AppendLine("       c.ICMS_PADRAO, c.email_nfe,  c.tipo_pessoa,");
            // dados complementares do endereço
            sql.AppendLine("       e.COBRANCA_ENDERECO, e.COBRANCA_BAIRRO, e.COBRANCA_CEP, e.COBRANCA_CIDADE, e.COBRANCA_ESTADO,");
            sql.AppendLine("       e.COBRANCA_FONE, e.COBRANCA_CONTATO, e.ENTREGA_ENDERECO, e.ENTREGA_BAIRRO, e.ENTREGA_CEP,");
            sql.AppendLine("       e.ENTREGA_CIDADE, e.ENTREGA_ESTADO, e.ENTREGA_FONE, e.ENTREGA_CONTATO, e.FRETE,");
            // dados da transportadora
            sql.AppendLine("       ct.endereco as transp_endereco,  ct.bairro as transp_bairro,  ct.cidade as transp_cidade,");
            sql.AppendLine("       ct.estado as transp_estado,  ct.cnpj as transp_cnpj,  ct.inscricao as transp_inscricao,");
            sql.AppendLine("       null as transp_cep,  ct.codigo as transp_codigo,");
            // dados do IBGE
            sql.AppendLine("       ibge.coduf as ibge_coduf,  ibge.codcidade as ibge_codcidade");
            // tabelas
            sql.AppendLine("FROM   CADASTRO_CLIENTES c");
            sql.AppendLine("       LEFT JOIN CADASTRO_CLIENTE_ENDERECOS e ON e.CODIGO_CLIENTE = c.CODIGO");
            sql.AppendLine("       LEFT JOIN CADASTRO_TRANSPORTADORAS ct ON ct.RAZAO_SOCIAL = c.TRANSPORTADORA");
            sql.AppendLine("       LEFT JOIN CIDADES_IBGE ibge ON ibge.uf = c.ESTADO AND ibge.cidade = c.CIDADE");
            sql.AppendLine("WHERE  c.codigo = ?");

            param.Clear();
            param.Add(new Parametro("codigo", MySqlDbType.Int32, codigo));

            return base.getTbl();
        }

        public DataTable getTitulosEmAtraso(int codigo)
        {
            sql.Clear();
            sql.AppendLine("select v.NOTA,");
            sql.AppendLine("       v.VENCIMENTO,");
            sql.AppendLine("       v.DATA_PAGAMENTO,");
            sql.AppendLine("       v.POSICAO,");
            sql.AppendLine("       n.NOTA_CANCELADA");
            sql.AppendLine("from   NF_VENDAS_VENCIMENTOS v");
            sql.AppendLine("       inner join NF_VENDAS n on v.NOTA = n.NOTA");
            sql.AppendLine("where  v.VENCIMENTO < ?");
            sql.AppendLine("       and v.DATA_PAGAMENTO is null");
            sql.AppendLine("       and n.CLIENTE = ?");
            sql.AppendLine("order  by v.VENCIMENTO desc");

            param.Clear();
            param.Add(new Parametro("VENCIMENTO", MySqlDbType.VarChar, base.getDataFormatadaParametro(DateTime.Now)));
            param.Add(new Parametro("CLIENTE", MySqlDbType.Int32, codigo));

            return base.getTbl();
        }

        /// <summary>
        /// Retornar os dados do padrão de vencimentos do cliente.
        /// </summary>
        /// <param name="pCodigo">Código do cliente.</param>
        /// <returns></returns>
        public DataTable getPadraoVencimentos(int pCodigo)
        {
            sql.Clear();
            sql.AppendLine("select ccv.PADRAO_VIPRO,");
            sql.AppendLine("       ccv.VENCTO1,");
            sql.AppendLine("       ccv.VENCTO2,");
            sql.AppendLine("       ccv.VENCTO3,");
            sql.AppendLine("       ccv.VENCTO4,");
            sql.AppendLine("       ccv.VENCTO5,");
            sql.AppendLine("       ccv.VENCTO6,");
            sql.AppendLine("       ccv.VENCTO7");
            sql.AppendLine("  from CADASTRO_CLIENTES_VENCIMENTOS ccv");
            sql.AppendLine(" where ccv.CODIGO_CLIENTE = ?");

            param.Clear();
            param.Add(new Parametro("CODIGO_CLIENTE", MySqlDbType.Int32, pCodigo));

            return getTbl();
        }

        public void gravar_municipio_ibge(int p_cod_cliente, int p_cod_municipio)
        {
            // Buscando o nome da cidade/uF pelo código da cidade.
            sql.Clear();
            sql.AppendLine("SELECT ci.uf,");
            sql.AppendLine("       UPPER(ci.cidade) AS cidade");
            sql.AppendLine("  FROM CIDADES_IBGE ci");
            sql.AppendLine(" WHERE ci.codcidade = ?");
            param.Clear();
            param.Add(new Parametro("codCidade", MySqlDbType.Int32, p_cod_municipio));
            var _tbl_ibge = base.getTbl();

            // Atualizando o cadastro do cliente.
            sql.Clear();
            sql.AppendLine("UPDATE CADASTRO_CLIENTES");
            sql.AppendLine("   SET cidade = ?");
            sql.AppendLine("       , estado = ?");
            sql.AppendLine(" WHERE codigo = ?");
            param.Clear();
            param.Add(new Parametro("cidade", MySqlDbType.VarChar, _tbl_ibge.Rows[0]["cidade"].ToString()));
            param.Add(new Parametro("estado", MySqlDbType.VarChar, _tbl_ibge.Rows[0]["uf"].ToString()));
            param.Add(new Parametro("codigo", MySqlDbType.Int32, p_cod_cliente));
            base.execCommand();
        }
    }
}
