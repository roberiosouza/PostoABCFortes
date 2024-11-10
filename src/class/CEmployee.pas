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
      constructor Create(Connection : TFDConnection; Transction: TFDTransaction); overload;
      constructor Create; overload;
      destructor Destroy; Override;

      property Conection: TFDConnection read FConnection write FConnection;
      property Transaction: TFDTransaction read FTransaction write FTransaction;
      property Id: Integer read FId write FId;
      property Nome: String read FNome write FNome;
      property Status: Char read FStatus write FStatus;

      procedure inactive(id: Integer);
      function save(employee: Employee): Boolean;
      function ListAll(): TArray<Employee>;
  end;

implementation

uses
  Vcl.Dialogs, System.SysUtils;

var
  QueryListAll: TFDQuery;

{ Employee }

constructor Employee.Create(Connection: TFDConnection; Transction: TFDTransaction);
begin
  FConnection := Connection;
  FTransaction := Transaction;

  QueryListAll := TFDQuery.Create(nil);
  QueryListAll.Connection := FConnection;
end;

constructor Employee.Create;
begin
  inherited Create;
end;

destructor Employee.Destroy;
begin

  QueryListAll.Destroy;
  inherited;
end;

procedure Employee.Inactive(id: Integer);
begin
  try
    FConnection.Connected := False;
    FConnection.Connected := True;

    FConnection.StartTransaction;

    FConnection.ExecSQL('UPDATE TBFUNCIONARIO set STATUS = '+QuotedStr('N')+' where id = :id', [id]);

    FConnection.Commit;
  except on e: Exception do
    begin
      FConnection.Rollback;
      showmessage('Ocorreu um erro: ' + e.Message);
    end;
  end;
end;

function Employee.ListAll: TArray<Employee>;
var
  List: TArray<Employee>;
  VEmployee: Employee;
  Cont: Integer;
begin
  try
    try
      FConnection.Connected := False;
      FConnection.Connected := True;

      QueryListAll.close;
      QueryListAll.SQL.Clear;
      QueryListAll.SQL.Add('SELECT ID, NOME FROM TBFUNCIONARIO WHERE STATUS = '+QuotedStr('S')+' ORDER BY NOME ASC');
      QueryListAll.Open;

      SetLength(List, QueryListAll.RowsAffected);

      Cont := 0;
      QueryListAll.First;
      while not QueryListAll.eof do
      begin
        VEmployee := Employee.Create;
        VEmployee.Id := QueryListAll.FieldByName('ID').AsInteger;
        VEmployee.Nome := QueryListAll.FieldByName('NOME').AsString;

        List[cont] := VEmployee;

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

function Employee.Save(employee: Employee): Boolean;
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
      Showmessage('Ocorreu um erro: ' + e.Message);
    end;
  end;
end;

end.
