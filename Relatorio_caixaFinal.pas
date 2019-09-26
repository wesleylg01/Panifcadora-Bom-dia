unit Relatorio_caixaFinal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset,Relatorio_caixa_apre,
  Vcl.ImgList;

type
TForm_Form_relatiocx1 = class (TForm);
  TForm_RelatorioCaixa = class(TForm)
    Memo1: TMemo;
    ZQuery1: TZQuery;
    Button1: TButton;
    Button2: TButton;
    ImageList1: TImageList;
    procedure FormActivate(Sender: TObject);
    procedure listar;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_RelatorioCaixa: TForm_RelatorioCaixa;

implementation
        uses Printers;
{$R *.dfm}
procedure TForm_RelatorioCaixa.listar;
begin
ZQuery1.Close;
ZQuery1.SQL.Clear;
ZQuery1.SQL.Add('Select * from caixa Where ( NOME like "'+ vlcelula +'")');
ZQuery1.Open;
end;

procedure TForm_RelatorioCaixa.Button1Click(Sender: TObject);
begin
Form_RelatorioCaixa.Close;
end;

procedure TForm_RelatorioCaixa.Button2Click(Sender: TObject);
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

procedure TForm_RelatorioCaixa.FormActivate(Sender: TObject);
var
nome,tlcompras,tlsan,tlsuple,saldo,tlvendido,ab,fx,situ,user:String;
begin
listar;
//pegando dados no banco de dados
tlcompras:= ZQuery1.FieldbyName('TOTALCOMPRAS').value;
tlsan:= ZQuery1.FieldbyName('TOTALSAN').value;
tlsuple:= ZQuery1.FieldbyName('TOTALSUPLE').value;
saldo:= ZQuery1.FieldbyName('SALDOFINAL').value;
tlvendido:= ZQuery1.FieldbyName('TOTALVENDIDO').value;
ab:= ZQuery1.FieldbyName('ABRIUCX').value;
fx:= ZQuery1.FieldbyName('FECHOUCX').value;
situ:= ZQuery1.FieldbyName('SITUFINAL').value;
user := ZQuery1.FieldByName('usuario').value;
//pegando o nome da variavel vlcelula pois é o mesmo nome que sera usado e assim fica mais rapido
nome:= vlcelula;
//------------------------------------------------------------------------------
memo1.Clear;
//Montando relatorio
memo1.lines.add ('');
memo1.lines.add ('');
memo1.lines.add ('');
Memo1.Font.size := 10;
memo1.lines.add ('                                                   Relatório De Caixa  -  '+nome);
memo1.lines.add ('');
memo1.lines.add ('');
memo1.lines.add ('');
memo1.lines.add ('');
Memo1.Lines.Add('            Usuario: '+user+'                                                 Total de Compras Efetuadas : '+ tlcompras);
memo1.lines.add ('');
memo1.lines.add ('');
memo1.lines.add ('');
Memo1.Lines.Add('           Valor Total de Sangrias : '+ tlsan + ' R$                           Valor Total de Suplemento : ' + tlsuple + ' R$');
memo1.lines.add ('');
memo1.lines.add ('');
memo1.lines.add ('');
Memo1.Lines.Add('           Saldo do Caixa ' + saldo +' R$                                          '+ situ);
memo1.lines.add ('');
memo1.lines.add ('');
memo1.lines.add ('');
Memo1.Lines.Add('           Valor Total Vendido pelo Caixa : ' + tlvendido + ' R$              Caixa em Funcionamento de ' + ab +'   há  '+ fx);

end;

end.
