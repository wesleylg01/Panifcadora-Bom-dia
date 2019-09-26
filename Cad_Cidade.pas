unit Cad_Cidade;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBLookup, Vcl.Mask,
  Vcl.DBCtrls, Data.DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  Vcl.ExtCtrls,Fornecedores, Vcl.ImgList;

type
  TForm_fornecedore = class(TForm);
  TDBNewNavigator = class(TDBNavigator);
  TForm_AlterarFornecedores = class(TForm)
    GroupBox3: TGroupBox;
    Label4: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DataSource1: TDataSource;
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
    GroupBox6: TGroupBox;
    Label15: TLabel;
    Label16: TLabel;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
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
    ZQuery1ID: TIntegerField;
    DBEdit12: TDBEdit;
    Label20: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    ImageList1: TImageList;
    procedure FormActivate(Sender: TObject);
    procedure listar;
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_AlterarFornecedores: TForm_AlterarFornecedores;

implementation
       uses Buttons, Trasacao;
{$R *.dfm}

procedure TForm_AlterarFornecedores.Button1Click(Sender: TObject);
begin
   if Form_CadFornecedores = nil then
   Application.CreateForm(TForm_CadFornecedores, Form_CadFornecedores);
   Form_CadFornecedores.ShowModal;
end;

procedure TForm_AlterarFornecedores.Button2Click(Sender: TObject);
begin
vlcelula:= DBEdit1.Text;
ZQuery1.Post;
listar;
end;

procedure TForm_AlterarFornecedores.Button3Click(Sender: TObject);
begin
ZQuery1.Cancel;
end;

procedure TForm_AlterarFornecedores.Button4Click(Sender: TObject);
begin
if ZQuery1.RecordCount>0 then {verificar se tem registro}
begin
if Application.MessageBox('Tem certeza que deseja deletar este Fornecedor ? ','Aviso',MB_ICONQUESTION+mb_yesno)=idyes then
ZQuery1.delete;
Form_AlterarFornecedores.close;
Form_fornecedore.Close;
end;
end;

procedure TForm_AlterarFornecedores.FormActivate(Sender: TObject);
begin
listar;
end;

procedure TForm_AlterarFornecedores.listar;
begin
  ZQuery1.Close;
  ZQuery1.SQL.Clear;
   ZQuery1.SQL.Add('Select * from fornecedor Where ( id like "'+ vlcelula +'")');
  ZQuery1.Open;
end;

end.
