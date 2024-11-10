object FSupply: TFSupply
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'PostoABC - Abastecimento'
  ClientHeight = 240
  ClientWidth = 1014
  Color = 15524304
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  TextHeight = 21
  object Label1: TLabel
    Left = 32
    Top = 26
    Width = 152
    Height = 21
    Caption = 'Data Abastecimento:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI Semibold'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 208
    Top = 26
    Width = 67
    Height = 21
    Caption = 'Frentista:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI Semibold'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 596
    Top = 26
    Width = 56
    Height = 21
    Caption = 'Bomba:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI Semibold'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 32
    Top = 96
    Width = 97
    Height = 21
    Caption = 'Quant. Litros:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI Semibold'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 280
    Top = 96
    Width = 89
    Height = 21
    Caption = 'Imposto(%):'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI Semibold'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label6: TLabel
    Left = 528
    Top = 95
    Width = 65
    Height = 21
    Caption = ' Litro R$:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI Semibold'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label7: TLabel
    Left = 776
    Top = 89
    Width = 83
    Height = 28
    Caption = 'Total R$ :'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Segoe UI Semibold'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object edtMaskDate: TMaskEdit
    Left = 32
    Top = 48
    Width = 152
    Height = 29
    EditMask = '##/##/####;1;_'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    MaxLength = 10
    ParentFont = False
    TabOrder = 0
    Text = '  /  /    '
  end
  object cbEmployee: TComboBox
    Left = 208
    Top = 48
    Width = 365
    Height = 29
    Style = csDropDownList
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object cbPump: TComboBox
    Left = 596
    Top = 48
    Width = 365
    Height = 29
    Style = csDropDownList
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnChange = cbPumpChange
  end
  object edtQuantLiters: TEdit
    Left = 32
    Top = 117
    Width = 185
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
    Text = '0,00'
    OnExit = edtQuantLitersExit
    OnKeyPress = edtQuantLitersKeyPress
  end
  object pnlPercImpost: TPanel
    Left = 280
    Top = 117
    Width = 185
    Height = 29
    BorderWidth = 2
    BorderStyle = bsSingle
    Caption = '0,00'
    Color = 15524304
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 4
  end
  object pnlPriceCurrentLiter: TPanel
    Left = 528
    Top = 116
    Width = 185
    Height = 29
    BorderWidth = 2
    BorderStyle = bsSingle
    Caption = '0,00'
    Color = 15524304
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 5
  end
  object pnlTotal: TPanel
    Left = 776
    Top = 116
    Width = 185
    Height = 45
    BorderWidth = 2
    BorderStyle = bsSingle
    Caption = '0,00'
    Color = 15524304
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -20
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 6
  end
  inline FRCRUD1: TFRCRUD
    Left = 22
    Top = 167
    Width = 257
    Height = 65
    Color = 15524304
    ParentBackground = False
    ParentColor = False
    TabOrder = 7
    ExplicitLeft = 22
    ExplicitTop = 167
    inherited btnSave: TBitBtn
      OnClick = FRCRUD1btnSaveClick
    end
    inherited btnCancel: TBitBtn
      OnClick = FRCRUD1btnCancelClick
    end
  end
end
