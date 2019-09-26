unit relatorio_cli;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, Vcl.Grids, Vcl.DBGrids;

type
  TForm_clientes_apre = class(TForm)
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    ZQuery1: TZQuery;
    procedure FormActivate(Sender: TObject);
    procedure listar;
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_clientes_apre: TForm_clientes_apre;
  vlcelula:String;
implementation
           uses relatorio_clientes;
{$R *.dfm}
procedure TForm_clientes_apre.listar;
begin
   ZQuery1.Close;
   ZQuery1.SQL.Clear;
   ZQuery1.SQL.Add('select * from pessoafisica');
   ZQuery1.Open;
end;

procedure TForm_clientes_apre.DBGrid1DblClick(Sender: TObject);
begin
   vlcelula:= DBGrid1.SelectedField.AsString;
   if  Form_Relatoriocli = nil then
   Application.CreateForm(TForm_Relatoriocli,  Form_Relatoriocli);
   Form_Relatoriocli.ShowModal;
end;

procedure TForm_clientes_apre.FormActivate(Sender: TObject);
begin
listar;
end;

end.

