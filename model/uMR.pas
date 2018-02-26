unit uMR;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls, Forms, Dialogs,
  uModApp, uMRGroupReport, System.Generics.Collections, uUnit;

type
  TModMRItem = class;
  TModMR = class(TModApp)
  private
    FBulan: Integer;
    FGroupReport: TModMRGroupReport;
    FKeterangan: string;
    FMRItems: TObjectList<TModMRItem>;
    FStrategeySolusi: string;
    FTahun: Integer;
    FTglInput: TDatetime;
    FUnitUsaha: TModUnit;
    function GetMRItems: TObjectList<TModMRItem>;
  published
    property Bulan: Integer read FBulan write FBulan;
    property GroupReport: TModMRGroupReport read FGroupReport write FGroupReport;
    property Keterangan: string read FKeterangan write FKeterangan;
    property MRItems: TObjectList<TModMRItem> read GetMRItems write FMRItems;
    property StrategeySolusi: string read FStrategeySolusi write FStrategeySolusi;
    property Tahun: Integer read FTahun write FTahun;
    property TglInput: TDatetime read FTglInput write FTglInput;
    property UnitUsaha: TModUnit read FUnitUsaha write FUnitUsaha;
  end;

  TModMRItem = class(TModApp)
  private
    FActual: Double;
    FGroupReport: TModMRGroupReport;
    FMR: TModMR;
    FTarget: Double;
  published
    property Actual: Double read FActual write FActual;
    property GroupReport: TModMRGroupReport read FGroupReport write FGroupReport;
    property MR: TModMR read FMR write FMR;
    property Target: Double read FTarget write FTarget;
  end;


implementation

{
************************************************************ TModMR ************************************************************
}
function TModMR.GetMRItems: TObjectList<TModMRItem>;
begin
  Result := FMRItems;
end;

initialization
  TModMR.RegisterRTTI;


end.
