unit teste;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ImgList, Vcl.Menus,principal;

type
  TForm_entracx = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Edit_suple: TEdit;
    Label2: TLabel;
    Button1: TButton;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Edit_san: TEdit;
    Label4: TLabel;
    Button2: TButton;
    Button3: TButton;
    Button5: TButton;
    Button6: TButton;
    MainMenu1: TMainMenu;
    Sair1: TMenuItem;
    ImageList1: TImageList;
    Button4: TButton;
    procedure Sair1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Edit_supleKeyPress(Sender: TObject; var Key: Char);
    procedure Edit_sanKeyPress(Sender: TObject; var Key: Char);
    procedure Button4Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Edit_supleExit(Sender: TObject);
    procedure Edit_sanExit(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public


  end;

var
  Form_entracx: TForm_entracx;
  suplemento,totalcx,totalsuple,totalsan,totaldincx:Real;
  sair, totalcompras:Integer;
  abriucx,fechoucx :String;
  sairvenda:boolean;
implementation
             uses caixa,fechar_caixa,relatorio_san, relatorio_caixa;
{$R *.dfm}

procedure TForm_entracx.Button1Click(Sender: TObject);
begin
  suplemento:= StrtoFloat (Edit_suple.Text);
  totalsuple := totalsuple + suplemento;
  Edit_suple.Clear;

end;

procedure TForm_entracx.Button2Click(Sender: TObject);
var
san:Real;
begin
san := StrtoFloat (Edit_san.Text);
Edit_san.Clear;
if totalcx >= san then
begin
totalsan:= totalsan + san;
ShowMessage('Sangria Efetuada com Sucesso valor ' + FormatFloat('#,##0.00', totalsan));
totalcx := totalcx - totalsan;
end
else
 begin
  ShowMessage('ERRO: Valor Invalido, voc� n�o tem esse valor em Caixa !!');
  totalsan := 0;
 end;

end;

procedure TForm_entracx.Button3Click(Sender: TObject);
begin
entrar_pdv := true;
sairvenda := true;
sair := 0;
if abriucx = '' then
abriucx:= FormatDateTime('hh:nn',now)
else
abriucx := abriucx;

 if (Form_pdv=Nil) then Application.CreateForm(TForm_pdv, Form_pdv);
   Form_pdv.ShowModal;
end;

procedure TForm_entracx.Button4Click(Sender: TObject);
begin
sair := 0;
   if (Form_relatoriocx=Nil) then Application.CreateForm(TForm_relatoriocx, Form_relatoriocx);
   Form_relatoriocx.ShowModal;
end;

procedure TForm_entracx.Button5Click(Sender: TObject);
begin
sairvenda:= false;
fechoucx:= FormatDateTime('hh:nn',now);
button5.Enabled:= false;
Button1.Enabled:= false;
Button2.Enabled:= false;
Edit_suple.Enabled:= false;
Edit_san.Enabled:= false;
sair := 0;
  Button3.Enabled:= false;
   if (Form_fecharcx=Nil) then Application.CreateForm(TForm_fecharcx, Form_fecharcx);
   Form_fecharcx.ShowModal;
end;

procedure TForm_entracx.Button6Click(Sender: TObject);
begin
sair := 0;
   if (Form_relatoriosan=Nil) then Application.CreateForm(TForm_relatoriosan, Form_relatoriosan);
   Form_relatoriosan.ShowModal;
end;

procedure TForm_entracx.Edit_sanExit(Sender: TObject);
begin
sair := 0;
end;

procedure TForm_entracx.Edit_sanKeyPress(Sender: TObject; var Key: Char);
begin
if Edit_san.Text <> '' then
   sair := sair + 1
   else sair := 0;
end;

procedure TForm_entracx.Edit_supleExit(Sender: TObject);
begin
  sair:= 0;
end;

procedure TForm_entracx.Edit_supleKeyPress(Sender: TObject; var Key: Char);
begin
if Edit_suple.Text <> '' then
    sair:= sair +1
   else
    sair := 0;
end;

procedure TForm_entracx.FormCreate(Sender: TObject);
begin
sair:= 0;
end;

procedure TForm_entracx.Sair1Click(Sender: TObject);
begin
  if sair = 0 then
  if ((Edit_suple.Text = '')  and (Edit_san.Text = '' ))then
  begin
    if application.MessageBox('Deseja Realmente Sair ?' , 'Aten��o' , mb_iconquestion + mb_yesno )= id_yes
     then
      Form_entracx.close;
    end
  else
  showmessage ('ERRO: Termine as transa��es para sair !!');
    end;


end.
