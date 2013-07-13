$(document).ready(function() {
	$("#mainTop").show(1000, function() {
		$("#imgLogoTop").fadeIn(1000);
	});
});


/******************************************************************************
* Função destinada a bloquear a edição de campos.
*******************************************************************************/
function bloquearEdicao() {
    event.keyCode = 0;
}


/******************************************************************************
* Função para formatar como número com casas decimais definidas no parâmetro.
*******************************************************************************/
function formatarNumeroDecimal(cmp, decimais) {
    var _valor = cmp.value.replace(",", ".");
    var _valorConvert = parseFloat(_valor).toFixed(decimais);
    cmp.value = _valorConvert.replace(".", ",");
}


/******************************************************************************
* Função para permitir digitar somente números e vírgula.
*******************************************************************************/
function onlyNumber(num) {
    if (document.all)
        var tecla = event.keyCode;
    else if (document.layers)
        var tecla = num.which;
    if (tecla > 47 && tecla < 58)
        return true;
    else {
        if (tecla != 8 && tecla != 44)
            event.keyCode = 0;
        else
            return true;
    }
}

