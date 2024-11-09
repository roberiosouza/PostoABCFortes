unit CTank;

interface

uses
  FireDAC.Comp.Client;

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
      constructor Create(Connection : TFDConnection; Transction: TFDTransaction);
      destructor Destroy; Override;

      property Conection: TFDConnection read FConnection write FConnection;
      property Transaction: TFDTransaction read FTransaction write FTransaction;
      property Id: Integer read FId write FId;
      property Numero: String read FNumero write FNumero;
      property TipoCombustivel: String read FTipoCombustivel write FTipoCombustivel;
      property CapacidadeLitros: Real read FCapacidadeLitros write FCapacidadeLitros;
      property Status: Char read FStatus write FStatus;

      procedure inactive(id: Integer);
      function save(tank: Tank): Boolean;
  end;

implementation

uses
  System.SysUtils, Vcl.Dialogs;

{ Tank }

constructor Tank.Create(Connection: TFDConnection; Transction: TFDTransaction);
begin
  FConnection := Connection;
  FTransaction := Transaction;
end;

destructor Tank.Destroy;
begin

  inherited;
end;

procedure Tank.inactive(id: Integer);
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

function Tank.save(tank: Tank): Boolean;
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
