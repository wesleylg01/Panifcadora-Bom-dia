unit ralatorio_produto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, Vcl.ImgList, Vcl.StdCtrls,
   ShellAPI, Vcl.ComCtrls;

type
  TForm_RelatorioPro = class(TForm)
    DataSource1: TDataSource;
    ImageList1: TImageList;
    ZQuery1: TZQuery;
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    procedure Button3Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure listar;
  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  Form_RelatorioPro: TForm_RelatorioPro;

implementation
       uses Con_Clientes;
{$R *.dfm}

procedure TForm_RelatorioPro.Button3Click(Sender: TObject);
begin
   if Form_EditarPro = nil then
   Application.CreateForm(TForm_EditarPro, Form_EditarPro);
   Form_EditarPro.ShowModal;
   Form_RelatorioPro.Close;
end;

procedure TForm_RelatorioPro.FormActivate(Sender: TObject);
begin
listar;
end;
procedure TForm_RelatorioPro.listar;
var
a:Integer;
begin
  ZQuery1.Close;
  ZQuery1.SQL.Clear;
 a:= ZQuery1.SQL.Add('SELECT COUNT(*) FROM produto');
  ZQuery1.Open;
  label2.Caption:= IntToStr (a);
end;
end.
