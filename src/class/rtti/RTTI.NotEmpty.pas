unit RTTI.NotEmpty;

interface

uses
  System.SysUtils, System.Classes, System.Rtti, RTTI.Components, Vcl.StdCtrls;

type
  NotEmpty = class(TCustomAttribute)
    private
    public
      procedure validate(const ARttiField: TRttiField; const AObject: TObject);
  end;

implementation

uses
  Vcl.Dialogs;

const
  MSG = 'Campo Obrigatório!';


{ NotEmpty }

procedure NotEmpty.validate(const ARttiField: TRttiField;
  const AObject: TObject);
var
  VComponent: TComponent;
  VText: string;
begin
  VComponent := (ARttiField.GetValue(AObject).AsObject as TComponent);
  VText := RTTIComponents.GetTextFromComponent(VComponent);

  if (VText.Trim.IsEmpty) then
  begin
    if (VComponent is TEdit) then
      TEdit(VComponent).SetFocus
    else if (VComponent is TComboBox) then
      TComboBox(VComponent).SetFocus;

    raise Exception.Create(MSG);
  end;
  
end;

end.
