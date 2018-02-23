unit uServerDSProvider;

interface
uses
  System.Classes, uModApp, uDBUtils, Rtti, Data.DB, SysUtils,
  StrUtils, System.Generics.Collections, Data.FireDACJSONReflect,
  FireDAC.Stan.Storage, FireDAC.Stan.StorageBin, uServerClasses,
  FireDAC.Comp.Client, uUser;

type
  {$METHODINFO ON}
  TDSProvider = class(TComponent)
  private
  public
    function Indikator_GetDS: TDataSet;
    function IndikatorByUnit_GetDS(aUnit: String): TDataSet;
    function LoadCPRByUnit(aUnit: string; aBulan, aTahun: Integer): TDataSet;
    function Unit_GetDS: TDataSet;
    function Indikator_GetDSLookup: TDataSet;
    function Unit_GetDSLookup: TDataSet;
    function Indikator_GetDSOverview: TDataSet;
    function CPRSetting_GetDSLookup: TDataSet;
    function CPR_GetDSLookup: TDataSet;
    function Unit_GetDSOverview: TDataSet;
    function CPRSetting_GetDSOverview: TDataSet;
    function MRGroup_GetDSOverview: TDataSet;
    function CPR_GetDSOverview: TDataSet;
    function Embedded_GetDS: TDataSet;
    function MRGroup_GetDSLookUp: TDataSet;
    function MRGroupItem_GetDSLookUp: TDataSet;
    function MRGroupItem_GetDSOverview: TDataSet;
    function User_GetDS: TDataSet;



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

function TDSProvider.Indikator_GetDS: TDataSet;
var
  S: string;
begin
  S := 'Select * from TIndikator';
  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.IndikatorByUnit_GetDS(aUnit: String): TDataSet;
var
  S: string;
begin
  S := 'SELECT C.ID, C.INDIKATOR FROM TCPRSETTING A'
      +' INNER JOIN TCPRSETTINGITEM B ON A.ID=B.CPRSETTING'
      +' INNER JOIN TINDIKATOR C ON C.ID=B.INDIKATOR'
      +' WHERE A.UNITUSAHA=' + QuotedStr(aUnit)
      +' ORDER BY C.KODE';

  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.LoadCPRByUnit(aUnit: string; aBulan, aTahun: Integer):
    TDataSet;
var
  S: string;
begin
  S := 'Select * from FN_LoadCPR(' + QuotedStr(aUnit)
    + ',' + IntTostr(aBulan) + ',' + IntToStr(aTahun) + ')';

  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.Unit_GetDS: TDataSet;
var
  S: string;
begin
  S := 'Select * from TUnit';
  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.Indikator_GetDSLookup: TDataSet;
var
  S: string;
begin
  S := 'SELECT * FROM TIndikator';

  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.Unit_GetDSLookup: TDataSet;
var
  S: string;
begin
  S := 'SELECT * FROM TUnit';

  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.Indikator_GetDSOverview: TDataSet;
var
  S: string;
begin
  S := 'SELECT * FROM TIndikator';

  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.CPRSetting_GetDSLookup: TDataSet;
var
  S: string;
begin
  S := 'SELECT A.id, b.KODE as UNITUSAHA, a.UNITUSAHA as UNITUSAHAID,' +
       ' A.NAMA, A.ISACTIVE from TCPRSETTING a' +
       ' inner join TUNIT b on a.UNITUSAHA = b.ID';

  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.CPR_GetDSLookup: TDataSet;
var
  S: string;
begin
  S := 'SELECT A.id, b.KODE as UNITUSAHA, a.UNITUSAHA as UNITUSAHAID,' +
       ' A.NAMA, A.ISACTIVE from TCPRSETTING a' +
       ' inner join TUNIT b on a.UNITUSAHA = b.ID';

  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.Unit_GetDSOverview: TDataSet;
var
  S: string;
begin
  S := 'SELECT * FROM TIndikator';

  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.CPRSetting_GetDSOverview: TDataSet;
var
  S: string;
begin
  S := 'SELECT * FROM VIEW_CPRSETTING';

  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.MRGroup_GetDSOverview: TDataSet;
var
  S: string;
begin
  S := 'SELECT * FROM TMRGroupReport order by kode';

  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.CPR_GetDSOverview: TDataSet;
var
  S: string;
begin
  S := 'SELECT * FROM VIEW_CPRSETTING';

  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.Embedded_GetDS: TDataSet;
var
  S: string;
begin
  S := 'Select * from TEmbeddedReport order by orderindex';
  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.MRGroup_GetDSLookUp: TDataSet;
var
  S: string;
begin
  S := 'SELECT * FROM TMRGroupReport order by kode';

  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.MRGroupItem_GetDSLookUp: TDataSet;
var
  S: string;
begin
  S := 'SELECT * FROM TMRGroupReport order by kode';

  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.MRGroupItem_GetDSOverview: TDataSet;
var
  S: string;
begin
  S := 'SELECT * FROM VIEW_GROUPREPORTITEM order by kode';

  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.User_GetDS: TDataSet;
var
  S: string;
begin
  S := 'Select * from TUser';
  Result := TDBUtils.OpenQuery(S);
end;

end.
