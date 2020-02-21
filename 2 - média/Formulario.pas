unit Formulario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmFormulario = class(TForm)
    edtTroco: TEdit;
    mmLista: TMemo;
    btnCalcular: TButton;
    lblTroco: TLabel;
    lblResultado: TLabel;
    procedure btnCalcularClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFormulario: TfrmFormulario;

implementation

uses
  uIMaquina, uMaquina, uTroco;

{$R *.dfm}

procedure TfrmFormulario.btnCalcularClick(Sender: TObject);
var
  vMaquina: IMaquina;
  vListaTroco: TList;
  vQuantidade, I: Integer;
  vValor: Double;
begin
  vMaquina := TMaquina.Create;
  vListaTroco := vMaquina.MontarTroco(StrToFloat(edtTroco.Text));
  mmLista.Lines.Clear;

  for I := 0 to vListaTroco.Count - 1 do
  begin
    vQuantidade := TTroco(vListaTroco.Items[I]).Quantidade;
    vValor := CValorCedula[TTroco(vListaTroco.Items[I]).Tipo];

    if vValor < 1 then
    begin
      mmLista.Lines.Add(IntToStr(vQuantidade) + ' moeda de ' + FloatToStr(vValor));
    end
    else
    begin
      mmLista.Lines.Add(IntToStr(vQuantidade) + ' nota de ' + FloatToStr(vValor));
    end;
  end;
end;

end.
