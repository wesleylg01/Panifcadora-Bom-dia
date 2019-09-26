object Form_fornecedore: TForm_fornecedore
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Fornecedores'
  ClientHeight = 386
  ClientWidth = 348
  Color = clActiveCaption
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 26
    Top = 8
    Width = 295
    Height = 361
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    Columns = <
      item
        Color = clMenuBar
        Expanded = False
        FieldName = 'ID'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Title.Caption = 'C'#243'digo'
        Width = 40
        Visible = True
      end
      item
        Color = clMenuBar
        Expanded = False
        FieldName = 'razao'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        Title.Caption = 'Raz'#227'o Social'
        Width = 220
        Visible = True
      end>
  end
  object ZQuery1: TZQuery
    Connection = DM.ZConnection1
    SQL.Strings = (
      'select * from fornecedor')
    Params = <>
    Left = 8
    Top = 224
  end
  object DataSource1: TDataSource
    DataSet = ZQuery1
    Left = 8
    Top = 280
  end
end
