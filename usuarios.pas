unit usuarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ImgList, Vcl.StdCtrls, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, Vcl.Grids, Vcl.DBGrids;

type
  TForm_usuarios = class(TForm)
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    ZQuery1: TZQuery;
    Button1: TButton;
    ImageList1: TImageList;
    procedure Button1Click(Sender: TObject);
    procedure listar;
    procedure FormActivate(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_usuarios: TForm_usuarios;
  vlcelula:String;
implementation
        uses Alt_usuario;
{$R *.dfm}
procedure TForm_usuarios.DBGrid1DblClick(Sender: TObject);
begin
   vlcelula:= DBGrid1.SelectedField.AsString;
   if  Form_alt_usuario = nil then
   Application.CreateForm(TForm_alt_usuario,  Form_alt_usuario);
   Form_alt_usuario.ShowModal;
end;

procedure TForm_usuarios.FormActivate(Sender: TObject);
begin
listar;
end;

procedure TForm_usuarios.listar;
begin
  ZQuery1.Close;
  ZQuery1.sql.clear;
  ZQuery1.SQL.Add('Select * from usuarios');
  ZQuery1.Open;
end;
procedure TForm_usuarios.Button1Click(Sender: TObject);
begin
Form_usuarios.Close;
end;

end.
