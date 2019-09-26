unit relatorio_cli_apre;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, Vcl.Grids, Vcl.DBGrids;

type
  TForm_Cliente = class(TForm)
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    ZQuery1: TZQuery;
    procedure DBGrid1DblClick(Sender: TObject);
    procedure listar;
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_Cliente: TForm_Cliente;
  vlcelula:String;
implementation
 uses relatorio_clientes;
{$R *.dfm}
procedure TForm_Cliente.FormActivate(Sender: TObject);
begin
//listar;
end;

procedure TForm_Cliente.listar;
begin
   {ZQuery1.Close;
   ZQuery1.SQL.Clear;
   ZQuery1.SQL.Add('select * from pessoafisica');
   ZQuery1.Open;}
end;

procedure TForm_Cliente.DBGrid1DblClick(Sender: TObject);
begin
  // vlcelula:= DBGrid1.SelectedField.AsString;
   if  Form_Relatoriocli = nil then
   Application.CreateForm(TForm_Relatoriocli,  Form_Relatoriocli);
   Form_Relatoriocli.ShowModal;
end;

end.
