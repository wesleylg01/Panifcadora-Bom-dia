unit relatorio_for_apre;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, Vcl.Grids, Vcl.DBGrids;

type
  TForm_rela_forne = class(TForm)
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    ZQuery1: TZQuery;
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure listar;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_rela_forne: TForm_rela_forne;
  vlcelula:String;
implementation
      uses relatorio_fornecedores;
{$R *.dfm}
procedure TForm_rela_forne.listar;
begin
  ZQuery1.Close;
  ZQuery1.SQL.Clear;
  ZQuery1.SQL.Add('Select * from fornecedor');
  ZQuery1.Open;
end;
procedure TForm_rela_forne.DBGrid1DblClick(Sender: TObject);
begin
   vlcelula:= ZQuery1.Fields[0].AsString; //DBGrid1.SelectedField.AsString;
   if  Form_RelatorioFor = nil then
   Application.CreateForm(TForm_Relatoriofor,  Form_Relatoriofor);
   Form_Relatoriofor.ShowModal;
end;

procedure TForm_rela_forne.FormActivate(Sender: TObject);
begin
listar;
end;

end.
