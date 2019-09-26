unit Relatorio_caixa_apre;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.DBGrids, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  TForm_relatiocx1 = class(TForm)
    ZQuery1: TZQuery;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure listar;
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_relatiocx1: TForm_relatiocx1;
  vlcelula:String;
implementation
    uses Relatorio_caixaFinal;
{$R *.dfm}

procedure TForm_relatiocx1.listar;
begin
ZQuery1.Close;
ZQuery1.SQL.Clear;
ZQuery1.SQL.Add('select * from caixa');
ZQuery1.Open;
end;
procedure TForm_relatiocx1.DBGrid1DblClick(Sender: TObject);
begin
vlcelula:= DBGrid1.SelectedField.AsString;
   if  Form_RelatorioCaixa = nil then
   Application.CreateForm(TForm_RelatorioCaixa,  Form_RelatorioCaixa);
    Form_RelatorioCaixa.ShowModal;
end;

procedure TForm_relatiocx1.FormCreate(Sender: TObject);
begin
 listar;
end;
end.
