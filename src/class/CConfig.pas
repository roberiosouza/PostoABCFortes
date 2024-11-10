unit CConfig;

interface

uses
  FireDAC.Comp.Client, FireDAC.DApt, System.Classes;

type
  Config = class

  private
    FConnection: TFDConnection;
    FTransaction: TFDTransaction;
    FId: Integer;
    FPercImposto: Real;

  public
    constructor Create(Connection : TFDConnection; Transction: TFDTransaction); overload;
    constructor Create(); overload;

    destructor Destroy; Override;

    property Conection: TFDConnection read FConnection write FConnection;
    property Transaction: TFDTransaction read FTransaction write FTransaction;
    property Id: Integer read FId write FId;
    property PercImposto: Real read FPercImposto write FPercImposto;

    function SaveUpdate(config: Config): Boolean;
    function PercConfigurated(): Boolean;
    function PecentCurrent(): Real;
  end;

implementation

uses
  System.SysUtils, Vcl.Dialogs;

var
  QueryConfig: TFDQuery;

{ Config }

constructor Config.Create(Connection: TFDConnection;
  Transction: TFDTransaction);
begin
  FConnection := Connection;
  FTransaction := Transaction;

  QueryConfig := TFDQuery.Create(nil);
  QueryConfig.Connection := FConnection;
end;

constructor Config.Create();
begin
  inherited Create;
end;

destructor Config.Destroy;
begin

  QueryConfig.Destroy;
  inherited;
end;

function Config.PecentCurrent: Real;
begin
  try
    Result := 0;

    FConnection.Connected := False;
    FConnection.Connected := True;

    QueryConfig.Close;
    QueryConfig.SQL.Clear;
    QueryConfig.SQL.Add('SELECT FIRST 1 ID, PERC_IMPOSTO FROM TBCONFIG');
    QueryConfig.Open;

    if (QueryConfig.RowsAffected > 0) then
      Result := QueryConfig.FieldByName('PERC_IMPOSTO').AsFloat;
  except on e: Exception do
    begin
      Result := 0;
      Showmessage('Ocorreu um erro: ' + e.Message);
    end;
  end;
end;

function Config.PercConfigurated: Boolean;
begin
  try
    Result := False;

    FConnection.Connected := False;
    FConnection.Connected := True;

    QueryConfig.Close;
    QueryConfig.SQL.Clear;
    QueryConfig.SQL.Add('SELECT FIRST 1 ID FROM TBCONFIG');
    QueryConfig.Open;

    if (QueryConfig.RowsAffected > 0) then
      Result := True;
  except on e: Exception do
    begin
      Result := False;
      Showmessage('Ocorreu um erro: ' + e.Message);
    end;
  end;
end;

function Config.SaveUpdate(config: Config): Boolean;
begin
  try
    FConnection.Connected := False;
    FConnection.Connected := True;

    FConnection.StartTransaction;

    if (PercConfigurated()) then
      FConnection.ExecSQL('UPDATE TBCONFIG SET PERC_IMPOSTO=:PERC_IMPOSTO',
                        [config.PercImposto])
    else
      FConnection.ExecSQL('INSERT INTO TBCONFIG (PERC_IMPOSTO)'+
                          ' VALUES (:PERC_IMPOSTO)',
                          [config.PercImposto]);

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
