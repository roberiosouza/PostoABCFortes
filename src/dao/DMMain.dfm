object DM: TDM
  Height = 714
  Width = 990
  object FDCon: TFDConnection
    Params.Strings = (
      
        'Database=C:\Users\admin\Documents\DelphiProjects\PostoABC\databa' +
        'se\DATABASE.FDB'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'DriverID=FB')
    LoginPrompt = False
    Left = 32
    Top = 16
  end
  object FDTransaction: TFDTransaction
    Connection = FDCon
    Left = 97
    Top = 16
  end
  object QueryRelAbastecimento: TFDQuery
    AutoCalcFields = False
    Connection = FDCon
    SQL.Strings = (
      ' select'
      '       ab.id as cod_abastecimento,'
      '       ab.data_abastecimento,'
      '       f.nome as frentista,'
      '       t.tipo_combustivel,'
      '       b.numero as bomba_numero,'
      '       ab.quant_total_litros,'
      '       ((ab.perc_imposto/100) * ab.rs_total_bruto) as imposto,'
      '       ab.rs_total_bruto,'
      '       ab.rs_total_liquido'
      ' '
      ' from TBABASTECIMENTO as ab'
      ' join TBFUNCIONARIO as f on (f.id = ab.frentista_id)'
      ' join TBBOMBA as b on (b.id = ab.bomba_id)'
      ' join TBTANQUE as t on (t.id = b.tanque_id)'
      ' where ab.status = '#39'S'#39
      ' order by ab.data_abastecimento, t.tipo_combustivel, f.nome desc')
    Left = 64
    Top = 136
    object QueryRelAbastecimentoCOD_ABASTECIMENTO: TIntegerField
      FieldName = 'COD_ABASTECIMENTO'
      Origin = 'ID'
      Required = True
    end
    object QueryRelAbastecimentoDATA_ABASTECIMENTO: TDateField
      FieldName = 'DATA_ABASTECIMENTO'
      Origin = 'DATA_ABASTECIMENTO'
      Required = True
    end
    object QueryRelAbastecimentoFRENTISTA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'FRENTISTA'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 120
    end
    object QueryRelAbastecimentoBOMBA_NUMERO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'BOMBA_NUMERO'
      Origin = 'NUMERO'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object QueryRelAbastecimentoQUANT_TOTAL_LITROS: TIntegerField
      FieldName = 'QUANT_TOTAL_LITROS'
      Origin = 'QUANT_TOTAL_LITROS'
      Required = True
      DisplayFormat = '#,##0.00'
    end
    object QueryRelAbastecimentoIMPOSTO: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'IMPOSTO'
      Origin = 'IMPOSTO'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = '#,##0.00'
      Precision = 18
    end
    object QueryRelAbastecimentoRS_TOTAL_BRUTO: TFMTBCDField
      FieldName = 'RS_TOTAL_BRUTO'
      Origin = 'RS_TOTAL_BRUTO'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object QueryRelAbastecimentoRS_TOTAL_LIQUIDO: TFMTBCDField
      FieldName = 'RS_TOTAL_LIQUIDO'
      Origin = 'RS_TOTAL_LIQUIDO'
      Required = True
      DisplayFormat = '#,#0.00'
      Precision = 18
      Size = 2
    end
    object QueryRelAbastecimentoTIPO_COMBUSTIVEL: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'TIPO_COMBUSTIVEL'
      Origin = 'TIPO_COMBUSTIVEL'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
  end
  object DSRelAbastecimento: TDataSource
    DataSet = QueryRelAbastecimento
    Left = 184
    Top = 136
  end
end
