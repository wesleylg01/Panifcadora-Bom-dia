unit relatorio_fornecedores;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, Vcl.ImgList, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids,relatorio_for_apre;

type
  TForm_rela_forne = class(TForm);
  TForm_relatorioFor = class(TForm)
    ZQuery1: TZQuery;
    DataSource1: TDataSource;
    Button2: TButton;
    ImageList1: TImageList;
    Memo1: TMemo;
    Button1: TButton;
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
  Form_relatorioFor: TForm_relatorioFor;

implementation
        uses Cad_cidade,Printers;
{$R *.dfm}

procedure TForm_relatorioFor.listar;
begin
   ZQuery1.Close;
   ZQuery1.SQL.Clear;
   ZQuery1.SQL.Add('Select * from fornecedor Where ( id like "'+ vlcelula +'")');
   ZQuery1.Open;
end;

procedure TForm_relatorioFor.Button1Click(Sender: TObject);
begin
Form_relatorioFor.Close;
end;

procedure TForm_relatorioFor.Button2Click(Sender: TObject);
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


procedure TForm_relatorioFor.FormActivate(Sender: TObject);
var
nome,rg,cpf,rua,num,comple,bairro,cidade,cep,tel,email:String;
begin
listar;
//pegando dados no banco de dados
rg:= ZQuery1.FieldbyName('INSCRI').value;
cpf:= ZQuery1.FieldbyName('CNPJ').value;
rua:= ZQuery1.FieldbyName('RUA').value;
num:= ZQuery1.FieldbyName('NUM').value;
comple:= ZQuery1.FieldbyName('COMPLE').value;
bairro:= ZQuery1.FieldbyName('BAIRRO').value;
cidade:= ZQuery1.FieldbyName('CIDADE').value;
cep:= ZQuery1.FieldbyName('CEP').value;
tel:= ZQuery1.FieldbyName('TEL').value;
email:= ZQuery1.FieldbyName('MAIL').value;
//pegando o nome da variavel vlcelula pois � o mesmo nome que sera usado e assim fica mais rapido
nome:= vlcelula;
//------------------------------------------------------------------------------
memo1.Clear;
//Montando relatorio
memo1.lines.add ('');
memo1.lines.add ('');
memo1.lines.add ('');
Memo1.Font.size := 10;
memo1.lines.add ('                                                          '+nome);
memo1.lines.add ('');
memo1.lines.add ('');
memo1.lines.add ('');
memo1.lines.add ('');
Memo1.Lines.Add('           RG: '+rg +'                                                 Cpf : '+ cpf);
memo1.lines.add ('');
memo1.lines.add ('');
memo1.lines.add ('');
Memo1.Lines.Add('           Email : '+ email +'                                Telefone : ' + tel );
memo1.lines.add ('');
memo1.lines.add ('');
memo1.lines.add ('');
memo1.lines.add ('');
memo1.lines.add ('                                                              Endere�o');
memo1.lines.add ('');
memo1.lines.add ('');
memo1.lines.add ('');
memo1.lines.add ('');
Memo1.Lines.Add('         ' + rua +'                    n� '+num + '  Complemento: '+comple);
memo1.lines.add ('');
memo1.lines.add ('');
memo1.lines.add ('');
Memo1.Lines.Add('         Bairro: '+ bairro+'    Cidade: ' + cidade + '   CEP: ' + cep );
end;


end.
