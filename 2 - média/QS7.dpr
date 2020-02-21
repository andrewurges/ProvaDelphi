program QS7;

uses
  Vcl.Forms,
  uTroco in 'uTroco.pas',
  uIMaquina in 'uIMaquina.pas',
  uMaquina in 'uMaquina.pas',
  Formulario in 'Formulario.pas' {frmFormulario};

{$R *.RES}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmFormulario, frmFormulario);
  Application.Run;
end.

