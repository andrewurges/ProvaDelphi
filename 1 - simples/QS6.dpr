program QS6;

uses
  Vcl.Forms,
  uISubstitui in 'uISubstitui.pas',
  uSubstitui in 'uSubstitui.pas',
  Formulario in 'Formulario.pas' {frmFormulario};

{$R *.RES}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmFormulario, frmFormulario);
  Application.Run;
end.

