program DanfeImpressao;

uses
  Forms,
  ufrmDanfeImpressao in 'ufrmDanfeImpressao.pas' {frmDanfeImpressao};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmDanfeImpressao, frmDanfeImpressao);
  Application.Run;
end.
