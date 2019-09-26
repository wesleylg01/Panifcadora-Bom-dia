unit fechar_caixa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,teste, Vcl.ImgList, Vcl.StdCtrls,
  Vcl.Menus, Data.DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,login,
  Vcl.ExtCtrls;

type
  TForm_login = class (Tform);
  Tform_Form_entracx = class (TForm);
  TForm_fecharcx = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label_suple: TLabel;
    Label_caixa: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    ImageList1: TImageList;
    Label_saldo: TLabel;
    Label_final: TLabel;
    Label7: TLabel;
    Label_situ: TLabel;
    MainMenu1: TMainMenu;
    Sair1: TMenuItem;
    ZQuery1: TZQuery;
    Timer1: TTimer;
    ZQuery2: TZQuery;
    procedure Button4Click(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure Edit2Enter(Sender: TObject);
    procedure Edit1Enter(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure listar;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_fecharcx: TForm_fecharcx;
  totalfimcx:Real;
  supleok: Boolean;
  sair: integer;
  data:String;
implementation
           uses Relatorio_caixa;
{$R *.dfm}

procedure TForm_fecharcx.Button1Click(Sender: TObject);
var
saldo:Real;
situ:String;
begin
 //recendo saldo do caixa
 saldo := (StrToFloat(Edit2.Text) - totalcx);
  if saldo >= 0 then
  begin
   Label_saldo.Visible := true;
   Label_final.Font.Color := clGreen;
   label_final.Caption := FormatFloat('#,##0.00', saldo);
   Label_situ.Visible := true;
   Label_situ.Font.Color := clGreen;
   Label_situ.Caption := 'Caixa Positivo';
   //desativando o botao cancelar, botao finalizar e os edits
   Button1.Enabled := false;
   Button2.Enabled := false;
   Edit1.Enabled := false;
   edit2.Enabled := false;
   // zerando variavel de controle
   sair := 0;
  end
   else
  begin
   Label_saldo.Visible := true;
   Label_final.Font.Color := clMaroon;
   label_final.Caption := FormatFloat('#,##0.00', saldo);
   Label_situ.Visible := true;
   Label_situ.Font.Color := clMaroon;
   Label_situ.Caption := 'Caixa Negativo';
   //desativando o botao cancelar, finalizar e od edits
   Button1.Enabled := false;
   Button2.Enabled := false;
   // zerando variavel de controle
   sair := 0;

  end;
      //Recebendo Usuario
        ZQuery2.Close;
        ZQuery2.SQL.Clear;
        ZQuery2.SQL.Add('Select * from usuarios Where (nome like "'+ usuario +'")');
        ZQuery2.Open;
     //Cadastrando no Banco de Dados
      situ:= Label_situ.Caption;
      ZQuery1.Close;
      ZQuery1.SQL.Clear;
      ZQuery1.SQL.Add('insert into caixa(NOME, TOTALCOMPRAS, TOTALSAN, TOTALSUPLE, SALDOFINAL, TOTALVENDIDO,SITUFINAL,ABRIUCX,FECHOUCX,usuario,idusuario)values(:NOME,:TOTALCOMPRAS,:TOTALSAN,:TOTALSUPLE,:SALDOFINAL,:TOTALVENDIDO,:SITUFINAL,:ABRIUCX,:FECHOUCX,:usuario,:idusuario)');
      ZQuery1.ParamByName('NOME').AsString:= data;
      ZQuery1.ParamByName('TOTALCOMPRAS').AsInteger:= totalcompras;
      ZQuery1.ParamByName('TOTALSAN').AsFloat:= totalsan;
      ZQuery1.ParamByName('TOTALSUPLE').AsFloat:= totalsuple;
      ZQuery1.ParamByName('SALDOFINAL').AsFloat:= saldo;
      ZQuery1.ParamByName('TOTALVENDIDO').AsFloat:= totaldincx;
      ZQuery1.ParamByName('SITUFINAL').AsString := situ;
      ZQuery1.ParamByName('ABRIUCX').AsString := abriucx;
      ZQuery1.ParamByName('FECHOUCX').AsString := fechoucx;
      ZQuery1.ParamByName('usuario').AsString := usuario;
      //Cadstrando id da tabela usuario na tabela caixa  (foreign key)
      ZQuery1.ParamByName('idusuario').AsString := ZQuery2.FieldByName('id').value;
      ZQuery1.ExecSQL;
      listar;

end;

procedure TForm_fecharcx.Button2Click(Sender: TObject);
begin
Edit1.Clear;
Edit2.Clear;
Label_suple.Caption :=  '';
Label_caixa.Caption :=  '';
Edit1.SetFocus;
end;

procedure TForm_fecharcx.Button3Click(Sender: TObject);
begin
   if (Form_relatoriocx=Nil) then Application.CreateForm(TForm_relatoriocx, Form_relatoriocx);
   Form_relatoriocx.ShowModal;
end;

procedure TForm_fecharcx.Button4Click(Sender: TObject);
begin
WinExec('calc.exe',SHOW_OPENWINDOW);
end;

procedure TForm_fecharcx.Edit1Enter(Sender: TObject);
begin
sair := sair + 1;
end;

procedure TForm_fecharcx.Edit1Exit(Sender: TObject);
begin
if Edit1.Text = FloatToStr (totalsuple) then
begin
sair:= 0;
   Label_suple.Font.Color := clGreen;
   Label_suple.Caption := 'OK !';
   // alimentando variavel de controle
   sair := sair + 1;
   end
   else
   begin
    Label_suple.Font.Color := clMaroon;
   Label_suple.Caption := 'Valor n�o confere !';
   end;
   // alimentando variavel de controle

end;

procedure TForm_fecharcx.Edit2Enter(Sender: TObject);
begin
sair := sair + 1;
end;

procedure TForm_fecharcx.Edit2Exit(Sender: TObject);
begin
sair:= 0;
if Edit2.Text = FloatToStr (totalcx) then
begin
   Label_caixa.Font.Color := clGreen;
   Label_caixa.Caption := 'OK !';
   // alimentando variavel de controle
   sair := sair + 1;
   end
   else
   begin
    Label_caixa.Font.Color := clMaroon;
   Label_caixa.Caption := 'Valor Invalido !';
   // alimentando variavel de controle

   end;
end;

procedure TForm_fecharcx.FormActivate(Sender: TObject);
begin
data := FormatDateTime('DD/MM/YYYY  -  hh:nn',now);
listar;
end;

procedure TForm_fecharcx.listar;
begin
  zquery1.close;
  ZQuery1.SQL.Clear;
  ZQuery1.SQL.Add('select * from caixa');
  ZQuery1.Open;
end;

procedure TForm_fecharcx.FormCreate(Sender: TObject);
begin
sair := 0;
end;

procedure TForm_fecharcx.Sair1Click(Sender: TObject);
begin
if sair <> 0 then
showmessage ('ERRO: Termine as transa��es antes de sair !!')
else
Form_fecharcx.Close
end;

end.
