unit DMMain;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client, CEmployee,
  CTank, CPump, CConfig, CSupply;

type
  TDM = class(TDataModule)
    FDCon: TFDConnection;
    FDTransaction: TFDTransaction;
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

