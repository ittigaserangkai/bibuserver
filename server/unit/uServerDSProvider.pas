unit uServerDSProvider;

interface
uses
  System.Classes, uModApp, uDBUtils, Rtti, Data.DB, SysUtils,
  StrUtils, System.Generics.Collections, Data.FireDACJSONReflect,
  FireDAC.Stan.Storage, FireDAC.Stan.StorageBin, uServerClasses,
  FireDAC.Comp.Client;

type
  {$METHODINFO ON}
  TDSProvider = class(TComponent)
  private
  public



  end;

  TDSReport = class(TComponent)
  private
  public
    function DO_GetDSNP(ANONP : String): TFDJSONDataSets;
    function DO_GetDS_CheckList(ANONP : String): TFDJSONDataSets;
    function SO_ByDate(StartDate, EndDate: TDateTime): TFDJSONDataSets;
    function SO_ByDateNoBukti(StartDate, EndDate: TDateTime; aNoBuktiAwal: string =
        ''; aNoBuktiAkhir: string = ''): TFDJSONDataSets;
    function PO_SLIP_ByDateNoBukti(StartDate, EndDate: TDateTime; aNoBuktiAwal:
        string = ''; aNoBuktiAkhir: string = ''): TFDJSONDataSets;
    function SO_Test: TFDJSONDataSets;
    function Test2: OleVariant;
    function Test: Variant;
  end;

  {$METHODINFO OFF}
implementation
uses
  System.DateUtils, System.Variants;



function TDSReport.DO_GetDSNP(ANONP : String): TFDJSONDataSets;
var
  S: string;
begin
  Result := TFDJSONDataSets.Create;

  S := 'SELECT * FROM V_DO_NP where DO_NP = ' + QuotedStr(ANONP);

  TFDJSONDataSetsWriter.ListAdd(Result, TDBUtils.OpenQuery(S));
end;

function TDSReport.SO_ByDate(StartDate, EndDate: TDateTime): TFDJSONDataSets;
var
  S: string;
begin
  Result := TFDJSONDataSets.Create;

  S := 'SELECT * FROM V_SO_REPORT WHERE SO_DATE BETWEEN '
  + TDBUtils.QuotDt(StartDate) + ' and ' + TDBUtils.QuotDt(EndDate);
  TFDJSONDataSetsWriter.ListAdd(Result, TDBUtils.OpenQuery(S));

  S := 'SELECT * FROM SUPLIER';
  TFDJSONDataSetsWriter.ListAdd(Result, TDBUtils.OpenQuery(S));
end;

function TDSReport.SO_ByDateNoBukti(StartDate, EndDate: TDateTime;
    aNoBuktiAwal: string = ''; aNoBuktiAkhir: string = ''): TFDJSONDataSets;
var
  S: string;
begin
  Result := TFDJSONDataSets.Create;

  S := 'SELECT * FROM V_SO_REPORT WHERE SO_DATE BETWEEN '
      + TDBUtils.QuotDt(StartDate) + ' and ' + TDBUtils.QuotDt(EndDate);

  if aNoBuktiAwal <> '' then
    S := S + ' AND SO_NO between ' + QuotedStr(aNoBuktiAwal) + ' and '
        + QuotedStr(aNoBuktiAkhir);

  S := S + ' order by so_no, sup_code';

  TFDJSONDataSetsWriter.ListAdd(Result, TDBUtils.OpenQuery(S));

end;

function TDSReport.DO_GetDS_CheckList(ANONP: String): TFDJSONDataSets;
var
  s : string;
begin
  Result := TFDJSONDataSets.Create;

  S := 'SELECT * FROM V_CHECKLIST_DO where DO_NP = ' + QuotedStr(ANONP);

  TFDJSONDataSetsWriter.ListAdd(Result, TDBUtils.OpenQuery(S));
end;

function TDSReport.PO_SLIP_ByDateNoBukti(StartDate, EndDate: TDateTime;
    aNoBuktiAwal: string = ''; aNoBuktiAkhir: string = ''): TFDJSONDataSets;
var
  S: string;
begin
  Result := TFDJSONDataSets.Create;

  S := 'SELECT * FROM V_PO_SLIP WHERE PO_DATE BETWEEN '
      + TDBUtils.QuotDShort(StartDate) + ' and ' + TDBUtils.QuotDShort(EndDate);

  if aNoBuktiAwal <> '' then
    S := S + ' AND PO_NO between ' + QuotedStr(aNoBuktiAwal) + ' and '
        + QuotedStr(aNoBuktiAkhir);

  S := S + ' order by PO_NO';

  TFDJSONDataSetsWriter.ListAdd(Result, TDBUtils.OpenQuery(S));

end;

function TDSReport.SO_Test: TFDJSONDataSets;
var
  S: string;
begin
  Result := TFDJSONDataSets.Create;

//  S := 'SELECT * FROM V_SO_REPORT';
//  TFDJSONDataSetsWriter.ListAdd(Result, TDBUtils.OpenMemTable(S));

  S := 'SELECT 1 AS CONTOH';
  TFDJSONDataSetsWriter.ListAdd(Result, TDBUtils.OpenQuery(S));
end;

function TDSReport.Test2: OleVariant;
begin
  Result := VarArrayCreate([0, 2], varVariant);
end;

function TDSReport.Test: Variant;
begin
  Result := 'Wtf';
end;

end.
