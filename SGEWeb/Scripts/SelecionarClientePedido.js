$(document).ready(function () {

    displayObj("#contentMaster_btnPesquisarNomeFantasia", "none");
    displayObj("#contentMaster_btnPesquisarNome", "none");
    displayObj("#contentMaster_btnPesquisarCnpj", "none");
    displayObj("#contentMaster_btnPesquisarCpf", "none");

    $("#mainSelecionarPedido").fadeIn(1500, function () {
        $("#contentMaster_btnPesquisarNomeFantasia").show(1000);
        $("#contentMaster_btnPesquisarNome").show(1300);
        $("#contentMaster_btnPesquisarCnpj").show(1600);
        $("#contentMaster_btnPesquisarCpf").show(2000);
    });

    $("#contentMaster_inputNomeFantasia").focus();
});

function displayObj(painel,valor) {
    $(painel).css("display", valor);
}
