program StationABC;

uses
  Vcl.Forms,
  UMain in 'src\main\UMain.pas' {FMain},
  DMMain in 'src\dao\DMMain.pas' {DM: TDataModule},
  CEmployee in 'src\class\CEmployee.pas',
  UEmployee in 'src\main\forms\UEmployee.pas' {FEmployee},
  FRRegistrations in 'src\main\frames\FRRegistrations.pas' {FRCRUD: TFrame};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFMain, FMain);
  Application.Run;
end.
