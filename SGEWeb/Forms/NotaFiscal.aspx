<%@ Page Title="" Language="C#" MasterPageFile="~/Forms/MasterMain.Master" AutoEventWireup="true" CodeBehind="NotaFiscal.aspx.cs" Inherits="SGEWeb.Forms.NotaFiscal" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="~/Forms/NotaFiscalIBGE.ascx" TagPrefix="aspIBGE" TagName="IBGE" %>

<asp:Content ID="contentHead" ContentPlaceHolderID="headMaster" runat="server">
    <link href="../Styles/NotaFiscal.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/IBGE.css" rel="stylesheet" type="text/css" />
    <script src="../Scripts/NotaFiscal.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="contentBody" ContentPlaceHolderID="contentMaster" runat="server">
    <div id="NotaFiscal" class="notaFiscal">
        
        <div id="NotaFiscalTitulo" class="notaFiscalTitulo">
            <asp:UpdatePanel ID="nf_ajax_botoes" runat="server">
                <ContentTemplate>
                    <table>
                        <tr>
                            <td><img src="../Images/Forms/NotaFiscal.png" alt="" /></td>
                            <td>
                                <asp:LinkButton ID="btnVoltar" runat="server"
                                    OnClick="btnVoltar_Click">
                                    <img alt="" src="../Images/Buttons/Left.png" title="Voltar" border="0" />
                                </asp:LinkButton>
                            </td>
                            <td>
                                <asp:LinkButton ID="btnNotaGerarTxtSefaz" runat="server"
                                    OnClick="btnNotaGerarTxtSefaz_Click">
                                    <img src="../Images/Buttons/NF-e.png" alt="" title="Exportar arquivo de integração com SEFAZ" border="0" />
                                </asp:LinkButton>
                            </td>
                        </tr>
                    </table>            
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        
        <asp:UpdatePanel ID="conteudo_ajax_panel" runat="server">
            <ContentTemplate>
            <div id="NotaFiscalConteudo" class="notaFiscalConteudo">
            <asp:Accordion ID="NotaFiscalAccordion" runat="server" HeaderCssClass="notaFiscalAba" ContentCssClass="notaFiscalAbaConteudo">
                <Panes>
                    <asp:AccordionPane ID="NotaFiscalPanelDados" runat="server">
                        <Header><span>Principal</span></Header>
                        <Content>
                            <asp:UpdatePanel ID="ajaxPanelDados" runat="server">
                                <ContentTemplate>
                                    <table width="600">
                                        <tr>
                                            <td><span>NF-e Nº</span></td>
                                            <td><span>Origem</span></td>
                                            <td><span>Data Emissão</span></td>
                                            <td><span>Data Saída</span></td>
                                            <td><span>Hora Saída</span></td>
                                        </tr>
                                        <tr>
                                            <td><asp:TextBox ID="inputNotaNumero" runat="server" CssClass="inputDisable" Enabled="False" Width="70px"></asp:TextBox></td>
                                            <td>
                                                <asp:RadioButtonList ID="inputNotaOrigem" runat="server" RepeatDirection="Horizontal" CssClass="inputEnable" style="width:180px;" RepeatColumns="0">
                                                    <asp:ListItem Selected="False" Text="Entrada" Value="E"></asp:ListItem>
                                                    <asp:ListItem Selected="True" Text="Saída" Value="S"></asp:ListItem>
                                                </asp:RadioButtonList>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="inputNotaDataEmissao" runat="server" CssClass="inputEnable" Width="70px"></asp:TextBox>
                                                <asp:MaskedEditExtender ID="inputNotaDataEmissaoMsk" runat="server" TargetControlID="inputNotaDataEmissao" Mask="99/99/9999" MaskType="Date" PromptCharacter=" " UserDateFormat="DayMonthYear" ClearMaskOnLostFocus="False"></asp:MaskedEditExtender>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="inputNotaDataSaida" runat="server" CssClass="inputEnable" Width="70px"></asp:TextBox>
                                                <asp:MaskedEditExtender ID="inputNotaDataSaidaMsk" runat="server" TargetControlID="inputNotaDataSaida" Mask="99/99/9999" MaskType="Date" PromptCharacter=" " UserDateFormat="DayMonthYear" ClearMaskOnLostFocus="False"></asp:MaskedEditExtender>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="inputNotaHoraSaida" runat="server" CssClass="inputEnable" Width="70px"></asp:TextBox>
                                                <asp:MaskedEditExtender ID="inputNotaHoraSaidaMsk" runat="server" TargetControlID="inputNotaHoraSaida" Mask="99:99" MaskType="Time" PromptCharacter=" " UserDateFormat="None" ClearMaskOnLostFocus="False"></asp:MaskedEditExtender>
                                            </td>
                                        </tr>
                                    </table>
                                    <table>
                                        <tr>
                                            <td><span>Natureza Operação</span></td>
                                            <td><span>Natureza Operação (Descrição na NF-e)</span></td>
                                        </tr>
                                        <tr>
                                            <td style="width:313px;"><asp:DropDownList ID="inputNaturezaOperacao" runat="server" Width="300px" 
                                                    DataTextField="Descricao" DataValueField="CFOP" AutoPostBack="True"
                                                    OnSelectedIndexChanged="inputNaturezaOperacao_SelectedIndexChanged"></asp:DropDownList>
                                            </td>
                                            <td>
                                                <asp:Label ID="infNaturezaOperacaoNF" runat="server" Font-Bold="True" ForeColor="White"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </Content>
                    </asp:AccordionPane>
                    <asp:AccordionPane ID="NotaFiscalDestinatario" runat="server">
                        <Header>
                            <span>Destinatário / Remetente</span>
                            &nbsp;&nbsp;&nbsp;
                            <asp:Image ID="imgCheckDestinatario" runat="server" ImageUrl="~/Images/Base/check_small.png" />
                            &nbsp;&nbsp;&nbsp;
                            <asp:Image ID="imgCheckDestinatarioCNPJ" runat="server" ImageUrl="~/Images/Base/Warning_small.png" ToolTip="CNPJ Inválido." />
                        </Header>
                        <Content>
                            <asp:UpdatePanel ID="ajax_panel_cliente" runat="server">
                                <ContentTemplate>
                                    <table>
                                        <tr>
                                            <td><span>Nome / Razão Social</span></td>
                                            <td><span>CNPJ / CPF</span></td>
                                            <td><span>Inscrição Estadual</span></td>
                                        </tr>
                                        <tr>
                                            <td><asp:TextBox ID="inputDestinatarioNome" runat="server" CssClass="inputEnable" Width="600px"></asp:TextBox></td>
                                            <td>
                                                <asp:TextBox ID="inputDestinatarioCNPJ" runat="server" CssClass="inputEnable" Width="130px"></asp:TextBox>
                                                <asp:MaskedEditExtender
                                                    ID="mskInputDestinatarioCNPJ" runat="server" TargetControlID="inputDestinatarioCNPJ" 
                                                    AutoComplete="False" ClearMaskOnLostFocus="False" CultureName="pt-BR" 
                                                    Mask="99\.999\.999\/9999\-99" PromptCharacter=" ">
                                                </asp:MaskedEditExtender>
                                            </td>
                                            <td><asp:TextBox ID="inputDestinatarioInscricao" runat="server" CssClass="inputEnable" Width="100px"></asp:TextBox></td>
                                        </tr>
                                    </table>
                                    <table>
                                        <tr>
                                            <td><span>Endereço</span></td>
                                            <td><span>Bairro</span></td>
                                        </tr>
                                        <tr>
                                            <td><asp:TextBox ID="inputDestinatarioEndereco" runat="server" CssClass="inputEnable" Width="600px"></asp:TextBox></td>
                                            <td><asp:TextBox ID="inputDestinatarioBairro" runat="server" CssClass="inputEnable" Width="230px"></asp:TextBox></td>
                                        </tr>
                                    </table>
                                    <table>
                                        <tr>
                                            <td><span>CEP</span></td>
                                            <td><span>Município</span></td>
                                            <td><span>UF</span></td>
                                            <td><span>Fone / Fax</span></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:TextBox ID="inputDestinatarioCEP" runat="server" CssClass="inputEnable" Width="70px"></asp:TextBox>
                                                <asp:MaskedEditExtender ID="inputDestinatarioCEPMsk" runat="server" TargetControlID="inputDestinatarioCEP" Mask="99999-999" MaskType="None" PromptCharacter=" " UserDateFormat="None" ClearMaskOnLostFocus="False"></asp:MaskedEditExtender>
                                            </td>
                                            <td><asp:TextBox ID="inputDestinatarioMunicipio" runat="server" CssClass="inputEnable" Width="300px"></asp:TextBox></td>
                                            <td><asp:TextBox ID="inputDestinatarioUF" runat="server" CssClass="inputEnable" Width="50px"></asp:TextBox></td>
                                            <td><asp:TextBox ID="inputDestinatarioFone" runat="server" CssClass="inputEnable" Width="165px"></asp:TextBox></td>
                                        </tr>
                                    </table>
                                    <table>
                                        <tr><td><span>E-mail para enviar a NF-e</span></td></tr>
                                        <tr><td><asp:TextBox ID="inputDestinatarioEmailNFe" runat="server" CssClass="inputEnable" style="text-transform:lowercase;" Width="600px"></asp:TextBox></td></tr>
                                    </table>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </Content>
                    </asp:AccordionPane>
                    <asp:AccordionPane ID="NotaFiscalProdutos" runat="server">
                        <Header>
                            <asp:UpdatePanel ID="ajaxPanelProdutosImg" runat="server">
                                <ContentTemplate>
                                    <span>Produtos</span>
                                    &nbsp;&nbsp;&nbsp;
                                    <asp:Image ID="imgCheckProdutos" runat="server" />
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </Header>
                        <Content>
                            <asp:UpdatePanel ID="ajaxPanelProdutos" runat="server">
                                <ContentTemplate>
                                    <asp:GridView ID="grdProdutos" runat="server" AutoGenerateColumns="False"
                                        CssClass="prdGrd" HeaderStyle-CssClass="prdGrdHead"
                                        DataKeyNames="Produto,ValorUnitario,ValorTotal"
                                        OnRowDataBound="grdProdutos_RowDataBound" AlternatingRowStyle-BackColor="#666666">
                                        <Columns>
                                            <asp:BoundField HeaderText="Qtde" DataField="Qtde" ItemStyle-HorizontalAlign="Center" ItemStyle-CssClass="prdGrdContent" />
                                            <asp:TemplateField HeaderText="Grupo" ItemStyle-CssClass="prdGrdContent">
                                                <ItemTemplate><asp:Label ID="infGrdProdutoGrupo" runat="server"></asp:Label></ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Produto" ItemStyle-CssClass="prdGrdContent">
                                                <ItemTemplate><asp:Label ID="infGrdProdutoProduto" runat="server"></asp:Label></ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Marca" ItemStyle-CssClass="prdGrdContent">
                                                <ItemTemplate><asp:Label ID="infGrdProdutoMarca" runat="server"></asp:Label></ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="NCM/SH" ItemStyle-HorizontalAlign="Center" ItemStyle-CssClass="prdGrdContent">
                                                <ItemTemplate><asp:Label ID="infGrdProdutoNCM" runat="server"></asp:Label></ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="CFOP" ItemStyle-HorizontalAlign="Center" ItemStyle-CssClass="prdGrdContent">
                                                <ItemTemplate><asp:Label ID="infGrdProdutoCFOP" runat="server"></asp:Label></ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Situação<br />Tributária" ItemStyle-HorizontalAlign="Center" ItemStyle-CssClass="prdGrdContent">
                                                <ItemTemplate><asp:Label ID="infGrdProdutoSitTrib" runat="server"></asp:Label></ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Valor<br />Unitário" ItemStyle-HorizontalAlign="Right" ItemStyle-CssClass="prdGrdContent">
                                                <ItemTemplate><asp:Label ID="infGrdProdutoVlrUnitario" runat="server"></asp:Label></ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Valor<br />Total" ItemStyle-HorizontalAlign="Right" ItemStyle-CssClass="prdGrdContent">
                                                <ItemTemplate><asp:Label ID="infGrdProdutoVlrTotal" runat="server"></asp:Label></ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="ICMS" ItemStyle-HorizontalAlign="Center" ItemStyle-CssClass="prdGrdContent">
                                                <ItemTemplate><asp:Label ID="infGrdProdutoICMS" runat="server"></asp:Label></ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="IPI" ItemStyle-HorizontalAlign="Center" ItemStyle-CssClass="prdGrdContent">
                                                <ItemTemplate><asp:Label ID="infGrdProdutoIPI" runat="server"></asp:Label></ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                    <br />

                                    <asp:Panel ID="pnlInfPrdSubstTrib" runat="server">
                                        <table>
                                            <tr>
                                                <td style="background-color:Orange;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                                <td><asp:Label ID="infProdutoComSubstituicaoTributaria" style="color:Orange; padding-right:15px;" runat="server" Text="Produto com Substituição Tributária"></asp:Label>
                                            </tr>
                                        </table>
                                    </asp:Panel>

                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </Content>
                    </asp:AccordionPane>
                    <asp:AccordionPane ID="NotaFiscalImpostos" runat="server">
                        <Header><span>Impostos</span></Header>
                        <Content>
                            <asp:UpdatePanel ID="ajaxPanelImpostos" runat="server">
                                <ContentTemplate>
                                    <table class="notaFiscalImpostoTable">
                                        <tr>
                                            <td><span>Base Cálculo ICMS</span></td>
                                            <td><span>Valor ICMS</span></td>
                                            <td><span>Base Cálculo ICMS S.T.</span></td>
                                            <td><span>Valor ICMS Substituição</span></td>
                                            <td></td>
                                            <td><span>Valor Total Produtos</span></td>
                                        </tr>
                                        <tr>
                                            <td><asp:TextBox ID="inputImpostoBaseCalculoIcms" runat="server" CssClass="inputDisable" Width="100px" onkeypress="bloquearEdicao()"></asp:TextBox></td>
                                            <td><asp:TextBox ID="inputImpostoValorIcms" runat="server" CssClass="inputDisable" Width="100px" onkeypress="bloquearEdicao()"></asp:TextBox></td>
                                            <td><asp:TextBox ID="inputImpostoBaseCalculoIcmsSt" runat="server" CssClass="inputDisable" Width="100px" onkeypress="bloquearEdicao()"></asp:TextBox></td>
                                            <td><asp:TextBox ID="inputImpostoValorIcmsSt" runat="server" CssClass="inputDisable" Width="100px" onkeypress="bloquearEdicao()"></asp:TextBox></td>
                                            <td></td>
                                            <td><asp:TextBox ID="inputImpostoValorTotalProdutos" runat="server" CssClass="inputDisable" Width="100px" onkeypress="bloquearEdicao()"></asp:TextBox></td>
                                        </tr>
                                        <tr>
                                            <td><span>Valor Frete</span></td>
                                            <td><span>Valor Seguro</span></td>
                                            <td><span>Desconto</span></td>
                                            <td><span>Outras Desp. Acessórias</span></td>
                                            <td><span>Valor Total IPI</span></td>
                                            <td><span>Valor Total Nota</span></td>
                                        </tr>
                                        <tr>
                                            <td><asp:TextBox ID="inputImpostoValorFrete" runat="server" CssClass="inputEnable" Width="100px" onkeyup="calcularTotalNota()" onkeypress="onlyNumber(event)" onblur="formatarNumeroDecimal(this, 2); calcularFaturamento();"></asp:TextBox></td>
                                            <td><asp:TextBox ID="inputImpostoValorSeguro" runat="server" CssClass="inputEnable" Width="100px" onkeyup="calcularTotalNota()" onblur="formatarNumeroDecimal(this, 2); calcularFaturamento();"></asp:TextBox></td>
                                            <td><asp:TextBox ID="inputImpostoDesconto" runat="server" CssClass="inputEnable" Width="100px" onkeyup="calcularTotalNota()" onblur="formatarNumeroDecimal(this, 2)"></asp:TextBox></td>
                                            <td><asp:TextBox ID="inputImpostoOutrasDespesas" runat="server" CssClass="inputEnable" Width="100px" onkeyup="calcularTotalNota()" onblur="formatarNumeroDecimal(this, 2); calcularFaturamento();"></asp:TextBox></td>
                                            <td><asp:TextBox ID="inputImpostoValorTotalIpi" runat="server" CssClass="inputDisable" Width="100px" onkeypress="bloquearEdicao()"></asp:TextBox></td>
                                            <td><asp:TextBox ID="inputImpostoValorTotalNota" runat="server" CssClass="inputDisable" Width="100px" onkeypress="bloquearEdicao()"></asp:TextBox></td>
                                        </tr>
                                    </table>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                            
                        </Content>
                    </asp:AccordionPane>
                    <asp:AccordionPane ID="NotaFiscalTransportador" runat="server">
                        <Header>
                            <span>Transportador</span>
                            &nbsp;&nbsp;&nbsp;
                            <asp:Image ID="imgCheckTransportador" runat="server" />
                        </Header>
                        <Content>
                            <asp:UpdatePanel ID="ajaxPanelTransportador" runat="server">
                                <ContentTemplate>
                                    <table class="notaFiscalTransportadorTable">
                                        <tr>
                                            <td><span>Frete por Conta</span></td>
                                            <td><span>Nome / Razão Social</span></td>
                                            <td><span>CNPJ / CPF</span></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:RadioButtonList ID="inputTranspFrete" runat="server" RepeatDirection="Horizontal" CssClass="inputEnable" style="width:200px;" RepeatColumns="0">
                                                    <asp:ListItem Selected="True" Text="Emitente" Value="E"></asp:ListItem>
                                                    <asp:ListItem Selected="False" Text="Destinatario" Value="D"></asp:ListItem>
                                                </asp:RadioButtonList>
                                            </td>
                                            <td><asp:TextBox ID="inputTranspNome" runat="server" CssClass="inputEnable" Width="500px"></asp:TextBox></td>
                                            <td><asp:TextBox ID="inputTranspCnpj" runat="server" CssClass="inputEnable" Width="130px"></asp:TextBox></td>
                                        </tr>
                                    </table>
                                    <table class="notaFiscalTransportadorTable">
                                        <tr>
                                            <td><span>Endereço</span></td>
                                            <td><span>Município</span></td>
                                            <td><span>UF</span></td>
                                            <td><span>Inscrição Estadual</span></td>
                                        </tr>
                                        <tr>
                                            <td><asp:TextBox ID="inputTranspEndereco" runat="server" CssClass="inputEnable" Width="400px"></asp:TextBox></td>
                                            <td><asp:TextBox ID="inputTranspMunicipio" runat="server" CssClass="inputEnable" Width="300px"></asp:TextBox></td>
                                            <td><asp:TextBox ID="inputTranspUF" runat="server" CssClass="inputEnable" Width="20px"></asp:TextBox></td>
                                            <td><asp:TextBox ID="inputTranspInscricaoEstadual" runat="server" CssClass="inputEnable" Width="130px"></asp:TextBox></td>
                                        </tr>
                                    </table>
                                    <table>
                                        <tr>
                                            <td><span>Código ANTT</span></td>
                                            <td style="padding-left:5px;"><span>Placa Veículo</span></td>
                                            <td style="padding-left:9px;"><span>UF</span></td>
                                        </tr>
                                        <tr>
                                            <td><asp:TextBox ID="inputTranspCodigoAntt" runat="server" CssClass="inputEnable" Width="135px"></asp:TextBox></td>
                                            <td style="padding-left:5px;"><asp:TextBox ID="inputTranspPlacaVeiculo" runat="server" CssClass="inputEnable" Width="135px"></asp:TextBox></td>
                                            <td style="padding-left:9px;"><asp:TextBox ID="inputTranspPlacaVeiculoUF" runat="server" CssClass="inputEnable" Width="20px"></asp:TextBox></td>
                                        </tr>
                                    </table>
                                    <table class="notaFiscalTransportadorTable">
                                        <tr>
                                            <td><span>Quantidade</span></td>
                                            <td><span>Espécie</span></td>
                                            <td><span>Marca</span></td>
                                            <td><span>Numeração</span></td>
                                            <td><span>Peso Bruto</span></td>
                                            <td><span>Peso Líquido</span></td>
                                        </tr>
                                        <tr>
                                            <td><asp:TextBox ID="inputTranspQuantidade" runat="server" CssClass="inputEnable" Width="135px"></asp:TextBox></td>
                                            <td><asp:TextBox ID="inputTranspEspecie" runat="server" CssClass="inputEnable" Width="135px"></asp:TextBox></td>
                                            <td><asp:TextBox ID="inputTranspMarca" runat="server" CssClass="inputEnable" Width="135px"></asp:TextBox></td>
                                            <td><asp:TextBox ID="inputTranspNumeracao" runat="server" CssClass="inputEnable" Width="135px"></asp:TextBox></td>
                                            <td><asp:TextBox ID="inputTranspPesoBruto" runat="server" CssClass="inputEnable" onkeypress="onlyNumber(event)" Width="135px"></asp:TextBox></td>
                                            <td><asp:TextBox ID="inputTranspPesoLiquido" runat="server" CssClass="inputEnable" onkeypress="onlyNumber(event)" Width="135px"></asp:TextBox></td>
                                        </tr>
                                    </table>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </Content>
                    </asp:AccordionPane>
                    <asp:AccordionPane ID="NotaFiscalFatura" runat="server">
                        <Header><span>Faturamento</span></Header>
                        <Content>
                            <asp:UpdatePanel ID="ajaxPanelFaturamento" runat="server" ChildrenAsTriggers="True" UpdateMode="Always">
                                <ContentTemplate>
                                    <table>
                                        <tr>
                                            <!-- forma de pagto e qtd de parcelas -->
                                            <td valign="top">
                                                <table>
                                                    <tr>
                                                        <td><span>Tipo de Cobrança</span></td>
                                                        <td>
                                                            <asp:DropDownList ID="inputFaturaTipoCobranca" runat="server" CssClass="inputEnable" Width="100px">
                                                                <asp:ListItem Selected="True" Text="BANCARIA" Value="BANCARIA"></asp:ListItem>
                                                                <asp:ListItem Text="CARTEIRA" Value="CARTEIRA"></asp:ListItem>
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td><span>Forma de Pagamento</span></td>
                                                        <td>
                                                            <asp:DropDownList ID="inputFaturamentoForma" runat="server" CssClass="inputEnable" Width="100px"
                                                                OnSelectedIndexChanged="inputFaturamentoForma_SelectedIndexChanged" AutoPostBack="True">
                                                                <asp:ListItem Selected="True" Text="A VISTA" Value="A VISTA"></asp:ListItem>
                                                                <asp:ListItem Text="FATURADO" Value="FATURADO"></asp:ListItem>
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td><span>Qtde. de Parcelas</span></td>
                                                        <td><table><tr>
                                                            <td><asp:TextBox ID="inputFaturamentoParcelas" runat="server" 
                                                                    CssClass="inputEnable" Width="20px" MaxLength="2"
                                                                    onkeypress="onlyNumber(event)"></asp:TextBox></td>
                                                            <td><asp:LinkButton ID="btnFaturamentoCalcularParcelas" runat="server"
                                                                    OnClick="btnFaturamentoCalcularParcelas_Click">
                                                                    <img src="../Images/Base/calculator.png" alt="" border="0"
                                                                        title="Calcular Parcela(s)" />
                                                                </asp:LinkButton></td>
                                                            </tr></table>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>

                                            <!-- visualizar as parcelas -->
                                            <td valign="top" style="padding-left:40px;">
                                                <asp:GridView ID="grdFaturamentoParcelas" runat="server" AutoGenerateColumns="False"
                                                    CssClass="nfFaturamentoGrd" HeaderStyle-CssClass="prdGrdHead"
                                                    AlternatingRowStyle-BackColor="#666666"
                                                    DataKeyNames="NumeroParcela,DataVencimento,DataVencimentoDias,ValorParcela"
                                                    OnRowDataBound="grdFaturamentoParcelas_RowDataBound"
                                                    OnRowCommand="grdFaturamentoParcelas_RowCommand">
                                                    <Columns>
                                                        <asp:TemplateField HeaderText="Nº Parcela" ItemStyle-HorizontalAlign="Center" ItemStyle-CssClass="prdGrdContent">
                                                            <ItemTemplate>
                                                                <asp:Label ID="infFaturaNumParcela" runat="server" Text=""></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Vencimento" ItemStyle-HorizontalAlign="Center" ItemStyle-CssClass="prdGrdContent">
                                                            <ItemTemplate>
                                                                <span>+</span>
                                                                <asp:TextBox ID="inputFaturaVencimentoDias" runat="server" 
                                                                    CssClass="inputEnable" MaxLength="3" Width="25px" 
                                                                    onkeypress="onlyNumber(event)">
                                                                </asp:TextBox>
                                                                <asp:Button ID="btnFaturaVencimentoDd" runat="server" Text="dd"
                                                                    CommandName="calcularDias"
                                                                    CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" />
                                                                <span> = </span>
                                                                <asp:TextBox ID="inputFaturaVencimento" runat="server" CssClass="inputEnable" 
                                                                    MaxLength="10" Width="70px"></asp:TextBox>
                                                                <asp:Image ID="imgFaturaVencimento" runat="server" ImageUrl="~/Images/Base/calendario_small.png" />
                                                                <asp:CalendarExtender ID="inputFaturaVencimentoCalendario" runat="server" 
                                                                    PopupButtonID="imgFaturaVencimento" PopupPosition="BottomRight" 
                                                                    TargetControlID="inputFaturaVencimento" Format="dd/MM/yyyy">
                                                                </asp:CalendarExtender>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Valor" ItemStyle-HorizontalAlign="Right" ItemStyle-CssClass="prdGrdContent">
                                                            <ItemTemplate>
                                                                <asp:Label ID="infFaturaValor" runat="server" Text=""></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                    </Columns>
                                                </asp:GridView>
                                            </td>

                                            <!-- visualizar o padrão de vencimentos do cliente -->
                                            <td valign="top" style="padding-left:40px;">
                                                <asp:Panel ID="pnlFaturamentoClientePadraoVencimento" runat="server" Visible="true" CssClass="pnlPadraoVenctoCliente">
                                                    <table>
                                                        <tr>
                                                            <td valign="top"><img src="../Images/Base/Warning_small.png" alt="" /></td>
                                                            <td style="padding-left:5px;"><span>Este cliente possui um padrão de vencimento diferenciado:</span>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <br />
                                                    <asp:Label ID="infFaturamentoClientePadraoVencimento" runat="server" Font-Bold="True"></asp:Label>
                                                </asp:Panel>
                                            </td>
                                        </tr>
                                    </table>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </Content>
                    </asp:AccordionPane>
                    <asp:AccordionPane ID="NotaFiscalImportacao" runat="server">
                        <Header>
                            <span>Importação</span>
                        </Header>
                    </asp:AccordionPane>
                    <asp:AccordionPane ID="NotaFiscalAdicionais" runat="server">
                        <Header><span>Dados Adicionais</span></Header>
                        <Content>
                            <span>Informações Complementares</span>
                            <br />
                            <asp:TextBox ID="inputDadosAdicionais" runat="server" TextMode="MultiLine" Rows="6" CssClass="inputEnable" style="height:100px; width:880px;"></asp:TextBox>
                        </Content>
                    </asp:AccordionPane>
                </Panes>
            </asp:Accordion>
            </div>
            </ContentTemplate>
        </asp:UpdatePanel>
        
        <!-- painel que visualiza os produtos com preços diferentes -->
        <asp:UpdatePanel ID="ajaxPanelProdutoPrecoDiferente" runat="server">
            <ContentTemplate>
                <asp:Panel ID="pnlTratarProdutos" runat="server" Visible="true" CssClass="pnlPrdPrecoDif">
                    <!-- Titulo do painel -->
                    <table class="pnlPrdPrecoDifTitulo">
                        <tr>
                            <td><img src="../Images/Base/Warning_small.png" alt="" /></td>
                            <td><span>Corrigir Produtos com Preços Diferentes</span></td>
                            <td style="width:400px;" align="right">
                                <asp:LinkButton ID="btnFecharPnlPrecoDif" runat="server" CssClass="lnkBtnWhite" onclick="btnFecharPnlPrecoDif_Click">
                                    <img src="../Images/Buttons/CloseSmall.png" alt="" border="0" />
                                </asp:LinkButton>
                            </td>
                        </tr>
                    </table>
            
                    <!-- Listando os produtos com preços diferentes -->
                    <asp:GridView ID="grdPrdDiferente" runat="server" AutoGenerateColumns="False"
                        CssClass="pnlPrdPrecoDifGrd" HeaderStyle-CssClass="prdGrdHead"
                        DataKeyNames="Produto,ValorUnitario,Qtde,PedidoNumero"
                        OnRowDataBound="grdPrdDiferente_RowDataBound">
                        <Columns>
                            <asp:TemplateField HeaderText="Pedido Nº" ItemStyle-CssClass="prdGrdContent" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate><asp:Label ID="infGrdProdutoPedido" runat="server"></asp:Label></ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Qtde" ItemStyle-CssClass="prdGrdContent" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate><asp:Label ID="infGrdProdutoQtde" runat="server"></asp:Label></ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Grupo" ItemStyle-CssClass="prdGrdContent">
                                <ItemTemplate><asp:Label ID="infGrdProdutoGrupo" runat="server"></asp:Label></ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Produto" ItemStyle-CssClass="prdGrdContent">
                                <ItemTemplate><asp:Label ID="infGrdProdutoProduto" runat="server"></asp:Label></ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Marca" ItemStyle-CssClass="prdGrdContent">
                                <ItemTemplate><asp:Label ID="infGrdProdutoMarca" runat="server"></asp:Label></ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Valor<br />Unitário" ItemStyle-HorizontalAlign="Right" ItemStyle-CssClass="prdGrdContent">
                                <ItemTemplate><asp:Label ID="infGrdProdutoVlrUnitario" runat="server"></asp:Label></ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Valor Unitário<br />Correto" ItemStyle-HorizontalAlign="Right" ItemStyle-CssClass="prdGrdContent">
                                <ItemTemplate><asp:TextBox ID="inputPrdPrecoDifAlterar" runat="server" Width="80px" onblur="formatarNumeroDecimal(this, 2)" onkeypress="onlyNumber(event)"></asp:TextBox></ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Classificação<br />Fiscal" ItemStyle-HorizontalAlign="Center" ItemStyle-CssClass="prdGrdContent">
                                <ItemTemplate><asp:Label ID="infGrdProdutoClassFiscal" runat="server"></asp:Label></ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="CST" ItemStyle-HorizontalAlign="Center" ItemStyle-CssClass="prdGrdContent">
                                <ItemTemplate><asp:Label ID="infGrdProdutoCCST" runat="server"></asp:Label></ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="IPI" ItemStyle-HorizontalAlign="Center" ItemStyle-CssClass="prdGrdContent">
                                <ItemTemplate><asp:Label ID="infGrdProdutoIPI" runat="server"></asp:Label></ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>

                    <!-- legenda -->
                    <div class="pnlPrdPrecoDifLegenda">
                        <table>
                            <tr>
                                <td style="background-color:Orange;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                <td><span style="color:Orange; padding-right:15px;">Produto com Substituição Tributária</span></td>
                                <td style="background-color:Red;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                <td><span style="color:#FF5050;">Produto com valor unitário não corrigido</span></td>
                            </tr>
                        </table>
                    </div>

                </asp:Panel>
            </ContentTemplate>
        </asp:UpdatePanel>

        <!-- painel que visualiza o UF/Municipio do IBGE -->
        <aspIBGE:IBGE ID="IBGE1" runat="server"></aspIBGE:IBGE>

        <!-- painel que visualiza para seguir a próxima etapa de gravação -->
        <asp:UpdatePanel ID="step_gravar_ajax_panel" runat="server">
            <ContentTemplate>
                <asp:Panel ID="step_gravar_panel" runat="server" Visible="false" CssClass="step_panel">
                    <span>A nota fiscal&nbsp;<asp:Label ID="step_gravar_lbl_nome_arquivo" runat="server" Font-Bold="True" ForeColor="White"></asp:Label>&nbsp;foi transmitida com sucesso para Secretaria da Fazenda.</span>
                    <br />
                    <span>O que você deseja fazer?</span>
                    <br /><br />
                    <p>
                        <asp:LinkButton ID="step_gravar_btn_voltar" runat="server" CssClass="lnk_btn_step" OnClick="step_gravar_btn_voltar_Click">Voltar</asp:LinkButton>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:LinkButton ID="step_gravar_btn_gravar" runat="server" CssClass="lnk_btn_step" OnClick="step_gravar_btn_gravar_Click">Concluir</asp:LinkButton>
                    </p>
                </asp:Panel>
            </ContentTemplate>
        </asp:UpdatePanel>

        <asp:UpdatePanel ID="step_finalizado_ajax_panel" runat="server">
            <ContentTemplate>
                <asp:Panel ID="step_finalizado_panel" runat="server" Visible="False" CssClass="step_panel">
                    <span>OK... Nota Fiscal Gravada Com Sucesso!</span>
                    <br /><br />
                    <asp:LinkButton ID="step_finalizado_btn" runat="server" CssClass="lnk_btn_step" OnClick="step_finalizado_btn_Click">Clique Aqui</asp:LinkButton>
                </asp:Panel>
            </ContentTemplate>
        </asp:UpdatePanel>

        <asp:UpdateProgress ID="nf_ajax_progress_botoes" runat="server" AssociatedUpdatePanelID="nf_ajax_botoes" DisplayAfter="100">
            <ProgressTemplate>
                <div class="msgAguardeBkg"></div>
            </ProgressTemplate>
        </asp:UpdateProgress>

        <asp:UpdateProgress ID="step_gravar_ajax_progress" runat="server" AssociatedUpdatePanelID="step_gravar_ajax_panel" DisplayAfter="100">
            <ProgressTemplate>
                <div class="msgAguardeBkg"></div>
            </ProgressTemplate>
        </asp:UpdateProgress>
        
    </div>
</asp:Content>
