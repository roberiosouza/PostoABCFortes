unit UEmployee;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FRRegistrations;

type
  TFEmployee = class(TForm)
    FRCRUD1: TFRCRUD;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FRCRUD1btnCancelClick(Sender: TObject);
    procedure FRCRUD1btnSaveClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FEmployee: TFEmployee;

implementation


{$R *.dfm}

uses DMMain, CEmployee;

procedure TFEmployee.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FEmployee := nil;
  Action := caFree;
end;

procedure TFEmployee.FRCRUD1btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TFEmployee.FRCRUD1btnSaveClick(Sender: TObject);
begin
  try
    // Cria o objeto a ser salvo
    DM.Employee := Employee.Create(DM.FDCon, DM.FDTransaction);
    DM.Employee.Nome := FRCRUD1.edtNameDescription.Text;

    // Executa o método para salvar e se retorno TRUE informa ao usuário sucesso
    if (DM.Employee.save(DM.Employee)) then
      Application.MessageBox('Funcionário salvo com sucesso!', 'Aviso', MB_ICONINFORMATION+MB_OK);
  finally
    Close;
  end;
end;

end.
