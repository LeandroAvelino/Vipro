<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="NotaFiscalIBGE.ascx.cs" Inherits="SGEWeb.Forms.NotaFiscalIBGE" %>
<asp:UpdatePanel ID="ajax_panel_ibge" runat="server">
    <ContentTemplate>
        <asp:Panel ID="pnlIBGE" runat="server">
            <div id="ibge">
                <table>
                    <tr>
                        <td><img src="../Images/Base/Warning_small.png" /></td>
                        <td><h3>&nbsp;Corrigir UF / Municipio com base no IBGE</h3></td>
                    </tr>
                </table>
                <br />
                <h5>DADOS ATUAIS</h5>
                <table>
                    <tr>
                        <td><span>Estado (UF):</span></td>
                        <td>
                            <asp:Label ID="inf_cliente_uf" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td><span>Município:</span></td>
                        <td>
                            <asp:Label ID="inf_cliente_municipio" runat="server"></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
                <h5>INFORMAR DADOS CORRETOS</h5>
                <table>
                    <tr>
                        <td><span>Estado (UF):</span></td>
                        <td>
                            <asp:DropDownList ID="inputIBGEUF" runat="server"
                                DataTextField="Sigla" DataValueField="Codigo" AutoPostBack="True" 
                                onselectedindexchanged="inputIBGEUF_SelectedIndexChanged">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td><span>Município:</span></td>
                        <td>
                            <asp:DropDownList ID="inputIBGEMunicipio" runat="server"
                                DataTextField="Descricao" DataValueField="Codigo">
                            </asp:DropDownList>
                        </td>
                    </tr>
                </table>
                <br />
                <asp:LinkButton ID="btn_salvar" runat="server" onclick="btn_salvar_Click">
                    <img src="../Images/Buttons/Save.png" alt="" title="Salvar UF/Municipio" border="0" />
                </asp:LinkButton>
            </div>
        </asp:Panel>
    </ContentTemplate>
</asp:UpdatePanel>

<asp:UpdateProgress ID="ajax_update_progress" runat="server" AssociatedUpdatePanelID="ajax_panel_ibge" DisplayAfter="100">
    <ProgressTemplate>
        <div class="msgAguardeBkg"></div>
    </ProgressTemplate>
</asp:UpdateProgress>
