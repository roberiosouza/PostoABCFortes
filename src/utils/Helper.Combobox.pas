unit Helper.Combobox;

interface

uses
  Vcl.StdCtrls;

type
  HelperCombobox = class helper for TCombobox
     function RemovePrefixTank(): Integer;
  end;

implementation

uses
  System.SysUtils;

const
  PREFIX_TANK = 'TQ-';

{ HelperCombobox }

function HelperCombobox.RemovePrefixTank: Integer;
var
  PosEspace: Integer;
  Text: string;
begin
  PosEspace := Pos(' ', Self.Text);

  if PosEspace > 0 then
    Text := Copy(Self.Text, 1, PosEspace - 1)
  else
    Text := Self.Text;

  Result := StrToInt(Text);
end;

end.
