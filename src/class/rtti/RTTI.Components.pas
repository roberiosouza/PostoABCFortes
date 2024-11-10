unit RTTI.Components;

interface

uses
  System.SysUtils, System.Classes, System.Rtti, Vcl.StdCtrls;

type
  RTTIComponents = class
    private
    public
      class function GetTextFromComponent(const AComponent: TComponent): String;
  end;

implementation

{ RTTIComponents }

class function RTTIComponents.GetTextFromComponent(
  const AComponent: TComponent): String;
begin
  Result := '';
  if (AComponent is TEdit) then
    Result := TEdit(AComponent).Text
  else if (AComponent is TComboBox) then
    Result := TComboBox(AComponent).Text;
end;

end.
