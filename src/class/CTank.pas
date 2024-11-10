unit CTank;

interface

uses
  FireDAC.Comp.Client, FireDAC.DApt, System.Classes;

type
  Tank = class

    private
      FConnection: TFDConnection;
      FTransaction: TFDTransaction;
      FId: Integer;
      FNumero: string;
      FTipoCombustivel: String;
      FCapacidadeLitros: Real;
      FStatus: Char;

    public
      constructor Create(Connection : TFDConnection; Transction: TFDTransaction); overload;
      constructor Create(AOwner: TComponent); overload;

      destructor Destroy; Override;

      property Conection: TFDConnection read FConnection write FConnection;
      property Transaction: TFDTransaction read FTransaction write FTransaction;
      property Id: Integer read FId write FId;
      property Numero: String read FNumero write FNumero;
      property TipoCombustivel: String read FTipoCombustivel write FTipoCombustivel;
      property CapacidadeLitros: Real read FCapacidadeLitros write FCapacidadeLitros;
      property Status: Char read FStatus write FStatus;

      procedure Inactive(id: Integer);
      function Save(tank: Tank): Boolean;
      function ListAll(): TArray<Tank>;
  end;

implementation

uses
  System.SysUtils, Vcl.Dialogs;

var
  QueryListAll: TFDQuery;


{ Tank }

constructor Tank.Create(Connection: TFDConnection; Transction: TFDTransaction);
begin
  FConnection := Connection;
  FTransaction := Transaction;

  QueryListAll := TFDQuery.Create(nil);
  QueryListAll.Connection := FConnection;
end;

constructor Tank.Create(AOwner: TComponent);
begin
  inherited Create;
end;

destructor Tank.Destroy;
begin

  QueryListAll.Destroy;
  inherited;
end;

procedure Tank.Inactive(id: Integer);
begin
  try
    FConnection.Connected := False;
    FConnection.Connected := True;

    FConnection.StartTransaction;

    FConnection.ExecSQL('UPDATE TBTANQUE set STATUS = '+QuotedStr('N')+' where id = :id', [id]);

    FConnection.Commit;
  except on e: Exception do
    begin
      FConnection.Rollback;
      showmessage('Ocorreu um erro: ' + e.Message);
    end;
  end;
end;

function Tank.ListAll: TArray<Tank>;
var
  List: TArray<Tank>;
  VTank: Tank;
  Cont: Integer;
begin
  try
    try
      FConnection.Connected := False;
      FConnection.Connected := True;

      QueryListAll.close;
      QueryListAll.SQL.Clear;
      QueryListAll.SQL.Add('SELECT ID, NUMERO FROM TBTANQUE WHERE STATUS = '+QuotedStr('S')+' ORDER BY NUMERO ASC');
      QueryListAll.Open;

      SetLength(List, QueryListAll.RowsAffected);

      Cont := 0;
      QueryListAll.First;
      while not QueryListAll.eof do
      begin
        VTank := Tank.Create;
        VTank.Id := QueryListAll.FieldByName('ID').AsInteger;
        VTank.Numero := QueryListAll.FieldByName('NUMERO').AsString;

        List[cont] := VTank;

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

function Tank.Save(tank: Tank): Boolean;
begin
  try
    FConnection.Connected := False;
    FConnection.Connected := True;

    FConnection.StartTransaction;

    FConnection.ExecSQL('INSERT INTO TBTANQUE (NUMERO, TIPO_COMBUSTIVEL, CAPACIDADE_LITROS)'+
                        ' VALUES (:NUMERO, :TIPO_COMBUSTIVEL, :CAPACIDADE_LITROS)',
                        [tank.Numero, tank.TipoCombustivel, tank.CapacidadeLitros]);

    FConnection.Commit;
    Result := True;
  except on e: Exception do
    begin
      FConnection.Rollback;
      Result := False;
      showmessage('Ocorreu um erro: ' + e.Message);
    end;
  end;
end;

end.
