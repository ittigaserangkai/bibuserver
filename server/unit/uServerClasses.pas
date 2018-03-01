unit uServerClasses;

interface

uses
  System.Classes, uModApp, uDBUtils, Rtti, Data.DB, SysUtils,
  StrUtils, Datasnap.DBClient, uUser, System.JSON, uJSONUtils, uMR;

type
  {$METHODINFO ON}
  TBaseServerClass = class(TComponent)
  public
    procedure AfterExecuteMethod;
  end;

  TUser = class(TComponent)
  public
    function GetLoginUser(aUserName, aPassword: String): TModUser;
  end;

  TCrud = class(TBaseServerClass)
  private
    function Retrieve(ModAppClass: TModAppClass; AID: String; LoadObjectList:
        Boolean = True): TModApp; overload;
    function ValidateCode(AOBject: TModApp): Boolean;
  protected
    function BeforeSaveToDB(AObject: TModApp): Boolean; virtual;
    function AfterSaveToDB(AObject: TModApp): Boolean; virtual;
    function StringToClass(ModClassName: string): TModAppClass;
  public
    function SaveToDB(AObject: TModApp): Boolean;
    function DeleteFromDB(AObject: TModApp): Boolean;
    function OpenQuery(S: string): TDataSet;
    function Retrieve(ModClassName, AID: string): TModApp; overload;
    function GenerateCustomNo(aTableName, aFieldName: string; aCountDigit: Integer
        = 11): String; overload;
    function GenerateID: String;
    function GenerateNo(aClassName: string): String; overload;
    function RetrieveSingle(ModClassName, AID: string): TModApp; overload;
    function RetrieveByCode(ModClassName, aCode: string): TModApp; overload;
    function RetrieveJSON(AClassName, AID: String): TJSONObject;
    function SaveToDBLog(AObject: TModApp): Boolean;
    function SaveToDBID(AObject: TModApp): String;
    function SaveToDBJSON(AJSON: TJSONObject): TJSONObject;
    function TestGenerateSQL(AObject: TModApp): TStrings;
  end;

type
  TJSONCRUD = class(TBaseServerClass)
  private
    FCRUD: TCrud;
  protected
    function GetCRUD: TCrud;
    function StringToClass(ModClassName: string): TModAppClass;
    property CRUD: TCrud read GetCRUD write FCRUD;
  public
    function Retrieve(AClassName, AID: String): TJSONObject;
    function SaveToDB(AJSON: TJSONObject): TJSONObject;
  end;

  TMRCRUD = class(TCrud)
  public
    function GetMRByPeriod(AMRGroupID, AUnitID: String; AMonth, AYear: Integer):
        TModMR;
    function PrepareMRByPeriod(AMRGroupID, AUnitID: String; AMonth, AYear:
        Integer): TModMR;
  end;



{$METHODINFO OFF}

const
  CloseSession : Boolean = True;

implementation

uses
  System.Generics.Collections, Datasnap.DSSession, Data.DBXPlatform, uUnit,
  uMRGroupReport;

function TUser.GetLoginUser(aUserName, aPassword: String): TModUser;
var
  lCrud: TCrud;
  lDataset: TDataSet;
  S: string;
  sID: string;
begin
  Result := nil;

  S := 'SELECT * from TUSER'
      +' WHERE USERNAME =' + QuotedStr(aUserName)
      +' AND PASSWORD =' + QuotedStr(aPassword);

  lDataset := TDBUtils.OpenQuery(S);
  lCrud := TCrud.Create(Self);
  try
    if not lDataset.eof then
    begin
      sID := lDataset.FieldByname('ID').AsString;
      Result := lCrud.Retrieve(TModUser.ClassName, sID) as TModUser;
    end;
  finally
    lCrud.Free;
    lDataset.free;
  end;


end;

function TCrud.BeforeSaveToDB(AObject: TModApp): Boolean;
begin
  Result := True;
end;

function TCrud.AfterSaveToDB(AObject: TModApp): Boolean;
begin
  Result := True;
end;

function TCrud.SaveToDB(AObject: TModApp): Boolean;
var
  lSS: TStrings;
begin
  Result := False;

  if not ValidateCode(AObject) then exit;
  if not BeforeSaveToDB(AObject) then exit;
  lSS := TDBUtils.GenerateSQL(AObject);
  Try
    Try
      TDBUtils.ExecuteSQL(lSS, False);
      if not AfterSaveToDB(AObject) then exit;

      TDBUtils.Commit;
      Result := True;
    except
      TDBUtils.RollBack;
      raise;
    End;
  Finally
//    AObject.Free;
    lSS.Free;
    AfterExecuteMethod;
  End;
end;

function TCrud.DeleteFromDB(AObject: TModApp): Boolean;
var
  lSS: TStrings;
begin
  Result := False;
  lSS := TDBUtils.GenerateSQLDelete(AObject);
  Try
    Try
      TDBUtils.ExecuteSQL(lSS, False);
      TDBUtils.Commit;
      Result := True;
    except
      TDBUtils.RollBack;
      raise;
    End;
  Finally
    lSS.Free;
    AfterExecuteMethod;
  End;
end;

function TCrud.OpenQuery(S: string): TDataSet;
begin
  Result := TDBUtils.OpenQuery(S);
  AfterExecuteMethod;
end;

function TCrud.Retrieve(ModAppClass: TModAppClass; AID: String; LoadObjectList:
    Boolean = True): TModApp;
begin
  Result := ModAppClass.Create;
  TDBUtils.LoadFromDB(Result, AID, LoadObjectList);
end;

function TCrud.Retrieve(ModClassName, AID: string): TModApp;
var
  lClass: TModAppClass;
begin
  lClass := Self.StringToClass(ModClassName);
  If not Assigned(lClass) then
    Raise Exception.Create('Class ' + ModClassName + ' not found');
  Result := Self.Retrieve(lClass, AID);

  AfterExecuteMethod;
end;

function TCrud.GenerateCustomNo(aTableName, aFieldName: string; aCountDigit:
    Integer = 11): String;
var
  i: Integer;
  lNum: Integer;
  S: string;
begin
  lNum := 0;
  S := 'select max(' + aFieldName + ') from ' + aTableName;
  with TDBUtils.OpenQuery(S) do
  begin
    Try
      if not eof then
        TryStrToInt( RightStr(Fields[0].AsString, aCountDigit), lNum);
    Finally
      free;
    End;
  end;
  inc(lNum);
  Result := IntToStr(lNum);
  for i := 0 to aCountDigit-1 do Result := '0' + Result;
  Result := RightStr(Result, aCountDigit);

  AfterExecuteMethod;
end;

function TCrud.GenerateID: String;
begin
  Result := TDBUtils.GetNextIDGUIDToString();
end;

function TCrud.GenerateNo(aClassName: string): String;
var
  lClass: TModAppClass;
  lObj: TModApp;
begin
  lClass := Self.StringToClass(aClassName);
  lObj := lClass.Create;
  Try
    Result := Self.GenerateCustomNo(lObj.GetTableName, lObj.GetCodeField, 11);
  Finally
    AfterExecuteMethod;
    lObj.Free;
  End;
end;

function TCrud.RetrieveSingle(ModClassName, AID: string): TModApp;
var
  lClass: TModAppClass;
begin
  lClass := Self.StringToClass(ModClassName);
  If not Assigned(lClass) then
    Raise Exception.Create('Class ' + ModClassName + ' not found');
  Result := Self.Retrieve(lClass, AID, False);

  AfterExecuteMethod;
end;

function TCrud.RetrieveByCode(ModClassName, aCode: string): TModApp;
var
  lClass: TModAppClass;
begin
  lClass := Self.StringToClass(ModClassName);
  If not Assigned(lClass) then
    Raise Exception.Create('Class ' + ModClassName + ' not found');
  Result := lClass.Create;
  if aCode <> '' then
    TDBUtils.LoadByCode(Result, aCode);
  AfterExecuteMethod;
end;

function TCrud.RetrieveJSON(AClassName, AID: String): TJSONObject;
var
  lModApp: TModApp;
begin
  lModApp := Self.Retrieve(AClassName, AID);
  try
    Result := TJSONUtils.ModelToJSON(lModApp);
  finally
    lModApp.Free;
  end;
end;

function TCrud.SaveToDBLog(AObject: TModApp): Boolean;
var
  lSS: TStrings;
begin
  Result := False;
  if not ValidateCode(AObject) then exit;
  lSS := TDBUtils.GenerateSQL(AObject);
  Try
    Try
      lSS.SaveToFile(ExtractFilePath(ParamStr(0)) + '\SaveToDB.log');
      TDBUtils.ExecuteSQL(lSS, False);
      TDBUtils.Commit;
      Result := True;
    except
      TDBUtils.RollBack;
      raise;
    End;
  Finally
    lSS.Free;
  End;
end;

function TCrud.SaveToDBID(AObject: TModApp): String;
//  Result := '';
//  If SaveToDB(AObject) then Result := AObject.ID;
var
  lSS: TStrings;
begin
  Result := '';
  if not ValidateCode(AObject) then exit;
  if not BeforeSaveToDB(AObject) then exit;
  lSS := TDBUtils.GenerateSQL(AObject);
  Try
    Try
      TDBUtils.ExecuteSQL(lSS, False);
      if not AfterSaveToDB(AObject) then exit;

      TDBUtils.Commit;
      Result := AObject.ID;
    except
      TDBUtils.RollBack;
      raise;
    End;
  Finally
//    AObject.Free;
    lSS.Free;
    AfterExecuteMethod;
  End;
end;

function TCrud.SaveToDBJSON(AJSON: TJSONObject): TJSONObject;
var
  AClassName: string;
  lClass: TModAppClass;
  LJSVal: TJSONValue;
  lModApp: TModApp;
begin
//  LJSVal  := AJSON.GetValue('ClassName');
  lJSVal := TJSONUtils.GetValue(AJSON, 'ClassName');
  if LJSVal = nil then
    Raise Exception.Create('ClassName can''t be found in JSON Body');
  AClassName := LJSVal.Value;
  lClass  := StringToClass(AClassName);
  lModApp := TJSONUtils.JSONToModel(AJSON, lClass);
  Self.SaveToDB(lModApp);
  try
    Result := TJSONUtils.ModelToJSON(lModApp);
  finally
    lModApp.Free;
  end;
end;

function TCrud.StringToClass(ModClassName: string): TModAppClass;
var
  ctx: TRttiContext;
  typ: TRttiType;
  list: TArray<TRttiType>;
begin
  Result := nil;
  ctx := TRttiContext.Create;
  list := ctx.GetTypes;
  for typ in list do
  begin
    if typ.IsInstance and (EndsText(ModClassName, typ.Name)) then
    begin
      Result := TModAppClass(typ.AsInstance.MetaClassType);
      break;
    end;
  end;
  ctx.Free;
end;

function TCrud.TestGenerateSQL(AObject: TModApp): TStrings;
begin
  Result := TDBUtils.GenerateSQL(AObject);
end;

function TCrud.ValidateCode(AOBject: TModApp): Boolean;
var
  S: string;
  sFilter: string;
begin
  Result  := True;
  if AObject.PropFromAttr(AttributeOfCode, False) = nil then
    exit;
  sFilter := AOBject.GetCodeField + ' = ' + QuotedStr(AObject.GetCodeValue);
  if AOBject.ID <> '' then
    sFilter := sFilter + ' And ' + AOBject.GetPrimaryField + ' <> ' + QuotedStr(AOBject.ID);
  S := Format(SQL_Select,['*', AOBject.GetTableName, sFilter]);
  with TDBUtils.OpenQuery(S) do
  begin
    Try
      Result := EOF;
    Finally
      Free;
    End;
  end;
  if not Result then
    raise Exception.Create(AOBject.GetTableName + '.' + AOBject.GetCodeField
      + ' : ' + AOBject.GetCodeValue + ' sudah ada di Database'
    );
end;


procedure TBaseServerClass.AfterExecuteMethod;
begin
  if CloseSession then
    GetInvocationMetaData.CloseSession := True;
end;

function TJSONCRUD.GetCRUD: TCrud;
begin
  if not Assigned(FCRUD) then
    FCRUD := TCrud.Create(Self);
  Result := FCRUD;
end;

function TJSONCRUD.Retrieve(AClassName, AID: String): TJSONObject;
var
  lModApp: TModApp;
begin
  lModApp := Self.CRUD.Retrieve(AClassName, AID);
  try
    Result := TJSONUtils.ModelToJSON(lModApp);
  finally
    lModApp.Free;
  end;
end;

function TJSONCRUD.SaveToDB(AJSON: TJSONObject): TJSONObject;
var
  AClassName: string;
  lClass: TModAppClass;
  LJSVal: TJSONValue;
  lModApp: TModApp;
begin
//  LJSVal  := AJSON.GetValue('ClassName');
  lJSVal := TJSONUtils.GetValue(AJSON, 'ClassName');
  if LJSVal = nil then
    Raise Exception.Create('ClassName can''t be found in JSON Body');
  AClassName := LJSVal.Value;
  lClass  := StringToClass(AClassName);
  lModApp := TJSONUtils.JSONToModel(AJSON, lClass);
  Self.CRUD.SaveToDB(lModApp);
  try
    Result := TJSONUtils.ModelToJSON(lModApp);
  finally
    lModApp.Free;
  end;
end;

function TJSONCRUD.StringToClass(ModClassName: string): TModAppClass;
var
  ctx: TRttiContext;
  typ: TRttiType;
  list: TArray<TRttiType>;
begin
  Result := nil;
  ctx := TRttiContext.Create;
  list := ctx.GetTypes;
  for typ in list do
  begin
    if typ.IsInstance and (EndsText(ModClassName, typ.Name)) then
    begin
      Result := TModAppClass(typ.AsInstance.MetaClassType);
      break;
    end;
  end;
  ctx.Free;
end;

function TMRCRUD.GetMRByPeriod(AMRGroupID, AUnitID: String; AMonth, AYear:
    Integer): TModMR;
var
  lMR: TModMR;
  lQ: TDataSet;
  S: string;
begin
  S := 'SELECT * FROM MR A  '
      +' WHERE BULAN = ' + IntToStr(AMonth)
      +' AND A.TAHUN = ' + IntToStr(AYear)
      +' AND GROUPREPORT = ' + QuotedStr(AMRGroupID)
      +' AND UNITUSAHA = ' + QuotedStr(AUnitID);
  lQ := TDBUtils.OpenQuery(S);
  try
    if not lQ.Eof then
      Result := Self.Retrieve(TModMR, lQ.FieldByName('ID').AsString) as TModMR
    else
      Result := TModMR.Create;
  finally
    lQ.Free;
  end;
end;

function TMRCRUD.PrepareMRByPeriod(AMRGroupID, AUnitID: String; AMonth, AYear:
    Integer): TModMR;
var
  lLastYearMR: TModMR;
  lMR: TModMR;
  lQ: TDataSet;
  S: string;

  procedure SetReportItem(aItem: TModMRItemReport);
  var
    lFound: Boolean;
    lItem: TModMRItem;
  begin
    lFound := False;
    for lItem in Result.MRItems do
    begin
      if lItem.MRItemReport.ID = aItem.ID then
      begin
        lFound := True;
      end;
    end;
    if not lFound then
    begin
      lItem := TModMRItem.Create;
      lItem.MRItemReport := TModMRItemReport.CreateID(aItem.ID);
    end;
  end;

  procedure SetLastYearItem;
  var
    lItem: TModMRItemReport;
    lLYItem: TModMRItemReport;
  begin
//    for lItem in Result.MRItems do
//    begin
//      for lLYItem in lLastYearMR.MRItems do
//      begin
//        if lItem.ID = lLYItem. then
//
//
//      end;
//    end;

  end;

begin
  Result := Self.GetMRByPeriod(AMRGroupID, AUnitID, AMonth, AYear);
  lLastYearMR  := Self.GetMRByPeriod(AMRGroupID, AUnitID, AMonth, AYear-1);

  S := 'select * from TMRItemReport where GROUPREPORT = ' + QuotedStr(AMRGroupID)
     + ' and UNITUSAHA = '  + QuotedStr(AUnitID);
  lQ := TDBUtils.OpenQuery(S);
  try
    while not lQ.Eof do
    begin
      lQ.Next;
    end;
  finally
    lQ.Free;
  end;
end;


end.
