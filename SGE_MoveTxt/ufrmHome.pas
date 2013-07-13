unit ufrmHome;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, WideStrings, DB, SqlExpr, FMTBcd, ShellApi;

type
  TfrmHome = class(TForm)
    lblInformativo1: TLabel;
    ConexaoDatabase: TSQLConnection;
    DtsUltimaNota: TSQLDataSet;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    function StrZeros(Value: string; QtdZeros: Integer): string;
  public
    { Public declarations }
  end;

var
  frmHome: TfrmHome;

implementation

{$R *.dfm}

procedure TfrmHome.FormCreate(Sender: TObject);
var
  _numero_ultima_nfe: Integer;
  _nome_arquivo_origem: string;
  _nome_arquivo_destino: string;
  _arq: TextFile;
begin
  {$REGION 'Verificando se existe arquivo para mover'}
  try
    try
      ConexaoDatabase.Connected := True;
      DtsUltimaNota.Open;
      _numero_ultima_nfe := DtsUltimaNota.FieldByName('UltimaNotaFiscal').AsInteger;
      DtsUltimaNota.Close;
      _nome_arquivo_origem := 'N:\NF' + StrZeros(IntToStr(_numero_ultima_nfe - 1),5) + '-NFE.TXT';
      _nome_arquivo_destino := 'C:\NFE\TXT\NF' + StrZeros(IntToStr(_numero_ultima_nfe - 1),5) + '-NFE.TXT';
      if FileExists(_nome_arquivo_origem) then begin
        ShellExecute(Handle, nil, 'copiar.bat', PAnsiChar(_nome_arquivo_origem), 'C:\NFE\servico\', 0); 
        if FileExists(_nome_arquivo_destino) then
          DeleteFile(_nome_arquivo_origem);
      end;
    except
      on e: Exception do begin
        AssignFile(_arq, 'c:\NFE\servico\logErro.txt');
        Rewrite(_arq);
        Writeln(_arq, e.Message);
        CloseFile(_arq);
        Exit;
      end;
    end;
  finally
    if ( ConexaoDatabase.Connected ) then
      ConexaoDatabase.Connected := False;
    Application.Terminate;
  end;
  {$ENDREGION}
end;

function TfrmHome.StrZeros(Value: string; QtdZeros: Integer): string;
var
  _diferenca: Integer;
  _i: Integer;
begin
  Result := '';
  _diferenca := QtdZeros - Length(Value);
  for _I := 1 to _diferenca do
    Result := Result + '0';

  Result := Result + Value;
end;

end.
