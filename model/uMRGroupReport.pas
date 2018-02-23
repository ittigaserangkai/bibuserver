unit uMRGroupReport;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls, Forms, Dialogs,
  uModApp, uUnit;

type
  TModMRGroupReport = class;
  TModMRItemReport = class(TModApp)
  private
    FGroupReport: TModMRGroupReport;
    FKode: string;
    FNama: string;
    FUnitUsaha: TModUnit;
  protected
  public
    class function GetTableName: string; override;
  published
    [AttributeOfForeign]
    property GroupReport: TModMRGroupReport read FGroupReport write FGroupReport;
    [AttributeOfCode]
    property Kode: string read FKode write FKode;
    property Nama: string read FNama write FNama;
    [AttributeOfForeign]
    property UnitUsaha: TModUnit read FUnitUsaha write FUnitUsaha;
  end;

  TModMRGroupReport = class(TModApp)
  private
    FKode: string;
    FNama: string;
  public
    class function GetTableName: string; override;
  published
    [AttributeOfCode]
    property Kode: string read FKode write FKode;
    property Nama: string read FNama write FNama;
  end;


implementation

{ TModMRGroupReport }

{
****************************************************** TModMRGroupReport ******************************************************
}
class function TModMRGroupReport.GetTableName: string;
begin
  Result := 'TMRGroupReport';
end;

{ TModMRItemReport }

{
****************************************************** TModMRItemReport ******************************************************
}
class function TModMRItemReport.GetTableName: string;
begin
  Result := 'TMRItemReport';
end;

initialization
  TModMRGroupReport.RegisterRTTI;
  TModMRItemReport.RegisterRTTI;
end.
