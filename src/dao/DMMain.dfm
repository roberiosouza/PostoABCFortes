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
end
