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
    FFormula: string;
    FIndent: Integer;
    FKode: string;
    FLevel: Integer;
    FNama: string;
    FPercentOf: string;
    FPNLSetting: TModPNLSetting;
    FRowStyle: string;
    FStyle: string;
    FUrutan: Integer;
  public
    class function GetTableName: String; override;
  published
    property Formula: string read FFormula write FFormula;
    property Indent: Integer read FIndent write FIndent;
    property Kode: string read FKode write FKode;
    property Level: Integer read FLevel write FLevel;
    property Nama: string read FNama write FNama;
    property PercentOf: string read FPercentOf write FPercentOf;
    [AttributeOfHeader]
    property PNLSetting: TModPNLSetting read FPNLSetting write FPNLSetting;
    property RowStyle: string read FRowStyle write FRowStyle;
    property Style: string read FStyle write FStyle;
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
    FPNLReport: TModPNLReport;
    FPNLSettingItem: TModPNLSettingItem;
  public
    class function GetTableName: String; override;
    property LastYear: Double read FLastYear write FLastYear;
    property LastYearPercent: Double read FLastYearPercent write FLastYearPercent;
  published
    property Actual: Double read FActual write FActual;
    property ActualPercent: Double read FActualPercent write FActualPercent;
    property Budget: Double read FBudget write FBudget;
    property BudgetPercent: Double read FBudgetPercent write FBudgetPercent;
    [AttributeOfHeader]
    property PNLReport: TModPNLReport read FPNLReport write FPNLReport;
    property PNLSettingItem: TModPNLSettingItem read FPNLSettingItem write
        FPNLSettingItem;
  end;

  TModPNLReport = class(TModApp)
  private
    FActionPlan: string;
    FBulan: Integer;
    FGeneralCommentary: string;
    FIssue: string;
    FItems: TObjectList<TModPNLReportItem>;
    FKeterangan: string;
    FTahun: Integer;
    FTglInput: TDatetime;
    FUnitUsaha: TModUnit;
    function GetItems: TObjectList<TModPNLReportItem>;
  public
    class function GetTableName: String; override;
    property Items: TObjectList<TModPNLReportItem> read GetItems write FItems;
  published
    property ActionPlan: string read FActionPlan write FActionPlan;
    property Bulan: Integer read FBulan write FBulan;
    property GeneralCommentary: string read FGeneralCommentary write
        FGeneralCommentary;
    property Issue: string read FIssue write FIssue;
    property Keterangan: string read FKeterangan write FKeterangan;
    property Tahun: Integer read FTahun write FTahun;
    property TglInput: TDatetime read FTglInput write FTglInput;
    property UnitUsaha: TModUnit read FUnitUsaha write FUnitUsaha;
  end;

  TModPNLSetting = class(TModApp)
  private
    FIsActive: Integer;
    FItems: TObjectList<TModPNLSettingItem>;
    FNama: string;
    FUnitUsaha: TModUnit;
    function GetItems: TObjectList<TModPNLSettingItem>;
  public
    class function GetTableName: String; override;
    property Items: TObjectList<TModPNLSettingItem> read GetItems write FItems;
  published
    property IsActive: Integer read FIsActive write FIsActive;
    property Nama: string read FNama write FNama;
    property UnitUsaha: TModUnit read FUnitUsaha write FUnitUsaha;
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
