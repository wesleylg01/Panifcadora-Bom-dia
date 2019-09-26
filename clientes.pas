unit clientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.DBCtrls,
  Vcl.StdCtrls;

type
 TDBNewNavigator = class (TDBNavigator);
  TForm_Clientes = class(TForm)
    DBGrid1: TDBGrid;
    ZQuery1: TZQuery;
    DataSource1: TDataSource;
    procedure DBGrid1DblClick(Sender: TObject);
    procedure listar;
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_Clientes: TForm_Clientes;
  B: TNavigateBtn;
  vlcelula:String;
implementation
 uses  Buttons, alterar_clientes;
{$R *.dfm}

procedure TForm_Clientes.DBGrid1DblClick(Sender: TObject);
begin
vlcelula:= DBGrid1.SelectedField.AsString;
   if  Form_ConsultaClientes = nil then
   Application.CreateForm(TForm_ConsultaClientes, Form_ConsultaClientes);
    Form_ConsultaClientes.ShowModal;
end;


procedure TForm_Clientes.FormActivate(Sender: TObject);
begin
Listar;
end;

procedure TForm_Clientes.listar;
begin
ZQuery1.Close;
ZQuery1.SQL.Clear;
ZQuery1.SQL.Add('select * from pessoafisica');
ZQuery1.Open;
end;

end.
