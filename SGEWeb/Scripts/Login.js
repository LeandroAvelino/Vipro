$(document).ready(function () {
    $("#SgeLogo").fadeIn(3000);
    $("#LoginInput").slideDown(1500, function () {
        $("#UsuarioInput").focus();
    });
    $("#LoginMensagemBemVindo").show(1500);
    $("#LoginEntrarBtn").show(1500);
});