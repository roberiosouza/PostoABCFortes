unit CSupply;

interface

uses
  FireDAC.Comp.Client;

type
  Supply = class
    private
    FConnection: TFDConnection;
    FTransaction: TFDTransaction;
    FId: Integer;
    FDataAbastecimento: TDate;
    FFrentista: Integer;
    FBomba: Integer;
    FQuantLitros: Real;
    FPercImposto: Real;
    FRSTotalBruto: Real;
    FRSTotalLiquido: Real;
    FStatus: Char;

  public
    constructor Create(Connection : TFDConnection; Transction: TFDTransaction); overload;
    constructor Create(); overload;

    destructor Destroy; Override;

    property Conection: TFDConnection read FConnection write FConnection;
    property Transaction: TFDTransaction read FTransaction write FTransaction;
    property Id: Integer read FId write FId;
    property DataAbastecimento: TDate read FDataAbastecimento write FDataAbastecimento;
    property Frentista: Integer read FFrentista write FFrentista;
    property Bomba: Integer read FBomba write FBomba;
    property QuantLitros: Real read FQuantLitros write FQuantLitros;
    property PercImposto: Real read FPercImposto write FPercImposto;
    property RSTotalBruto: Real read FRSTotalBruto write FRSTotalBruto;
    property RSTotalLiquido: Real read FRSTotalLiquido write FRSTotalLiquido;
    property Status: Char read FStatus write FStatus;

    procedure RelSupply(Query: TFDQuery);
    function VerifyImpostHighestEqualsZero(Impost: Real): Boolean;
    function Save(ASupply: Supply): Boolean;
  end;

implementation
uses
  System.SysUtils, Vcl.Dialogs;

var
  QuerySupply: TFDQuery;


{ Sumpply }

constructor Supply.Create(Connection: TFDConnection;
  Transction: TFDTransaction);
begin
  FConnection := Connection;
  FTransaction := Transaction;

  QuerySupply := TFDQuery.Create(nil);
  QuerySupply.Connection := FConnection;
end;

constructor Supply.Create;
begin
  inherited Create;
end;

destructor Supply.Destroy;
begin
  QuerySupply.Destroy;
  inherited;
end;

procedure Supply.RelSupply(Query: TFDQuery);
begin
  try
    FConnection.Connected := False;
    FConnection.Connected := True;

    Query.Close;
    Query.Open;
  except on e: Exception do
    Showmessage('Ocorreu um erro: ' + e.Message);
  end;
end;

function Supply.Save(ASupply: Supply): Boolean;
begin
  try
    FConnection.Connected := False;
    FConnection.Connected := True;

    FConnection.StartTransaction;

    QuerySupply.close;
    QuerySupply.SQL.Clear;
    QuerySupply.SQL.Add('INSERT INTO TBABASTECIMENTO (DATA_ABASTECIMENTO, FRENTISTA_ID, BOMBA_ID, QUANT_TOTAL_LITROS, ');
    QuerySupply.SQL.Add('PERC_IMPOSTO, RS_TOTAL_BRUTO, RS_TOTAL_LIQUIDO) VALUES (:DATA_ABASTECIMENTO, :FRENTISTA_ID, :BOMBA_ID, ');
    QuerySupply.SQL.Add(':QUANT_TOTAL_LITROS, :PERC_IMPOSTO, :RS_TOTAL_BRUTO, :RS_TOTAL_LIQUIDO) ');
    QuerySupply.ParamByName('DATA_ABASTECIMENTO').AsDate := ASupply.DataAbastecimento;
    QuerySupply.ParamByName('FRENTISTA_ID').AsInteger := ASupply.Frentista;
    QuerySupply.ParamByName('BOMBA_ID').AsInteger := ASupply.Bomba;
    QuerySupply.ParamByName('QUANT_TOTAL_LITROS').AsFloat := ASupply.QuantLitros;
    QuerySupply.ParamByName('PERC_IMPOSTO').AsFloat := ASupply.PercImposto;
    QuerySupply.ParamByName('RS_TOTAL_BRUTO').AsFloat := ASupply.RSTotalBruto;
    QuerySupply.ParamByName('RS_TOTAL_LIQUIDO').AsFloat := ASupply.RSTotalLiquido;
    QuerySupply.ExecSQL;

    FConnection.Commit;
    Result := True;
  except on e: Exception do
    begin
      FConnection.Rollback;
      Result := False;
      Showmessage('Ocorreu um erro: ' + e.Message);
    end;
  end;
end;

function Supply.VerifyImpostHighestEqualsZero(Impost: Real): Boolean;
begin
  if (Impost >= 0) then
    Result := True
  else
    Result := False;
end;

end.
