using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SGELibrary.Businees;
using SGELibrary.Objects;
using System.Text;

namespace SGEWeb.Forms
{
    public partial class NotaFiscalSelecionarCliente : System.Web.UI.Page
    {
        private MasterMain master = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            master = (MasterMain)Master;

            if (IsPostBack)
                return;

            var cliente = new Cliente();
            inputNomeFantasia.DataSource = cliente.getListaNomeFantasia();
            inputNomeFantasia.DataBind();
        }

        protected void btnPesquisarNomeFantasia_Click(object sender, EventArgs e)
        {
            var cliente = new Cliente();
            var cli = cliente.getDadosByCodigo(int.Parse(inputNomeFantasia.SelectedValue));

            #region visualizando os dados do cliente

            infClienteSituacao.Text = cli.SituacaoAtivo ? "ATIVO" : "INATIVO";
            infClienteSituacao.ForeColor = cli.SituacaoAtivo ? System.Drawing.Color.FromName("Green") : System.Drawing.Color.FromName("Orange");
            imgClienteSituacao.ImageUrl = cli.SituacaoAtivo ? "~/Images/Base/check_small.png" : "~/Images/Base/Warning_small.png";
            imgClienteSituacao.Visible = true;

            infClientePosicaoFinanceira.Text = cli.PosicaoFinanceiraTituloEmAtraso ? "EM ATRASO - Vencto: " + cli.PosicaoFinanceiraTituloEmAtrasoData : "OK";
            infClientePosicaoFinanceira.ForeColor = !cli.PosicaoFinanceiraTituloEmAtraso ? System.Drawing.Color.FromName("Green") : System.Drawing.Color.FromName("Orange");
            imgClientePosicaoFinanceira.ImageUrl = !cli.PosicaoFinanceiraTituloEmAtraso ? "~/Images/Base/check_small.png" : "~/Images/Base/Warning_small.png";
            imgClientePosicaoFinanceira.Visible = true;

            infClienteRestricao.Text = "";
            if (cli.Restricao || cli.RestricaoTxt != "" || cli.RestricaoTipo.Substring(0,3) != "L.1")
            {
                infClienteRestricao.Text = cli.RestricaoTxt;
                infClienteRestricao.Text += cli.RestricaoTipo.Substring(0, 3) == "L.1" ? "" : " - " + cli.RestricaoTipo;
            }
            infClienteRestricao.ForeColor = infClienteRestricao.Text == "" ? System.Drawing.Color.FromName("Green") : System.Drawing.Color.FromName("Orange");
            imgClienteRestricao.ImageUrl = infClienteRestricao.Text == "" ? "~/Images/Base/check_small.png" : "~/Images/Base/Warning_small.png";
            imgClienteRestricao.Visible = true;
            infClienteRestricao.Text = infClienteRestricao.Text == "" ? "SEM RESTRIÇÃO" : infClienteRestricao.Text;

            infClienteRazaoSocial.Text = cli.RazaoSocial;
            infClienteEndereco.Text = cli.Endereco;
            if (cli.EnderecoNro.Length > 0)
                infClienteEndereco.Text += ", " + cli.EnderecoNro;
            infClienteEnderecoBairroCep.Text = cli.EnderecoBairro + " - CEP: " + cli.EnderecoCEP;
            infClienteEnderecoMunicipioUF.Text = cli.EnderecoMunicipio + " / " + cli.EnderecoUF;
            infClienteCNPJ.Text = cli.CNPJ;
            infClienteInscricao.Text = cli.InscricaoEstadual;
            infClienteLocalEntrega.Text = cli.LocalEntrega;
            infClienteLocalEntregaBairroCEP.Text = cli.LocalEntregaBairro.Length > 0 ? cli.LocalEntregaBairro + " - CEP: " + cli.LocalEntregaCEP : "";
            infClienteLocalEntregaMunicipioUF.Text = cli.LocalEntregaMunicipio.Length > 0 ? cli.LocalEntregaMunicipio + " / " + cli.LocalEntregaUF : "";
            infClienteLocalEntregaContatoFone.Text = cli.LocalEntregaContato.Length > 0 ? cli.LocalEntregaContato + " - Fone: " + cli.LocalEntregaFone : "";

            infClienteTransportadora.Text = cli.Transportadora;
            infClienteTransportadoraEndereco.Text = cli.TransportadoraEndereco;
            infClienteTransportadoraBairroCEP.Text = cli.TransportadoraBairro.Length > 0 ? cli.TransportadoraBairro + " - CEP: " + cli.TransportadoraCEP : "";
            infClienteTransportadoraMunicipioUF.Text = cli.TransportadoraMunicipio.Length > 0 ? cli.TransportadoraMunicipio + " / " + cli.TransportadoraUF : "";
            infClienteTransportadoraCNPJ.Text = cli.TransportadoraCNPJ.Length > 0 ? "CNPJ: " + cli.TransportadoraCNPJ + " - Inscr.Est: " + cli.TransportadoraInscricao : "";
            #endregion

            #region listando os pedidos do cliente
            var ped = new Pedido();
            grdPedidos.DataSource = ped.getListaByCliente(int.Parse(inputNomeFantasia.SelectedValue));
            grdPedidos.DataBind();
            btnFaturarPedidos.Visible = false;
            #endregion
        }

        protected void inputNomeFantasia_SelectedIndexChanged(object sender, EventArgs e)
        {
            //btnPesquisarNomeFantasia_Click(sender, e);
        }

        private void pesquisarCliente(Tipos.PesquisaTipo psqTipo, string Conteudo)
        {
            var cliente = new Cliente();
            var tbl = cliente.getListaNomeFantasia(psqTipo, Conteudo);
            grdPesquisaCliente.DataSource = tbl;
            grdPesquisaCliente.DataBind();

            psqCliente.Visible = true;
        }

        protected void btnPesquisarNome_Click(object sender, EventArgs e)
        {
            if (inputRazaoSocial.Text.Trim().Length == 0)
            {
                string jscript = "<script type='text/javascript'>alert('O campo não pode estar vazio');</script>";
                Page.ClientScript.RegisterClientScriptBlock(Page.GetType(), "scrpt", jscript);
                return;
            }
            pesquisarCliente(Tipos.PesquisaTipo.Nome, inputRazaoSocial.Text);
        }

        protected void btnPesquisarCnpj_Click(object sender, EventArgs e)
        {
            pesquisarCliente(Tipos.PesquisaTipo.CNPJ, inputCnpj.Text);
        }

        protected void btnPesquisarCpf_Click(object sender, EventArgs e)
        {
            pesquisarCliente(Tipos.PesquisaTipo.CPF, inputCpf.Text);
        }

        protected void grdPesquisaCliente_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "SELECIONAR")
            {
                int idx = Convert.ToInt32(e.CommandArgument);
                string apelido = grdPesquisaCliente.DataKeys[idx]["NomeFantasia"].ToString();
                inputNomeFantasia.SelectedIndex = inputNomeFantasia.Items.IndexOf(inputNomeFantasia.Items.FindByText(apelido));
                inputNomeFantasia_SelectedIndexChanged(inputNomeFantasia, new EventArgs());
                psqCliente.Visible = false;
                inputRazaoSocial.Text = "";
                inputCnpj.Text = "";
                inputCpf.Text = "";
            }
        }

        protected void grdPedidos_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Cells[2].Text = String.Format("{0:C2}", float.Parse(e.Row.Cells[2].Text));  // valor moeda com 2 casas decimais
                e.Row.Cells[3].Text = e.Row.Cells[3].Text.Substring(0, 10);  // data de emissão
            }
        }

        protected void btnFecharPsqCliente_Click(object sender, EventArgs e)
        {
            psqCliente.Visible = false;
        }

        protected void grdPedidos_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "SELECIONAR_PEDIDO")
            {
                int idx = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = grdPedidos.Rows[idx];
                var btnImg = (ImageButton)row.FindControl("btnCheckPedido");
                setSelecionarPedido(row, btnImg.ImageUrl.Contains("unchecked") ? true : false);
            }
        }

        protected void btnPedidosSelecionarTodos_Click(object sender, ImageClickEventArgs e)
        {
            bool selecionar = btnPedidosSelecionarTodos.ImageUrl.Contains("unchecked") ? true : false;
            btnPedidosSelecionarTodos.ImageUrl = selecionar ? "~/Images/Base/check_small.png" : "~/Images/Base/unchecked.png";

            foreach (GridViewRow row in grdPedidos.Rows)
            {
                setSelecionarPedido(row, selecionar);
            }
        }

        private void setSelecionarPedido(GridViewRow row, bool selecionar)
        {
            var corMarcado = System.Drawing.ColorTranslator.FromHtml("#FFE2AE");
            var corDesmarcado = System.Drawing.Color.FromName("0");

            var btnImg = (ImageButton)row.FindControl("btnCheckPedido");
            btnImg.ImageUrl = selecionar ? "~/Images/Base/check_small.png" : "~/Images/Base/unchecked.png";
            row.BackColor = selecionar ? corMarcado : corDesmarcado;

            #region regra para visualizar o botão para faturar os pedidos
            btnFaturarPedidos.Visible = false;
            foreach (GridViewRow rw in grdPedidos.Rows)
            {
                btnFaturarPedidos.Visible = ((ImageButton)rw.FindControl("btnCheckPedido")).ImageUrl == "~/Images/Base/check_small.png";
                if (btnFaturarPedidos.Visible)
                    break;
            }
            #endregion
        }

        protected void btnFaturarPedidos_Click(object sender, EventArgs e)
        {
            #region verifica o status do serviço da NFe
            var nfe = new NFe();
            if (!nfe.get_status_servico())
            {
                master.show_msg("O serviço de emissão de NFe da Secretaria da Fazenda não está operando neste momento. Tente novamente daqui alguns instantes.");
                return;
            }
            #endregion

            #region consulta cadastro do contribuinte no SEFAZ
            //var ret = nfe.getConsultaCadastro("05875230000118", "", "SP", "");
            #endregion


            #region guardando os pedidos que foram selecionados.
            var listaPedidos = new List<string>();
            foreach (GridViewRow row in grdPedidos.Rows)
            {
                if (((ImageButton)row.FindControl("btnCheckPedido")).ImageUrl == "~/Images/Base/check_small.png")
                    listaPedidos.Add(grdPedidos.DataKeys[row.RowIndex]["Numero"].ToString());
            }
            #endregion

            #region guardando na sessão, o cliente e os pedidos selecionados.
            Session["ClienteId"] = inputNomeFantasia.SelectedValue;
            Session["ListaPedidos"] = listaPedidos;
            #endregion

            Response.Redirect("NotaFiscal.aspx?tp=emissao", false);
        }
    }
}