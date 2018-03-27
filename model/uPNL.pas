unit uPNL;

interface

uses
  uModApp, uUnit, System.Generics.Collections;

type
  TModPNLReport = class;
  TModPNLSetting = class;
  TModPNLReportItem = class;

  TModPNLSettingItem = class(TModApp)
  private
    FIndent: Integer;
    FStyle: string;
    FKode: string;
    FNama: string;
    FFormula: string;
    FPercentOf: string;
    FLevel: Integer;
    FPNLSetting: TModPNLSetting;
    FRowStyle: string;
    FUrutan: Integer;
  public
    class function GetTableName: String; override;
  published
    property Indent: Integer read FIndent write FIndent;
    property Kode: string read FKode write FKode;
    property Nama: string read FNama write FNama;
    property Formula: string read FFormula write FFormula;
    property PercentOf: string read FPercentOf write FPercentOf;
    property Level: Integer read FLevel write FLevel;
    [AttributeOfHeader]
    property PNLSetting: TModPNLSetting read FPNLSetting write FPNLSetting;
    property Style: string read FStyle write FStyle;
    property RowStyle: string read FRowStyle write FRowStyle;
    property Urutan: Integer read FUrutan write FUrutan;
  end;

  TModPNLReportItem = class(TModApp)
  private
    FActual: Double;
    FActualPercent: Double;
    FBudget: Double;
    FBudgetPercent: Double;
    FLastYear: Double;
    FLastYearPercent: Double;
    FPNLSettingItem: TModPNLSettingItem;
    FPNLReport: TModPNLReport;
  public
    class function GetTableName: String; override;
    property LastYear: Double read FLastYear write FLastYear;
    property LastYearPercent: Double read FLastYearPercent write FLastYearPercent;
  published
    property Actual: Double read FActual write FActual;
    property ActualPercent: Double read FActualPercent write FActualPercent;
    property Budget: Double read FBudget write FBudget;
    property BudgetPercent: Double read FBudgetPercent write FBudgetPercent;
    property PNLSettingItem: TModPNLSettingItem read FPNLSettingItem write
        FPNLSettingItem;
    [AttributeOfHeader]
    property PNLReport: TModPNLReport read FPNLReport write FPNLReport;
  end;

  TModPNLReport = class(TModApp)
  private
    FBulan: Integer;
    FKeterangan: string;
    FItems: TObjectList<TModPNLReportItem>;
    FTahun: Integer;
    FTglInput: TDatetime;
    FUnitUsaha: TModUnit;
    function GetItems: TObjectList<TModPNLReportItem>;
  public
    class function GetTableName: String; override;
    property Items: TObjectList<TModPNLReportItem> read GetItems write FItems;
  published
    property Bulan: Integer read FBulan write FBulan;
    property Keterangan: string read FKeterangan write FKeterangan;
    property Tahun: Integer read FTahun write FTahun;
    property TglInput: TDatetime read FTglInput write FTglInput;
    property UnitUsaha: TModUnit read FUnitUsaha write FUnitUsaha;
  end;

  TModPNLSetting = class(TModApp)
  private
    FUnitUsaha: TModUnit;
    FIsActive: Integer;
    FItems: TObjectList<TModPNLSettingItem>;
    FNama: string;
    function GetItems: TObjectList<TModPNLSettingItem>;
  public
    class function GetTableName: String; override;
    property Items: TObjectList<TModPNLSettingItem> read GetItems write FItems;
  published
    property UnitUsaha: TModUnit read FUnitUsaha write FUnitUsaha;
    property IsActive: Integer read FIsActive write FIsActive;
    property Nama: string read FNama write FNama;
  end;

implementation


function TModPNLReport.GetItems: TObjectList<TModPNLReportItem>;
begin
  if not Assigned(FItems) then
    FItems := TObjectList<TModPNLReportItem>.Create();
  Result := FItems;
end;

{ TModPNLReport }

class function TModPNLReport.GetTableName: String;
begin
  Result := 'TPNLReport';
end;

function TModPNLSetting.GetItems: TObjectList<TModPNLSettingItem>;
begin
  if not Assigned(FItems) then
    FItems := TObjectList<TModPNLSettingItem>.Create();
  Result := FItems;
end;

{ TModPNLSetting }

class function TModPNLSetting.GetTableName: String;
begin
  Result := 'TPNLSetting';
end;

{ TModPNLReportItem }

class function TModPNLReportItem.GetTableName: String;
begin
  Result := 'TPNLReportItem';
end;

{ TModPNLSettingItem }

class function TModPNLSettingItem.GetTableName: String;
begin
  Result := 'TPNLSettingItem';
end;


initialization
  TModPNLReport.RegisterRTTI;
  TModPNLReportItem.RegisterRTTI;
  TModPNLSetting.RegisterRTTI;
  TModPNLSettingItem.RegisterRTTI;


end.
