unit UConfigTest;

interface

uses
  DUnitX.TestFramework, CConfig, DMMain;

type
  [TestFixture]
  ConfigTest = class
  strict private
    FConfig: Config;
    FDM: TDM;
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;

    [Test]
    procedure SaveUpdateTest();
  end;

implementation

procedure ConfigTest.SaveUpdateTest;
begin
  FConfig.PercImposto := 13;

  var lResult := FConfig.SaveUpdate(FConfig);
  Assert.AreEqual(True, lResult, 'Não conseguiu configurar o imposto');
end;

procedure ConfigTest.Setup;
begin
  FDM := TDM.Create(nil);
  FConfig := Config.Create(FDM.FDCon, FDM.FDTransaction);
end;

procedure ConfigTest.TearDown;
begin
  FConfig := nil;
  FDM := nil;
end;

initialization
  TDUnitX.RegisterTestFixture(ConfigTest);

end.
