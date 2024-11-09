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
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Funcionrios1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMain: TFMain;

implementation

{$R *.dfm}

uses DMMain, UEmployee;

procedure TFMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFMain.Funcionrios1Click(Sender: TObject);
begin
  try
    if (FEmployee = nil) then
      FEmployee := TFEmployee.Create(Application);
    FEmployee.Show;
  except on E: Exception do
    ShowMessage('Ocorreu um erro. ' + E.Message);
  end;
end;

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
