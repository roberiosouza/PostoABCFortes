unit UPump;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FRRegistrations, Vcl.StdCtrls, UUtils, RTTI.NotEmpty,
  Helper.Edits, Helper.Combobox;

type
  TFPump = class(TForm)
    FRCRUD1: TFRCRUD;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;

    [NotEmpty]
    edtNumber: TEdit;

    [NotEmpty]
    cbTank: TComboBox;

    [NotEmpty]
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

    cbTank.Items.Clear;

    for I:= 0 to Length(ListTanks)-1 do
    begin
      cbTank.Items.Add(ListTanks[I].Id.ToString+' - '+ListTanks[I].Numero);
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
var
  VUtils: Utils;
begin
  try
    VUtils := Utils.Create;
    if (VUtils.validate(TFPump, Self)) then
    begin
      try
        // Cria o objeto a ser salvo
        DM.Pump := Pump.Create(DM.FDCon, DM.FDTransaction);
        DM.Pump.Numero := edtNumber.Text;
        DM.Pump.Tanque := cbTank.RemovePrefixTank;  // Ajustar Combobox
        DM.Pump.PrecoLitro := StrToFloat(edtPriceLiters.RemovePoint);  //Usar um helper aqui

        // Executa o método para salvar e se retorno TRUE informa ao usuário sucesso
        if (DM.Pump.Save(DM.Pump)) then
          Application.MessageBox('Bomba salva com sucesso!', 'Aviso', MB_ICONINFORMATION+MB_OK);
      finally
        Close;
      end;
    end;
  finally
    VUtils.Free;
  end;
end;

end.
