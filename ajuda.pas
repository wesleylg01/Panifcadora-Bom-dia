unit ajuda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.jpeg,
  Vcl.ExtCtrls, Vcl.Imaging.pngimage;

type
  TForm_ajuda = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Image1: TImage;
    Image2: TImage;
    Label9: TLabel;
    Panel2: TPanel;
    procedure Label1DblClick(Sender: TObject);
    procedure Label3DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_ajuda: TForm_ajuda;

implementation
       uses mensagens_erro,suporte,shellapi;
{$R *.dfm}

procedure TForm_ajuda.Label1DblClick(Sender: TObject);
begin
if (Form_mensagens=Nil) then Application.CreateForm(TForm_mensagens, Form_mensagens);
   Form_mensagens.ShowModal;
end;

procedure TForm_ajuda.Label3DblClick(Sender: TObject);
begin
if (Form_contato=Nil) then Application.CreateForm(TForm_contato, Form_contato);
   Form_contato.ShowModal;
end;

end.
