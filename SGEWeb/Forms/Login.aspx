<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="SGEWeb.Forms.Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="../Styles/Base.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/Login.css" rel="stylesheet" type="text/css" />
    <script src="../Scripts/jquery-1.7.2.js" type="text/javascript"></script>
    <script src="../Scripts/Login.js" type="text/javascript"></script>
    <title></title>
</head>
<body>
    <form id="loginFrm" runat="server">
    <div id="LoginMensagemBemVindo" class="lgnMsgBemVindo">
        <img src="../Images/Login/LoginMsg.png" alt="" />
    </div>
    <div class="lgnBkg">
        <div id="SgeLogo" class="lgnSgeLogo">
            <img src="../Images/Base/SGELogo.png" alt="" />
        </div>
        <div id="LoginInput" class="lgnInputBkg">
            <asp:TextBox ID="UsuarioInput" runat="server" CssClass="lgnInputLogin" MaxLength="20"></asp:TextBox>
            <asp:TextBox ID="SenhaInput" runat="server" CssClass="lgnInputSenha" TextMode="Password" MaxLength="20"></asp:TextBox>
        </div>
        <div id="LoginEntrarBtn" class="lgnEntrarBtn">
            <asp:LinkButton ID="EntrarBtn" runat="server" onclick="EntrarBtn_Click"><img src="../Images/Buttons/EntrarBtn.png" alt="" border="0" /></asp:LinkButton>
        </div>
    </div>
    </form>
</body>
</html>
