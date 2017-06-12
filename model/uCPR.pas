unit uCPR;

interface
uses
  uModApp, uIndikator, uUnit, System.Generics.Collections;

type
  TModCPRSetting = class;
  TModCPRItem = class;

  TModCPRSettingItem = class(TModApp)
  private
    FCPRSetting: TModCPRSetting;
    FIndikator: TModIndikator;
  public
    [AttributeOfHeader]
    class function GetTableName: string; override;
  published
    [AttributeOfHeader]
    property CPRSetting: TModCPRSetting read FCPRSetting write FCPRSetting;
    property Indikator: TModIndikator read FIndikator write FIndikator;
  end;

  TModCPRSetting = class(TModApp)
  private
    FCPRSettingItems: TObjectList<TModCPRSettingItem>;
    FIsActive: Integer;
    FNAMA: string;
    FUnitUsaha: TModUnit;
    function GetCPRSettingItems: TObjectList<TModCPRSettingItem>;
  public
    class function GetTableName: string; override;
    property CPRSettingItems: TObjectList<TModCPRSettingItem> read
        GetCPRSettingItems write FCPRSettingItems;
  published
    property IsActive: Integer read FIsActive write FIsActive;
    property NAMA: string read FNAMA write FNAMA;
    property UnitUsaha: TModUnit read FUnitUsaha write FUnitUsaha;
  end;

  TModCPR = class(TModApp)
  private
    FBulan: Integer;
    FCPRItems: TObjectList<TModCPRItem>;
    FCrusialIssues: string;
    FMinggu: Integer;
    FStrategySolusi: string;
    FTahun: Integer;
    FTanggalInput: TDatetime;
    FUnitUsaha: TModUnit;
    function GetCPRItems: TObjectList<TModCPRItem>;
  public
    [AttributeOfHeader]
    class function GetTableName: string; override;
    property CPRItems: TObjectList<TModCPRItem> read GetCPRItems write FCPRItems;
  published
    property Bulan: Integer read FBulan write FBulan;
    property CrusialIssues: string read FCrusialIssues write FCrusialIssues;
    property Minggu: Integer read FMinggu write FMinggu;
    property StrategySolusi: string read FStrategySolusi write FStrategySolusi;
    property Tahun: Integer read FTahun write FTahun;
    property TanggalInput: TDatetime read FTanggalInput write FTanggalInput;
    property UnitUsaha: TModUnit read FUnitUsaha write FUnitUsaha;
  end;

  TModCPRItem = class(TModApp)
  private
    FActual: Double;
    FActual_LY: Double;
    FCPR: TModCPR;
    FIndikator: TModIndikator;
    FJustifikasi: string;
    FTarget: Double;
  public
    [AttributeOfHeader]
    class function GetTableName: string; override;
  published
    property Actual: Double read FActual write FActual;
    property Actual_LY: Double read FActual_LY write FActual_LY;
    [AttributeOfHeader]
    property CPR: TModCPR read FCPR write FCPR;
    property Indikator: TModIndikator read FIndikator write FIndikator;
    property Justifikasi: string read FJustifikasi write FJustifikasi;
    property Target: Double read FTarget write FTarget;
  end;

implementation

{ TModCPRSetting }

{
******************************************************** TModCPRSetting ********************************************************
}
function TModCPRSetting.GetCPRSettingItems: TObjectList<TModCPRSettingItem>;
begin
  if FCPRSettingItems = nil then
    FCPRSettingItems := TObjectList<TModCPRSettingItem>.Create;

  Result := FCPRSettingItems;
end;

class function TModCPRSetting.GetTableName: string;
begin
  Result := 'TCPRSetting';
end;

{
************************************************************* TModCPR *************************************************************
}
function TModCPR.GetCPRItems: TObjectList<TModCPRItem>;
begin
  if FCPRItems = nil then
    FCPRItems := TObjectList<TModCPRItem>.Create;

  Result := FCPRItems;
end;

{ TModCPR }

{
****************************************************** TModCPR ******************************************************
}
class function TModCPR.GetTableName: string;
begin
  Result := 'TCPR';
end;

{ TModCPRSettingItem }

{
****************************************************** TModCPRSettingItem ******************************************************
}
class function TModCPRSettingItem.GetTableName: string;
begin
  Result := 'TCPRSettingItem';
end;

{ TModCPRItem }

{
****************************************************** TModCPRItem ******************************************************
}
class function TModCPRItem.GetTableName: string;
begin
  Result := 'TCPRItem';
end;

initialization
  TModCPR.RegisterRTTI;
  TModCPRItem.RegisterRTTI;
  TModCPRSetting.RegisterRTTI;
  TModCPRSettingItem.RegisterRTTI;

end.
