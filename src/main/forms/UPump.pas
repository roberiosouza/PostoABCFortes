unit UPump;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FRRegistrations, Vcl.StdCtrls;

type
  TFPump = class(TForm)
    FRCRUD1: TFRCRUD;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edtNumber: TEdit;
    cbTank: TComboBox;
    edtPriceLiters: TEdit;
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
  FPump: TFPump;

implementation

uses
  CPump, DMMain, CTank;

{$R *.dfm}

procedure TFPump.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FPump := nil;
  Action := caFree;
end;

procedure TFPump.FormCreate(Sender: TObject);
var
  ListTanks: TArray<Tank>;
  VTank: Tank;
  I: Integer;
begin
  try
    VTank := Tank.Create(DM.FDCon, DM.FDTransaction);

    SetLength(ListTanks, Length(VTank.ListAll));
    ListTanks := VTank.ListAll;

    for I:= 0 to Length(ListTanks)-1 do
    begin
      cbTank.Items.Add(ListTanks[I].Numero);
    end;

  finally
    FreeAndNil(VTank);
  end;
end;

procedure TFPump.FRCRUD1btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TFPump.FRCRUD1btnSaveClick(Sender: TObject);
begin
  try
    // Cria o objeto a ser salvo
    DM.Pump := Pump.Create(DM.FDCon, DM.FDTransaction);
    DM.Pump.Numero := edtNumber.Text;
    DM.Pump.Tanque := 1;  // Ajustar Combobox
    DM.Pump.PrecoLitro := StrToFloat(edtPriceLiters.Text);  //Usar um helper aqui

    // Executa o m�todo para salvar e se retorno TRUE informa ao usu�rio sucesso
    if (DM.Pump.Save(DM.Pump)) then
      Application.MessageBox('Bomba salva com sucesso!', 'Aviso', MB_ICONINFORMATION+MB_OK);
  finally
    Close;
  end;
end;

end.