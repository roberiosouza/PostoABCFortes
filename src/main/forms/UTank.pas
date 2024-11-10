unit UTank;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FRRegistrations, Vcl.StdCtrls,
  Vcl.Buttons, DMMain, UUtils, RTTI.NotEmpty, Helper.Edits;

type
  TFTank = class(TForm)
    [NotEmpty]
    edtNumber: TEdit;

    Label1: TLabel;
    FRCRUD1: TFRCRUD;

    [NotEmpty]
    cbTypeFuel: TComboBox;

    Label2: TLabel;

    [NotEmpty]
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
var
  VUtils: Utils;
begin
  try
    VUtils := Utils.Create;
    if (VUtils.validate(TFTank, Self)) then
    begin
      try
        // Cria o objeto a ser salvo
        DM.Tank := Tank.Create(DM.FDCon, DM.FDTransaction);
        DM.Tank.Numero := edtNumber.AddPrefixTank;
        DM.Tank.TipoCombustivel := cbTypeFuel.Text;
        DM.Tank.CapacidadeLitros := StrToFloat(edtQuantLiters.RemovePoint);

        // Executa o método para salvar e se retorno TRUE informa ao usuário sucesso
        if (DM.Tank.Save(DM.Tank)) then
          Application.MessageBox('Tanque salvo com sucesso!', 'Aviso', MB_ICONINFORMATION+MB_OK);
      finally
        Close;
      end;
    end;
  finally
    VUtils.Free;
  end;
end;

end.
