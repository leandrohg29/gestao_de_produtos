object DM: TDM
  OldCreateOrder = False
  Height = 212
  Width = 364
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=C:\ARECO\Dados\BD_ARECO.GDB'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'DriverID=FB')
    Connected = True
    LoginPrompt = False
    Left = 72
    Top = 48
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 232
    Top = 48
  end
  object QRY_PRODUTOS: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'Select * from produtos'
      'Order by ID')
    Left = 232
    Top = 128
    object QRY_PRODUTOSID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QRY_PRODUTOSNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 50
    end
    object QRY_PRODUTOSQUANTIDADE: TIntegerField
      FieldName = 'QUANTIDADE'
      Origin = 'QUANTIDADE'
    end
    object QRY_PRODUTOSMARCA: TStringField
      FieldName = 'MARCA'
      Origin = 'MARCA'
      Size = 50
    end
    object QRY_PRODUTOSVALOR: TStringField
      FieldName = 'VALOR'
      Origin = 'VALOR'
      Size = 50
    end
  end
  object DS1: TDataSource
    DataSet = QRY_PRODUTOS
    Left = 72
    Top = 128
  end
end
