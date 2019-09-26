unit Relatorio_caixa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,teste, Vcl.ImgList, Vcl.ExtCtrls,
  Vcl.StdCtrls;

type
  TForm_entracx = class (TForm);
  TForm_relatoriocx = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    Button2: TButton;
    Timer1: TTimer;
    ImageList1: TImageList;
    procedure FormActivate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_relatoriocx: TForm_relatoriocx;
  hora:String;
implementation
          uses Printers;
{$R *.dfm}

procedure TForm_relatoriocx.Button1Click(Sender: TObject);
var
  I: integer;
  F: TextFile;
begin
  { Usa na impressora a mesma fonte do memo }
  Printer.Canvas.Font.Assign(Memo1.Font);

  AssignPrn(F);
  Rewrite(F);
  try
    for I := 0 to Memo1.Lines.Count -1 do
      WriteLn(F, Memo1.Lines[I]);
  finally
    CloseFile(F);
  end;
end;

procedure TForm_relatoriocx.Button2Click(Sender: TObject);
begin
Form_relatoriocx.Close;
end;

procedure TForm_relatoriocx.FormActivate(Sender: TObject);
begin
hora := FormatDateTime('DD/MM/YYYY  |  hh:nn',now);
memo1.lines.add ('=======      Relatório De Caixa     ======');
memo1.lines.add ('');
memo1.lines.add ('');
Memo1.Lines.Add('Valor Total de Suplementos : '+ FormatFloat('##,##0.00', totalsuple));
memo1.lines.add ('');
memo1.lines.add ('');
memo1.lines.add ('');
Memo1.Lines.Add('Valor Total de Sangrias : '+ FormatFloat('##,##0.00', totalsan));
memo1.lines.add ('');
memo1.lines.add ('');
memo1.lines.add ('');
Memo1.Lines.Add('Total de Compras Realizadas : ' + (InttoStr (totalcompras)));
memo1.lines.add ('');
memo1.lines.add ('');
memo1.lines.add ('');
Memo1.Lines.Add('Valor Total Vendido : '+ FormatFloat('##,##0.00', totaldincx));
memo1.lines.add ('');
memo1.lines.add ('');
memo1.lines.add ('');
Memo1.Lines.Add('=============  ' + hora);
Memo1.Lines.Add('============================');
end;

end.
