unit CEmployee;

interface

uses
  FireDAC.Comp.Client;

Type

  Employee = class

    private
      FConnection: TFDConnection;
      FTransaction: TFDTransaction;
      FId: Integer;
      FNome: String;
      FStatus: Char;

    public
      constructor Create(Connection : TFDConnection; Transction: TFDTransaction);
      destructor Destroy; Override;

      property Conection: TFDConnection read FConnection write FConnection;
      property Transaction: TFDTransaction read FTransaction write FTransaction;
      property Id: Integer read FId write FId;
      property Nome: String read FNome write FNome;
      property Status: Char read FStatus write FStatus;

      procedure inactive(id: Integer);
      function save(employee: Employee): Boolean;
  end;

implementation

uses
  Vcl.Dialogs, System.SysUtils;

{ Employee }

constructor Employee.Create(Connection: TFDConnection; Transction: TFDTransaction);
begin
  FConnection := Connection;
  FTransaction := Transaction;
end;

destructor Employee.Destroy;
begin

  inherited;
end;

procedure Employee.inactive(id: Integer);
begin
  try
    FConnection.StartTransaction;

    FConnection.Connected := False;
    FConnection.Connected := True;

    FConnection.ExecSQL('UPDATE TBFUNCIONARIO set STATUS = '+QuotedStr('N')+' where id = :id', [id]);

    FConnection.Commit;
  except on e: Exception do
    begin
      FConnection.Rollback;
      showmessage('Ocorreu um erro: ' + e.Message);
    end;
  end;
end;

function Employee.save(employee: Employee): Boolean;
begin
  try
    FConnection.Connected := False;
    FConnection.Connected := True;

    FConnection.StartTransaction;

    FConnection.ExecSQL('INSERT INTO TBFUNCIONARIO (NOME) VALUES (:NOME) ', [employee.Nome]);

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
