using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SGEWeb.Forms
{
    public partial class MasterMain : System.Web.UI.MasterPage
    {

        public void show_msg(string pMsg)
        {
            atencao_lbl.Text = pMsg;
            atencao_pnl.Visible = true;
        }

        public void show_confirmacao(string pMsg)
        {
            confirma_lbl.Text = pMsg;
            confirma_pnl.Visible = true;
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void atencao_btn_fechar_Click(object sender, EventArgs e)
        {
            atencao_pnl.Visible = false;
        }

        protected void confirma_btn_sim_Click(object sender, EventArgs e)
        {
            confirma_pnl.Visible = false;
        }

        protected void confirma_btn_nao_Click(object sender, EventArgs e)
        {
            confirma_pnl.Visible = false;
        }
    }
}