unit Login;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Mask, Vcl.Imaging.jpeg,
  Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Menus, Vcl.ImgList, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  TForm_Login = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Image1: TImage;
    MaskEdit1: TMaskEdit;
    Button1: TButton;
    Button2: TButton;
    Panel2: TPanel;
    Panel1: TPanel;
    ImageList1: TImageList;
    MainMenu1: TMainMenu;
    Sair1: TMenuItem;
    Label3: TLabel;
    Timer1: TTimer;
    ZQuery1: TZQuery;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure MaskEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure Timer1Timer(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    PROCEDURE LISTAR;
    procedure usuarios;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_Login: TForm_Login;
  login_banco,senha_banco,usuario,nomecomple:String;
implementation

{$R *.dfm}

uses Principal;
procedure TForm_Login.LISTAR;
BEGIN
  ZQuery1.Close;
  ZQuery1.SQL.Clear;
  ZQuery1.SQL.Add('SELECT * FROM usuarios');
  ZQuery1.Open;
END;
procedure TForm_Login.usuarios;
BEGIN
  ZQuery1.Close;
  ZQuery1.SQL.Clear;
  ZQuery1.SQL.Add('SELECT * FROM usuarios  Where (login like "'+ Edit1.Text +'")');
  ZQuery1.Open;
  if ((ZQuery1.FieldbyName('LOGIN').value = null) or (ZQuery1.FieldByName('condicao').Value = 'Desativado')) then
  begin
   application.MessageBox ('ERRO 003 - Usuario não cadastrado, ou Desativado','ERRO 003',MB_ICONWARNING);
  end
  else
  begin
  nomecomple := ZQuery1.FieldByName('NOME').Value;
  login_banco:= ZQuery1.FieldbyName('LOGIN').value;
  senha_banco:= ZQuery1.FieldbyName('SENHA').value;
  end;
END;
procedure TForm_Login.Button1Click(Sender: TObject);
var
login,senha:String;
begin
usuarios;
// recendo dados do edtis
login:= Edit1.Text;
senha:= MaskEdit1.Text;

if ( login = login_banco) and ( senha = senha_banco)
         then
         begin
         usuario:= login;
         close;
         end
     else
     if application.MessageBox('Erro 002 - Nome de usuário ou senha inválidos, Tente novamente' , 'Atenção ' , MB_ICONWARNING + mb_yesno )= id_no
         then
         //Application.Terminate;
         Edit1.Clear;
         MaskEdit1.Clear;
         edit1.SetFocus;
     end;
procedure TForm_Login.Button2Click(Sender: TObject);
begin
Edit1.Clear;
Maskedit1.Clear;
edit1.SetFocus;
end;

procedure TForm_Login.FormActivate(Sender: TObject);
begin
Label3.Caption := FormatDateTime('DD/MM/YYYY  |  hh:nn',now);
ZQuery1.Close;

end;

procedure TForm_Login.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Action:= cafree;
Form_Login:= nil;
Edit1.SetFocus;
end;

procedure TForm_Login.MaskEdit1KeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then
   Button1.Click;
end;

procedure TForm_Login.Sair1Click(Sender: TObject);
begin
if application.MessageBox('Sair' , 'Atenção' , mb_iconquestion + mb_yesno )= id_yes
then Application.Terminate;
end;

procedure TForm_Login.Timer1Timer(Sender: TObject);
begin
      Label3.Caption := FormatDateTime('DD/MM/YYYY  |  hh:nn',now);

end;

end.
