unit USupplyTest;

interface

uses
  DUnitX.TestFramework, CSupply, DMMain, System.SysUtils;

type
  [TestFixture('Teste Abastecimento', 'Vai validar os métodos da classe de abastecimento.')]
  SupplyTest = class
  strict private
    FSupply: Supply;
    FDM: TDM;
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;
    [Test]
    procedure VerifyPercImpostHighestEqualsZeroTest;
    [Test]
    procedure Save();
  end;

implementation

procedure SupplyTest.VerifyPercImpostHighestEqualsZeroTest;
begin
  FSupply.PercImposto := 10;

  var lResultado := FSupply.VerifyImpostHighestEqualsZero(FSupply.PercImposto);

  Assert.AreEqual(True, lResultado, 'Não é maior que zero');
end;

procedure SupplyTest.Save;
begin
  FSupply.DataAbastecimento := StrToDate('01/01/2024');
  FSupply.Frentista := 1;
  FSupply.Bomba := 1;
  FSupply.QuantLitros := 1;
  FSupply.PercImposto := 13;
  FSupply.RSTotalBruto := 4.50;
  FSupply.RSTotalLiquido := 3.95;
  FSupply.Status := 'N';

  var lResult := FSupply.Save(FSupply);
  Assert.AreEqual(True, lResult, 'Não conseguiu salvar o abastecimento');
end;

procedure SupplyTest.Setup;
begin
  FDM := TDM.Create(nil);
  FSupply := Supply.Create(FDM.FDCon, FDM.FDTransaction);
end;

procedure SupplyTest.TearDown;
begin
  FSupply := nil;
  FDM := nil;
end;

initialization
  TDUnitX.RegisterTestFixture(SupplyTest);

end.
