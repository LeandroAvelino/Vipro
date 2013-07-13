<%@ Page Title="" Language="C#" MasterPageFile="~/Forms/MasterMain.Master" AutoEventWireup="true" CodeBehind="NotaFiscalSelecionarCliente.aspx.cs" Inherits="SGEWeb.Forms.NotaFiscalSelecionarCliente" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="contentHead" ContentPlaceHolderID="headMaster" runat="server">
    <link href="../Styles/SelecionarClientePedido.css" rel="stylesheet" type="text/css" />
    <script src="../Scripts/SelecionarClientePedido.js" type="text/javascript"></script>
</asp:Content>

<asp:Content ID="contentBody" ContentPlaceHolderID="contentMaster" runat="server">
    <div id="mainSelecionarPedido" class="mainSelecionarPedido">

        <asp:UpdatePanel ID="ajaxPanelPesquisa" runat="server">
            <ContentTemplate>
                <div id="DadosPesquisa">
                    <asp:DropDownList ID="inputNomeFantasia" runat="server" 
                        CssClass="inputNoBorderEnable inputNomeFantasia" DataValueField="CodigoID" 
                        DataTextField="NomeFantasia"></asp:DropDownList>
                    <asp:TextBox ID="inputRazaoSocial" runat="server" CssClass="inputNoBorderEnable inputRazaoSocial" MaxLength="30"></asp:TextBox>
                    <asp:TextBox ID="inputCnpj" runat="server" CssClass="inputNoBorderEnable inputCnpj" MaxLength="30"></asp:TextBox>
                        <asp:MaskedEditExtender ID="inputCnpjMsk" runat="server" TargetControlID="inputCnpj" ClearMaskOnLostFocus="False" Mask="99\.999\.999/9999-99" PromptCharacter=" "></asp:MaskedEditExtender>
                    <asp:TextBox ID="inputCpf" runat="server" CssClass="inputNoBorderEnable inputCpf" MaxLength="30"></asp:TextBox>
                        <asp:MaskedEditExtender ID="inputCpfMsk" runat="server" TargetControlID="inputCpf" ClearMaskOnLostFocus="False" Mask="999\.999\.999-99" PromptCharacter=" "></asp:MaskedEditExtender>
                    <asp:LinkButton ID="btnPesquisarNomeFantasia" runat="server" 
                        CssClass="btnPesquisaFantasia" ToolTip="Pesquisar pedidos" 
                        onclick="btnPesquisarNomeFantasia_Click"><img src="../Images/Buttons/Find.png" alt="" border="0" /></asp:LinkButton>
                    <asp:LinkButton ID="btnPesquisarNome" runat="server" CssClass="btnPesquisaNome" onclick="btnPesquisarNome_Click"
                        ToolTip="Pesquisar clientes"><img src="../Images/Buttons/Find.png" alt="" border="0" /></asp:LinkButton>
                    <asp:LinkButton ID="btnPesquisarCnpj" runat="server" CssClass="btnPesquisaCnpj" 
                        ToolTip="Pesquisar clientes" onclick="btnPesquisarCnpj_Click"><img src="../Images/Buttons/Find.png" alt="" border="0" /></asp:LinkButton>
                    <asp:LinkButton ID="btnPesquisarCpf" runat="server" CssClass="btnPesquisaCpf" 
                        ToolTip="Pesquisar clientes" onclick="btnPesquisarCpf_Click"><img src="../Images/Buttons/Find.png" alt="" border="0" /></asp:LinkButton>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>

        <asp:UpdatePanel ID="ajaxPanelDadosCliente" runat="server">
            <ContentTemplate>
                <div id="DadosCliente" class="dadosCliente">
                    <table>
                        
                        <tr><td>
                            <table>
                                <tr>
                                    <td><span class="dadosClienteSpanHead">Situação</span></td>
                                    <td style="padding-left:25px;"><span class="dadosClienteSpanHead">Posição Financeira</span></td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Image ID="imgClienteSituacao" runat="server" Visible="False" />&nbsp;
                                        <asp:Label ID="infClienteSituacao" runat="server" Font-Bold="True" style="font-size:14px;"></asp:Label>
                                    </td>
                                    <td style="padding-left:25px;">
                                        <asp:Image ID="imgClientePosicaoFinanceira" runat="server" Visible="False" />&nbsp;
                                        <asp:Label ID="infClientePosicaoFinanceira" runat="server" Font-Bold="True" style="font-size:14px;"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </td></tr>

                        <tr><td style="padding-top:15px;"><span class="dadosClienteSpanHead">Restrição</span></td></tr>
                        <tr><td>
                            <asp:Image ID="imgClienteRestricao" runat="server" Visible="False" />&nbsp;
                            <asp:Label ID="infClienteRestricao" runat="server" Font-Bold="True" style="font-size:14px;"></asp:Label>
                        </td></tr>
                        
                        <tr><td style="padding-top:15px;"><span class="dadosClienteSpanHead">Razão Social / Nome</span></td></tr>
                        <tr><td><asp:Label ID="infClienteRazaoSocial" runat="server" Font-Bold="True" style="font-size:14px;"></asp:Label></td></tr>

                        <tr><td style="padding-top:15px;"><span class="dadosClienteSpanHead">Endereço</span></td></tr>
                        <tr>
                            <td>
                                <asp:Label ID="infClienteEndereco" runat="server" Font-Bold="True" style="font-size:14px;"></asp:Label>
                                <br />
                                <asp:Label ID="infClienteEnderecoBairroCep" runat="server" Font-Bold="True" style="font-size:14px;"></asp:Label>
                                <br />
                                <asp:Label ID="infClienteEnderecoMunicipioUF" runat="server" Font-Bold="True" style="font-size:14px;"></asp:Label>
                            </td>
                        </tr>
                    </table>
                    <table>
                        <tr>
                            <td style="padding-top:15px;"><span class="dadosClienteSpanHead">CNPJ / CPF</span></td>
                            <td style="padding-top:15px; padding-left:25px;"><span class="dadosClienteSpanHead">Inscrição Est.</span></td>
                        </tr>
                        <tr>
                            <td><asp:Label ID="infClienteCNPJ" runat="server" Font-Bold="True" style="font-size:14px;"></asp:Label></td>
                            <td style="padding-left:25px;"><asp:Label ID="infClienteInscricao" runat="server" Font-Bold="True" style="font-size:14px;"></asp:Label></td>
                        </tr>
                    </table>
                    <table>
                        <tr><td style="padding-top:15px;"><span class="dadosClienteSpanHead">Loca Entrega</span></td></tr>
                        <tr><td>
                                <asp:Label ID="infClienteLocalEntrega" runat="server" Font-Bold="True" style="font-size:14px;"></asp:Label>
                                <br />
                                <asp:Label ID="infClienteLocalEntregaBairroCEP" runat="server" Font-Bold="True" style="font-size:14px;"></asp:Label>
                                <br />
                                <asp:Label ID="infClienteLocalEntregaMunicipioUF" runat="server" Font-Bold="True" style="font-size:14px;"></asp:Label>
                                <br />
                                <asp:Label ID="infClienteLocalEntregaContatoFone" runat="server" Font-Bold="True" style="font-size:14px;"></asp:Label>
                            </td>
                        </tr>

                        <tr><td style="padding-top:20px;"><span class="dadosClienteSpanHead">Transportadora</span></td></tr>
                        <tr><td>
                                <asp:Label ID="infClienteTransportadora" runat="server" Font-Bold="True" style="font-size:14px;"></asp:Label>
                                <br />
                                <asp:Label ID="infClienteTransportadoraEndereco" runat="server" Font-Bold="True" style="font-size:14px;"></asp:Label>
                                <br />
                                <asp:Label ID="infClienteTransportadoraBairroCEP" runat="server" Font-Bold="True" style="font-size:14px;"></asp:Label>
                                <br />
                                <asp:Label ID="infClienteTransportadoraMunicipioUF" runat="server" Font-Bold="True" style="font-size:14px;"></asp:Label>
                                <br />
                                <asp:Label ID="infClienteTransportadoraCNPJ" runat="server" Font-Bold="True" style="font-size:14px;"></asp:Label>
                            </td>
                        </tr>

                    </table>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>

        <asp:UpdatePanel ID="ajaxPanelPesquisaCliente" runat="server">
            <ContentTemplate>
                <asp:Panel ID="psqCliente" runat="server" CssClass="psqCliente" Visible="false">
                    <asp:LinkButton ID="btnFecharPsqCliente" runat="server" 
                        CssClass="psqClienteBtnFechar" onclick="btnFecharPsqCliente_Click"><img src="../Images/Buttons/CloseSmall.png" alt="" border="0" /></asp:LinkButton>
                    <asp:Panel ID="pnlPsqCliente" runat="server" CssClass="psqClientePainel">
                        <asp:GridView ID="grdPesquisaCliente" runat="server" AutoGenerateColumns="False" AlternatingRowStyle-BackColor="#666666"
                            DataKeyNames="NomeFantasia" CssClass="psqClienteGrd" 
                            HeaderStyle-CssClass="psqClienteGrdHead" 
                            onrowcommand="grdPesquisaCliente_RowCommand">
                            <Columns>
                                <asp:ButtonField ButtonType="Button" Text="SELECIONAR" ControlStyle-CssClass="psqClienteGrdColSelecionar" CommandName="SELECIONAR" />
                                <asp:BoundField DataField="NomeFantasia" HeaderText="Fantasia" ItemStyle-CssClass="psqClienteGrdContent" />
                                <asp:BoundField DataField="RazaoSocial" HeaderText="Razão Social" ItemStyle-CssClass="psqClienteGrdContent" />
                            </Columns>
                        </asp:GridView>
                    </asp:Panel>
                </asp:Panel>
            </ContentTemplate>
        </asp:UpdatePanel>
    
        <asp:UpdatePanel ID="ajaxPanelPedidos" runat="server">
            <ContentTemplate>
                <asp:Panel ID="pnlPedidos" runat="server" CssClass="pnlPedidosHead">
                    
                    <div class="pnlPedidosBtnTodos">
                        <table>
                            <tr>
                                <td><span>Selecionar Todos</span></td>
                                <td style="padding-left:3px;"><asp:ImageButton ID="btnPedidosSelecionarTodos" 
                                        runat="server" ImageUrl="~/Images/Base/unchecked.png" 
                                        onclick="btnPedidosSelecionarTodos_Click" /></td>
                            </tr>
                        </table>
                    </div>
                    
                    <asp:Panel ID="pnlPedidosConteudo" runat="server" CssClass="pnlPedidosContent">
                        <asp:GridView ID="grdPedidos" runat="server" AutoGenerateColumns="false"
                            DataKeyNames="Numero" CssClass="pnlPedidosGrd"
                            HeaderStyle-CssClass="pnlPedidosGrdHead"
                             AlternatingRowStyle-BackColor="#666666"
                            ShowHeaderWhenEmpty="true" ShowHeader="true"
                            EmptyDataText="Não existem pedidos para este cliente." 
                            onrowdatabound="grdPedidos_RowDataBound" 
                            onrowcommand="grdPedidos_RowCommand">
                            <Columns>
                                <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderText="Selecionar" ItemStyle-CssClass="pnlPedidosGrdContent">
                                    <ItemTemplate>
                                        <asp:ImageButton ID="btnCheckPedido" runat="server" 
                                            CommandName="SELECIONAR_PEDIDO" 
                                            CommandArgument="<%# ((GridViewRow) Container).RowIndex %>"
                                            ImageUrl="~/Images/Base/unchecked.png" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField HeaderText="Número" DataField="Numero" ItemStyle-HorizontalAlign="Center" ItemStyle-CssClass="pnlPedidosGrdContent" />
                                <asp:BoundField HeaderText="Valor" DataField="ValorTotalLiquido" ItemStyle-HorizontalAlign="Right" ItemStyle-CssClass="pnlPedidosGrdContent" />
                                <asp:BoundField HeaderText="Data" DataField="DataEmissao" ItemStyle-HorizontalAlign="Center" ItemStyle-CssClass="pnlPedidosGrdContent" />
                            </Columns>
                        </asp:GridView>
                    </asp:Panel>

                    <div class="pnlPedidosBtnGo">
                        <asp:LinkButton ID="btnFaturarPedidos" runat="server" 
                            CssClass="lnkBtnWhite" Visible="False" 
                            onclick="btnFaturarPedidos_Click">
                            <table>
                                <tr>
                                    <td><span>Faturar Pedidos</span></td>
                                    <td style="padding-left:3px;"><img src="../Images/Buttons/Go.png" alt="" border="0" /></td>
                                </tr>
                            </table>
                        </asp:LinkButton>
                    </div>

                </asp:Panel>
            </ContentTemplate>
        </asp:UpdatePanel>

        <asp:UpdateProgress ID="ajaxUpdateProgress1" runat="server" AssociatedUpdatePanelID="ajaxPanelPesquisa" DisplayAfter="100">
            <ProgressTemplate>
                <div class="msgAguardeBkg"></div>
            </ProgressTemplate>
        </asp:UpdateProgress>

        <asp:UpdateProgress ID="ajaxUpdateProgress2" runat="server" AssociatedUpdatePanelID="ajaxPanelPedidos" DisplayAfter="200">
            <ProgressTemplate>
                <div class="msgAguardeBkg"></div>
            </ProgressTemplate>
        </asp:UpdateProgress>

    </div>
</asp:Content>
