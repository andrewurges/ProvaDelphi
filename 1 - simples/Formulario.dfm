object frmFormulario: TfrmFormulario
  Left = 0
  Top = 0
  Caption = 'Formul'#225'rio'
  ClientHeight = 193
  ClientWidth = 415
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lblFrase: TLabel
    Left = 32
    Top = 32
    Width = 31
    Height = 13
    Caption = 'Frase:'
  end
  object lblTextoAntigo: TLabel
    Left = 193
    Top = 59
    Width = 65
    Height = 13
    Caption = 'Texto antigo:'
  end
  object lblTextoNovo: TLabel
    Left = 199
    Top = 86
    Width = 59
    Height = 13
    Caption = 'Texto novo:'
  end
  object lblResultado: TLabel
    Left = 11
    Top = 144
    Width = 52
    Height = 13
    Caption = 'Resultado:'
  end
  object edtFrase: TEdit
    Left = 69
    Top = 29
    Width = 316
    Height = 21
    TabOrder = 0
  end
  object Button1: TButton
    Left = 310
    Top = 110
    Width = 75
    Height = 25
    Caption = 'Substituir'
    TabOrder = 3
    OnClick = Button1Click
  end
  object edtTextoAntigo: TEdit
    Left = 264
    Top = 56
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object edtTextoNovo: TEdit
    Left = 264
    Top = 83
    Width = 121
    Height = 21
    TabOrder = 2
  end
  object edtResultado: TEdit
    Left = 69
    Top = 141
    Width = 316
    Height = 21
    TabOrder = 4
  end
end
