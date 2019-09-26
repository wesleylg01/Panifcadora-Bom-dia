unit fina_caixa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ImgList, Vcl.StdCtrls, caixa, teste,
  Vcl.ExtCtrls, Data.DB, ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  TForm_pdv = class (TForm) ;
  Tform_Form_entracx = class (TForm);
  TForm_Final = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label_valor: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Edit_din: TEdit;
    Label6: TLabel;
    Edit_desconto: TEdit;
    Label7: TLabel;
    Button1: TButton;
    ImageList1: TImageList;
    Label3: TLabel;
    Label_troco: TLabel;
    Label9: TLabel;
    Button4: TButton;
    Button2: TButton;
    Button3: TButton;
    Timer1: TTimer;
    ZQuery1: TZQuery;
    procedure Button1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Edit_dinExit(Sender: TObject);
    procedure Edit_descontoExit(Sender: TObject);
    procedure Button1Exit(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Edit_dinKeyPress(Sender: TObject; var Key: Char);
    procedure KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public



    { Public declarations }
  end;

var
  Form_Final: TForm_Final;
  total,din,des:Real;
  pag:Boolean;
  hora:String;
implementation


{$R *.dfm}

procedure TForm_Final.Button1Click(Sender: TObject);

begin
  if (din < vlgeral) then
    begin
     ShowMessage(' ERRO: O valor Inserido é menor que o total da venda !!');
     Edit_din.SetFocus;
    end
     else
     begin
       total := (din - vlgeral);
       Label_troco.Caption :=  FormatFloat('#,##0.00', total);
       pag := true;
       Button1.Enabled := false;
     end;
       {variavel "totalcx" rcebendo "vlgeral" a variavel
       totalcx tem a função de somar todas as vendas do caixa}
       totalcx:= totalcx + vlgeral;

       //alimentando variavel que soma a quantidade vendas que foram realizadas
       totalcompras:= totalcompras + 1;
       //zerando variaveis que controlam a venda
          vlgeral:= 0;
          vlproduto:= 0;
          canc := 0;
          nome:= '';
          cod:= '';

   end;

procedure TForm_Final.Button1Exit(Sender: TObject);
begin
Button4.SetFocus;
end;

procedure TForm_Final.Button2Click(Sender: TObject);
begin
if application.MessageBox('Tem certeza que deseja cancelar o Pagamento ?' , 'Atenção !!!' , MB_ICONEXCLAMATION + mb_yesno )= id_yes
then
  Edit_din.Text:= '';
  Edit_desconto.text:= '';
  Label_troco.Caption :='';
  total:= 0;
  Label_valor.Caption := FormatFloat('#,##0.00', vlgeral);
  Edit_din.SetFocus;
end;

procedure TForm_Final.Button3Click(Sender: TObject);
begin
if application.MessageBox('Tem certeza que deseja cancelar esta venda ?' , 'Atenção !!!' , MB_ICONEXCLAMATION + mb_yesno )= id_yes
then
  Edit_din.Clear;
  Edit_desconto.Clear;
  Label_valor.Caption:= '';
  Label_troco.Caption :='';
  total:= 0;
  vlgeral:= 0;
  vlproduto:= 0;
  Form_Final.Close;
end;

procedure TForm_Final.Button4Click(Sender: TObject);
begin

if (pag = false) then
    begin
      ShowMessage(' ERRO: O valor Inserido é menor que o total da venda !!');
    end
     else
     if Label_troco.Caption <> '' then
      begin
        showmessage('VENDA REALIZADA COM SUCESSO !!!');
        Form_Final.Close;
         Form_pdv.Show;
      end;
end;

procedure TForm_Final.Edit_descontoExit(Sender: TObject);
begin
  if Edit_desconto.Text = '' then
    begin
      des := 0 ;
    end
  else
    begin
      des := StrToFloat (Edit_desconto.Text);
      vlgeral:= vlgeral -des;
    end;
end;

procedure TForm_Final.KeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then
    Button1.SetFocus;
end;

procedure TForm_Final.Edit_dinExit(Sender: TObject);
var
valor:double;
begin
try
valor:= StrToFloat(StringReplace(Edit_din.Text, '.', ',',
                          [rfReplaceAll, rfIgnoreCase]));
except
ShowMessage('Informar valor real');
end;
din := StrToFloat (Edit_din.Text);
edit_din.text := FormatFloat('#.###,##', valor);

end;

procedure TForm_Final.Edit_dinKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then
    Edit_desconto.SetFocus;
end;

procedure TForm_Final.FormActivate(Sender: TObject);

begin
  Edit_din.Clear;
  Edit_desconto.Clear;
  Label_troco.Caption :='';
  total:= 0;
  Label_valor.Caption := FloatToStr( vlgeral);
  Button1.Enabled := true;
  Edit_din.SetFocus;
end;

procedure TForm_Final.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     vlgeral:= 0;
     Label_valor.Caption:= '';
     Label_troco.Caption:= '';
     Edit_din.Clear;
     Edit_desconto.Clear;
end;

procedure TForm_Final.Timer1Timer(Sender: TObject);
begin
  //recebendo a hora do sistema
    hora := FormatDateTime('DD/MM/YYYY  |  hh:nn',now);
end;

end.
