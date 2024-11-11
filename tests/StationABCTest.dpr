program StationABCTest;

///// UI Selection - Pick only 1! //////////////////////////////
{DEFINE UseVCL}
{DEFINE UseFMX}
{$DEFINE UseWinConsole}
////////////////////////////////////////////////////////////////


{$IFDEF UseWinConsole}
{$DEFINE UseConsole}
{$ENDIF}

{$IFDEF UseConsole}
{$APPTYPE CONSOLE}
{$ENDIF}

uses
  {$IFDEF UseVCL}
  VCL.Forms,
  {$ENDIF }
  {$IFDEF UseFMX}
  FMX.Forms,
  {$ENDIF }
  {$IFDEF UseConsole}
  DUnitX.ConsoleWriter.Base,
  DUnitX.Loggers.Console,
  DUnitX.Loggers.XML.NUnit,
  DUnitX.Loggers.Text,
  DUnitX.Loggers.XML.xUnit,
  {$ENDIF }
  {$IFDEF UseWinConsole}
  DUnitX.Windows.Console,
  WinAPI.Windows,
  WinAPI.Messages,
  {$ENDIF }
  System.SysUtils,
  DUnitX.Generics,
  DUnitX.InternalInterfaces,
  DUnitX.WeakReference,
  DUnitX.FixtureResult,
  DUnitX.RunResults,
  DUnitX.Test,
  DUnitX.TestFixture,
  DUnitX.TestFramework,
  DUnitX.TestResult,
  DUnitX.TestRunner,
  DUnitX.Utils,
  DUnitX.IoC,
  DUnitX.MemoryLeakMonitor.Default,
  DUnitX.DUnitCompatibility,
  USupplyTest in 'USupplyTest.pas',
  CSupply in '..\src\class\CSupply.pas',
  UConfigTest in 'UConfigTest.pas',
  CConfig in '..\src\class\CConfig.pas',
  CEmployee in '..\src\class\CEmployee.pas',
  CPump in '..\src\class\CPump.pas',
  CTank in '..\src\class\CTank.pas',
  DMMain in '..\src\dao\DMMain.pas' {DM: TDataModule};

{$R *.res}

/////////////////////////////////////////////////////////////////////////
{$IFDEF UseVCL}
begin
  Application.Initialize;
  Application.CreateForm(TGUIVCLTestRunner, GUIVCLTestRunner);
  Application.Run;
{$ENDIF}
/////////////////////////////////////////////////////////////////////////
{$IFDEF UseFMX}
begin
  Application.Initialize;
  Application.CreateForm(TGUIXTestRunner, GUIXTestRunner);
  Application.Run;
{$ENDIF}
/////////////////////////////////////////////////////////////////////////
{$IFDEF UseConsole}
var
  runner : ITestRunner;
  results : IRunResults;
  logger : ITestLogger;
  nunitLogger : ITestLogger;

begin
   try
      //Create the runner
      runner := TDUnitX.CreateRunner;
      runner.UseRTTI := True;
      //tell the runner how we will log things
      logger := TDUnitXConsoleLogger.Create(true);
      nunitLogger := TDUnitXXMLNUnitFileLogger.Create;
      runner.AddLogger(logger);
      runner.AddLogger(nunitLogger);

      //Run tests
      results := runner.Execute;

      System.Write('Done.. press <Enter> key to quit.');
      System.Readln;

   except
      on E: Exception do
         System.Writeln(E.ClassName, ': ', E.Message);
   end;
{$ENDIF}
/////////////////////////////////////////////////////////////////////////
end.
