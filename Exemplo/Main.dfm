object MainForm: TMainForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Demo - DTMaskEdit'
  ClientHeight = 92
  ClientWidth = 306
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object lblStatus: TLabel
    Left = 12
    Top = 67
    Width = 12
    Height = 13
    Caption = '...'
  end
  object Label1: TLabel
    Left = 12
    Top = 16
    Width = 25
    Height = 13
    Caption = 'CNPJ'
  end
  object Label2: TLabel
    Left = 170
    Top = 16
    Width = 19
    Height = 13
    Caption = 'Cep'
  end
  object DTMaskedit1: TDTMaskedit
    Left = 12
    Top = 31
    Width = 142
    Height = 21
    EditMask = '99.999.999/9999-99;0'
    MaxLength = 18
    TabOrder = 0
    Text = ''
    ColorInvalido = 12895487
    ColorValido = 14286809
    EditType = etCNPJ
    OnValidate = DTMaskedit1Validate
  end
  object DTMaskedit2: TDTMaskedit
    Left = 170
    Top = 31
    Width = 113
    Height = 21
    EditMask = '99.999-999;0'
    MaxLength = 10
    TabOrder = 1
    Text = ''
    ColorInvalido = 12895487
    ColorValido = 14286809
    EditType = etCEP
  end
end
