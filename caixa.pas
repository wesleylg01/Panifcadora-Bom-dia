unit caixa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ImgList, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage, Data.DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,teste,
  Vcl.Touch.Keyboard, Vcl.Menus,login, Vcl.Imaging.jpeg, Datasnap.DBClient,
  Vcl.Buttons;
type
  Tform_login = class (TForm);
  Tform_Form_entracx = class (TForm);
  TForm_pdv = class(TForm)
    Image1: TImage;
    Panel1: TPanel;
    Memo1: TMemo;
    Label1: TLabel;
    Edit_cod: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label_und: TLabel;
    Edit_qtd: TEdit;
    Label5: TLabel;
    Button1: TButton;
    Button2: TButton;
    Label_geral: TLabel;
    Label8: TLabel;
    Label7: TLabel;
    ImageList1: TImageList;
    Panel2: TPanel;
    Label9: TLabel;
    Button3: TButton;
    Button4: TButton;
    ZQuery1: TZQuery;
    Timer1: TTimer;
    Label_hr: TLabel;
    MainMenu1: TMainMenu;
    Sair1: TMenuItem;
    DataSource1: TDataSource;
    ZQuery2: TZQuery;
    Label6: TLabel;
    Label4: TLabel;
    Label10: TLabel;
    Edit1: TEdit;
    cdsItensVenda: TClientDataSet;
    cdsItensVendaCODBARRA: TStringField;
    cdsItensVendaQTDEPRODUTO: TIntegerField;
    cdsItensVendaVLRPRODUTO: TCurrencyField;
    cdsItensVendaVLRITEM: TCurrencyField;
    procedure FormActivate(Sender: TObject);
    procedure listar;
    procedure Edit_codExit(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Edit_qtdKeyPress(Sender: TObject; var Key: Char);
    procedure Edit_codKeyPress(Sender: TObject; var Key: Char);
    procedure Edit_codKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cancelar;
    procedure Edit1Enter(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);

  private
    { Private declarations }
  public

     var
     vlgeral2:Real;

    { Public declarations }
  end;

var
  Form_pdv: TForm_pdv;
  vlgeral,vlproduto,canc:Real;
  qtdgeral,sair,i:Integer;
  nome,cod,hora,est_db,id:String;
  qtd:Real;
  est: Integer;

implementation
            uses fina_caixa;
{$R *.dfm}


procedure TForm_pdv.BitBtn1Click(Sender: TObject);
begin
  Memo1.Clear;
  cdsItensVenda.First;
  while not cdsItensVenda.Eof do
  begin
    Memo1.Lines.Add(cdsItensVendaCODBARRA.AsString + '  - ' +
        cdsItensVendaQTDEPRODUTO.AsString + ' - '+
        cdsItensVendaVLRPRODUTO.AsString + ' - '+
        cdsItensVendaVLRITEM.AsString);
    cdsItensVenda.Next;
  end;
end;

procedure TForm_pdv.Button1Click(Sender: TObject);
begin
 { Verificando para que o
 usuario n�o consiga sair com a
 venda em andamento}
 if sair = 0 then
  begin
   if application.MessageBox('Deseja Fechar o Caixa ?' , 'Aten��o' , mb_iconquestion + mb_yesno )= id_yes
   then Form_pdv.Close;
   end
  else
  begin
   ShowMessage('ERRO: Venda em Andamento, encerre a venda para sair !!');
  end;
end;

procedure TForm_pdv.cancelar;
begin
  Edit_cod.Clear;
Edit_qtd.Clear;
Label_und.Caption := '0,00';
Edit_cod.SetFocus;
   vlgeral:= vlgeral - canc;
  Memo1.Lines.Add('            ITEM CANCELADO            ');
  Memo1.Lines.Add('            - '+ FloattoStr (canc)+'            ');
  Memo1.Lines.Add('=========================================');
  label_geral.Caption:= FloatTOStr(vlgeral);
          ZQuery2.Close;
          ZQuery2.SQL.clear;
          ZQuery2.SQL.Add('update produto set estoque = estoque + '+ FloatToStr (qtd) +' where id = '+ id+ '');
          ZQuery2.ExecSQL;
          sair := 0;
end;


procedure TForm_pdv.Button4Click(Sender: TObject);
begin
  vlgeral:= 0;
  vlproduto:= 0;
  canc := 0;
  qtdgeral:= 0;
  sair:= 0;
    if application.MessageBox('Tem certeza que deseja cancelar esta venda ?' , 'Aten��o !!!' , MB_ICONEXCLAMATION + mb_yesno )= id_yes
    then
     begin
      Memo1.Lines.Clear;
      Memo1.Lines.Add('=========== Bom dia P�es e Confeitaria ============');
      Edit_cod.Clear;
      Edit_qtd.Clear;
      Label_und.Caption := '0,00';
      Label_geral.Caption := '0,00';
      Edit_cod.SetFocus;
      Panel1.Font.Color:= clBlack;
      Panel1.Font.Size := 30;
      Panel1.Caption:= 'Caixa Livre';
        //zerando variaveis
          vlgeral:= 0;
          vlproduto:= 0;
          canc := 0;
          qtdgeral:= 0;
    end;
end;

procedure TForm_pdv.Edit1Enter(Sender: TObject);
begin
Edit_cod.SetFocus;
end;

procedure TForm_pdv.Edit_codExit(Sender: TObject);
var
valor:Real;
n: String;
begin
  //zerando variaveis
    n:= '';
    cod:= '';
    valor:= 0;
    vlproduto:= 0;
    cod := Edit_cod.Text;
    est:= 0;
    est_db:= '';
    sair:= 0;

  if Edit_cod.Text <> '' then
    begin
      ZQuery1.Close;
      ZQuery1.SQL.Clear;
      ZQuery1.SQL.Add('Select * from produto Where (EAN like "'+ Edit_cod.text +'")');
      ZQuery1.Open;
        // -----------recebendo dados do banco
        n := ZQuery1.FieldbyName('descricao').value;
        //varialvel local recebendo valor do produto
        valor:= ZQuery1.FieldbyName('valorfinal').value;
        label_und.Caption:= FormatFloat('#,##0.00', valor);
        Panel1.Font.Color := clBlack;
        Panel1.Font.Size:= 30;
        Panel1.Caption:= n;
        //recebendo variavel local
        vlproduto:= valor;
        nome:= n;
        //--------------------------------------------------
      if Edit_qtd.Text <> '' then
      begin
      qtd:= StrToFloat (Edit_qtd.Text);
      Edit_qtd.Clear;
        vlgeral:= vlgeral + (vlproduto * qtd);
        canc:= vlproduto;
        label_geral.Caption:= FormatFloat('###0.00', vlgeral);
        qtdgeral:= qtdgeral + 1;
        Memo1.Lines.Add('Nome:' + nome );
        Memo1.Lines.Add('Pre�o und: ' + Floattostr (vlproduto)+ 'R$' );
        Memo1.Lines.Add('Quantidade: ' + Floattostr (qtd) + ' valor: ' + Floattostr (vlgeral) + ' R$' );
        Memo1.Lines.Add('=========================================');
      end
      else
        begin
        qtd:= 1;
        vlgeral:= vlgeral + (vlproduto * qtd);
        canc:= vlproduto;
        label_geral.Caption:= FormatFloat('###0.00', vlgeral);
        qtdgeral:= qtdgeral + 1;
        Memo1.Lines.Add('Nome:' + nome );
        Memo1.Lines.Add('Pre�o und: ' + Floattostr (vlproduto)+ 'R$' );
        Memo1.Lines.Add('Quantidade: ' + Floattostr (qtd) + ' valor: ' + Floattostr (canc) + ' R$' );
        Memo1.Lines.Add('=========================================');
        cdsItensVenda.Insert;
        cdsItensVendaCODBARRA.AsString :=  Edit_cod.Text;
        cdsItensVendaQTDEPRODUTO.AsString :=  FloatToStr(qtd);
        cdsItensVendaVLRPRODUTO.AsCurrency := canc;
        cdsItensVendaVLRITEM.AsCurrency := vlproduto;
        cdsItensVenda.Post;

        end;
         ZQuery2.Close;
  ZQuery2.SQL.Clear;
  ZQuery2.SQL.Add('Select * from produto Where (EAN like "'+ Edit_cod.text +'")');
  ZQuery2.Open;
    // recebendo quantidade em estoque e convertendo para string
    est_db:= ZQuery2.FieldByName('estoque').value;
    id:= ZQuery2.FieldByName('id').Value;
    est := StrtoInt (est_db);
    // verificando o estoque do produto
      if est > 0 then
        begin
          ZQuery2.Close;
          ZQuery2.SQL.clear;
          ZQuery2.SQL.Add('update produto set estoque = estoque - '+ FloatToStr (qtd) +' where id = '+ id+ '');
          ZQuery2.ExecSQL;
        end
        else
         if est  <= 0 then
          begin
           application.MessageBox ('ERRO 004 - N�o � possivel vender este produto, pois n�o temos ele em estoque !','ERRO 004',MB_ICONWARNING);
            //cancela o Produto no cupom
             Edit_cod.Clear;
             Edit_qtd.Clear;
             Label_und.Caption := '0,00';
             Edit_cod.SetFocus;
             vlgeral:= vlgeral - canc;
             Memo1.Lines.Add('            ITEM CANCELADO            ');
             Memo1.Lines.Add('            - '+ FloattoStr (canc)+'            ');
             Memo1.Lines.Add('=========================================');
             label_geral.Caption:= FloatTOStr(vlgeral);
          end;
           if Edit_cod.text = null  then
              Edit_qtd.SetFocus;
              Edit_cod.Clear;
              Edit1.SetFocus;
      end;
      sair:= 1;
end;
procedure TForm_pdv.Edit_codKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  Button1.SetFocus;

end;

procedure TForm_pdv.Edit_codKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Length(Edit_cod.text) >= 13 then
Edit_cod.SetFocus;

end;

procedure TForm_pdv.Edit_qtdKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then
   Edit_cod.SetFocus;
end;

procedure TForm_pdv.FormActivate(Sender: TObject);
begin
  label6.Caption := usuario;
  Label_hr.Caption := FormatDateTime('DD/MM/YYYY  |  hh:nn:',now);
  listar;
  vlproduto:= 0;
  Panel1.Caption:= '';
  Label_und.Caption:= '0,00';
  Label_geral.Caption:= '0,00';
  Panel1.Font.Color := clBlack;
  Panel1.Font.Size:= 30;
  Panel1.Caption:= 'Caixa Livre';
  Memo1.Clear;
  Memo1.Lines.Add('=========== Bom dia P�es e Confeitaria ============');
  Edit_cod.SetFocus;
  //zeando variavel de cotrole do vetor


end;
procedure TForm_pdv.FormCreate(Sender: TObject);
begin
Panel1.Caption:= 'Caixa Livre';
cdsItensVenda.Open;
end;

procedure TForm_pdv.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//faz a fun��o de dar o foco no edit_qtd para o usuario digitar a quantidade de determinado produto, pela tecla F1
 if key = vk_F1 then
   begin
     Edit_qtd.SetFocus;
   end;

//faz a fun��o de sair da tela de pdv, pela tecla F4
 if key = vk_F1 then
   begin
     Edit_qtd.SetFocus;
   end;

//faz a fun��o do botao "Finalizar venda", pela tecla F6
 if key = vk_F6 then
  begin
  sair:= 0;
  totaldincx:= totaldincx + vlgeral;
        // zerando os labels e Edts
        Edit_cod.Clear;
        Edit_qtd.Clear;
        Label_und.Caption := '0,00';
        // configurando painel
        Panel1.Font.Color := clRed;
        Panel1.Font.Size:= 40;
        Panel1.Caption:= ('VALOR TOTAL:  '+ FormatFloat('#,##0.00',vlgeral)+ '  R$');
        vlgeral2:= vlgeral;
          // recendo a hora do sistema
          hora := timetostr (Time);
          Memo1.Lines.Add('                                        ') ;
          Memo1.Lines.Add('                               VALOR TOTAL : '+Floattostr (vlgeral) + '  R$');
          Memo1.Lines.Add('==================================  ' + hora);
          Memo1.Lines.Add('=========================================');
           //Chamando o form de conclu��o de venda
           vlgeral := StrToFloat (label_geral.Caption);

             begin
              Application.CreateForm(TForm_final, Form_final);
              Form_final.ShowModal;
                // Preparando form para proxima venda
                 Memo1.Lines.Clear;
                 Memo1.Lines.Add('=========== Bom dia P�es e Confeitaria ============');
                 Edit_cod.Clear;
                 Edit_qtd.Clear;
                 Label_und.Caption := '0,00';
                 Label_geral.Caption := '0,00';
                 Edit_cod.SetFocus;
                 Panel1.Font.Color:= clBlack;
                 Panel1.Font.Size := 30;
                 Panel1.Caption:= 'Caixa Livre';
             end;

  end;




 begin
//faz a fun��o do botao "cancelar item", pela tecla F8
 if key = vk_F11 then
  cancelar;
 end;

end;

procedure TForm_pdv.listar;
begin
ZQuery1.Close;
ZQuery1.SQL.Clear;
ZQuery1.SQL.Add('select * from produto');
ZQuery1.Open;

end;

procedure TForm_pdv.Sair1Click(Sender: TObject);
begin
 { Verificando para que o
 usuario n�o consiga sair com a
 venda em andamento}
 if sair = 0 then
  begin
   if application.MessageBox('Deseja Fechar o Caixa ?' , 'Aten��o' , mb_iconquestion + mb_yesno )= id_yes
   then Form_pdv.Close;
   end
  else
  begin
   ShowMessage('ERRO: Venda em Andamento, encerre a venda para sair !!');
  end;
end;

procedure TForm_pdv.Timer1Timer(Sender: TObject);
begin
Label_hr.Caption := FormatDateTime('DD/MM/YYYY  |  hh:nn',now);
end;

procedure TForm_pdv.Button2Click(Sender: TObject);
begin
  sair:= 0;
  totaldincx:= totaldincx + vlgeral;
        // zerando os labels e Edts
        Edit_cod.Clear;
        Edit_qtd.Clear;
        Label_und.Caption := '0,00';
        // configurando painel
        Panel1.Font.Color := clRed;
        Panel1.Font.Size:= 40;
        Panel1.Caption:= ('VALOR TOTAL:  '+ FormatFloat('#,##0.00',vlgeral)+ '  R$');
        vlgeral2:= vlgeral;
          // recendo a hora do sistema
          hora := timetostr (Time);
          Memo1.Lines.Add('                                        ') ;
          Memo1.Lines.Add('                               VALOR TOTAL : '+Floattostr (vlgeral) + '  R$');
          Memo1.Lines.Add('==================================  ' + hora);
          Memo1.Lines.Add('=========================================');
           //Chamando o form de conclu��o de venda
           vlgeral := StrToFloat (label_geral.Caption);

             begin
              Application.CreateForm(TForm_final, Form_final);
              Form_final.ShowModal;
                // Preparando form para proxima venda
                 Memo1.Lines.Clear;
                 Memo1.Lines.Add('=========== Bom dia P�es e Confeitaria ============');
                 Edit_cod.Clear;
                 Edit_qtd.Clear;
                 Label_und.Caption := '0,00';
                 Label_geral.Caption := '0,00';
                 Edit_cod.SetFocus;
                 Panel1.Font.Color:= clBlack;
                 Panel1.Font.Size := 30;
                 Panel1.Caption:= 'Caixa Livre';
             end;
end;

procedure TForm_pdv.Button3Click(Sender: TObject);
begin
cancelar;
end;
end.
