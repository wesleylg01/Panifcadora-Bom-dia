unit backup;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,ShellApi, Vcl.StdCtrls, IBServices,
  Vcl.Imaging.jpeg, Vcl.ExtCtrls, Vcl.ImgList, Data.DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset;

type
  TForm_backup = class(TForm)
    Button1: TButton;
    Image1: TImage;
    ImageList1: TImageList;
    ZQuery1: TZQuery;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_backup: TForm_backup;

implementation

{$R *.dfm}

procedure TForm_backup.Button1Click(Sender: TObject);
begin
ShellExecute(handle,'open', 'cmd.exe',Pchar('/c  C:\mysqldump -h localhost -u root panificadora > C:\Backup\backup.sql'),nil, SW_SHOW );
application.MessageBox (' O BACKUP FOI GERADO COM SUCESSO!', 'BACKUP REALIZADO' , MB_ICONINFORMATION);
end;

procedure TForm_backup.Button2Click(Sender: TObject);
begin
if application.MessageBox('Deseja Realmente fazer o Restore? Isso far� com que todas as altera��es feitas no banco de dado/s depois ultimo backup se perca.' , 'Aten��o' , mb_iconquestion + mb_yesno )= id_yes
then
ShellExecute(handle,'open', 'cmd.exe',Pchar('/c  C:\mysqldump -h localhost -u root panificadora < C:\Backup\backup.sql'),nil, SW_SHOW )
else
showmessage ('O Restore Foi cancelado');
end;

end.
