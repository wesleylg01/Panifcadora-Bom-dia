object Form_ConFornecedores: TForm_ConFornecedores
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Consultar / Aletrar Fornecedores'
  ClientHeight = 486
  ClientWidth = 696
  Color = clActiveCaption
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label10: TLabel
    Left = 366
    Top = 447
    Width = 42
    Height = 18
    Caption = 'Novo*'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object Label1: TLabel
    Left = 446
    Top = 447
    Width = 51
    Height = 18
    Caption = 'Deletar'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 525
    Top = 447
    Width = 44
    Height = 18
    Caption = 'Salvar'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 119
    Top = 447
    Width = 55
    Height = 18
    Caption = 'Anterior'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object Label12: TLabel
    Left = 592
    Top = 447
    Width = 63
    Height = 18
    Caption = 'Cancelar'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object Label17: TLabel
    Left = 195
    Top = 447
    Width = 58
    Height = 18
    Caption = 'Pr'#243'ximo'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object Label18: TLabel
    Left = 38
    Top = 447
    Width = 60
    Height = 18
    Caption = 'Primeiro'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object Label19: TLabel
    Left = 284
    Top = 447
    Width = 44
    Height = 18
    Caption = 'Ultimo'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object GroupBox1: TGroupBox
    Left = 22
    Top = 232
    Width = 640
    Height = 145
    Caption = '  Endere'#231'o  '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object Label11: TLabel
      Left = 42
      Top = 24
      Width = 22
      Height = 13
      Caption = 'Rua'
    end
    object Label5: TLabel
      Left = 323
      Top = 24
      Width = 44
      Height = 13
      Caption = 'Numero'
    end
    object Label6: TLabel
      Left = 442
      Top = 24
      Width = 79
      Height = 13
      Caption = 'Complemento'
    end
    object Label7: TLabel
      Left = 42
      Top = 84
      Width = 34
      Height = 13
      Caption = 'Bairro'
    end
    object Label8: TLabel
      Left = 323
      Top = 81
      Width = 38
      Height = 13
      Caption = 'Cidade'
    end
    object Label9: TLabel
      Left = 519
      Top = 84
      Width = 20
      Height = 13
      Caption = 'CEP'
    end
    object DBEdit7: TDBEdit
      Left = 42
      Top = 43
      Width = 239
      Height = 21
      DataField = 'rua'
      DataSource = DataSource1
      TabOrder = 0
    end
    object DBEdit6: TDBEdit
      Left = 323
      Top = 43
      Width = 44
      Height = 21
      DataField = 'num'
      DataSource = DataSource1
      TabOrder = 1
    end
    object DBEdit8: TDBEdit
      Left = 442
      Top = 43
      Width = 151
      Height = 21
      DataField = 'comple'
      DataSource = DataSource1
      TabOrder = 2
    end
    object DBEdit9: TDBEdit
      Left = 42
      Top = 103
      Width = 239
      Height = 21
      DataField = 'bairro'
      DataSource = DataSource1
      TabOrder = 3
    end
    object DBEdit10: TDBEdit
      Left = 323
      Top = 103
      Width = 166
      Height = 21
      DataField = 'cidade'
      DataSource = DataSource1
      TabOrder = 4
    end
    object DBEdit11: TDBEdit
      Left = 516
      Top = 103
      Width = 77
      Height = 21
      DataField = 'cep'
      DataSource = DataSource1
      TabOrder = 5
    end
  end
  object GroupBox3: TGroupBox
    Left = 22
    Top = 27
    Width = 267
    Height = 185
    Caption = '   Dados  '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    object Label4: TLabel
      Left = 32
      Top = 26
      Width = 115
      Height = 13
      Caption = 'Nome / Raz'#227'o Social'
    end
    object Label13: TLabel
      Left = 32
      Top = 72
      Width = 59
      Height = 13
      Caption = 'CPF / CNPJ'
    end
    object Label14: TLabel
      Left = 32
      Top = 123
      Width = 90
      Height = 13
      Caption = 'RG / INSCRI'#199#195'O'
    end
    object DBEdit1: TDBEdit
      Left = 32
      Top = 45
      Width = 169
      Height = 21
      DataField = 'razao'
      DataSource = DataSource1
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 32
      Top = 91
      Width = 121
      Height = 21
      DataField = 'cnpj'
      DataSource = DataSource1
      TabOrder = 1
    end
    object DBEdit3: TDBEdit
      Left = 32
      Top = 142
      Width = 121
      Height = 21
      DataField = 'inscri'
      DataSource = DataSource1
      TabOrder = 2
    end
  end
  object GroupBox6: TGroupBox
    Left = 372
    Top = 27
    Width = 290
    Height = 185
    Caption = '   Contato   '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    object Label15: TLabel
      Left = 48
      Top = 45
      Width = 78
      Height = 13
      Caption = 'Celular / Fone'
    end
    object Label16: TLabel
      Left = 48
      Top = 109
      Width = 30
      Height = 13
      Caption = 'Email'
    end
    object DBEdit4: TDBEdit
      Left = 48
      Top = 69
      Width = 153
      Height = 21
      DataField = 'TEL'
      DataSource = DataSource1
      TabOrder = 0
    end
    object DBEdit5: TDBEdit
      Left = 48
      Top = 128
      Width = 153
      Height = 21
      DataField = 'mail'
      DataSource = DataSource1
      TabOrder = 1
    end
  end
  object DBNavigator1: TDBNavigator
    Left = 22
    Top = 399
    Width = 640
    Height = 42
    DataSource = DataSource1
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel]
    Kind = dbnHorizontal
    TabOrder = 3
  end
  object DataSource1: TDataSource
    DataSet = ZQuery1
    Left = 16
    Top = 272
  end
  object ZQuery1: TZQuery
    Connection = DM.ZConnection1
    Active = True
    SQL.Strings = (
      'select * from fornecedor')
    Params = <>
    Left = 8
    Top = 224
    object ZQuery1razao: TWideStringField
      FieldName = 'razao'
      Required = True
      Size = 40
    end
    object ZQuery1cnpj: TWideStringField
      FieldName = 'cnpj'
      Required = True
      Size = 14
    end
    object ZQuery1inscri: TWideStringField
      FieldName = 'inscri'
      Required = True
      Size = 9
    end
    object ZQuery1TEL: TWideStringField
      FieldName = 'TEL'
      Required = True
      Size = 14
    end
    object ZQuery1mail: TWideStringField
      FieldName = 'mail'
      Required = True
      Size = 40
    end
    object ZQuery1rua: TWideStringField
      FieldName = 'rua'
      Required = True
      Size = 40
    end
    object ZQuery1bairro: TWideStringField
      FieldName = 'bairro'
      Required = True
      Size = 40
    end
    object ZQuery1num: TWideStringField
      FieldName = 'num'
      Required = True
      Size = 40
    end
    object ZQuery1comple: TWideStringField
      FieldName = 'comple'
      Size = 40
    end
    object ZQuery1cidade: TWideStringField
      FieldName = 'cidade'
      Required = True
      Size = 40
    end
    object ZQuery1cep: TWideStringField
      FieldName = 'cep'
      Size = 9
    end
  end
end
