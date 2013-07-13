using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using MySql.Data.MySqlClient;

namespace SGELibrary.Data
{
    public class conexao: IDisposable
    {
        #region variáveis privativas
        private MySqlConnection _cnx;
        private StringBuilder _sql;
        private List<Parametro> _param;
        #endregion

        #region propriedades
        public MySqlConnection cnx
        {
            get { return this.conectar(); }
        }

        public StringBuilder sql
        {
            get 
            {
                if (this._sql == null)
                    this._sql = new StringBuilder();

                return this._sql; 
            }
            set { this._sql = value; }
        }

        public List<Parametro> param
        {
            get
            {
                if (this._param == null)
                    this._param = new List<Parametro>();
                return this._param;
            }

            set { this._param = value; }
        }
        #endregion

        #region métodos privativos
        private MySqlConnection conectar()
        {
            if (this._cnx == null)
            {
                var _cnxStr = System.Configuration.ConfigurationManager.AppSettings.Get("conexao");
                this._cnx = new MySqlConnection(_cnxStr);
            }

            if (this._cnx.State != System.Data.ConnectionState.Open)
                this._cnx.Open();

            return this._cnx;
        }

        #endregion

        #region métodos públicos
        public void desconectar()
        {
            if (this._cnx.State != System.Data.ConnectionState.Closed)
                this._cnx.Close();
            this._cnx.Dispose();
            this._cnx = null;
        }

        public string getDataFormatadaParametro(DateTime data)
        {
            var ret = data.Year.ToString() + "-" + data.Month.ToString() + "-" + data.Day.ToString() + " 00:00:00";
            return ret;
        }

        /// <summary>
        /// Retorna um DataTable utilizando as propriedades SQL e PARAM da classe base.
        /// </summary>
        /// <returns></returns>
        public DataTable getTbl()
        {
            var cmd = new MySqlCommand(this.sql.ToString(), cnx);
            foreach (Parametro pa in this.param)
                cmd.Parameters.Add(pa.Nome, pa.Tipo).Value = pa.Valor;

            var adp = new MySqlDataAdapter(cmd);
            var tbl = new DataTable();
            adp.Fill(tbl);
            adp.Dispose();
            cmd.Dispose();
            desconectar();
            return tbl;
        }

        /// <summary>
        /// Executar um SQL sem retornar dados.
        /// Utiliza as propriedades SQL e PARAM da classe.
        /// </summary>
        public void execCommand()
        {
            var cmd = new MySqlCommand(this.sql.ToString(), cnx);
            foreach (Parametro pa in this.param)
                cmd.Parameters.Add(pa.Nome, pa.Tipo).Value = pa.Valor;

            cmd.ExecuteNonQuery();
            cmd.Dispose();
            desconectar();
        }

        #endregion

        void IDisposable.Dispose()
        {
            this.desconectar();
            this._cnx.Dispose();
        }
    }

    public struct Parametro
    {
        public string Nome;
        public MySqlDbType Tipo;
        public object Valor;

        public Parametro(string nome, MySqlDbType tipo, object valor)
        {
            this.Nome = nome;
            this.Tipo = tipo;
            this.Valor = valor;
        }
    }
}
