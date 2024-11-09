object FEmployee: TFEmployee
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'PostoABC - Cadastro Funcion'#225'rios'
  ClientHeight = 201
  ClientWidth = 879
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesktopCenter
  OnClose = FormClose
  TextHeight = 15
  inline FRCRUD1: TFRCRUD
    Left = 0
    Top = 0
    Width = 879
    Height = 201
    Align = alClient
    Color = 15524304
    ParentBackground = False
    ParentColor = False
    TabOrder = 0
    ExplicitLeft = 11
    ExplicitTop = -29
    inherited Label1: TLabel
      StyleElements = [seFont, seClient, seBorder]
    end
    inherited edtNameDescription: TEdit
      MaxLength = 120
      StyleElements = [seFont, seClient, seBorder]
    end
    inherited btnSave: TBitBtn
      OnClick = FRCRUD1btnSaveClick
    end
    inherited btnCancel: TBitBtn
      OnClick = FRCRUD1btnCancelClick
    end
  end
end
