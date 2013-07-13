using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SGELibrary.Businees;
using SGELibrary.Objects;

namespace SGEWeb.Forms
{
    public partial class NotaFiscalIBGE : System.Web.UI.UserControl
    {

        /// <summary>
        /// Carregar a lista UF conforme IBGE.
        /// </summary>
        private void IBGE_UF_Load()
        {
            inputIBGEUF.DataSource = Regras.getListaIBGEUF();
            inputIBGEUF.DataBind();
        }

        /// <summary>
        /// Carregar a lista de municipios conforme IBGE.
        /// </summary>
        /// <param name="pUF">UF (Estado)</param>
        private void IBGE_Municipio_Load(string pUF)
        {
            inputIBGEMunicipio.DataSource = Regras.getListaIBGEMunicipio(pUF);
            inputIBGEMunicipio.DataBind();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if ( IsPostBack )
                return;

            IBGE_UF_Load();
            inputIBGEUF_SelectedIndexChanged(sender, e);
        }

        protected void inputIBGEUF_SelectedIndexChanged(object sender, EventArgs e)
        {
            IBGE_Municipio_Load(inputIBGEUF.SelectedItem.Text);
        }

        protected void btn_salvar_Click(object sender, EventArgs e)
        {
            var ngCliente = new Cliente();
            ngCliente.gravar_municipio_ibge(
                int.Parse(Session["ClienteId"].ToString()),
                int.Parse(inputIBGEMunicipio.SelectedValue));
            pnlIBGE.Visible = false;
        }

    }
}