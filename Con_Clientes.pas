unit Con_Clientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Mask, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.DBCtrls, Data.DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,Consulta_Produto,padocks,
  Vcl.ImgList;

type
  TForm_ConProduto = class(TForm);
  Tform_pesquisarpro = class (TForm);

  TForm_EditarPro = class(TForm)
    DBEdit1: TDBEdit;
    DataSource1: TDataSource;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label1: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    ZQuery1: TZQuery;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    ImageList1: TImageList;
    Button4: TButton;
    procedure FormActivate(Sender: TObject);
    procedure Listar;
    procedure Button3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_EditarPro: TForm_EditarPro;

implementation
     uses Buttons,Cad_Produto;
{$R *.dfm}

procedure TForm_EditarPro.Button1Click(Sender: TObject);
begin
if (Form_CadProduto=Nil) then Application.CreateForm(TForm_CadProduto, Form_CadProduto);
   Form_CadProduto.ShowModal;
   Form_EditarPro.Close;
   Form_ConProduto.Close;
end;

procedure TForm_EditarPro.Button2Click(Sender: TObject);
begin
vlcelula:= DBEdit3.Text;
ZQuery1.Post;
listar;
end;

procedure TForm_EditarPro.Button3Click(Sender: TObject);
begin
ZQuery1.Cancel;
end;

procedure TForm_EditarPro.Button4Click(Sender: TObject);
begin
if ZQuery1.RecordCount>0 then {verificar se tem registro}
begin
if Application.MessageBox('Tem certeza que deseja deletar este produto ? ','Aviso',MB_ICONQUESTION+mb_yesno)=idyes then
ZQuery1.delete;
Form_EditarPro.Close;
Form_ConProduto.Close;
end;
end;

procedure TForm_EditarPro.FormActivate(Sender: TObject);
begin
  listar;
end;
procedure TForm_EditarPro.Listar;
begin
  if teste = 'consulta_geral' then
    begin
     ZQuery1.Close;
     ZQuery1.SQL.Clear;
     ZQuery1.SQL.Add('Select * from produto Where ( EAN like "'+ vlcel +'")');
     ZQuery1.Open;
    end
    else
      begin
        ZQuery1.Close;
        ZQuery1.SQL.Clear;
        ZQuery1.SQL.Add('Select * from produto Where ( EAN like "'+ vlcelula +'")');
        ZQuery1.Open;
      end;
end;


end.
