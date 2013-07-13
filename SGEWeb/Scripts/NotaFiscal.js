function calcularTotalNota() {
  // Pegando os valores
  var vlrIcmsST = document.getElementById("contentMaster_inputImpostoValorIcmsSt").value.replace(",", ".");
  var vlrProdutos = document.getElementById("contentMaster_inputImpostoValorTotalProdutos").value.replace(",", ".");
  var vlrFrete = document.getElementById("contentMaster_inputImpostoValorFrete").value.replace(",", ".");
  var vlrSeguro = document.getElementById("contentMaster_inputImpostoValorSeguro").value.replace(",", ".");
  var vlrDesconto = document.getElementById("contentMaster_inputImpostoDesconto").value.replace(",", ".");
  var vlrOutrasDespesas = document.getElementById("contentMaster_inputImpostoOutrasDespesas").value.replace(",", ".");
  var vlrIpi = document.getElementById("contentMaster_inputImpostoValorTotalIpi").value.replace(",", ".");
  var vlrTotal = 0;

  // Tratando quando não tiver valor para não causar erro no cálculo.
  if (vlrIcmsST=="") { vlrIcmsST = "0"; }
  if (vlrFrete=="") { vlrFrete = "0"; }
  if (vlrSeguro=="") { vlrSeguro = "0"; }
  if (vlrOutrasDespesas=="") { vlrOutrasDespesas = "0"; }
  
  // Calculando o valor total.
  vlrTotal = parseFloat(vlrIcmsST) + parseFloat(vlrProdutos) + parseFloat(vlrFrete) + 
    parseFloat(vlrSeguro) - parseFloat(vlrDesconto) + parseFloat(vlrOutrasDespesas) + parseFloat(vlrIpi);

  $("#contentMaster_inputImpostoValorTotalNota").val(vlrTotal.toFixed(2).replace(".", ","));
}

function calcularFaturamento() {
    /* este método está sendo utilizado para realizar os recalculos referente
     * aos totais da nota fiscal, por exemplo, qdo o usuário informar o valor 
     * do frete, o sistema deverá recalcular a base de cálculo do ICMS
     */
    __doPostBack('ctl00$contentMaster$NotaFiscalFatura_content$btnFaturamentoCalcularParcelas', '');
}