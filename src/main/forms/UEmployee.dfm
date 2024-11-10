object FEmployee: TFEmployee
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'PostoABC - Cadastro de Funcion'#225'rios'
  ClientHeight = 201
  ClientWidth = 879
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
    Width = 49
    Height = 21
    Caption = 'Nome:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI Semibold'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object edtName: TEdit
    Left = 40
    Top = 61
    Width = 785
    Height = 29
    CharCase = ecUpperCase
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    MaxLength = 120
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
      Left = 3
      OnClick = FRCRUD1btnSaveClick
      ExplicitLeft = 3
    end
    inherited btnCancel: TBitBtn
      Left = 131
      OnClick = FRCRUD1btnCancelClick
      ExplicitLeft = 131
    end
  end
end
