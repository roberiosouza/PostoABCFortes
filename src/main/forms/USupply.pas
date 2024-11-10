unit USupply;

interface

uses
  Winapi.Windows, Winapi.Messages, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls,
  FRRegistrations, Vcl.ComCtrls;

type
  TFSupply = class(TForm)
    edtMaskDate: TMaskEdit;
    Label1: TLabel;
    Label2: TLabel;
    cbEmployee: TComboBox;
    Label3: TLabel;
    cbPump: TComboBox;
    Label4: TLabel;
    edtQuantLiters: TEdit;
    Label5: TLabel;
    pnlPercImpost: TPanel;
    Label6: TLabel;
    pnlPriceCurrentLiter: TPanel;
    Label7: TLabel;
    pnlTotal: TPanel;
    FRCRUD1: TFRCRUD;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FRCRUD1btnCancelClick(Sender: TObject);
    procedure cbPumpChange(Sender: TObject);
    procedure edtQuantLitersKeyPress(Sender: TObject; var Key: Char);
    procedure edtQuantLitersExit(Sender: TObject);
    procedure FRCRUD1btnSaveClick(Sender: TObject);
  private
    { Private declarations }
    procedure InitCbPump();
    procedure InitCbEmployee();
    procedure InitPecImpost();
    procedure GetPriceCurrentLiter(IdPump: Integer);
    procedure CalcTotal();
  public
    { Public declarations }
  end;

var
  FSupply: TFSupply;

implementation

uses
  CPump, DMMain, CEmployee, CConfig, CSupply, System.SysUtils;

var
  PercImpost, LiterValue, Total: Real;

{$R *.dfm}

procedure TFSupply.CalcTotal;
var
  QuantLiter, TotalGross: Real;
begin
  QuantLiter := StrToFloat(edtQuantLiters.Text);
  TotalGross := (QuantLiter * LiterValue);

  Total := TotalGross - ((PercImpost/100) * TotalGross);
  pnlTotal.Caption := FloatToStr(Total);
end;

procedure TFSupply.cbPumpChange(Sender: TObject);
begin
  GetPriceCurrentLiter(1);
  pnlPriceCurrentLiter.Caption := FloatToStr(LiterValue);
  CalcTotal();
end;

procedure TFSupply.edtQuantLitersExit(Sender: TObject);
begin
  CalcTotal();
end;

procedure TFSupply.edtQuantLitersKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
    keybd_event(VK_TAB,0,0,0);
end;

procedure TFSupply.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FSupply := nil;
  Action := caFree;
end;

procedure TFSupply.FormCreate(Sender: TObject);
begin
  edtMaskDate.Text := DateToStr(Date);
  InitCbPump();
  InitCbEmployee();
  InitPecImpost();
end;

procedure TFSupply.FRCRUD1btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TFSupply.FRCRUD1btnSaveClick(Sender: TObject);
begin
  try
    // Cria o objeto a ser salvo
    DM.Supply := Supply.Create(DM.FDCon, DM.FDTransaction);
    DM.Supply.DataAbastecimento := StrToDate(edtMaskDate.Text);
    DM.Supply.Frentista := 1;  // Ajustar Combobox
    DM.Supply.Bomba := 1;  // Ajustar Combobox
    DM.Supply.QuantLitros := StrToFloat(edtQuantLiters.Text);  //Usar um helper aqui
    DM.Supply.PercImposto := PercImpost;
    DM.Supply.RSTotalBruto := (StrToFloat(edtQuantLiters.Text) * LiterValue);
    DM.Supply.RSTotalLiquido := Total;

    // Executa o método para salvar e se retorno TRUE informa ao usuário sucesso
    if (DM.Supply.Save(DM.Supply)) then
      Application.MessageBox('Abastecimento salvo com sucesso!', 'Aviso', MB_ICONINFORMATION+MB_OK);
  finally
    Close;
  end;
end;

procedure TFSupply.GetPriceCurrentLiter(IdPump: Integer);
var
  VPump: Pump;
begin
  try
    VPump := Pump.Create(DM.FDCon, DM.FDTransaction);
    LiterValue := VPump.PriceCurrentLiter(IdPump);
  finally
    FreeAndNil(VPump);
  end;
end;

procedure TFSupply.InitCbEmployee;
var
  ListEmployees: TArray<Employee>;
  VEmployee: Employee;
  I: Integer;
begin
  try
    VEmployee := Employee.Create(DM.FDCon, DM.FDTransaction);

    SetLength(ListEmployees, Length(VEmployee.ListAll));
    ListEmployees := VEmployee.ListAll;

    cbEmployee.Items.Clear;

    for I:= 0 to Length(ListEmployees)-1 do
    begin
      cbEmployee.Items.Add(ListEmployees[I].Id.ToString + '-' + ListEmployees[I].Nome);
    end;

  finally
    FreeAndNil(VEmployee);
  end;
end;

procedure TFSupply.InitCbPump;
var
  ListPumps: TArray<Pump>;
  VPump: Pump;
  I: Integer;
begin
  try
    VPump := Pump.Create(DM.FDCon, DM.FDTransaction);

    SetLength(ListPumps, Length(VPump.ListAll));
    ListPumps := VPump.ListAll;

    cbPump.Items.Clear;

    for I:= 0 to Length(ListPumps)-1 do
    begin
      cbPump.Items.Add(ListPumps[I].Numero);
    end;

  finally
    FreeAndNil(VPump);
  end;
end;

procedure TFSupply.InitPecImpost;
var
  VConfig: Config;
begin
  try
    VConfig := Config.Create(DM.FDCon, DM.FDTransaction);

    PercImpost := VConfig.PecentCurrent();
    pnlPercImpost.Caption := FloatToStr(PercImpost);     // Adicionar um Helper No Panel

  finally
    FreeAndNil(VConfig);
  end;
end;

end.
