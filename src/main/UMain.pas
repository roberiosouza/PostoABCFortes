unit UMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ExtCtrls, Vcl.Skia,
  Vcl.Imaging.jpeg, Vcl.StdCtrls, Vcl.ComCtrls;

type
  TFMain = class(TForm)
    Menu: TMainMenu;
    Cadastros1: TMenuItem;
    Controle1: TMenuItem;
    Configurao1: TMenuItem;
    Sair1: TMenuItem;
    Funcionrios1: TMenuItem;
    Bomba1: TMenuItem;
    anques1: TMenuItem;
    Abastecimento1: TMenuItem;
    imgLogo: TImage;
    lblUsuario: TLabel;
    Timer: TTimer;
    StatusBar1: TStatusBar;
    procedure Sair1Click(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMain: TFMain;

implementation

{$R *.dfm}

procedure TFMain.Sair1Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFMain.TimerTimer(Sender: TObject);
begin
  StatusBar1.Panels[0].Text := 'Data: ' + DateToStr(Date);
  StatusBar1.Panels[1].Text := 'Hora: ' + TimeToStr(Time);
end;

end.
