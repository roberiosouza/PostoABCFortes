unit URSupply;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RLReport;

type
  TFRSupply = class(TForm)
    RSupply: TRLReport;
    BHeader: TRLBand;
    RLSystemInfo1: TRLSystemInfo;
    RLSystemInfo2: TRLSystemInfo;
    RLLabel1: TRLLabel;
    BTitle: TRLBand;
    RLLabel2: TRLLabel;
    BGroup: TRLGroup;
    BHGroup: TRLBand;
    RLLabel3: TRLLabel;
    RLDBText1: TRLDBText;
    BTHeader: TRLBand;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    RLLabel8: TRLLabel;
    RLBand1: TRLBand;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBText5: TRLDBText;
    RLDBText6: TRLDBText;
    RLLabel9: TRLLabel;
    BFooter: TRLBand;
    BSumary: TRLBand;
    RLDraw1: TRLDraw;
    RLLabel10: TRLLabel;
    RLDBResult1: TRLDBResult;
    RLLabel11: TRLLabel;
    RLDBText7: TRLDBText;
    RLLabel12: TRLLabel;
    RLDBResult2: TRLDBResult;
    RLLabel13: TRLLabel;
    RLDBResult3: TRLDBResult;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRSupply: TFRSupply;

implementation

uses
  DMMain;

{$R *.dfm}

end.
