unit Confornecedores;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.Mask;

type
  TForm_ConFornecedores = class(TForm)
    GroupBox1: TGroupBox;
    Label11: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    DBEdit7: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    GroupBox3: TGroupBox;
    Label4: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    GroupBox6: TGroupBox;
    Label15: TLabel;
    Label16: TLabel;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBNavigator1: TDBNavigator;
    DataSource1: TDataSource;
    Label10: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label12: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    ZQuery1: TZQuery;
    ZQuery1razao: TWideStringField;
    ZQuery1cnpj: TWideStringField;
    ZQuery1inscri: TWideStringField;
    ZQuery1TEL: TWideStringField;
    ZQuery1mail: TWideStringField;
    ZQuery1rua: TWideStringField;
    ZQuery1bairro: TWideStringField;
    ZQuery1num: TWideStringField;
    ZQuery1comple: TWideStringField;
    ZQuery1cidade: TWideStringField;
    ZQuery1cep: TWideStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_ConFornecedores: TForm_ConFornecedores;

implementation

{$R *.dfm}

end.
