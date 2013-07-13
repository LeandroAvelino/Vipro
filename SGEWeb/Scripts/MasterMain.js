$(document).ready(function() {
	$("#mainTop").show(1000, function() {
		$("#imgLogoTop").fadeIn(1000);
	});
});


/******************************************************************************
* Fun��o destinada a bloquear a edi��o de campos.
*******************************************************************************/
function bloquearEdicao() {
    event.keyCode = 0;
}


/******************************************************************************
* Fun��o para formatar como n�mero com casas decimais definidas no par�metro.
*******************************************************************************/
function formatarNumeroDecimal(cmp, decimais) {
    var _valor = cmp.value.replace(",", ".");
    var _valorConvert = parseFloat(_valor).toFixed(decimais);
    cmp.value = _valorConvert.replace(".", ",");
}


/******************************************************************************
* Fun��o para permitir digitar somente n�meros e v�rgula.
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

