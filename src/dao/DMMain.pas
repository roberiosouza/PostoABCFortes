unit DMMain;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client, CEmployee,
  CTank, CPump, CConfig, CSupply, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet;

type
  TDM = class(TDataModule)
    FDCon: TFDConnection;
    FDTransaction: TFDTransaction;
    QueryRelAbastecimento: TFDQuery;
    QueryRelAbastecimentoCOD_ABASTECIMENTO: TIntegerField;
    QueryRelAbastecimentoDATA_ABASTECIMENTO: TDateField;
    QueryRelAbastecimentoFRENTISTA: TStringField;
    QueryRelAbastecimentoBOMBA_NUMERO: TStringField;
    QueryRelAbastecimentoQUANT_TOTAL_LITROS: TIntegerField;
    QueryRelAbastecimentoRS_TOTAL_BRUTO: TFMTBCDField;
    DSRelAbastecimento: TDataSource;
    QueryRelAbastecimentoIMPOSTO: TBCDField;
    QueryRelAbastecimentoRS_TOTAL_LIQUIDO: TFMTBCDField;
    QueryRelAbastecimentoTIPO_COMBUSTIVEL: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
    Employee : Employee;
    Tank : Tank;
    Pump: Pump;
    Config: Config;
    Supply: Supply;
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.

