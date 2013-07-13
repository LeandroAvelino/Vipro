program SGE_MoveTxt;

uses
  Forms,
  ufrmHome in 'ufrmHome.pas' {frmHome};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmHome, frmHome);
  Application.Run;
end.
