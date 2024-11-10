unit CPump;

interface

uses
  FireDAC.Comp.Client;

type

  Pump = class

    private
      FConnection: TFDConnection;
      FTransaction: TFDTransaction;
      FId: Integer;
      FNumero: string;
      FTanque: Integer;
      FPrecoLitro: Real;
      FStatus: Char;

    public
      constructor Create(Connection : TFDConnection; Transction: TFDTransaction); overload;
      constructor Create(); overload;
      destructor Destroy; Override;

      property Conection: TFDConnection read FConnection write FConnection;
      property Transaction: TFDTransaction read FTransaction write FTransaction;
      property Id: Integer read FId write FId;
      property Numero: String read FNumero write FNumero;
      property Tanque: Integer read FTanque write FTanque;
      property PrecoLitro: Real read FPrecoLitro write FPrecoLitro;
      property Status: Char read FStatus write FStatus;

      procedure Inactive(Id: Integer);
      function Save(pump: Pump): Boolean;
      function ListAll(): TArray<Pump>;
      function PriceCurrentLiter(IdPump: Integer): Real;
  end;

implementation

uses
  System.SysUtils, Vcl.Dialogs;

var
  QueryListAll, QueryPriceCurrentLiter: TFDQuery;


{ Pump }

constructor Pump.Create(Connection: TFDConnection; Transction: TFDTransaction);
begin
  FConnection := Connection;
  FTransaction := Transaction;

  QueryListAll := TFDQuery.Create(nil);
  QueryPriceCurrentLiter := TFDQuery.Create(nil);

  QueryListAll.Connection := FConnection;
  QueryPriceCurrentLiter.Connection := FConnection;
end;

constructor Pump.Create;
begin
  inherited Create;
end;

destructor Pump.Destroy;
begin

  QueryListAll.Destroy;
  QueryPriceCurrentLiter.Destroy;
  inherited;
end;

procedure Pump.Inactive(Id: Integer);
begin
  try
    FConnection.Connected := False;
    FConnection.Connected := True;

    FConnection.StartTransaction;

    FConnection.ExecSQL('UPDATE TBBOMBA set STATUS = '+QuotedStr('N')+' where id = :id', [Id]);

    FConnection.Commit;
  except on e: Exception do
    begin
      FConnection.Rollback;
      showmessage('Ocorreu um erro: ' + e.Message);
    end;
  end;
end;

function Pump.ListAll: TArray<Pump>;
var
  List: TArray<Pump>;
  VPump: Pump;
  Cont: Integer;
begin
  try
    try
      FConnection.Connected := False;
      FConnection.Connected := True;

      QueryListAll.close;
      QueryListAll.SQL.Clear;
      QueryListAll.SQL.Add('SELECT ID, NUMERO, PRECO_LITRO FROM TBBOMBA WHERE STATUS = '+QuotedStr('S')+' ORDER BY NUMERO ASC');
      QueryListAll.Open;

      SetLength(List, QueryListAll.RowsAffected);

      Cont := 0;
      QueryListAll.First;
      while not QueryListAll.eof do
      begin
        VPump := Pump.Create;
        VPump.Id := QueryListAll.FieldByName('ID').AsInteger;
        VPump.Numero := QueryListAll.FieldByName('NUMERO').AsString;
        VPump.PrecoLitro := QueryListAll.FieldByName('PRECO_LITRO').AsFloat;

        List[cont] := VPump;

        Cont := Cont + 1;
        QueryListAll.Next;
      end;
    finally
      Result := List;
    end;
  except on E: Exception do
     Showmessage('Ocorreu um erro: ' + e.Message);
  end;
end;

function Pump.PriceCurrentLiter(IdPump: Integer): Real;
begin
  try
    Result := 0;

    FConnection.Connected := False;
    FConnection.Connected := True;

    QueryPriceCurrentLiter.Close;
    QueryPriceCurrentLiter.SQL.Clear;
    QueryPriceCurrentLiter.SQL.Add('SELECT FIRST 1 PRECO_LITRO FROM TBBOMBA WHERE ID = :ID');
    QueryPriceCurrentLiter.ParamByName('ID').AsInteger := IdPump;
    QueryPriceCurrentLiter.Open;

    if (QueryPriceCurrentLiter.RowsAffected > 0) then
      Result := QueryPriceCurrentLiter.FieldByName('PRECO_LITRO').AsFloat;
  except on e: Exception do
    begin
      Result := 0;
      Showmessage('Ocorreu um erro: ' + e.Message);
    end;
  end;
end;

function Pump.Save(pump: Pump): Boolean;
begin
  try
    FConnection.Connected := False;
    FConnection.Connected := True;

    FConnection.StartTransaction;

    FConnection.ExecSQL('INSERT INTO TBBOMBA (NUMERO, TANQUE_ID, PRECO_LITRO)'+
                        ' VALUES (:NUMERO, :TANQUE_ID, :PRECO_LITRO)',
                        [pump.Numero, pump.Tanque, pump.PrecoLitro]);

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

end.
