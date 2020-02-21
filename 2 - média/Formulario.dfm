object frmFormulario: TfrmFormulario
  Left = 0
  Top = 0
  Caption = 'Formul'#225'rio'
  ClientHeight = 287
  ClientWidth = 318
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lblTroco: TLabel
    Left = 35
    Top = 27
    Width = 31
    Height = 13
    Caption = 'Troco:'
  end
  object lblResultado: TLabel
    Left = 14
    Top = 85
    Width = 52
    Height = 13
    Caption = 'Resultado:'
  end
  object edtTroco: TEdit
    Left = 72
    Top = 24
    Width = 209
    Height = 21
    TabOrder = 0
  end
  object mmLista: TMemo
    Left = 72
    Top = 82
    Width = 209
    Height = 177
    TabOrder = 1
  end
  object btnCalcular: TButton
    Left = 206
    Top = 51
    Width = 75
    Height = 25
    Caption = 'Calcular'
    TabOrder = 2
    OnClick = btnCalcularClick
  end
end
