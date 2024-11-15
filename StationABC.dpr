program StationABC;

uses
  Vcl.Forms,
  UMain in 'src\main\UMain.pas' {FMain},
  DMMain in 'src\dao\DMMain.pas' {DM: TDataModule},
  CEmployee in 'src\class\CEmployee.pas',
  UEmployee in 'src\main\forms\UEmployee.pas' {FEmployee},
  FRRegistrations in 'src\main\frames\FRRegistrations.pas' {FRCRUD: TFrame},
  UTank in 'src\main\forms\UTank.pas' {FTank},
  CTank in 'src\class\CTank.pas',
  UPump in 'src\main\forms\UPump.pas' {FPump},
  CPump in 'src\class\CPump.pas',
  UConfig in 'src\main\forms\UConfig.pas' {FConfig},
  CConfig in 'src\class\CConfig.pas',
  USupply in 'src\main\forms\USupply.pas' {FSupply},
  CSupply in 'src\class\CSupply.pas',
  URSupply in 'src\reports\URSupply.pas' {FRSupply},
  RTTI.NotEmpty in 'src\class\rtti\RTTI.NotEmpty.pas',
  RTTI.Components in 'src\class\rtti\RTTI.Components.pas',
  UUtils in 'src\utils\UUtils.pas',
  Helper.Edits in 'src\utils\Helper.Edits.pas',
  Helper.Combobox in 'src\utils\Helper.Combobox.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFMain, FMain);
  Application.Run;
end.
