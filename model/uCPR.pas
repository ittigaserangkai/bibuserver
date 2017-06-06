unit uCPR;

interface
uses
  uModApp, uIndikator, uUnit, System.Generics.Collections;

type
  TModCPRSetting = class;

  TModCPRSettingItem = class(TModApp)
  private
    FCPRSetting: TModCPRSetting;
    FIndikator: TModIndikator;
  public
    class function GetTableName: String; override;

  published
    [AttributeOfHeader]
    property CPRSetting : TModCPRSetting read FCPRSetting write FCPRSetting;
    property Indikator : TModIndikator read FIndikator write FIndikator;

  end;

  TModCPRSetting = class(TModApp)
  private
    FNAMA: string;
    FIsActive: Integer;
    FUnitUsaha: TModUnit;
    FCPRSettingItems: TObjectList<TModCPRSettingItem>;
    function GetCPRSettingItems: TObjectList<TModCPRSettingItem>;

  public
    class function GetTableName: String; override;

    property CPRSettingItems: TObjectList<TModCPRSettingItem> read GetCPRSettingItems write FCPRSettingItems;
  published
    property  NAMA : string read FNAMA write FNAMA;
    property  IsActive : Integer read FIsActive write FIsActive;
    property  UnitUsaha : TModUnit read FUnitUsaha write FUnitUsaha;

  end;
implementation

{ TModCPRSetting }

function TModCPRSetting.GetCPRSettingItems: TObjectList<TModCPRSettingItem>;
begin
  if FCPRSettingItems = nil then
    FCPRSettingItems := TObjectList<TModCPRSettingItem>.Create;

  Result := FCPRSettingItems;
end;

class function TModCPRSetting.GetTableName: String;
begin
  Result := 'TCPRSetting';
end;

{ TModCPRSettingItem }

class function TModCPRSettingItem.GetTableName: String;
begin
  Result := 'TCPRSettingItem';
end;

end.
