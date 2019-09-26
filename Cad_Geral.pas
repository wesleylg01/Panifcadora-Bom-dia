unit Cad_Geral;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask,IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, xmldom, XMLIntf, msxmldom,
  XMLDoc, Vcl.ImgList, Data.DB, ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  TForm_Cadgeral = class(TForm)
    GroupBox3: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    GroupBox6: TGroupBox;
    Edit_fone: TEdit;
    IdHTTP1: TIdHTTP;
    XMLDocument1: TXMLDocument;
    Label7: TLabel;
    Label14: TLabel;
    Edit_mail: TEdit;
    ZQuery1: TZQuery;
    DataSource1: TDataSource;
    Edit_FisicaNome: TEdit;
    Edit_Fisicacpf: TEdit;
    edit_pessoafisicarg: TEdit;
    ImageList1: TImageList;
    GroupBox5: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Edit_rua: TEdit;
    edit_num: TEdit;
    Edit_comple: TEdit;
    Edit_bairro: TEdit;
    Edit_cid: TEdit;
    MaskEdit_cep: TMaskEdit;
    Button4: TButton;
    Button6: TButton;
    Button7: TButton;
    ZQuery2: TZQuery;
    procedure RadioButton_FisicaClick(Sender: TObject);
    procedure MaskEdit_cepExit(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure salvar;
    procedure testar_duplicidade;

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_Cadgeral: TForm_Cadgeral;

implementation

{$R *.dfm}
procedure TForm_Cadgeral.testar_duplicidade;
begin
  ZQuery2.Close;
  ZQuery2.SQL.Clear;
  ZQuery2.SQL.Add('select * from pessoafisica where (cpf like "'+Edit_Fisicacpf.text+'")');
  ZQuery2.Open;

  if ZQuery2.FieldByName('cpf').Value = Edit_Fisicacpf.text then
  begin
  application.MessageBox('ERRO 005 - Este CPF ja est� cadastrado','ERRO - 005', MB_ICONWARNING);
  Edit_Fisicacpf.Text;
  end
  else
   application.MessageBox (' O CLIENTE FOI CADASTRADO COM SUCESSO !', 'PRODUTO CADASTRADO' , MB_ICONINFORMATION);
  salvar;
end;
procedure TForm_Cadgeral.salvar;
begin
 ZQuery1.Close;
ZQuery1.SQL.Clear;
ZQuery1.SQL.Add('insert into pessoafisica(nome,cpf,rg,tel,email,rua,num,comple,cep,bairro,cidade)values(:nome, :cpf, :rg,:tel,:email,:rua,:num,:comple,:cep,:bairro,:cidade)');
ZQuery1.ParamByName('nome').AsString:= Edit_FisicaNome.Text;
ZQuery1.ParamByName('cpf').AsString:= Edit_FisicaCPF.Text;
ZQuery1.ParamByName('tel').AsString:= Edit_fone.Text;
ZQuery1.ParamByName('rg').AsString:= edit_pessoafisicarg.Text;
ZQuery1.ParamByName('email').AsString:= Edit_mail.Text;
ZQuery1.ParamByName('rua').AsString:= Edit_rua.Text;
ZQuery1.ParamByName('num').AsString:= Edit_num.Text;
ZQuery1.ParamByName('comple').AsString:= Edit_comple.Text;
ZQuery1.ParamByName('cep').AsString:= MaskEdit_cep.Text;
ZQuery1.ParamByName('bairro').AsString:= Edit_bairro.Text;
ZQuery1.ParamByName('cidade').AsString:= Edit_cid.Text;
ZQuery1.ExecSQL;

//Limpando campos
Edit_FisicaNome.Clear;
Edit_FisicaCPF.Clear;
Edit_pessoaFisicaRG.Clear;
Edit_rua.Clear;
edit_num.Clear;
Edit_comple.Clear;
Edit_bairro.Clear;
Edit_fone.Clear;
Edit_mail.Clear;
MaskEdit_cep.Clear;
Edit_cid.Clear;
end;

procedure TForm_Cadgeral.Button4Click(Sender: TObject);
var
cpf:String;
begin
   if (Edit_FisicaNome.text = '') then
    begin
   showmessage ('Erro 001 - Preencha o campo Nome (Fisica)');
   Edit_FisicaNome.SetFocus;
   end;

   if (Edit_FisicaCPF.text = '') then
    begin
   showmessage ('Erro 001 - Preencha o campo CPF');
   Edit_FisicaNome.SetFocus;
   end;

   if (edit_pessoafisicarg.text = '') then
    begin
   showmessage ('Erro 001 - Preencha o campo Rg');
   Edit_FisicaNome.SetFocus;
   end;

   if (edit_pessoafisicarg.text = '') then
    begin
   showmessage ('Erro 001 - Preencha o campo Rg');
   Edit_FisicaNome.SetFocus;
   end;


   if (edit_num.text = '') then
    begin
   showmessage ('Erro 001 - Preencha o campo Numero');
   Edit_FisicaNome.SetFocus;
   end
   else
   testar_duplicidade;
end;

procedure TForm_Cadgeral.Button6Click(Sender: TObject);
begin
//Limpando dados da pessoa fisica
Edit_FisicaNome.Clear;
Edit_FisicaCPF.Clear;
Edit_pessoaFisicaRG.Clear;
//----------------------------------------------
Edit_rua.Clear;
edit_num.Clear;
Edit_comple.Clear;
Edit_bairro.Clear;
Edit_fone.Clear;
Edit_mail.Clear;
MaskEdit_cep.Clear;
Edit_cid.Clear;

end;

procedure TForm_Cadgeral.Button7Click(Sender: TObject);
begin
Form_CadGeral.Close;
end;

procedure TForm_Cadgeral.MaskEdit_cepExit(Sender: TObject);
var Consulta: String;
    TSConsulta: TStringList;
    Resposta: TStringStream;
begin
try
 if (MaskEdit_cep.Text = '     -   ') or (Length(MaskEdit_cep.Text) < 9) or  (Length(MaskEdit_cep.Text) > 9) then
     begin
        Application.MessageBox('CEP nulo ou inv�lido.', 'Erro - Aviso do Sistema', mb_iconwarning+mb_ok);
        exit;
     end;
     Resposta   := TStringStream.Create('');
     TSConsulta := TStringList.Create;
     IdHTTP1.Request.UserAgent:='Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV2';
     TSConsulta.Add('cep=' + MaskEdit_cep.Text);
     TSConsulta.Add('formato=xml');

     IdHTTP1.Post('http://cep.republicavirtual.com.br/web_cep.php?', TSConsulta, Resposta);
     XMLDocument1.Active := True;
     XMLDocument1.Encoding := 'iso-8859-1';
     XMLDocument1.LoadFromStream(Resposta);

     Edit_bairro.Text:= XMLDocument1.DocumentElement.ChildNodes['bairro'].NodeValue;
     Edit_rua.Text:= XMLDocument1.DocumentElement.ChildNodes['tipo_logradouro'].NodeValue+': '+XMLDocument1.DocumentElement.ChildNodes['logradouro'].NodeValue;

     Edit_cid.Text:= XMLDocument1.DocumentElement.ChildNodes['cidade'].NodeValue+' / '+XMLDocument1.DocumentElement.ChildNodes['uf'].NodeValue;
     TSConsulta.Free;
     Resposta.Free;
     XMLDocument1.Active := False;
     edit_num.SetFocus;
except
Application.MessageBox('CEP n�o encontrado, favor inserir dados manualmente', 'Aten��o.', MB_ICONWARNING+MB_OK);

 end;
end;

procedure TForm_Cadgeral.RadioButton_FisicaClick(Sender: TObject);
begin

Edit_FisicaNome.SetFocus;
end;

end.
