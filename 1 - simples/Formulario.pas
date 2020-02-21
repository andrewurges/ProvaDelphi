unit Formulario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmFormulario = class(TForm)
    edtFrase: TEdit;
    Button1: TButton;
    lblFrase: TLabel;
    edtTextoAntigo: TEdit;
    edtTextoNovo: TEdit;
    lblTextoAntigo: TLabel;
    lblTextoNovo: TLabel;
    edtResultado: TEdit;
    lblResultado: TLabel;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFormulario: TfrmFormulario;

implementation

uses
  uISubstitui, uSubstitui;

{$R *.dfm}

procedure TfrmFormulario.Button1Click(Sender: TObject);
var
  vSubstituir: ISubstitui;
begin
  vSubstituir := TSubstitui.Create;
  edtResultado.Text := vSubstituir.Substituir(edtFrase.Text, edtTextoAntigo.Text, edtTextoNovo.Text);
end;

end.
