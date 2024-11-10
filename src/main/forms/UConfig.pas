unit UConfig;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FRRegistrations, Vcl.StdCtrls;

type
  TFConfig = class(TForm)
    Label1: TLabel;
    edtPercImpost: TEdit;
    FRCRUD1: TFRCRUD;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FRCRUD1btnCancelClick(Sender: TObject);
    procedure FRCRUD1btnSaveClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FConfig: TFConfig;

implementation

uses
  DMMain, CConfig;

{$R *.dfm}

procedure TFConfig.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FConfig := nil;
  Action := caFree;
end;

procedure TFConfig.FormCreate(Sender: TObject);
var
  VConfig: Config;
begin
  try
    VConfig := Config.Create(DM.FDCon, DM.FDTransaction);

    edtPercImpost.Text := FloatToStr(VConfig.PecentCurrent());     // Adicionar um Helper No Panel
  finally
    FreeAndNil(VConfig);
  end;
end;

procedure TFConfig.FRCRUD1btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TFConfig.FRCRUD1btnSaveClick(Sender: TObject);
begin
  try
    // Cria o objeto a ser salvo
    DM.Config := Config.Create(DM.FDCon, DM.FDTransaction);
    DM.Config.PercImposto := StrToFloat(edtPercImpost.Text); //Usar um helper aqui

    // Executa o método para salvar e se retorno TRUE informa ao usuário sucesso
    if (DM.Config.SaveUpdate(DM.Config)) then
      Application.MessageBox('Configuração salva com sucesso!', 'Aviso', MB_ICONINFORMATION+MB_OK);
  finally
    Close;
  end;
end;

end.
