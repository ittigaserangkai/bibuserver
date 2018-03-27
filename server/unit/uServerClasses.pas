unit uServerClasses;

interface

uses
  System.Classes, uModApp, uDBUtils, Rtti, Data.DB, SysUtils,
  StrUtils, Datasnap.DBClient, uUser, System.JSON, uJSONUtils, uMR, uPNL;

type
  TServerModAppHelper = class helper for TModApp
  private
  protected
  public
    procedure CopyFrom(aModApp : TModApp);
    procedure Reload(LoadObjectList: Boolean = False);
  end;

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

  TCRUDMR = class(TCrud)
  public
    function GetMRByPeriod(AMRGroupID, AUnitID: String; AMonth, AYear: Integer):
        TModMR;
    function PrepareMR(AMRGroupID, AUnitID: String; AMonth, AYear: Integer):
        TJSONObject;
  end;

type
  TCRUDPNLReport = class(TCrud)
  private
    function GetPNLReport(AUnitID: String; AMonth, AYear: Integer): TModPNLReport;
    function GetPNLSetting(AUnitID: String): TModPNLSetting;
  public
    function GetPNLPeriod(AUnitID: String; AMonth, AYear: Integer): TJSONObject;
  end;

type
  TCRUDPNLSetting = class(TCrud)
  public
    function GetPNLSetting(AUnitID: String): TJSONObject;
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

  S := 'SELECT * from TUSER '
      +' WHERE USERNAME = ' + QuotedStr(aUserName)
      +' AND PASSWORD = ' + QuotedStr(aPassword);

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

function TCRUDMR.GetMRByPeriod(AMRGroupID, AUnitID: String; AMonth, AYear:
    Integer): TModMR;
var
  lQ: TDataSet;
  S: string;
begin
  Result := nil;
  S := 'SELECT * FROM MR A  '
      +' WHERE BULAN = ' + IntToStr(AMonth)
      +' AND A.TAHUN = ' + IntToStr(AYear)
      +' AND GROUPREPORT = ' + QuotedStr(AMRGroupID)
      +' AND UNITUSAHA = ' + QuotedStr(AUnitID);
  lQ := TDBUtils.OpenQuery(S);
  try
    if not lQ.Eof then
      Result := Self.Retrieve(TModMR, lQ.FieldByName('ID').AsString) as TModMR;
  finally
    lQ.Free;
  end;
end;

function TCRUDMR.PrepareMR(AMRGroupID, AUnitID: String; AMonth, AYear:
    Integer): TJSONObject;
var
  lItem: TModMRItem;
  lLastYearMR: TModMR;
  lLYItem: TModMRItem;
  lMR: TModMR;
  lQ: TDataSet;
  S: string;

  procedure SetReportItem(aMR: TModMR; aItemID: string);
  var
    lFound: Boolean;
    lItem: TModMRItem;
  begin
    lFound := False;
    for lItem in aMR.MRItems do
    begin
      if lItem.MRItemReport.ID = aItemID then
      begin
        lFound := True;
      end;
    end;
    if not lFound then
    begin
      lItem := TModMRItem.Create;
      lItem.MRItemReport := TModMRItemReport.CreateID(aItemID);
      aMR.MRItems.Add(lItem);
    end;
  end;
begin
  lMR := Self.GetMRByPeriod(AMRGroupID, AUnitID, AMonth, AYear);
  if lMR = nil then
  begin
    lMR := TModMR.Create;
    lMR.Bulan := AMonth;
    lMR.Tahun := AYear;
    lMR.GroupReport := TModMRGroupReport.CreateID(AMRGroupID);
    lMR.UnitUsaha   := TModUnit.CreateID(AUnitID);
  end;

  lLastYearMR  := Self.GetMRByPeriod(AMRGroupID, AUnitID, AMonth, AYear-1);
  S := 'select * from TMRItemReport where GROUPREPORT = ' + QuotedStr(AMRGroupID)
     + ' and UNITUSAHA = '  + QuotedStr(AUnitID);
  lQ := TDBUtils.OpenQuery(S);
  try
    while not lQ.Eof do
    begin
      SetReportItem(lMR, lQ.FieldByName('ID').AsString);
      lQ.Next;
    end;

    //set lastyear & reload mritemreport
    for lItem in lMR.MRItems do
    begin
      if lLastYearMR <> nil then
        for lLYItem in lLastYearMR.MRItems do
        begin
          if lItem.MRItemReport.ID = lLYItem.MRItemReport.ID then
          begin
            lItem.LastYear := lLYItem.Actual;
          end;
        end;
      lItem.MRItemReport.Reload;
    end;

    Result := TJSONUtils.ModelToJSON(lMR, [], True);
  finally
    lQ.Free;
  end;
end;

procedure TServerModAppHelper.CopyFrom(aModApp : TModApp);
var
  ctx: TRttiContext;
  i: Integer;
  lAppClass: TModAppClass;
  lNewItem: TModApp;
  lNewObjList: TObject;
  lSrcItem: TModApp;
  lSrcObjList: TObject;
  meth: TRttiMethod;
  RttiType: TRttiType;
  Prop: TRttiProperty;
  rtItem: TRttiType;
  sGenericItemClassName: string;
  value: TValue;

  function SetPropertyFrom(AProp: TRttiProperty; ASource: TModApp): TModApp;
  var
    lSrcObj: TObject;
  begin
    Result := nil;
    lSrcObj := Prop.GetValue(ASource).AsObject;
    if not prop.PropertyType.AsInstance.MetaclassType.InheritsFrom(TModApp) then exit;;
    meth    := prop.PropertyType.GetMethod('Create');
    Result  := TModApp(meth.Invoke(prop.PropertyType.AsInstance.MetaclassType, []).AsObject);
    if lSrcObj <> nil then
      TModApp(Result).CopyFrom(TModApp(lSrcObj));
  end;

begin
  RttiType := ctx.GetType(Self.ClassType);
  Try
    for Prop in RttiType.GetProperties do
    begin
      if not (Prop.IsReadable and Prop.IsWritable) then continue;
//      if prop.Visibility <> mvPublished then continue;

      If prop.PropertyType.TypeKind = tkClass then
      begin
        meth := prop.PropertyType.GetMethod('ToArray');
        if Assigned(meth) then  //object list
        begin
          lSrcObjList := prop.GetValue(aModApp).AsObject;
          lNewObjList := prop.GetValue(Self).AsObject;
          if lSrcObjList = nil then continue;

          value  := meth.Invoke(prop.GetValue(aModApp), []);
          Assert(value.IsArray);
          sGenericItemClassName := StringReplace(lSrcObjList.ClassName, 'TOBJECTLIST<','', [rfIgnoreCase]);
          sGenericItemClassName := StringReplace(sGenericItemClassName, '>','', [rfIgnoreCase]);
          rtItem := ctx.FindType(sGenericItemClassName);

          meth := prop.PropertyType.GetMethod('Add');
          if Assigned(meth) and Assigned(rtItem) then
          begin
            if not rtItem.AsInstance.MetaclassType.InheritsFrom(TModApp) then continue;
            lAppClass := TModAppClass( rtItem.AsInstance.MetaclassType );
            for i := 0 to value.GetArrayLength - 1 do
            begin
              lSrcItem := TModApp(value.GetArrayElement(i).AsObject);
              lNewItem := lAppClass.Create;
              lNewItem.CopyFrom(lSrcItem);
              meth.Invoke(lNewObjList,[lNewItem]);
            end;
          end;
          prop.SetValue(Self, lNewObjList);
        end
        else
        begin
          prop.SetValue(Self, SetPropertyFrom(prop, aModApp));
        end;
      end else
        Prop.SetValue(Self, Prop.GetValue(aModApp));
    end;
  except
    raise;
  End;
end;

procedure TServerModAppHelper.Reload(LoadObjectList: Boolean = False);
var
  lCRUD: TCRUD;
  lModApp: TModApp;
begin
  If Self.ID = '' then exit;
  lCRUD := TCRUD.Create(nil);
  try
    if LoadObjectList then
      lModApp := lCRUD.Retrieve(Self.ClassName, Self.ID)
    else
      lModApp := lCRUD.RetrieveSingle(Self.ClassName, Self.ID);

    Try
      Self.CopyFrom(lModApp);
    Finally
      lModApp.Free;
    End;
  finally
    FreeAndNil(lCRUD);
  end;
end;

function TCRUDPNLReport.GetPNLPeriod(AUnitID: String; AMonth, AYear: Integer):
    TJSONObject;
var
  LastYearPNL: TModPNLReport;
  lItem: TModPNLReportItem;
  lPNLItem: TModPNLReportItem;
  lPNLReport: TModPNLReport;
  lPNLSetting: TModPNLSetting;
  lSettingItem: TModPNLSettingItem;
  LYItem: TModPNLReportItem;
begin
  lPNLReport  := GetPNLReport(AUnitID, AMonth, AYear);
  Result      := nil;
  if lPNLReport = nil then
  begin
    lPNLReport := TModPNLReport.Create;
    lPNLReport.Bulan := AMonth;
    lPNLReport.Tahun := AYear;
    lPNLReport.UnitUsaha := TModUnit.CreateID(AUnitID);
  end;

  lPNLSetting := GetPNLSetting(AUnitID);

  if lPNLSetting = nil then exit;


  //reload items
  Try
    for lSettingItem in lPNLSetting.Items do
    begin
      lItem := nil;
      for lPNLItem in lPNLReport.Items do
      begin
        if lPNLItem.PNLSettingItem.ID = lSettingItem.ID then
        begin
          lItem := lPNLItem;
          break;
        end;
      end;
      if lItem = nil then
      begin
        lItem := TModPNLReportItem.Create();
        lItem.PNLSettingItem := TModPNLSettingItem.CreateID(lSettingItem.ID);
        lPNLReport.Items.Add(lItem);
      end;
      lItem.PNLSettingItem.Reload();
    end;
  Finally
    lPNLSetting.Free;
  End;

  //lastyear
  LastYearPNL := Self.GetPNLReport(AUnitID, AMonth, AYear-1);
  if LastYearPNL <> nil then
  begin
    Try
      for LYItem in LastYearPNL.Items do
      begin
        for lPNLItem in lPNLReport.Items do
        begin
          if lPNLItem.PNLSettingItem.ID = LYItem.PNLSettingItem.ID then
          begin
            lPNLItem.LastYear := LYItem.Actual;
            lPNLItem.LastYearPercent := LYItem.ActualPercent;
          end;
        end;
      end;
    finally
      LastYearPNL.free;
    end;
  end;

  Result := TJSONUtils.ModelToJSON(lPNLReport, [], True);

end;

function TCRUDPNLReport.GetPNLReport(AUnitID: String; AMonth, AYear: Integer):
    TModPNLReport;
var
  lQ: TDataSet;
  S: string;
begin
  Result := nil;
  S := 'SELECT * FROM TPNLREPORT '
      +' WHERE BULAN = ' + IntToStr(AMonth)
      +' AND TAHUN = ' + IntToStr(AYear)
      +' AND UNITUSAHA = ' + QuotedStr(AUnitID);
  lQ := TDBUtils.OpenQuery(S);
  try
    if not lQ.Eof then
    begin
      Result := Self.Retrieve(TModPNLReport, lQ.FieldByName('ID').AsString) as TModPNLReport;
    end;
  finally
    lQ.Free;
  end;
end;

function TCRUDPNLReport.GetPNLSetting(AUnitID: String): TModPNLSetting;
var
  lQ: TDataSet;
  S: string;
begin
  Result := nil;
  S := 'SELECT * FROM TPNLSetting '
      +' WHERE UNITUSAHA = ' + QuotedStr(AUnitID);
  lQ := TDBUtils.OpenQuery(S);
  try
    if not lQ.Eof then
      Result := Self.Retrieve(TModPNLSetting, lQ.FieldByName('ID').AsString) as TModPNLSetting;
  finally
    lQ.Free;
  end;
end;

function TCRUDPNLSetting.GetPNLSetting(AUnitID: String): TJSONObject;
var
  lPNLSetting: TModPNLSetting;
  lQ: TDataSet;
  S: string;
begin
  Result := nil;
  S := 'SELECT * FROM TPNLSetting '
      +' WHERE UNITUSAHA = ' + QuotedStr(AUnitID);
  lQ := TDBUtils.OpenQuery(S);
  try
    if not lQ.Eof then
    begin
      lPNLSetting := Self.Retrieve(TModPNLSetting, lQ.FieldByName('ID').AsString) as TModPNLSetting;
      Result := TJSONUtils.ModelToJSON(lPNLSetting, [], True);
    end;
  finally
    lQ.Free;
  end;
end;


end.
