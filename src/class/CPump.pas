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
      constructor Create(Connection : TFDConnection; Transction: TFDTransaction);
      destructor Destroy; Override;

      property Conection: TFDConnection read FConnection write FConnection;
      property Transaction: TFDTransaction read FTransaction write FTransaction;
      property Id: Integer read FId write FId;
      property Numero: String read FNumero write FNumero;
      property Tanque: Integer read FTanque write FTanque;
      property PrecoLitro: Real read FPrecoLitro write FPrecoLitro;
      property Status: Char read FStatus write FStatus;

      procedure Inactive(id: Integer);
      function Save(pump: Pump): Boolean;
  end;

implementation

uses
  System.SysUtils, Vcl.Dialogs;

{ Pump }

constructor Pump.Create(Connection: TFDConnection; Transction: TFDTransaction);
begin
  FConnection := Connection;
  FTransaction := Transaction;
end;

destructor Pump.Destroy;
begin

  inherited;
end;

procedure Pump.Inactive(id: Integer);
begin
  try
    FConnection.Connected := False;
    FConnection.Connected := True;

    FConnection.StartTransaction;

    FConnection.ExecSQL('UPDATE TBBOMBA set STATUS = '+QuotedStr('N')+' where id = :id', [id]);

    FConnection.Commit;
  except on e: Exception do
    begin
      FConnection.Rollback;
      showmessage('Ocorreu um erro: ' + e.Message);
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
      showmessage('Ocorreu um erro: ' + e.Message);
    end;
  end;
end;

end.
