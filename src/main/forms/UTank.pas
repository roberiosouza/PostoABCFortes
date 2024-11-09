unit UTank;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FRRegistrations, Vcl.StdCtrls,
  Vcl.Buttons, DMMain;

type
  TFTank = class(TForm)
    edtNumber: TEdit;
    Label1: TLabel;
    FRCRUD1: TFRCRUD;
    cbTypeFuel: TComboBox;
    Label2: TLabel;
    edtQuantLiters: TEdit;
    Label3: TLabel;
    procedure FRCRUD1btnCancelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FRCRUD1btnSaveClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FTank: TFTank;

implementation

uses
  CTank;

{$R *.dfm}

procedure TFTank.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FTank := nil;
  Action := caFree;
end;

procedure TFTank.FRCRUD1btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TFTank.FRCRUD1btnSaveClick(Sender: TObject);
begin
  try
    // Cria o objeto a ser salvo
    DM.Tank := Tank.Create(DM.FDCon, DM.FDTransaction);
    DM.Tank.Numero := edtNumber.Text;
    DM.Tank.TipoCombustivel := cbTypeFuel.Text;
    DM.Tank.CapacidadeLitros := StrToFloat(edtQuantLiters.Text);  //Usar um helper aqui

    // Executa o método para salvar e se retorno TRUE informa ao usuário sucesso
    if (DM.Tank.save(DM.Tank)) then
      Application.MessageBox('Tanque salvo com sucesso!', 'Aviso', MB_ICONINFORMATION+MB_OK);
  finally
    Close;
  end;
end;

end.
