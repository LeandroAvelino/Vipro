unit ufrmDanfeImpressao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, QuickRpt, QRCtrls, jpeg, DB, ADODB;

type
  TfrmDanfeImpressao = class(TForm)
    rptDANFE: TQuickRep;
    DetailBand1: TQRBand;
    PageHeaderBand1: TQRBand;
    QRShape1: TQRShape;
    QRLabel1: TQRLabel;
    qrmemDadosResumidoEmissao: TQRMemo;
    QRShape2: TQRShape;
    QRLabel2: TQRLabel;
    QRShape3: TQRShape;
    QRLabel3: TQRLabel;
    QRShape4: TQRShape;
    QRLabel4: TQRLabel;
    qrlblNFeNumero: TQRLabel;
    QRLabel5: TQRLabel;
    dtsDados: TADODataSet;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRShape8: TQRShape;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRShape11: TQRShape;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRImage1: TQRImage;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRShape12: TQRShape;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRShape13: TQRShape;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRShape14: TQRShape;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRShape15: TQRShape;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRShape16: TQRShape;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRShape17: TQRShape;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRShape19: TQRShape;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRShape20: TQRShape;
    QRLabel43: TQRLabel;
    QRLabel44: TQRLabel;
    QRShape21: TQRShape;
    QRLabel45: TQRLabel;
    QRLabel46: TQRLabel;
    QRShape22: TQRShape;
    QRLabel47: TQRLabel;
    QRLabel48: TQRLabel;
    QRShape23: TQRShape;
    QRLabel49: TQRLabel;
    QRLabel50: TQRLabel;
    QRShape24: TQRShape;
    QRLabel51: TQRLabel;
    QRLabel52: TQRLabel;
    QRShape25: TQRShape;
    QRLabel53: TQRLabel;
    QRLabel54: TQRLabel;
    QRShape26: TQRShape;
    QRLabel55: TQRLabel;
    QRLabel56: TQRLabel;
    QRShape27: TQRShape;
    QRLabel57: TQRLabel;
    QRLabel58: TQRLabel;
    QRShape28: TQRShape;
    QRLabel59: TQRLabel;
    QRLabel60: TQRLabel;
    QRShape18: TQRShape;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel61: TQRLabel;
    QRShape29: TQRShape;
    QRMemo1: TQRMemo;
    QRLabel62: TQRLabel;
    QRShape30: TQRShape;
    QRLabel63: TQRLabel;
    QRLabel64: TQRLabel;
    QRShape31: TQRShape;
    QRLabel65: TQRLabel;
    QRLabel66: TQRLabel;
    QRShape32: TQRShape;
    QRLabel67: TQRLabel;
    QRLabel68: TQRLabel;
    QRShape33: TQRShape;
    QRLabel69: TQRLabel;
    QRLabel70: TQRLabel;
    QRShape34: TQRShape;
    QRLabel71: TQRLabel;
    QRLabel72: TQRLabel;
    QRShape35: TQRShape;
    QRLabel73: TQRLabel;
    QRLabel74: TQRLabel;
    QRLabel75: TQRLabel;
    QRLabel76: TQRLabel;
    QRLabel77: TQRLabel;
    QRLabel78: TQRLabel;
    QRLabel79: TQRLabel;
    QRLabel80: TQRLabel;
    QRLabel81: TQRLabel;
    QRLabel82: TQRLabel;
    QRLabel83: TQRLabel;
    QRLabel84: TQRLabel;
    QRShape36: TQRShape;
    QRShape37: TQRShape;
    QRShape38: TQRShape;
    QRShape39: TQRShape;
    QRShape40: TQRShape;
    QRLabel85: TQRLabel;
    QRShape41: TQRShape;
    QRLabel86: TQRLabel;
    QRLabel87: TQRLabel;
    QRLabel88: TQRLabel;
    QRLabel89: TQRLabel;
    QRLabel90: TQRLabel;
    QRLabel91: TQRLabel;
    QRLabel92: TQRLabel;
    QRLabel93: TQRLabel;
    QRLabel94: TQRLabel;
    QRLabel95: TQRLabel;
    QRLabel96: TQRLabel;
    QRLabel97: TQRLabel;
    QRShape42: TQRShape;
    QRShape43: TQRShape;
    QRShape44: TQRShape;
    QRShape45: TQRShape;
    QRShape46: TQRShape;
    QRShape47: TQRShape;
    QRLabel98: TQRLabel;
    QRLabel99: TQRLabel;
    QRLabel100: TQRLabel;
    QRLabel101: TQRLabel;
    QRLabel102: TQRLabel;
    QRLabel103: TQRLabel;
    QRLabel104: TQRLabel;
    QRLabel105: TQRLabel;
    QRShape48: TQRShape;
    QRShape49: TQRShape;
    QRShape50: TQRShape;
    QRShape51: TQRShape;
    QRLabel106: TQRLabel;
    QRLabel107: TQRLabel;
    QRLabel108: TQRLabel;
    QRLabel109: TQRLabel;
    QRLabel110: TQRLabel;
    QRLabel111: TQRLabel;
    QRLabel112: TQRLabel;
    QRLabel113: TQRLabel;
    QRLabel114: TQRLabel;
    QRLabel115: TQRLabel;
    QRLabel116: TQRLabel;
    QRLabel117: TQRLabel;
    QRShape52: TQRShape;
    QRShape53: TQRShape;
    QRShape54: TQRShape;
    QRShape55: TQRShape;
    QRShape56: TQRShape;
    QRLabel118: TQRLabel;
    QRShape57: TQRShape;
    QRLabel119: TQRLabel;
    QRShape58: TQRShape;
    QRShape59: TQRShape;
    QRLabel120: TQRLabel;
    QRLabel121: TQRLabel;
    QRLabel122: TQRLabel;
    QRShape60: TQRShape;
    QRLabel123: TQRLabel;
    QRShape61: TQRShape;
    QRLabel124: TQRLabel;
    QRShape62: TQRShape;
    QRShape63: TQRShape;
    QRLabel125: TQRLabel;
    QRShape64: TQRShape;
    QRLabel126: TQRLabel;
    QRShape65: TQRShape;
    QRLabel127: TQRLabel;
    QRShape66: TQRShape;
    QRLabel128: TQRLabel;
    QRShape67: TQRShape;
    QRLabel129: TQRLabel;
    QRShape68: TQRShape;
    QRLabel130: TQRLabel;
    QRShape69: TQRShape;
    QRLabel131: TQRLabel;
    QRShape70: TQRShape;
    QRLabel132: TQRLabel;
    QRShape71: TQRShape;
    QRLabel133: TQRLabel;
    QRImage2: TQRImage;
    dbConexao: TADOConnection;
    QRMemo2: TQRMemo;
    QRMemo3: TQRMemo;
    QRMemo4: TQRMemo;
    QRMemo5: TQRMemo;
    QRMemo6: TQRMemo;
    QRMemo7: TQRMemo;
    QRMemo8: TQRMemo;
    QRMemo9: TQRMemo;
    QRMemo10: TQRMemo;
    QRMemo11: TQRMemo;
    QRMemo12: TQRMemo;
    QRMemo13: TQRMemo;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    fID: integer;
    function GetVlr(pFieldName: string): Extended;
  public
    { Public declarations }
  end;
var
  frmDanfeImpressao: TfrmDanfeImpressao;

implementation

{$R *.dfm}

procedure TfrmDanfeImpressao.FormCreate(Sender: TObject);
var
  vCount,
  vNrNF,
  vIdCliente,
  vIdTransportadora: integer;
  vVlr: Extended;
begin
  {$REGION 'Caso não tenha passado nenhum parâmetro, o sistema será encerrado.'}
  if (ParamCount = 0) then begin
    Application.Terminate;
    Exit;
  end;
  {$ENDREGION}

  {$REGION 'Verificando os parâmetros que foram passados'}
  fID := 0;
  for vCount := 0 to ParamCount do begin
    if (Copy(ParamStr(vCount),1,2) = 'ID') then begin
      fID := StrToInt(
                      Copy(ParamStr(vCount),
                           4,
                           Length(ParamStr(vCount))
                          )
                      );
    end;
  end;
  {$ENDREGION}

  {$REGION 'Se não for passado o parâmetro esperado, o sistema será encerrado.'}
  if ( fID = 0 ) then begin
    Application.Terminate;
    Exit;
  end;
  {$ENDREGION}

  {$REGION 'Imprimindo o DANFE'}
    dbConexao.Connected := True;  // Conectando ao banco de dados.
    {$REGION 'Verificando os dados da NFe'}
    dtsDados.Close;
    dtsDados.Parameters.Clear;
    dtsDados.CommandText := 'SELECT T.*, '+
                            '       R.* '+
                            '  FROM NFE_TRANSMITIR T '+
                            '       INNER JOIN NFE_RETORNO R '+
                            '             ON T.ID_NFE_TRANSMITIR = R.ID_NFE_TRANSMITIR '+
                            ' WHERE T.ID_NFE_TRANSMITIR = '+ IntToStr(fID);
    dtsDados.Open;
    vNrNF := dtsDados.FieldByName('NR_NF_INTERNO').AsInteger;
    qrlblNFeNumero.Caption := 'Nº ' + IntToStr(vNrNF);
    QRLabel13.Caption := qrlblNFeNumero.Caption;
    QRLabel17.Caption := dtsDados.FieldByName('NR_CHAVE_ACESSO').AsString;
    QRLabel29.Caption := dtsDados.FieldByName('NR_PROTOCOLO_AUTORIZACAO').AsString +' '+
                         dtsDados.FieldByName('DT_PROTOCOLO_AUTORIZACAO').AsString +' '+
                         dtsDados.FieldByName('HR_PROTOCOLO_AUTORIZACAO').AsString;
    {$ENDREGION}

    {$REGION 'Verificando os dados da nota.'}
    with dtsDados do begin
      Close;
      Parameters.Clear;
      CommandText := 'SELECT V.* '+
                     '  FROM NF_VENDAS V '+
                     ' WHERE V.NOTA = '+ IntToStr(vNrNF);
      Open;
      QRLabel27.Caption := FieldByName('NATUREZA').AsString;
      QRLabel42.Caption := Copy(FieldByName('EMISSAO').AsString, 1, 10);
      QRLabel46.Caption := QRLabel42.Caption;
      QRLabel60.Caption := TimeToStr(now);

      if ( FieldByName('FRETE').AsString = 'DESTINATARIO' ) then
        QRLabel89.Caption := '1-DESTINAT.'
      else
        QRLabel89.Caption := '0-EMITENTE';

      vIdCliente := FieldByName('CLIENTE').AsInteger;
      try
        vIdTransportadora := FieldByName('TRANSPORTADORA').AsInteger;
      except
        vIdTransportadora := 0;
      end;

      {$REGION 'Dados dos impostos.'}
      QRLabel64.Caption := FloatToStrF( GetVlr('BASE_ICMS'), ffNumber, 10, 2 );
      QRLabel66.Caption := FloatToStrF( GetVlr('VLR_ICMS'), ffNumber, 10, 2 );
      QRLabel68.Caption := FloatToStrF( GetVlr('BASE_CALC_IMCS_ST'), ffNumber, 10, 2 );
      QRLabel70.Caption := FloatToStrF( GetVlr('VLR_ICMS_ST'), ffNumber, 10, 2 );
      QRLabel72.Caption := FloatToStrF( GetVlr('VLR_PRODUTOS'), ffNumber, 10, 2 );
      QRLabel74.Caption := FloatToStrF( GetVlr('VLR_FRETE'), ffNumber, 10, 2 );
      QRLabel76.Caption := FloatToStrF( GetVlr('VLR_SEGURO'), ffNumber, 10, 2 );
      QRLabel78.Caption := FloatToStrF( 0, ffNumber, 10, 2 );
      QRLabel80.Caption := FloatToStrF( GetVlr('VLR_OUTROS'), ffNumber, 10, 2 );
      QRLabel82.Caption := FloatToStrF( GetVlr('VLR_IPI'), ffNumber, 10, 2 );

      // Calculando o total da nota.
      try
        vVlr := FieldByName('VLR_PRODUTOS').AsFloat +
                FieldByName('VLR_FRETE').AsFloat +
                FieldByName('VLR_SEGURO').AsFloat +
                FieldByName('VLR_OUTROS').AsFloat +
                FieldByName('VLR_IPI').AsFloat;
      except
        vVlr := 0;
      end;
      QRLabel84.Caption := FloatToStrF( vVlr, ffNumber, 10, 2 );
      {$ENDREGION}

      {$REGION 'Dados dos volumes'}
      QRLabel107.Caption := FieldByName('QUANTIDADE').AsString;
      QRLabel109.Caption := FieldByName('ESPECIE').AsString;
      QRLabel111.Caption := FieldByName('MARCA').AsString;
      QRLabel113.Caption := FieldByName('NUMERO').AsString;
      QRLabel115.Caption := FieldByName('PESO_BRUTO').AsString;
      QRLabel117.Caption := FieldByName('PESO_LIQUIDO').AsString;
      {$ENDREGION}
      Close;
    end;
    {$ENDREGION}

    {$REGION 'Verificando os dados do destinatário.'}
    with dtsDados do begin
      Close;
      Parameters.Clear;
      CommandText := 'SELECT C.* '+
                     '  FROM CADASTRO_CLIENTES C '+
                     ' WHERE C.CODIGO = '+ IntToStr(vIdCliente);
      Open;
      QRLabel38.Caption := FieldByName('RAZAO_SOCIAL').AsString;
      QRLabel40.Caption := FieldByName('CNPJ').AsString;
      QRLabel44.Caption := FieldByName('ENDERECO').AsString;
      QRLabel50.Caption := FieldByName('BAIRRO').AsString;
      QRLabel48.Caption := FieldByName('CEP').AsString;
      QRLabel52.Caption := FieldByName('CIDADE').AsString;
      QRLabel54.Caption := FieldByName('ESTADO').AsString;
      QRLabel56.Caption := FieldByName('FONE_1').AsString;
      QRLabel58.Caption := FieldByName('INSCRICAO').AsString;
      Close;
    end;    
    {$ENDREGION}

    {$REGION 'Verificando os dados das duplicatas.'}
    QRMemo1.Lines.Clear;
    with dtsDados do begin
      Close;
      Parameters.Clear;
      CommandText := 'SELECT V.* '+
                     '  FROM NF_VENDAS_VENCIMENTOS V '+
                     ' WHERE V.NOTA = '+ IntToStr(vNrNF);
      Open;
      while (not Eof) do begin
        QRMemo1.Lines.Text := QRMemo1.Lines.Text +
                              IntToStr(vNrNF) +'/'+
                              FieldByName('PARCELA').AsString +'  '+
                              FieldByName('VENCIMENTO').AsString +'  '+
                              FloatToStrF(FieldByName('VALOR').AsFloat, ffNumber, 10, 2) +
                              ' | ';
        Next;
      end;
      Close;
    end;
    {$ENDREGION}

    {$REGION 'Verificando os dados da transportadora.'}
      {$REGION 'Limpando os dados'}
      QRLabel87.Caption := '';
      QRLabel91.Caption := '';
      QRLabel93.Caption := '';
      QRLabel95.Caption := '';
      QRLabel97.Caption := '';
      QRLabel99.Caption := '';
      QRLabel101.Caption := '';
      QRLabel103.Caption := '';
      QRLabel105.Caption := '';
      {$ENDREGION}

      {$REGION 'Verificando os dados'}
      if ( vIdTransportadora > 0 ) then begin
        with dtsDados do begin
          Close;
          Parameters.Clear;
          CommandText := 'SELECT T.* '+
                         '  FROM CADASTRO_TRANSPORTADORAS T '+
                         ' WHERE T.CODIGO = '+ IntToStr(vIdTransportadora);
          Open;
          QRLabel87.Caption := FieldByName('RAZAO_SOCIAL').AsString;
          QRLabel97.Caption := FieldByName('CNPJ').AsString;
          QRLabel99.Caption := FieldByName('ENDERECO').AsString;
          QRLabel101.Caption := FieldByName('CIDADE').AsString;
          QRLabel103.Caption := FieldByName('ESTADO').AsString;
          QRLabel105.Caption := FieldByName('INSCRICAO').AsString;
          Close;
        end;
      end;
      {$ENDREGION}

    {$ENDREGION}

    {$REGION 'Imprimindo'}
    with dtsDados do begin
      Close;
      Parameters.Clear;
      CommandText := 'SELECT N.*'+
                     '  FROM NFE_TRANSMITIR N '+
                     ' WHERE N.ID_NFE_TRANSMITIR = '+ IntToStr(fID);
      Open;
    end;
    rptDANFE.PreviewModal;
    dtsDados.Close;
    {$ENDREGION}

    dbConexao.Connected := False;  // Desconectando do banco de dados.
  {$ENDREGION}

  Application.Terminate;  // Encerrando o sistema.
end;

function TfrmDanfeImpressao.GetVlr(pFieldName: string): Extended;
begin
  try
    Result := dtsDados.FieldByName(pFieldName).AsFloat;
  except
    Result := 0;
  end;
end;

end.
