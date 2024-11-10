object FRSupply: TFRSupply
  Left = 0
  Top = 0
  Caption = 'Relat'#243'rio de Abastecimentos'
  ClientHeight = 801
  ClientWidth = 938
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesktopCenter
  TextHeight = 15
  object RSupply: TRLReport
    Left = 64
    Top = 16
    Width = 794
    Height = 1123
    DataSource = DM.DSRelAbastecimento
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    object BHeader: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 32
      BandType = btHeader
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
      Borders.FixedBottom = True
      object RLSystemInfo1: TRLSystemInfo
        Left = 8
        Top = 8
        Width = 39
        Height = 16
        Text = ''
      end
      object RLSystemInfo2: TRLSystemInfo
        Left = 676
        Top = 8
        Width = 39
        Height = 16
        Alignment = taRightJustify
        Info = itHour
        Text = ''
      end
      object RLLabel1: TRLLabel
        Left = 326
        Top = 8
        Width = 66
        Height = 16
        Caption = 'PostoABC'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object BTitle: TRLBand
      Left = 38
      Top = 70
      Width = 718
      Height = 45
      BandType = btTitle
      object RLLabel2: TRLLabel
        Left = 0
        Top = 6
        Width = 718
        Height = 39
        Align = faClientBottom
        Alignment = taCenter
        Caption = 'RELAT'#211'RIO DE ABASTECIMENTOS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -20
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel9: TRLLabel
        Left = 0
        Top = 0
        Width = 718
        Height = 9
        Align = faClientTop
        Caption = ' '
      end
    end
    object BGroup: TRLGroup
      Left = 38
      Top = 115
      Width = 718
      Height = 120
      DataFields = 'DATA_ABASTECIMENTO'
      object BHGroup: TRLBand
        Left = 0
        Top = 0
        Width = 718
        Height = 33
        BandType = btHeader
        Color = 13880775
        ParentColor = False
        Transparent = False
        object RLLabel3: TRLLabel
          Left = 0
          Top = 9
          Width = 135
          Height = 16
          Caption = 'Data Abastecimento:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
        object RLDBText1: TRLDBText
          Left = 147
          Top = 9
          Width = 155
          Height = 16
          DataField = 'DATA_ABASTECIMENTO'
          DataSource = DM.DSRelAbastecimento
          Text = ''
          Transparent = False
        end
      end
      object BGroupFuel: TRLGroup
        Left = 0
        Top = 33
        Width = 718
        Height = 80
        DataFields = 'TIPO_COMBUSTIVEL'
        object BDetail: TRLBand
          Left = 0
          Top = 50
          Width = 718
          Height = 23
          object RLDBText2: TRLDBText
            Left = 16
            Top = 3
            Width = 177
            Height = 16
            DataField = 'FRENTISTA'
            DataSource = DM.DSRelAbastecimento
            Text = ''
          end
          object RLDBText3: TRLDBText
            Left = 200
            Top = 2
            Width = 116
            Height = 16
            DataField = 'BOMBA_NUMERO'
            DataSource = DM.DSRelAbastecimento
            Text = ''
          end
          object RLDBText4: TRLDBText
            Left = 322
            Top = 2
            Width = 87
            Height = 16
            Alignment = taCenter
            DataField = 'QUANT_TOTAL_LITROS'
            DataSource = DM.DSRelAbastecimento
            Text = ''
          end
          object RLDBText5: TRLDBText
            Left = 422
            Top = 3
            Width = 94
            Height = 16
            Alignment = taRightJustify
            DataField = 'RS_TOTAL_BRUTO'
            DataSource = DM.DSRelAbastecimento
            Text = ''
          end
          object RLDBText6: TRLDBText
            Left = 607
            Top = 2
            Width = 110
            Height = 16
            Alignment = taRightJustify
            DataField = 'RS_TOTAL_LIQUIDO'
            DataSource = DM.DSRelAbastecimento
            Text = ''
          end
          object RLDBText7: TRLDBText
            Left = 530
            Top = 2
            Width = 63
            Height = 16
            Alignment = taCenter
            DataField = 'IMPOSTO'
            DataSource = DM.DSRelAbastecimento
            DisplayMask = '#,##0.00'
            Text = ''
          end
        end
        object BTHeader: TRLBand
          Left = 0
          Top = 0
          Width = 718
          Height = 50
          BandType = btColumnHeader
          Borders.Sides = sdCustom
          Borders.DrawLeft = False
          Borders.DrawTop = False
          Borders.DrawRight = False
          Borders.DrawBottom = True
          object RLLabel4: TRLLabel
            Left = 16
            Top = 30
            Width = 59
            Height = 16
            Caption = 'Frentista'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
          end
          object RLLabel5: TRLLabel
            Left = 200
            Top = 30
            Width = 49
            Height = 16
            Caption = 'Bomba'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
          end
          object RLLabel6: TRLLabel
            Left = 330
            Top = 30
            Width = 70
            Height = 16
            Caption = 'Quant. (Lt)'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
          end
          object RLLabel7: TRLLabel
            Left = 422
            Top = 30
            Width = 94
            Height = 16
            Caption = 'Total Bruto R$'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
          end
          object RLLabel8: TRLLabel
            Left = 607
            Top = 30
            Width = 108
            Height = 16
            Caption = 'Total L'#237'quido R$'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
          end
          object RLLabel11: TRLLabel
            Left = 524
            Top = 30
            Width = 74
            Height = 16
            Caption = 'Imposto R$'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
          end
          object RLLabel14: TRLLabel
            Left = 16
            Top = 8
            Width = 86
            Height = 16
            Caption = 'Combust'#237'vel:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
          end
          object RLDBText8: TRLDBText
            Left = 108
            Top = 8
            Width = 141
            Height = 16
            DataField = 'TIPO_COMBUSTIVEL'
            DataSource = DM.DSRelAbastecimento
            Text = ''
          end
        end
      end
    end
    object BFooter: TRLBand
      Left = 38
      Top = 353
      Width = 718
      Height = 32
      BandType = btFooter
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = True
      Borders.DrawRight = False
      Borders.DrawBottom = False
    end
    object BSumary: TRLBand
      Left = 38
      Top = 235
      Width = 718
      Height = 118
      BandType = btSummary
      object RLDraw1: TRLDraw
        Left = 422
        Top = 12
        Width = 293
        Height = 93
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = False
      end
      object RLLabel10: TRLLabel
        Left = 491
        Top = 73
        Width = 73
        Height = 19
        Caption = 'Total R$:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLDBResult1: TRLDBResult
        Left = 570
        Top = 72
        Width = 139
        Height = 19
        Alignment = taRightJustify
        DataField = 'RS_TOTAL_LIQUIDO'
        DataSource = DM.DSRelAbastecimento
        DisplayMask = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Info = riSum
        ParentFont = False
        Text = ''
      end
      object RLLabel12: TRLLabel
        Left = 437
        Top = 48
        Width = 127
        Height = 18
        Caption = 'Total Imposto R$:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLDBResult2: TRLDBResult
        Left = 570
        Top = 47
        Width = 139
        Height = 18
        Alignment = taRightJustify
        DataField = 'IMPOSTO'
        DataSource = DM.DSRelAbastecimento
        DisplayMask = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Info = riSum
        ParentFont = False
        Text = ''
      end
      object RLLabel13: TRLLabel
        Left = 453
        Top = 24
        Width = 111
        Height = 18
        Caption = 'Total Bruto R$:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLDBResult3: TRLDBResult
        Left = 570
        Top = 23
        Width = 139
        Height = 18
        Alignment = taRightJustify
        DataField = 'RS_TOTAL_BRUTO'
        DataSource = DM.DSRelAbastecimento
        DisplayMask = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Info = riSum
        ParentFont = False
        Text = ''
      end
    end
  end
end
