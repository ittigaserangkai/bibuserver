unit uUser;

interface
uses
  uModApp, uUnit, System.Generics.Collections;

type
  TModUser = class;

  TModUserUnit = class(TModApp)
  private
    FUSER: TModUser;
    FUSERUNIT: TModUnit;
  public
    class function GetTableName: String; override;
  published
    [AttributeOfHeader('UserID')]
    property USER: TModUser read FUSER write FUSER;
    property USERUNIT: TModUnit read FUSERUNIT write FUSERUNIT;

  end;

  TModUser = class(TModApp)
  private
    FUNITS: TObjectList<TModUserUnit>;
    FISADMIN: Integer;
    FPASSWORD: string;
    FUSERNAME: string;
    function GetUNITS: TObjectList<TModUserUnit>;
  public
    class function GetTableName: String; override;
    property UNITS: TObjectList<TModUserUnit> read GetUNITS write FUNITS;
  published
    property ISADMIN: Integer read FISADMIN write FISADMIN;
    property PASSWORD: string read FPASSWORD write FPASSWORD;
    [AttributeOfCode]
    property USERNAME: string read FUSERNAME write FUSERNAME;

  end;

implementation


{
************************************************************* TModUser *************************************************************
}
function TModUser.GetUNITS: TObjectList<TModUserUnit>;
begin
  if FUNITS = nil then
    FUNITS := TObjectList<TModUserUnit>.Create;

  Result := FUNITS;
end;

{ TModUser }

class function TModUser.GetTableName: String;
begin
  Result := 'TUser';
end;

{ TModUserUnit }

class function TModUserUnit.GetTableName: String;
begin
  Result := 'TUserUnit';
end;

initialization
  TModUser.RegisterRTTI;
  TModUserUnit.RegisterRTTI;
end.
