program StationABC;

uses
  Vcl.Forms,
  UMain in 'src\main\UMain.pas' {FMain};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFMain, FMain);
  Application.Run;
end.
