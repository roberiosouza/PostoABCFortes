object FConfig: TFConfig
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'PostoABC - Configura'#231#245'es'
  ClientHeight = 186
  ClientWidth = 362
  Color = 15524304
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  TextHeight = 15
  object Label1: TLabel
    Left = 52
    Top = 40
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
  object edtPercImpost: TEdit
    Left = 52
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
    Left = 52
    Top = 96
    Width = 257
    Height = 65
    Color = 15524304
    ParentBackground = False
    ParentColor = False
    TabOrder = 1
    ExplicitLeft = 52
    ExplicitTop = 96
    inherited btnSave: TBitBtn
      OnClick = FRCRUD1btnSaveClick
    end
    inherited btnCancel: TBitBtn
      OnClick = FRCRUD1btnCancelClick
    end
  end
end
