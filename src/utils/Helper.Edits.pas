unit Helper.Edits;

interface

uses
  Vcl.StdCtrls;

type
  EditHelper = class helper for TEdit
    function RemovePoint(): string;
    function AddPrefixTank(): string;
  end;

implementation

const
  PREFIX_TANK = 'TQ-';

{ EditHelper }

function EditHelper.RemovePoint: string;
var
  I: Integer;
  Text: string;
begin
  Text := '';
  for I := 1 to Length(Self.Text) do
  begin
    if (Self.Text[I] in ['0'..'9', ',']) then
      Text := Text + Self.Text[I];
  end;

  Result := Text;
end;

function EditHelper.AddPrefixTank: string;
begin
  Result := PREFIX_TANK + Self.Text;
end;

end.
