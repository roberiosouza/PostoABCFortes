unit UUtils;

interface

uses System.Rtti, RTTI.NotEmpty;

type
  Utils = class
    private
    public
      constructor Create(); overload;
      function validate(AClass: TClass; const AObject: TObject): Boolean;
  end;

implementation

{ Utils }

constructor Utils.Create;
begin
  inherited Create;
end;

function Utils.validate(AClass: TClass; const AObject: TObject): Boolean;
var
  VRttiContext: TRttiContext;
  VRttiType: TRttiType;
  VRttiField: TRttiField;
  VCustomAttribute: TCustomAttribute;
begin
  VRttiContext := VRttiContext.Create;
  try
    VRttiType := VRttiContext.GetType(AClass);

    for VRttiField in VRttiType.GetFields do
    begin
      for VCustomAttribute in VRttiField.GetAttributes do
      begin
        if (VCustomAttribute is NotEmpty) then
        begin
          NotEmpty(VCustomAttribute).validate(VRttiField, AObject);
        end;

      end;
    end;
    Result := True;
  finally
    VRttiContext.Free;
  end;
end;

end.
