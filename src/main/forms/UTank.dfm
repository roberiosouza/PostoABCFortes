object FTank: TFTank
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'PostoABC - Cadastro de Tanques'
  ClientHeight = 188
  ClientWidth = 872
  Color = 15524304
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesktopCenter
  OnClose = FormClose
  TextHeight = 15
  object Label1: TLabel
    Left = 40
    Top = 40
    Width = 64
    Height = 21
    Caption = 'N'#250'mero:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI Semibold'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 316
    Top = 40
    Width = 132
    Height = 21
    Caption = 'Tipo Combust'#237'vel:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI Semibold'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 560
    Top = 40
    Width = 157
    Height = 21
    Caption = 'Capacidade de Litros:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI Semibold'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object edtNumber: TEdit
    Left = 40
    Top = 61
    Width = 257
    Height = 29
    CharCase = ecUpperCase
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    MaxLength = 15
    ParentFont = False
    TabOrder = 0
  end
  inline FRCRUD1: TFRCRUD
    Left = 40
    Top = 96
    Width = 257
    Height = 65
    Color = 15524304
    ParentBackground = False
    ParentColor = False
    TabOrder = 1
    ExplicitLeft = 40
    ExplicitTop = 96
    inherited btnSave: TBitBtn
      OnClick = FRCRUD1btnSaveClick
    end
    inherited btnCancel: TBitBtn
      OnClick = FRCRUD1btnCancelClick
    end
  end
  object cbTypeFuel: TComboBox
    Left = 316
    Top = 61
    Width = 225
    Height = 29
    Style = csDropDownList
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    Items.Strings = (
      'GASOLINA'
      'DIESEL')
  end
  object edtQuantLiters: TEdit
    Left = 560
    Top = 61
    Width = 257
    Height = 29
    CharCase = ecUpperCase
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    MaxLength = 15
    ParentFont = False
    TabOrder = 3
  end
end
