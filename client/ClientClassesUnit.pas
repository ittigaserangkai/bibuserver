//
// Created by the DataSnap proxy generator.
// 2/23/2018 1:45:46 PM
//

unit ClientClassesUnit;

interface

uses System.JSON, Datasnap.DSProxyRest, Datasnap.DSClientRest, Data.DBXCommon, Data.DBXClient, Data.DBXDataSnap, Data.DBXJSON, Datasnap.DSProxy, System.Classes, System.SysUtils, Data.DB, Data.SqlExpr, Data.DBXDBReaders, Data.DBXCDSReaders, uUser, uModApp, Data.FireDACJSONReflect, Data.DBXJSONReflect;

type

  IDSRestCachedTFDJSONDataSets = interface;
  IDSRestCachedTStrings = interface;
  IDSRestCachedTModApp = interface;
  IDSRestCachedTModUser = interface;

  TServerMethodsClient = class(TDSAdminRestClient)
  private
    FEchoStringCommand: TDSRestCommand;
    FReverseStringCommand: TDSRestCommand;
  public
    constructor Create(ARestConnection: TDSRestConnection); overload;
    constructor Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function EchoString(Value: string; const ARequestFilter: string = ''): string;
    function ReverseString(Value: string; const ARequestFilter: string = ''): string;
  end;

  TUserClient = class(TDSAdminRestClient)
  private
    FGetLoginUserCommand: TDSRestCommand;
    FGetLoginUserCommand_Cache: TDSRestCommand;
  public
    constructor Create(ARestConnection: TDSRestConnection); overload;
    constructor Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function GetLoginUser(aUserName: string; aPassword: string; const ARequestFilter: string = ''): TModUser;
    function GetLoginUser_Cache(aUserName: string; aPassword: string; const ARequestFilter: string = ''): IDSRestCachedTModUser;
  end;

  TCrudClient = class(TDSAdminRestClient)
  private
    FSaveToDBCommand: TDSRestCommand;
    FDeleteFromDBCommand: TDSRestCommand;
    FOpenQueryCommand: TDSRestCommand;
    FOpenQueryCommand_Cache: TDSRestCommand;
    FRetrieveCommand: TDSRestCommand;
    FRetrieveCommand_Cache: TDSRestCommand;
    FGenerateCustomNoCommand: TDSRestCommand;
    FGenerateIDCommand: TDSRestCommand;
    FGenerateNoCommand: TDSRestCommand;
    FRetrieveSingleCommand: TDSRestCommand;
    FRetrieveSingleCommand_Cache: TDSRestCommand;
    FRetrieveByCodeCommand: TDSRestCommand;
    FRetrieveByCodeCommand_Cache: TDSRestCommand;
    FSaveToDBLogCommand: TDSRestCommand;
    FSaveToDBIDCommand: TDSRestCommand;
    FTestGenerateSQLCommand: TDSRestCommand;
    FTestGenerateSQLCommand_Cache: TDSRestCommand;
    FAfterExecuteMethodCommand: TDSRestCommand;
  public
    constructor Create(ARestConnection: TDSRestConnection); overload;
    constructor Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function SaveToDB(AObject: TModApp; const ARequestFilter: string = ''): Boolean;
    function DeleteFromDB(AObject: TModApp; const ARequestFilter: string = ''): Boolean;
    function OpenQuery(S: string; const ARequestFilter: string = ''): TDataSet;
    function OpenQuery_Cache(S: string; const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function Retrieve(ModClassName: string; AID: string; const ARequestFilter: string = ''): TModApp;
    function Retrieve_Cache(ModClassName: string; AID: string; const ARequestFilter: string = ''): IDSRestCachedTModApp;
    function GenerateCustomNo(aTableName: string; aFieldName: string; aCountDigit: Integer; const ARequestFilter: string = ''): string;
    function GenerateID(const ARequestFilter: string = ''): string;
    function GenerateNo(aClassName: string; const ARequestFilter: string = ''): string;
    function RetrieveSingle(ModClassName: string; AID: string; const ARequestFilter: string = ''): TModApp;
    function RetrieveSingle_Cache(ModClassName: string; AID: string; const ARequestFilter: string = ''): IDSRestCachedTModApp;
    function RetrieveByCode(ModClassName: string; aCode: string; const ARequestFilter: string = ''): TModApp;
    function RetrieveByCode_Cache(ModClassName: string; aCode: string; const ARequestFilter: string = ''): IDSRestCachedTModApp;
    function SaveToDBLog(AObject: TModApp; const ARequestFilter: string = ''): Boolean;
    function SaveToDBID(AObject: TModApp; const ARequestFilter: string = ''): string;
    function TestGenerateSQL(AObject: TModApp; const ARequestFilter: string = ''): TStrings;
    function TestGenerateSQL_Cache(AObject: TModApp; const ARequestFilter: string = ''): IDSRestCachedTStrings;
    procedure AfterExecuteMethod;
  end;

  TDSProviderClient = class(TDSAdminRestClient)
  private
    FIndikator_GetDSCommand: TDSRestCommand;
    FIndikator_GetDSCommand_Cache: TDSRestCommand;
    FIndikatorByUnit_GetDSCommand: TDSRestCommand;
    FIndikatorByUnit_GetDSCommand_Cache: TDSRestCommand;
    FLoadCPRByUnitCommand: TDSRestCommand;
    FLoadCPRByUnitCommand_Cache: TDSRestCommand;
    FUnit_GetDSCommand: TDSRestCommand;
    FUnit_GetDSCommand_Cache: TDSRestCommand;
    FIndikator_GetDSLookupCommand: TDSRestCommand;
    FIndikator_GetDSLookupCommand_Cache: TDSRestCommand;
    FUnit_GetDSLookupCommand: TDSRestCommand;
    FUnit_GetDSLookupCommand_Cache: TDSRestCommand;
    FIndikator_GetDSOverviewCommand: TDSRestCommand;
    FIndikator_GetDSOverviewCommand_Cache: TDSRestCommand;
    FCPRSetting_GetDSLookupCommand: TDSRestCommand;
    FCPRSetting_GetDSLookupCommand_Cache: TDSRestCommand;
    FCPR_GetDSLookupCommand: TDSRestCommand;
    FCPR_GetDSLookupCommand_Cache: TDSRestCommand;
    FUnit_GetDSOverviewCommand: TDSRestCommand;
    FUnit_GetDSOverviewCommand_Cache: TDSRestCommand;
    FCPRSetting_GetDSOverviewCommand: TDSRestCommand;
    FCPRSetting_GetDSOverviewCommand_Cache: TDSRestCommand;
    FMRGroup_GetDSOverviewCommand: TDSRestCommand;
    FMRGroup_GetDSOverviewCommand_Cache: TDSRestCommand;
    FCPR_GetDSOverviewCommand: TDSRestCommand;
    FCPR_GetDSOverviewCommand_Cache: TDSRestCommand;
    FEmbedded_GetDSCommand: TDSRestCommand;
    FEmbedded_GetDSCommand_Cache: TDSRestCommand;
    FMRGroup_GetDSLookUpCommand: TDSRestCommand;
    FMRGroup_GetDSLookUpCommand_Cache: TDSRestCommand;
    FMRGroupItem_GetDSLookUpCommand: TDSRestCommand;
    FMRGroupItem_GetDSLookUpCommand_Cache: TDSRestCommand;
    FMRGroupItem_GetDSOverviewCommand: TDSRestCommand;
    FMRGroupItem_GetDSOverviewCommand_Cache: TDSRestCommand;
    FUser_GetDSCommand: TDSRestCommand;
    FUser_GetDSCommand_Cache: TDSRestCommand;
  public
    constructor Create(ARestConnection: TDSRestConnection); overload;
    constructor Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function Indikator_GetDS(const ARequestFilter: string = ''): TDataSet;
    function Indikator_GetDS_Cache(const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function IndikatorByUnit_GetDS(aUnit: string; const ARequestFilter: string = ''): TDataSet;
    function IndikatorByUnit_GetDS_Cache(aUnit: string; const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function LoadCPRByUnit(aUnit: string; aBulan: Integer; aTahun: Integer; const ARequestFilter: string = ''): TDataSet;
    function LoadCPRByUnit_Cache(aUnit: string; aBulan: Integer; aTahun: Integer; const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function Unit_GetDS(const ARequestFilter: string = ''): TDataSet;
    function Unit_GetDS_Cache(const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function Indikator_GetDSLookup(const ARequestFilter: string = ''): TDataSet;
    function Indikator_GetDSLookup_Cache(const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function Unit_GetDSLookup(const ARequestFilter: string = ''): TDataSet;
    function Unit_GetDSLookup_Cache(const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function Indikator_GetDSOverview(const ARequestFilter: string = ''): TDataSet;
    function Indikator_GetDSOverview_Cache(const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function CPRSetting_GetDSLookup(const ARequestFilter: string = ''): TDataSet;
    function CPRSetting_GetDSLookup_Cache(const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function CPR_GetDSLookup(const ARequestFilter: string = ''): TDataSet;
    function CPR_GetDSLookup_Cache(const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function Unit_GetDSOverview(const ARequestFilter: string = ''): TDataSet;
    function Unit_GetDSOverview_Cache(const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function CPRSetting_GetDSOverview(const ARequestFilter: string = ''): TDataSet;
    function CPRSetting_GetDSOverview_Cache(const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function MRGroup_GetDSOverview(const ARequestFilter: string = ''): TDataSet;
    function MRGroup_GetDSOverview_Cache(const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function CPR_GetDSOverview(const ARequestFilter: string = ''): TDataSet;
    function CPR_GetDSOverview_Cache(const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function Embedded_GetDS(const ARequestFilter: string = ''): TDataSet;
    function Embedded_GetDS_Cache(const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function MRGroup_GetDSLookUp(const ARequestFilter: string = ''): TDataSet;
    function MRGroup_GetDSLookUp_Cache(const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function MRGroupItem_GetDSLookUp(const ARequestFilter: string = ''): TDataSet;
    function MRGroupItem_GetDSLookUp_Cache(const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function MRGroupItem_GetDSOverview(const ARequestFilter: string = ''): TDataSet;
    function MRGroupItem_GetDSOverview_Cache(const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function User_GetDS(const ARequestFilter: string = ''): TDataSet;
    function User_GetDS_Cache(const ARequestFilter: string = ''): IDSRestCachedDataSet;
  end;

  TDSReportClient = class(TDSAdminRestClient)
  private
    FDO_GetDSNPCommand: TDSRestCommand;
    FDO_GetDSNPCommand_Cache: TDSRestCommand;
    FDO_GetDS_CheckListCommand: TDSRestCommand;
    FDO_GetDS_CheckListCommand_Cache: TDSRestCommand;
    FSO_ByDateCommand: TDSRestCommand;
    FSO_ByDateCommand_Cache: TDSRestCommand;
    FSO_ByDateNoBuktiCommand: TDSRestCommand;
    FSO_ByDateNoBuktiCommand_Cache: TDSRestCommand;
    FPO_SLIP_ByDateNoBuktiCommand: TDSRestCommand;
    FPO_SLIP_ByDateNoBuktiCommand_Cache: TDSRestCommand;
    FSO_TestCommand: TDSRestCommand;
    FSO_TestCommand_Cache: TDSRestCommand;
  public
    constructor Create(ARestConnection: TDSRestConnection); overload;
    constructor Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function DO_GetDSNP(ANONP: string; const ARequestFilter: string = ''): TFDJSONDataSets;
    function DO_GetDSNP_Cache(ANONP: string; const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    function DO_GetDS_CheckList(ANONP: string; const ARequestFilter: string = ''): TFDJSONDataSets;
    function DO_GetDS_CheckList_Cache(ANONP: string; const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    function SO_ByDate(StartDate: TDateTime; EndDate: TDateTime; const ARequestFilter: string = ''): TFDJSONDataSets;
    function SO_ByDate_Cache(StartDate: TDateTime; EndDate: TDateTime; const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    function SO_ByDateNoBukti(StartDate: TDateTime; EndDate: TDateTime; aNoBuktiAwal: string; aNoBuktiAkhir: string; const ARequestFilter: string = ''): TFDJSONDataSets;
    function SO_ByDateNoBukti_Cache(StartDate: TDateTime; EndDate: TDateTime; aNoBuktiAwal: string; aNoBuktiAkhir: string; const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    function PO_SLIP_ByDateNoBukti(StartDate: TDateTime; EndDate: TDateTime; aNoBuktiAwal: string; aNoBuktiAkhir: string; const ARequestFilter: string = ''): TFDJSONDataSets;
    function PO_SLIP_ByDateNoBukti_Cache(StartDate: TDateTime; EndDate: TDateTime; aNoBuktiAwal: string; aNoBuktiAkhir: string; const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    function SO_Test(const ARequestFilter: string = ''): TFDJSONDataSets;
    function SO_Test_Cache(const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
  end;

  IDSRestCachedTFDJSONDataSets = interface(IDSRestCachedObject<TFDJSONDataSets>)
  end;

  TDSRestCachedTFDJSONDataSets = class(TDSRestCachedObject<TFDJSONDataSets>, IDSRestCachedTFDJSONDataSets, IDSRestCachedCommand)
  end;
  IDSRestCachedTStrings = interface(IDSRestCachedObject<TStrings>)
  end;

  TDSRestCachedTStrings = class(TDSRestCachedObject<TStrings>, IDSRestCachedTStrings, IDSRestCachedCommand)
  end;
  IDSRestCachedTModApp = interface(IDSRestCachedObject<TModApp>)
  end;

  TDSRestCachedTModApp = class(TDSRestCachedObject<TModApp>, IDSRestCachedTModApp, IDSRestCachedCommand)
  end;
  IDSRestCachedTModUser = interface(IDSRestCachedObject<TModUser>)
  end;

  TDSRestCachedTModUser = class(TDSRestCachedObject<TModUser>, IDSRestCachedTModUser, IDSRestCachedCommand)
  end;

const
  TServerMethods_EchoString: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'Value'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TServerMethods_ReverseString: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'Value'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TUser_GetLoginUser: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'aUserName'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'aPassword'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TModUser')
  );

  TUser_GetLoginUser_Cache: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'aUserName'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'aPassword'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TCrud_SaveToDB: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AObject'; Direction: 1; DBXType: 37; TypeName: 'TModApp'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TCrud_DeleteFromDB: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AObject'; Direction: 1; DBXType: 37; TypeName: 'TModApp'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TCrud_OpenQuery: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'S'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TCrud_OpenQuery_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'S'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TCrud_Retrieve: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'ModClassName'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TModApp')
  );

  TCrud_Retrieve_Cache: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'ModClassName'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TCrud_GenerateCustomNo: array [0..3] of TDSRestParameterMetaData =
  (
    (Name: 'aTableName'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'aFieldName'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'aCountDigit'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TCrud_GenerateID: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TCrud_GenerateNo: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'aClassName'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TCrud_RetrieveSingle: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'ModClassName'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TModApp')
  );

  TCrud_RetrieveSingle_Cache: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'ModClassName'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TCrud_RetrieveByCode: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'ModClassName'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'aCode'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TModApp')
  );

  TCrud_RetrieveByCode_Cache: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'ModClassName'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'aCode'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TCrud_SaveToDBLog: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AObject'; Direction: 1; DBXType: 37; TypeName: 'TModApp'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TCrud_SaveToDBID: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AObject'; Direction: 1; DBXType: 37; TypeName: 'TModApp'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TCrud_TestGenerateSQL: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AObject'; Direction: 1; DBXType: 37; TypeName: 'TModApp'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TStrings')
  );

  TCrud_TestGenerateSQL_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AObject'; Direction: 1; DBXType: 37; TypeName: 'TModApp'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TDSProvider_Indikator_GetDS: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TDSProvider_Indikator_GetDS_Cache: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TDSProvider_IndikatorByUnit_GetDS: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'aUnit'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TDSProvider_IndikatorByUnit_GetDS_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'aUnit'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TDSProvider_LoadCPRByUnit: array [0..3] of TDSRestParameterMetaData =
  (
    (Name: 'aUnit'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'aBulan'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: 'aTahun'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TDSProvider_LoadCPRByUnit_Cache: array [0..3] of TDSRestParameterMetaData =
  (
    (Name: 'aUnit'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'aBulan'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: 'aTahun'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TDSProvider_Unit_GetDS: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TDSProvider_Unit_GetDS_Cache: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TDSProvider_Indikator_GetDSLookup: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TDSProvider_Indikator_GetDSLookup_Cache: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TDSProvider_Unit_GetDSLookup: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TDSProvider_Unit_GetDSLookup_Cache: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TDSProvider_Indikator_GetDSOverview: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TDSProvider_Indikator_GetDSOverview_Cache: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TDSProvider_CPRSetting_GetDSLookup: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TDSProvider_CPRSetting_GetDSLookup_Cache: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TDSProvider_CPR_GetDSLookup: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TDSProvider_CPR_GetDSLookup_Cache: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TDSProvider_Unit_GetDSOverview: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TDSProvider_Unit_GetDSOverview_Cache: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TDSProvider_CPRSetting_GetDSOverview: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TDSProvider_CPRSetting_GetDSOverview_Cache: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TDSProvider_MRGroup_GetDSOverview: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TDSProvider_MRGroup_GetDSOverview_Cache: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TDSProvider_CPR_GetDSOverview: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TDSProvider_CPR_GetDSOverview_Cache: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TDSProvider_Embedded_GetDS: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TDSProvider_Embedded_GetDS_Cache: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TDSProvider_MRGroup_GetDSLookUp: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TDSProvider_MRGroup_GetDSLookUp_Cache: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TDSProvider_MRGroupItem_GetDSLookUp: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TDSProvider_MRGroupItem_GetDSLookUp_Cache: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TDSProvider_MRGroupItem_GetDSOverview: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TDSProvider_MRGroupItem_GetDSOverview_Cache: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TDSProvider_User_GetDS: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TDSProvider_User_GetDS_Cache: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TDSReport_DO_GetDSNP: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'ANONP'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TDSReport_DO_GetDSNP_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'ANONP'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TDSReport_DO_GetDS_CheckList: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'ANONP'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TDSReport_DO_GetDS_CheckList_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'ANONP'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TDSReport_SO_ByDate: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'StartDate'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'EndDate'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TDSReport_SO_ByDate_Cache: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'StartDate'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'EndDate'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TDSReport_SO_ByDateNoBukti: array [0..4] of TDSRestParameterMetaData =
  (
    (Name: 'StartDate'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'EndDate'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'aNoBuktiAwal'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'aNoBuktiAkhir'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TDSReport_SO_ByDateNoBukti_Cache: array [0..4] of TDSRestParameterMetaData =
  (
    (Name: 'StartDate'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'EndDate'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'aNoBuktiAwal'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'aNoBuktiAkhir'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TDSReport_PO_SLIP_ByDateNoBukti: array [0..4] of TDSRestParameterMetaData =
  (
    (Name: 'StartDate'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'EndDate'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'aNoBuktiAwal'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'aNoBuktiAkhir'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TDSReport_PO_SLIP_ByDateNoBukti_Cache: array [0..4] of TDSRestParameterMetaData =
  (
    (Name: 'StartDate'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'EndDate'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'aNoBuktiAwal'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'aNoBuktiAkhir'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TDSReport_SO_Test: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TDSReport_SO_Test_Cache: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

implementation

function TServerMethodsClient.EchoString(Value: string; const ARequestFilter: string): string;
begin
  if FEchoStringCommand = nil then
  begin
    FEchoStringCommand := FConnection.CreateCommand;
    FEchoStringCommand.RequestType := 'GET';
    FEchoStringCommand.Text := 'TServerMethods.EchoString';
    FEchoStringCommand.Prepare(TServerMethods_EchoString);
  end;
  FEchoStringCommand.Parameters[0].Value.SetWideString(Value);
  FEchoStringCommand.Execute(ARequestFilter);
  Result := FEchoStringCommand.Parameters[1].Value.GetWideString;
end;

function TServerMethodsClient.ReverseString(Value: string; const ARequestFilter: string): string;
begin
  if FReverseStringCommand = nil then
  begin
    FReverseStringCommand := FConnection.CreateCommand;
    FReverseStringCommand.RequestType := 'GET';
    FReverseStringCommand.Text := 'TServerMethods.ReverseString';
    FReverseStringCommand.Prepare(TServerMethods_ReverseString);
  end;
  FReverseStringCommand.Parameters[0].Value.SetWideString(Value);
  FReverseStringCommand.Execute(ARequestFilter);
  Result := FReverseStringCommand.Parameters[1].Value.GetWideString;
end;

constructor TServerMethodsClient.Create(ARestConnection: TDSRestConnection);
begin
  inherited Create(ARestConnection);
end;

constructor TServerMethodsClient.Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ARestConnection, AInstanceOwner);
end;

destructor TServerMethodsClient.Destroy;
begin
  FEchoStringCommand.DisposeOf;
  FReverseStringCommand.DisposeOf;
  inherited;
end;

function TUserClient.GetLoginUser(aUserName: string; aPassword: string; const ARequestFilter: string): TModUser;
begin
  if FGetLoginUserCommand = nil then
  begin
    FGetLoginUserCommand := FConnection.CreateCommand;
    FGetLoginUserCommand.RequestType := 'GET';
    FGetLoginUserCommand.Text := 'TUser.GetLoginUser';
    FGetLoginUserCommand.Prepare(TUser_GetLoginUser);
  end;
  FGetLoginUserCommand.Parameters[0].Value.SetWideString(aUserName);
  FGetLoginUserCommand.Parameters[1].Value.SetWideString(aPassword);
  FGetLoginUserCommand.Execute(ARequestFilter);
  if not FGetLoginUserCommand.Parameters[2].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FGetLoginUserCommand.Parameters[2].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TModUser(FUnMarshal.UnMarshal(FGetLoginUserCommand.Parameters[2].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FGetLoginUserCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TUserClient.GetLoginUser_Cache(aUserName: string; aPassword: string; const ARequestFilter: string): IDSRestCachedTModUser;
begin
  if FGetLoginUserCommand_Cache = nil then
  begin
    FGetLoginUserCommand_Cache := FConnection.CreateCommand;
    FGetLoginUserCommand_Cache.RequestType := 'GET';
    FGetLoginUserCommand_Cache.Text := 'TUser.GetLoginUser';
    FGetLoginUserCommand_Cache.Prepare(TUser_GetLoginUser_Cache);
  end;
  FGetLoginUserCommand_Cache.Parameters[0].Value.SetWideString(aUserName);
  FGetLoginUserCommand_Cache.Parameters[1].Value.SetWideString(aPassword);
  FGetLoginUserCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTModUser.Create(FGetLoginUserCommand_Cache.Parameters[2].Value.GetString);
end;

constructor TUserClient.Create(ARestConnection: TDSRestConnection);
begin
  inherited Create(ARestConnection);
end;

constructor TUserClient.Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ARestConnection, AInstanceOwner);
end;

destructor TUserClient.Destroy;
begin
  FGetLoginUserCommand.DisposeOf;
  FGetLoginUserCommand_Cache.DisposeOf;
  inherited;
end;

function TCrudClient.SaveToDB(AObject: TModApp; const ARequestFilter: string): Boolean;
begin
  if FSaveToDBCommand = nil then
  begin
    FSaveToDBCommand := FConnection.CreateCommand;
    FSaveToDBCommand.RequestType := 'POST';
    FSaveToDBCommand.Text := 'TCrud."SaveToDB"';
    FSaveToDBCommand.Prepare(TCrud_SaveToDB);
  end;
  if not Assigned(AObject) then
    FSaveToDBCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FSaveToDBCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FSaveToDBCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AObject), True);
      if FInstanceOwner then
        AObject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FSaveToDBCommand.Execute(ARequestFilter);
  Result := FSaveToDBCommand.Parameters[1].Value.GetBoolean;
end;

function TCrudClient.DeleteFromDB(AObject: TModApp; const ARequestFilter: string): Boolean;
begin
  if FDeleteFromDBCommand = nil then
  begin
    FDeleteFromDBCommand := FConnection.CreateCommand;
    FDeleteFromDBCommand.RequestType := 'POST';
    FDeleteFromDBCommand.Text := 'TCrud."DeleteFromDB"';
    FDeleteFromDBCommand.Prepare(TCrud_DeleteFromDB);
  end;
  if not Assigned(AObject) then
    FDeleteFromDBCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FDeleteFromDBCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FDeleteFromDBCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AObject), True);
      if FInstanceOwner then
        AObject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FDeleteFromDBCommand.Execute(ARequestFilter);
  Result := FDeleteFromDBCommand.Parameters[1].Value.GetBoolean;
end;

function TCrudClient.OpenQuery(S: string; const ARequestFilter: string): TDataSet;
begin
  if FOpenQueryCommand = nil then
  begin
    FOpenQueryCommand := FConnection.CreateCommand;
    FOpenQueryCommand.RequestType := 'GET';
    FOpenQueryCommand.Text := 'TCrud.OpenQuery';
    FOpenQueryCommand.Prepare(TCrud_OpenQuery);
  end;
  FOpenQueryCommand.Parameters[0].Value.SetWideString(S);
  FOpenQueryCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FOpenQueryCommand.Parameters[1].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FOpenQueryCommand.FreeOnExecute(Result);
end;

function TCrudClient.OpenQuery_Cache(S: string; const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FOpenQueryCommand_Cache = nil then
  begin
    FOpenQueryCommand_Cache := FConnection.CreateCommand;
    FOpenQueryCommand_Cache.RequestType := 'GET';
    FOpenQueryCommand_Cache.Text := 'TCrud.OpenQuery';
    FOpenQueryCommand_Cache.Prepare(TCrud_OpenQuery_Cache);
  end;
  FOpenQueryCommand_Cache.Parameters[0].Value.SetWideString(S);
  FOpenQueryCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FOpenQueryCommand_Cache.Parameters[1].Value.GetString);
end;

function TCrudClient.Retrieve(ModClassName: string; AID: string; const ARequestFilter: string): TModApp;
begin
  if FRetrieveCommand = nil then
  begin
    FRetrieveCommand := FConnection.CreateCommand;
    FRetrieveCommand.RequestType := 'GET';
    FRetrieveCommand.Text := 'TCrud.Retrieve';
    FRetrieveCommand.Prepare(TCrud_Retrieve);
  end;
  FRetrieveCommand.Parameters[0].Value.SetWideString(ModClassName);
  FRetrieveCommand.Parameters[1].Value.SetWideString(AID);
  FRetrieveCommand.Execute(ARequestFilter);
  if not FRetrieveCommand.Parameters[2].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FRetrieveCommand.Parameters[2].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TModApp(FUnMarshal.UnMarshal(FRetrieveCommand.Parameters[2].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FRetrieveCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TCrudClient.Retrieve_Cache(ModClassName: string; AID: string; const ARequestFilter: string): IDSRestCachedTModApp;
begin
  if FRetrieveCommand_Cache = nil then
  begin
    FRetrieveCommand_Cache := FConnection.CreateCommand;
    FRetrieveCommand_Cache.RequestType := 'GET';
    FRetrieveCommand_Cache.Text := 'TCrud.Retrieve';
    FRetrieveCommand_Cache.Prepare(TCrud_Retrieve_Cache);
  end;
  FRetrieveCommand_Cache.Parameters[0].Value.SetWideString(ModClassName);
  FRetrieveCommand_Cache.Parameters[1].Value.SetWideString(AID);
  FRetrieveCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTModApp.Create(FRetrieveCommand_Cache.Parameters[2].Value.GetString);
end;

function TCrudClient.GenerateCustomNo(aTableName: string; aFieldName: string; aCountDigit: Integer; const ARequestFilter: string): string;
begin
  if FGenerateCustomNoCommand = nil then
  begin
    FGenerateCustomNoCommand := FConnection.CreateCommand;
    FGenerateCustomNoCommand.RequestType := 'GET';
    FGenerateCustomNoCommand.Text := 'TCrud.GenerateCustomNo';
    FGenerateCustomNoCommand.Prepare(TCrud_GenerateCustomNo);
  end;
  FGenerateCustomNoCommand.Parameters[0].Value.SetWideString(aTableName);
  FGenerateCustomNoCommand.Parameters[1].Value.SetWideString(aFieldName);
  FGenerateCustomNoCommand.Parameters[2].Value.SetInt32(aCountDigit);
  FGenerateCustomNoCommand.Execute(ARequestFilter);
  Result := FGenerateCustomNoCommand.Parameters[3].Value.GetWideString;
end;

function TCrudClient.GenerateID(const ARequestFilter: string): string;
begin
  if FGenerateIDCommand = nil then
  begin
    FGenerateIDCommand := FConnection.CreateCommand;
    FGenerateIDCommand.RequestType := 'GET';
    FGenerateIDCommand.Text := 'TCrud.GenerateID';
    FGenerateIDCommand.Prepare(TCrud_GenerateID);
  end;
  FGenerateIDCommand.Execute(ARequestFilter);
  Result := FGenerateIDCommand.Parameters[0].Value.GetWideString;
end;

function TCrudClient.GenerateNo(aClassName: string; const ARequestFilter: string): string;
begin
  if FGenerateNoCommand = nil then
  begin
    FGenerateNoCommand := FConnection.CreateCommand;
    FGenerateNoCommand.RequestType := 'GET';
    FGenerateNoCommand.Text := 'TCrud.GenerateNo';
    FGenerateNoCommand.Prepare(TCrud_GenerateNo);
  end;
  FGenerateNoCommand.Parameters[0].Value.SetWideString(aClassName);
  FGenerateNoCommand.Execute(ARequestFilter);
  Result := FGenerateNoCommand.Parameters[1].Value.GetWideString;
end;

function TCrudClient.RetrieveSingle(ModClassName: string; AID: string; const ARequestFilter: string): TModApp;
begin
  if FRetrieveSingleCommand = nil then
  begin
    FRetrieveSingleCommand := FConnection.CreateCommand;
    FRetrieveSingleCommand.RequestType := 'GET';
    FRetrieveSingleCommand.Text := 'TCrud.RetrieveSingle';
    FRetrieveSingleCommand.Prepare(TCrud_RetrieveSingle);
  end;
  FRetrieveSingleCommand.Parameters[0].Value.SetWideString(ModClassName);
  FRetrieveSingleCommand.Parameters[1].Value.SetWideString(AID);
  FRetrieveSingleCommand.Execute(ARequestFilter);
  if not FRetrieveSingleCommand.Parameters[2].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FRetrieveSingleCommand.Parameters[2].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TModApp(FUnMarshal.UnMarshal(FRetrieveSingleCommand.Parameters[2].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FRetrieveSingleCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TCrudClient.RetrieveSingle_Cache(ModClassName: string; AID: string; const ARequestFilter: string): IDSRestCachedTModApp;
begin
  if FRetrieveSingleCommand_Cache = nil then
  begin
    FRetrieveSingleCommand_Cache := FConnection.CreateCommand;
    FRetrieveSingleCommand_Cache.RequestType := 'GET';
    FRetrieveSingleCommand_Cache.Text := 'TCrud.RetrieveSingle';
    FRetrieveSingleCommand_Cache.Prepare(TCrud_RetrieveSingle_Cache);
  end;
  FRetrieveSingleCommand_Cache.Parameters[0].Value.SetWideString(ModClassName);
  FRetrieveSingleCommand_Cache.Parameters[1].Value.SetWideString(AID);
  FRetrieveSingleCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTModApp.Create(FRetrieveSingleCommand_Cache.Parameters[2].Value.GetString);
end;

function TCrudClient.RetrieveByCode(ModClassName: string; aCode: string; const ARequestFilter: string): TModApp;
begin
  if FRetrieveByCodeCommand = nil then
  begin
    FRetrieveByCodeCommand := FConnection.CreateCommand;
    FRetrieveByCodeCommand.RequestType := 'GET';
    FRetrieveByCodeCommand.Text := 'TCrud.RetrieveByCode';
    FRetrieveByCodeCommand.Prepare(TCrud_RetrieveByCode);
  end;
  FRetrieveByCodeCommand.Parameters[0].Value.SetWideString(ModClassName);
  FRetrieveByCodeCommand.Parameters[1].Value.SetWideString(aCode);
  FRetrieveByCodeCommand.Execute(ARequestFilter);
  if not FRetrieveByCodeCommand.Parameters[2].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FRetrieveByCodeCommand.Parameters[2].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TModApp(FUnMarshal.UnMarshal(FRetrieveByCodeCommand.Parameters[2].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FRetrieveByCodeCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TCrudClient.RetrieveByCode_Cache(ModClassName: string; aCode: string; const ARequestFilter: string): IDSRestCachedTModApp;
begin
  if FRetrieveByCodeCommand_Cache = nil then
  begin
    FRetrieveByCodeCommand_Cache := FConnection.CreateCommand;
    FRetrieveByCodeCommand_Cache.RequestType := 'GET';
    FRetrieveByCodeCommand_Cache.Text := 'TCrud.RetrieveByCode';
    FRetrieveByCodeCommand_Cache.Prepare(TCrud_RetrieveByCode_Cache);
  end;
  FRetrieveByCodeCommand_Cache.Parameters[0].Value.SetWideString(ModClassName);
  FRetrieveByCodeCommand_Cache.Parameters[1].Value.SetWideString(aCode);
  FRetrieveByCodeCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTModApp.Create(FRetrieveByCodeCommand_Cache.Parameters[2].Value.GetString);
end;

function TCrudClient.SaveToDBLog(AObject: TModApp; const ARequestFilter: string): Boolean;
begin
  if FSaveToDBLogCommand = nil then
  begin
    FSaveToDBLogCommand := FConnection.CreateCommand;
    FSaveToDBLogCommand.RequestType := 'POST';
    FSaveToDBLogCommand.Text := 'TCrud."SaveToDBLog"';
    FSaveToDBLogCommand.Prepare(TCrud_SaveToDBLog);
  end;
  if not Assigned(AObject) then
    FSaveToDBLogCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FSaveToDBLogCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FSaveToDBLogCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AObject), True);
      if FInstanceOwner then
        AObject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FSaveToDBLogCommand.Execute(ARequestFilter);
  Result := FSaveToDBLogCommand.Parameters[1].Value.GetBoolean;
end;

function TCrudClient.SaveToDBID(AObject: TModApp; const ARequestFilter: string): string;
begin
  if FSaveToDBIDCommand = nil then
  begin
    FSaveToDBIDCommand := FConnection.CreateCommand;
    FSaveToDBIDCommand.RequestType := 'POST';
    FSaveToDBIDCommand.Text := 'TCrud."SaveToDBID"';
    FSaveToDBIDCommand.Prepare(TCrud_SaveToDBID);
  end;
  if not Assigned(AObject) then
    FSaveToDBIDCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FSaveToDBIDCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FSaveToDBIDCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AObject), True);
      if FInstanceOwner then
        AObject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FSaveToDBIDCommand.Execute(ARequestFilter);
  Result := FSaveToDBIDCommand.Parameters[1].Value.GetWideString;
end;

function TCrudClient.TestGenerateSQL(AObject: TModApp; const ARequestFilter: string): TStrings;
begin
  if FTestGenerateSQLCommand = nil then
  begin
    FTestGenerateSQLCommand := FConnection.CreateCommand;
    FTestGenerateSQLCommand.RequestType := 'POST';
    FTestGenerateSQLCommand.Text := 'TCrud."TestGenerateSQL"';
    FTestGenerateSQLCommand.Prepare(TCrud_TestGenerateSQL);
  end;
  if not Assigned(AObject) then
    FTestGenerateSQLCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FTestGenerateSQLCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FTestGenerateSQLCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AObject), True);
      if FInstanceOwner then
        AObject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FTestGenerateSQLCommand.Execute(ARequestFilter);
  if not FTestGenerateSQLCommand.Parameters[1].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FTestGenerateSQLCommand.Parameters[1].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TStrings(FUnMarshal.UnMarshal(FTestGenerateSQLCommand.Parameters[1].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FTestGenerateSQLCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TCrudClient.TestGenerateSQL_Cache(AObject: TModApp; const ARequestFilter: string): IDSRestCachedTStrings;
begin
  if FTestGenerateSQLCommand_Cache = nil then
  begin
    FTestGenerateSQLCommand_Cache := FConnection.CreateCommand;
    FTestGenerateSQLCommand_Cache.RequestType := 'POST';
    FTestGenerateSQLCommand_Cache.Text := 'TCrud."TestGenerateSQL"';
    FTestGenerateSQLCommand_Cache.Prepare(TCrud_TestGenerateSQL_Cache);
  end;
  if not Assigned(AObject) then
    FTestGenerateSQLCommand_Cache.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FTestGenerateSQLCommand_Cache.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FTestGenerateSQLCommand_Cache.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AObject), True);
      if FInstanceOwner then
        AObject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FTestGenerateSQLCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTStrings.Create(FTestGenerateSQLCommand_Cache.Parameters[1].Value.GetString);
end;

procedure TCrudClient.AfterExecuteMethod;
begin
  if FAfterExecuteMethodCommand = nil then
  begin
    FAfterExecuteMethodCommand := FConnection.CreateCommand;
    FAfterExecuteMethodCommand.RequestType := 'GET';
    FAfterExecuteMethodCommand.Text := 'TCrud.AfterExecuteMethod';
  end;
  FAfterExecuteMethodCommand.Execute;
end;

constructor TCrudClient.Create(ARestConnection: TDSRestConnection);
begin
  inherited Create(ARestConnection);
end;

constructor TCrudClient.Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ARestConnection, AInstanceOwner);
end;

destructor TCrudClient.Destroy;
begin
  FSaveToDBCommand.DisposeOf;
  FDeleteFromDBCommand.DisposeOf;
  FOpenQueryCommand.DisposeOf;
  FOpenQueryCommand_Cache.DisposeOf;
  FRetrieveCommand.DisposeOf;
  FRetrieveCommand_Cache.DisposeOf;
  FGenerateCustomNoCommand.DisposeOf;
  FGenerateIDCommand.DisposeOf;
  FGenerateNoCommand.DisposeOf;
  FRetrieveSingleCommand.DisposeOf;
  FRetrieveSingleCommand_Cache.DisposeOf;
  FRetrieveByCodeCommand.DisposeOf;
  FRetrieveByCodeCommand_Cache.DisposeOf;
  FSaveToDBLogCommand.DisposeOf;
  FSaveToDBIDCommand.DisposeOf;
  FTestGenerateSQLCommand.DisposeOf;
  FTestGenerateSQLCommand_Cache.DisposeOf;
  FAfterExecuteMethodCommand.DisposeOf;
  inherited;
end;

function TDSProviderClient.Indikator_GetDS(const ARequestFilter: string): TDataSet;
begin
  if FIndikator_GetDSCommand = nil then
  begin
    FIndikator_GetDSCommand := FConnection.CreateCommand;
    FIndikator_GetDSCommand.RequestType := 'GET';
    FIndikator_GetDSCommand.Text := 'TDSProvider.Indikator_GetDS';
    FIndikator_GetDSCommand.Prepare(TDSProvider_Indikator_GetDS);
  end;
  FIndikator_GetDSCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FIndikator_GetDSCommand.Parameters[0].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FIndikator_GetDSCommand.FreeOnExecute(Result);
end;

function TDSProviderClient.Indikator_GetDS_Cache(const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FIndikator_GetDSCommand_Cache = nil then
  begin
    FIndikator_GetDSCommand_Cache := FConnection.CreateCommand;
    FIndikator_GetDSCommand_Cache.RequestType := 'GET';
    FIndikator_GetDSCommand_Cache.Text := 'TDSProvider.Indikator_GetDS';
    FIndikator_GetDSCommand_Cache.Prepare(TDSProvider_Indikator_GetDS_Cache);
  end;
  FIndikator_GetDSCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FIndikator_GetDSCommand_Cache.Parameters[0].Value.GetString);
end;

function TDSProviderClient.IndikatorByUnit_GetDS(aUnit: string; const ARequestFilter: string): TDataSet;
begin
  if FIndikatorByUnit_GetDSCommand = nil then
  begin
    FIndikatorByUnit_GetDSCommand := FConnection.CreateCommand;
    FIndikatorByUnit_GetDSCommand.RequestType := 'GET';
    FIndikatorByUnit_GetDSCommand.Text := 'TDSProvider.IndikatorByUnit_GetDS';
    FIndikatorByUnit_GetDSCommand.Prepare(TDSProvider_IndikatorByUnit_GetDS);
  end;
  FIndikatorByUnit_GetDSCommand.Parameters[0].Value.SetWideString(aUnit);
  FIndikatorByUnit_GetDSCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FIndikatorByUnit_GetDSCommand.Parameters[1].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FIndikatorByUnit_GetDSCommand.FreeOnExecute(Result);
end;

function TDSProviderClient.IndikatorByUnit_GetDS_Cache(aUnit: string; const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FIndikatorByUnit_GetDSCommand_Cache = nil then
  begin
    FIndikatorByUnit_GetDSCommand_Cache := FConnection.CreateCommand;
    FIndikatorByUnit_GetDSCommand_Cache.RequestType := 'GET';
    FIndikatorByUnit_GetDSCommand_Cache.Text := 'TDSProvider.IndikatorByUnit_GetDS';
    FIndikatorByUnit_GetDSCommand_Cache.Prepare(TDSProvider_IndikatorByUnit_GetDS_Cache);
  end;
  FIndikatorByUnit_GetDSCommand_Cache.Parameters[0].Value.SetWideString(aUnit);
  FIndikatorByUnit_GetDSCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FIndikatorByUnit_GetDSCommand_Cache.Parameters[1].Value.GetString);
end;

function TDSProviderClient.LoadCPRByUnit(aUnit: string; aBulan: Integer; aTahun: Integer; const ARequestFilter: string): TDataSet;
begin
  if FLoadCPRByUnitCommand = nil then
  begin
    FLoadCPRByUnitCommand := FConnection.CreateCommand;
    FLoadCPRByUnitCommand.RequestType := 'GET';
    FLoadCPRByUnitCommand.Text := 'TDSProvider.LoadCPRByUnit';
    FLoadCPRByUnitCommand.Prepare(TDSProvider_LoadCPRByUnit);
  end;
  FLoadCPRByUnitCommand.Parameters[0].Value.SetWideString(aUnit);
  FLoadCPRByUnitCommand.Parameters[1].Value.SetInt32(aBulan);
  FLoadCPRByUnitCommand.Parameters[2].Value.SetInt32(aTahun);
  FLoadCPRByUnitCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FLoadCPRByUnitCommand.Parameters[3].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FLoadCPRByUnitCommand.FreeOnExecute(Result);
end;

function TDSProviderClient.LoadCPRByUnit_Cache(aUnit: string; aBulan: Integer; aTahun: Integer; const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FLoadCPRByUnitCommand_Cache = nil then
  begin
    FLoadCPRByUnitCommand_Cache := FConnection.CreateCommand;
    FLoadCPRByUnitCommand_Cache.RequestType := 'GET';
    FLoadCPRByUnitCommand_Cache.Text := 'TDSProvider.LoadCPRByUnit';
    FLoadCPRByUnitCommand_Cache.Prepare(TDSProvider_LoadCPRByUnit_Cache);
  end;
  FLoadCPRByUnitCommand_Cache.Parameters[0].Value.SetWideString(aUnit);
  FLoadCPRByUnitCommand_Cache.Parameters[1].Value.SetInt32(aBulan);
  FLoadCPRByUnitCommand_Cache.Parameters[2].Value.SetInt32(aTahun);
  FLoadCPRByUnitCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FLoadCPRByUnitCommand_Cache.Parameters[3].Value.GetString);
end;

function TDSProviderClient.Unit_GetDS(const ARequestFilter: string): TDataSet;
begin
  if FUnit_GetDSCommand = nil then
  begin
    FUnit_GetDSCommand := FConnection.CreateCommand;
    FUnit_GetDSCommand.RequestType := 'GET';
    FUnit_GetDSCommand.Text := 'TDSProvider.Unit_GetDS';
    FUnit_GetDSCommand.Prepare(TDSProvider_Unit_GetDS);
  end;
  FUnit_GetDSCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FUnit_GetDSCommand.Parameters[0].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FUnit_GetDSCommand.FreeOnExecute(Result);
end;

function TDSProviderClient.Unit_GetDS_Cache(const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FUnit_GetDSCommand_Cache = nil then
  begin
    FUnit_GetDSCommand_Cache := FConnection.CreateCommand;
    FUnit_GetDSCommand_Cache.RequestType := 'GET';
    FUnit_GetDSCommand_Cache.Text := 'TDSProvider.Unit_GetDS';
    FUnit_GetDSCommand_Cache.Prepare(TDSProvider_Unit_GetDS_Cache);
  end;
  FUnit_GetDSCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FUnit_GetDSCommand_Cache.Parameters[0].Value.GetString);
end;

function TDSProviderClient.Indikator_GetDSLookup(const ARequestFilter: string): TDataSet;
begin
  if FIndikator_GetDSLookupCommand = nil then
  begin
    FIndikator_GetDSLookupCommand := FConnection.CreateCommand;
    FIndikator_GetDSLookupCommand.RequestType := 'GET';
    FIndikator_GetDSLookupCommand.Text := 'TDSProvider.Indikator_GetDSLookup';
    FIndikator_GetDSLookupCommand.Prepare(TDSProvider_Indikator_GetDSLookup);
  end;
  FIndikator_GetDSLookupCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FIndikator_GetDSLookupCommand.Parameters[0].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FIndikator_GetDSLookupCommand.FreeOnExecute(Result);
end;

function TDSProviderClient.Indikator_GetDSLookup_Cache(const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FIndikator_GetDSLookupCommand_Cache = nil then
  begin
    FIndikator_GetDSLookupCommand_Cache := FConnection.CreateCommand;
    FIndikator_GetDSLookupCommand_Cache.RequestType := 'GET';
    FIndikator_GetDSLookupCommand_Cache.Text := 'TDSProvider.Indikator_GetDSLookup';
    FIndikator_GetDSLookupCommand_Cache.Prepare(TDSProvider_Indikator_GetDSLookup_Cache);
  end;
  FIndikator_GetDSLookupCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FIndikator_GetDSLookupCommand_Cache.Parameters[0].Value.GetString);
end;

function TDSProviderClient.Unit_GetDSLookup(const ARequestFilter: string): TDataSet;
begin
  if FUnit_GetDSLookupCommand = nil then
  begin
    FUnit_GetDSLookupCommand := FConnection.CreateCommand;
    FUnit_GetDSLookupCommand.RequestType := 'GET';
    FUnit_GetDSLookupCommand.Text := 'TDSProvider.Unit_GetDSLookup';
    FUnit_GetDSLookupCommand.Prepare(TDSProvider_Unit_GetDSLookup);
  end;
  FUnit_GetDSLookupCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FUnit_GetDSLookupCommand.Parameters[0].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FUnit_GetDSLookupCommand.FreeOnExecute(Result);
end;

function TDSProviderClient.Unit_GetDSLookup_Cache(const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FUnit_GetDSLookupCommand_Cache = nil then
  begin
    FUnit_GetDSLookupCommand_Cache := FConnection.CreateCommand;
    FUnit_GetDSLookupCommand_Cache.RequestType := 'GET';
    FUnit_GetDSLookupCommand_Cache.Text := 'TDSProvider.Unit_GetDSLookup';
    FUnit_GetDSLookupCommand_Cache.Prepare(TDSProvider_Unit_GetDSLookup_Cache);
  end;
  FUnit_GetDSLookupCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FUnit_GetDSLookupCommand_Cache.Parameters[0].Value.GetString);
end;

function TDSProviderClient.Indikator_GetDSOverview(const ARequestFilter: string): TDataSet;
begin
  if FIndikator_GetDSOverviewCommand = nil then
  begin
    FIndikator_GetDSOverviewCommand := FConnection.CreateCommand;
    FIndikator_GetDSOverviewCommand.RequestType := 'GET';
    FIndikator_GetDSOverviewCommand.Text := 'TDSProvider.Indikator_GetDSOverview';
    FIndikator_GetDSOverviewCommand.Prepare(TDSProvider_Indikator_GetDSOverview);
  end;
  FIndikator_GetDSOverviewCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FIndikator_GetDSOverviewCommand.Parameters[0].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FIndikator_GetDSOverviewCommand.FreeOnExecute(Result);
end;

function TDSProviderClient.Indikator_GetDSOverview_Cache(const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FIndikator_GetDSOverviewCommand_Cache = nil then
  begin
    FIndikator_GetDSOverviewCommand_Cache := FConnection.CreateCommand;
    FIndikator_GetDSOverviewCommand_Cache.RequestType := 'GET';
    FIndikator_GetDSOverviewCommand_Cache.Text := 'TDSProvider.Indikator_GetDSOverview';
    FIndikator_GetDSOverviewCommand_Cache.Prepare(TDSProvider_Indikator_GetDSOverview_Cache);
  end;
  FIndikator_GetDSOverviewCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FIndikator_GetDSOverviewCommand_Cache.Parameters[0].Value.GetString);
end;

function TDSProviderClient.CPRSetting_GetDSLookup(const ARequestFilter: string): TDataSet;
begin
  if FCPRSetting_GetDSLookupCommand = nil then
  begin
    FCPRSetting_GetDSLookupCommand := FConnection.CreateCommand;
    FCPRSetting_GetDSLookupCommand.RequestType := 'GET';
    FCPRSetting_GetDSLookupCommand.Text := 'TDSProvider.CPRSetting_GetDSLookup';
    FCPRSetting_GetDSLookupCommand.Prepare(TDSProvider_CPRSetting_GetDSLookup);
  end;
  FCPRSetting_GetDSLookupCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FCPRSetting_GetDSLookupCommand.Parameters[0].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FCPRSetting_GetDSLookupCommand.FreeOnExecute(Result);
end;

function TDSProviderClient.CPRSetting_GetDSLookup_Cache(const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FCPRSetting_GetDSLookupCommand_Cache = nil then
  begin
    FCPRSetting_GetDSLookupCommand_Cache := FConnection.CreateCommand;
    FCPRSetting_GetDSLookupCommand_Cache.RequestType := 'GET';
    FCPRSetting_GetDSLookupCommand_Cache.Text := 'TDSProvider.CPRSetting_GetDSLookup';
    FCPRSetting_GetDSLookupCommand_Cache.Prepare(TDSProvider_CPRSetting_GetDSLookup_Cache);
  end;
  FCPRSetting_GetDSLookupCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FCPRSetting_GetDSLookupCommand_Cache.Parameters[0].Value.GetString);
end;

function TDSProviderClient.CPR_GetDSLookup(const ARequestFilter: string): TDataSet;
begin
  if FCPR_GetDSLookupCommand = nil then
  begin
    FCPR_GetDSLookupCommand := FConnection.CreateCommand;
    FCPR_GetDSLookupCommand.RequestType := 'GET';
    FCPR_GetDSLookupCommand.Text := 'TDSProvider.CPR_GetDSLookup';
    FCPR_GetDSLookupCommand.Prepare(TDSProvider_CPR_GetDSLookup);
  end;
  FCPR_GetDSLookupCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FCPR_GetDSLookupCommand.Parameters[0].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FCPR_GetDSLookupCommand.FreeOnExecute(Result);
end;

function TDSProviderClient.CPR_GetDSLookup_Cache(const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FCPR_GetDSLookupCommand_Cache = nil then
  begin
    FCPR_GetDSLookupCommand_Cache := FConnection.CreateCommand;
    FCPR_GetDSLookupCommand_Cache.RequestType := 'GET';
    FCPR_GetDSLookupCommand_Cache.Text := 'TDSProvider.CPR_GetDSLookup';
    FCPR_GetDSLookupCommand_Cache.Prepare(TDSProvider_CPR_GetDSLookup_Cache);
  end;
  FCPR_GetDSLookupCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FCPR_GetDSLookupCommand_Cache.Parameters[0].Value.GetString);
end;

function TDSProviderClient.Unit_GetDSOverview(const ARequestFilter: string): TDataSet;
begin
  if FUnit_GetDSOverviewCommand = nil then
  begin
    FUnit_GetDSOverviewCommand := FConnection.CreateCommand;
    FUnit_GetDSOverviewCommand.RequestType := 'GET';
    FUnit_GetDSOverviewCommand.Text := 'TDSProvider.Unit_GetDSOverview';
    FUnit_GetDSOverviewCommand.Prepare(TDSProvider_Unit_GetDSOverview);
  end;
  FUnit_GetDSOverviewCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FUnit_GetDSOverviewCommand.Parameters[0].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FUnit_GetDSOverviewCommand.FreeOnExecute(Result);
end;

function TDSProviderClient.Unit_GetDSOverview_Cache(const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FUnit_GetDSOverviewCommand_Cache = nil then
  begin
    FUnit_GetDSOverviewCommand_Cache := FConnection.CreateCommand;
    FUnit_GetDSOverviewCommand_Cache.RequestType := 'GET';
    FUnit_GetDSOverviewCommand_Cache.Text := 'TDSProvider.Unit_GetDSOverview';
    FUnit_GetDSOverviewCommand_Cache.Prepare(TDSProvider_Unit_GetDSOverview_Cache);
  end;
  FUnit_GetDSOverviewCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FUnit_GetDSOverviewCommand_Cache.Parameters[0].Value.GetString);
end;

function TDSProviderClient.CPRSetting_GetDSOverview(const ARequestFilter: string): TDataSet;
begin
  if FCPRSetting_GetDSOverviewCommand = nil then
  begin
    FCPRSetting_GetDSOverviewCommand := FConnection.CreateCommand;
    FCPRSetting_GetDSOverviewCommand.RequestType := 'GET';
    FCPRSetting_GetDSOverviewCommand.Text := 'TDSProvider.CPRSetting_GetDSOverview';
    FCPRSetting_GetDSOverviewCommand.Prepare(TDSProvider_CPRSetting_GetDSOverview);
  end;
  FCPRSetting_GetDSOverviewCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FCPRSetting_GetDSOverviewCommand.Parameters[0].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FCPRSetting_GetDSOverviewCommand.FreeOnExecute(Result);
end;

function TDSProviderClient.CPRSetting_GetDSOverview_Cache(const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FCPRSetting_GetDSOverviewCommand_Cache = nil then
  begin
    FCPRSetting_GetDSOverviewCommand_Cache := FConnection.CreateCommand;
    FCPRSetting_GetDSOverviewCommand_Cache.RequestType := 'GET';
    FCPRSetting_GetDSOverviewCommand_Cache.Text := 'TDSProvider.CPRSetting_GetDSOverview';
    FCPRSetting_GetDSOverviewCommand_Cache.Prepare(TDSProvider_CPRSetting_GetDSOverview_Cache);
  end;
  FCPRSetting_GetDSOverviewCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FCPRSetting_GetDSOverviewCommand_Cache.Parameters[0].Value.GetString);
end;

function TDSProviderClient.MRGroup_GetDSOverview(const ARequestFilter: string): TDataSet;
begin
  if FMRGroup_GetDSOverviewCommand = nil then
  begin
    FMRGroup_GetDSOverviewCommand := FConnection.CreateCommand;
    FMRGroup_GetDSOverviewCommand.RequestType := 'GET';
    FMRGroup_GetDSOverviewCommand.Text := 'TDSProvider.MRGroup_GetDSOverview';
    FMRGroup_GetDSOverviewCommand.Prepare(TDSProvider_MRGroup_GetDSOverview);
  end;
  FMRGroup_GetDSOverviewCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FMRGroup_GetDSOverviewCommand.Parameters[0].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FMRGroup_GetDSOverviewCommand.FreeOnExecute(Result);
end;

function TDSProviderClient.MRGroup_GetDSOverview_Cache(const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FMRGroup_GetDSOverviewCommand_Cache = nil then
  begin
    FMRGroup_GetDSOverviewCommand_Cache := FConnection.CreateCommand;
    FMRGroup_GetDSOverviewCommand_Cache.RequestType := 'GET';
    FMRGroup_GetDSOverviewCommand_Cache.Text := 'TDSProvider.MRGroup_GetDSOverview';
    FMRGroup_GetDSOverviewCommand_Cache.Prepare(TDSProvider_MRGroup_GetDSOverview_Cache);
  end;
  FMRGroup_GetDSOverviewCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FMRGroup_GetDSOverviewCommand_Cache.Parameters[0].Value.GetString);
end;

function TDSProviderClient.CPR_GetDSOverview(const ARequestFilter: string): TDataSet;
begin
  if FCPR_GetDSOverviewCommand = nil then
  begin
    FCPR_GetDSOverviewCommand := FConnection.CreateCommand;
    FCPR_GetDSOverviewCommand.RequestType := 'GET';
    FCPR_GetDSOverviewCommand.Text := 'TDSProvider.CPR_GetDSOverview';
    FCPR_GetDSOverviewCommand.Prepare(TDSProvider_CPR_GetDSOverview);
  end;
  FCPR_GetDSOverviewCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FCPR_GetDSOverviewCommand.Parameters[0].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FCPR_GetDSOverviewCommand.FreeOnExecute(Result);
end;

function TDSProviderClient.CPR_GetDSOverview_Cache(const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FCPR_GetDSOverviewCommand_Cache = nil then
  begin
    FCPR_GetDSOverviewCommand_Cache := FConnection.CreateCommand;
    FCPR_GetDSOverviewCommand_Cache.RequestType := 'GET';
    FCPR_GetDSOverviewCommand_Cache.Text := 'TDSProvider.CPR_GetDSOverview';
    FCPR_GetDSOverviewCommand_Cache.Prepare(TDSProvider_CPR_GetDSOverview_Cache);
  end;
  FCPR_GetDSOverviewCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FCPR_GetDSOverviewCommand_Cache.Parameters[0].Value.GetString);
end;

function TDSProviderClient.Embedded_GetDS(const ARequestFilter: string): TDataSet;
begin
  if FEmbedded_GetDSCommand = nil then
  begin
    FEmbedded_GetDSCommand := FConnection.CreateCommand;
    FEmbedded_GetDSCommand.RequestType := 'GET';
    FEmbedded_GetDSCommand.Text := 'TDSProvider.Embedded_GetDS';
    FEmbedded_GetDSCommand.Prepare(TDSProvider_Embedded_GetDS);
  end;
  FEmbedded_GetDSCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FEmbedded_GetDSCommand.Parameters[0].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FEmbedded_GetDSCommand.FreeOnExecute(Result);
end;

function TDSProviderClient.Embedded_GetDS_Cache(const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FEmbedded_GetDSCommand_Cache = nil then
  begin
    FEmbedded_GetDSCommand_Cache := FConnection.CreateCommand;
    FEmbedded_GetDSCommand_Cache.RequestType := 'GET';
    FEmbedded_GetDSCommand_Cache.Text := 'TDSProvider.Embedded_GetDS';
    FEmbedded_GetDSCommand_Cache.Prepare(TDSProvider_Embedded_GetDS_Cache);
  end;
  FEmbedded_GetDSCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FEmbedded_GetDSCommand_Cache.Parameters[0].Value.GetString);
end;

function TDSProviderClient.MRGroup_GetDSLookUp(const ARequestFilter: string): TDataSet;
begin
  if FMRGroup_GetDSLookUpCommand = nil then
  begin
    FMRGroup_GetDSLookUpCommand := FConnection.CreateCommand;
    FMRGroup_GetDSLookUpCommand.RequestType := 'GET';
    FMRGroup_GetDSLookUpCommand.Text := 'TDSProvider.MRGroup_GetDSLookUp';
    FMRGroup_GetDSLookUpCommand.Prepare(TDSProvider_MRGroup_GetDSLookUp);
  end;
  FMRGroup_GetDSLookUpCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FMRGroup_GetDSLookUpCommand.Parameters[0].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FMRGroup_GetDSLookUpCommand.FreeOnExecute(Result);
end;

function TDSProviderClient.MRGroup_GetDSLookUp_Cache(const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FMRGroup_GetDSLookUpCommand_Cache = nil then
  begin
    FMRGroup_GetDSLookUpCommand_Cache := FConnection.CreateCommand;
    FMRGroup_GetDSLookUpCommand_Cache.RequestType := 'GET';
    FMRGroup_GetDSLookUpCommand_Cache.Text := 'TDSProvider.MRGroup_GetDSLookUp';
    FMRGroup_GetDSLookUpCommand_Cache.Prepare(TDSProvider_MRGroup_GetDSLookUp_Cache);
  end;
  FMRGroup_GetDSLookUpCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FMRGroup_GetDSLookUpCommand_Cache.Parameters[0].Value.GetString);
end;

function TDSProviderClient.MRGroupItem_GetDSLookUp(const ARequestFilter: string): TDataSet;
begin
  if FMRGroupItem_GetDSLookUpCommand = nil then
  begin
    FMRGroupItem_GetDSLookUpCommand := FConnection.CreateCommand;
    FMRGroupItem_GetDSLookUpCommand.RequestType := 'GET';
    FMRGroupItem_GetDSLookUpCommand.Text := 'TDSProvider.MRGroupItem_GetDSLookUp';
    FMRGroupItem_GetDSLookUpCommand.Prepare(TDSProvider_MRGroupItem_GetDSLookUp);
  end;
  FMRGroupItem_GetDSLookUpCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FMRGroupItem_GetDSLookUpCommand.Parameters[0].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FMRGroupItem_GetDSLookUpCommand.FreeOnExecute(Result);
end;

function TDSProviderClient.MRGroupItem_GetDSLookUp_Cache(const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FMRGroupItem_GetDSLookUpCommand_Cache = nil then
  begin
    FMRGroupItem_GetDSLookUpCommand_Cache := FConnection.CreateCommand;
    FMRGroupItem_GetDSLookUpCommand_Cache.RequestType := 'GET';
    FMRGroupItem_GetDSLookUpCommand_Cache.Text := 'TDSProvider.MRGroupItem_GetDSLookUp';
    FMRGroupItem_GetDSLookUpCommand_Cache.Prepare(TDSProvider_MRGroupItem_GetDSLookUp_Cache);
  end;
  FMRGroupItem_GetDSLookUpCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FMRGroupItem_GetDSLookUpCommand_Cache.Parameters[0].Value.GetString);
end;

function TDSProviderClient.MRGroupItem_GetDSOverview(const ARequestFilter: string): TDataSet;
begin
  if FMRGroupItem_GetDSOverviewCommand = nil then
  begin
    FMRGroupItem_GetDSOverviewCommand := FConnection.CreateCommand;
    FMRGroupItem_GetDSOverviewCommand.RequestType := 'GET';
    FMRGroupItem_GetDSOverviewCommand.Text := 'TDSProvider.MRGroupItem_GetDSOverview';
    FMRGroupItem_GetDSOverviewCommand.Prepare(TDSProvider_MRGroupItem_GetDSOverview);
  end;
  FMRGroupItem_GetDSOverviewCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FMRGroupItem_GetDSOverviewCommand.Parameters[0].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FMRGroupItem_GetDSOverviewCommand.FreeOnExecute(Result);
end;

function TDSProviderClient.MRGroupItem_GetDSOverview_Cache(const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FMRGroupItem_GetDSOverviewCommand_Cache = nil then
  begin
    FMRGroupItem_GetDSOverviewCommand_Cache := FConnection.CreateCommand;
    FMRGroupItem_GetDSOverviewCommand_Cache.RequestType := 'GET';
    FMRGroupItem_GetDSOverviewCommand_Cache.Text := 'TDSProvider.MRGroupItem_GetDSOverview';
    FMRGroupItem_GetDSOverviewCommand_Cache.Prepare(TDSProvider_MRGroupItem_GetDSOverview_Cache);
  end;
  FMRGroupItem_GetDSOverviewCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FMRGroupItem_GetDSOverviewCommand_Cache.Parameters[0].Value.GetString);
end;

function TDSProviderClient.User_GetDS(const ARequestFilter: string): TDataSet;
begin
  if FUser_GetDSCommand = nil then
  begin
    FUser_GetDSCommand := FConnection.CreateCommand;
    FUser_GetDSCommand.RequestType := 'GET';
    FUser_GetDSCommand.Text := 'TDSProvider.User_GetDS';
    FUser_GetDSCommand.Prepare(TDSProvider_User_GetDS);
  end;
  FUser_GetDSCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FUser_GetDSCommand.Parameters[0].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FUser_GetDSCommand.FreeOnExecute(Result);
end;

function TDSProviderClient.User_GetDS_Cache(const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FUser_GetDSCommand_Cache = nil then
  begin
    FUser_GetDSCommand_Cache := FConnection.CreateCommand;
    FUser_GetDSCommand_Cache.RequestType := 'GET';
    FUser_GetDSCommand_Cache.Text := 'TDSProvider.User_GetDS';
    FUser_GetDSCommand_Cache.Prepare(TDSProvider_User_GetDS_Cache);
  end;
  FUser_GetDSCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FUser_GetDSCommand_Cache.Parameters[0].Value.GetString);
end;

constructor TDSProviderClient.Create(ARestConnection: TDSRestConnection);
begin
  inherited Create(ARestConnection);
end;

constructor TDSProviderClient.Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ARestConnection, AInstanceOwner);
end;

destructor TDSProviderClient.Destroy;
begin
  FIndikator_GetDSCommand.DisposeOf;
  FIndikator_GetDSCommand_Cache.DisposeOf;
  FIndikatorByUnit_GetDSCommand.DisposeOf;
  FIndikatorByUnit_GetDSCommand_Cache.DisposeOf;
  FLoadCPRByUnitCommand.DisposeOf;
  FLoadCPRByUnitCommand_Cache.DisposeOf;
  FUnit_GetDSCommand.DisposeOf;
  FUnit_GetDSCommand_Cache.DisposeOf;
  FIndikator_GetDSLookupCommand.DisposeOf;
  FIndikator_GetDSLookupCommand_Cache.DisposeOf;
  FUnit_GetDSLookupCommand.DisposeOf;
  FUnit_GetDSLookupCommand_Cache.DisposeOf;
  FIndikator_GetDSOverviewCommand.DisposeOf;
  FIndikator_GetDSOverviewCommand_Cache.DisposeOf;
  FCPRSetting_GetDSLookupCommand.DisposeOf;
  FCPRSetting_GetDSLookupCommand_Cache.DisposeOf;
  FCPR_GetDSLookupCommand.DisposeOf;
  FCPR_GetDSLookupCommand_Cache.DisposeOf;
  FUnit_GetDSOverviewCommand.DisposeOf;
  FUnit_GetDSOverviewCommand_Cache.DisposeOf;
  FCPRSetting_GetDSOverviewCommand.DisposeOf;
  FCPRSetting_GetDSOverviewCommand_Cache.DisposeOf;
  FMRGroup_GetDSOverviewCommand.DisposeOf;
  FMRGroup_GetDSOverviewCommand_Cache.DisposeOf;
  FCPR_GetDSOverviewCommand.DisposeOf;
  FCPR_GetDSOverviewCommand_Cache.DisposeOf;
  FEmbedded_GetDSCommand.DisposeOf;
  FEmbedded_GetDSCommand_Cache.DisposeOf;
  FMRGroup_GetDSLookUpCommand.DisposeOf;
  FMRGroup_GetDSLookUpCommand_Cache.DisposeOf;
  FMRGroupItem_GetDSLookUpCommand.DisposeOf;
  FMRGroupItem_GetDSLookUpCommand_Cache.DisposeOf;
  FMRGroupItem_GetDSOverviewCommand.DisposeOf;
  FMRGroupItem_GetDSOverviewCommand_Cache.DisposeOf;
  FUser_GetDSCommand.DisposeOf;
  FUser_GetDSCommand_Cache.DisposeOf;
  inherited;
end;

function TDSReportClient.DO_GetDSNP(ANONP: string; const ARequestFilter: string): TFDJSONDataSets;
begin
  if FDO_GetDSNPCommand = nil then
  begin
    FDO_GetDSNPCommand := FConnection.CreateCommand;
    FDO_GetDSNPCommand.RequestType := 'GET';
    FDO_GetDSNPCommand.Text := 'TDSReport.DO_GetDSNP';
    FDO_GetDSNPCommand.Prepare(TDSReport_DO_GetDSNP);
  end;
  FDO_GetDSNPCommand.Parameters[0].Value.SetWideString(ANONP);
  FDO_GetDSNPCommand.Execute(ARequestFilter);
  if not FDO_GetDSNPCommand.Parameters[1].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FDO_GetDSNPCommand.Parameters[1].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FDO_GetDSNPCommand.Parameters[1].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FDO_GetDSNPCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TDSReportClient.DO_GetDSNP_Cache(ANONP: string; const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
begin
  if FDO_GetDSNPCommand_Cache = nil then
  begin
    FDO_GetDSNPCommand_Cache := FConnection.CreateCommand;
    FDO_GetDSNPCommand_Cache.RequestType := 'GET';
    FDO_GetDSNPCommand_Cache.Text := 'TDSReport.DO_GetDSNP';
    FDO_GetDSNPCommand_Cache.Prepare(TDSReport_DO_GetDSNP_Cache);
  end;
  FDO_GetDSNPCommand_Cache.Parameters[0].Value.SetWideString(ANONP);
  FDO_GetDSNPCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTFDJSONDataSets.Create(FDO_GetDSNPCommand_Cache.Parameters[1].Value.GetString);
end;

function TDSReportClient.DO_GetDS_CheckList(ANONP: string; const ARequestFilter: string): TFDJSONDataSets;
begin
  if FDO_GetDS_CheckListCommand = nil then
  begin
    FDO_GetDS_CheckListCommand := FConnection.CreateCommand;
    FDO_GetDS_CheckListCommand.RequestType := 'GET';
    FDO_GetDS_CheckListCommand.Text := 'TDSReport.DO_GetDS_CheckList';
    FDO_GetDS_CheckListCommand.Prepare(TDSReport_DO_GetDS_CheckList);
  end;
  FDO_GetDS_CheckListCommand.Parameters[0].Value.SetWideString(ANONP);
  FDO_GetDS_CheckListCommand.Execute(ARequestFilter);
  if not FDO_GetDS_CheckListCommand.Parameters[1].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FDO_GetDS_CheckListCommand.Parameters[1].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FDO_GetDS_CheckListCommand.Parameters[1].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FDO_GetDS_CheckListCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TDSReportClient.DO_GetDS_CheckList_Cache(ANONP: string; const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
begin
  if FDO_GetDS_CheckListCommand_Cache = nil then
  begin
    FDO_GetDS_CheckListCommand_Cache := FConnection.CreateCommand;
    FDO_GetDS_CheckListCommand_Cache.RequestType := 'GET';
    FDO_GetDS_CheckListCommand_Cache.Text := 'TDSReport.DO_GetDS_CheckList';
    FDO_GetDS_CheckListCommand_Cache.Prepare(TDSReport_DO_GetDS_CheckList_Cache);
  end;
  FDO_GetDS_CheckListCommand_Cache.Parameters[0].Value.SetWideString(ANONP);
  FDO_GetDS_CheckListCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTFDJSONDataSets.Create(FDO_GetDS_CheckListCommand_Cache.Parameters[1].Value.GetString);
end;

function TDSReportClient.SO_ByDate(StartDate: TDateTime; EndDate: TDateTime; const ARequestFilter: string): TFDJSONDataSets;
begin
  if FSO_ByDateCommand = nil then
  begin
    FSO_ByDateCommand := FConnection.CreateCommand;
    FSO_ByDateCommand.RequestType := 'GET';
    FSO_ByDateCommand.Text := 'TDSReport.SO_ByDate';
    FSO_ByDateCommand.Prepare(TDSReport_SO_ByDate);
  end;
  FSO_ByDateCommand.Parameters[0].Value.AsDateTime := StartDate;
  FSO_ByDateCommand.Parameters[1].Value.AsDateTime := EndDate;
  FSO_ByDateCommand.Execute(ARequestFilter);
  if not FSO_ByDateCommand.Parameters[2].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FSO_ByDateCommand.Parameters[2].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FSO_ByDateCommand.Parameters[2].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FSO_ByDateCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TDSReportClient.SO_ByDate_Cache(StartDate: TDateTime; EndDate: TDateTime; const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
begin
  if FSO_ByDateCommand_Cache = nil then
  begin
    FSO_ByDateCommand_Cache := FConnection.CreateCommand;
    FSO_ByDateCommand_Cache.RequestType := 'GET';
    FSO_ByDateCommand_Cache.Text := 'TDSReport.SO_ByDate';
    FSO_ByDateCommand_Cache.Prepare(TDSReport_SO_ByDate_Cache);
  end;
  FSO_ByDateCommand_Cache.Parameters[0].Value.AsDateTime := StartDate;
  FSO_ByDateCommand_Cache.Parameters[1].Value.AsDateTime := EndDate;
  FSO_ByDateCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTFDJSONDataSets.Create(FSO_ByDateCommand_Cache.Parameters[2].Value.GetString);
end;

function TDSReportClient.SO_ByDateNoBukti(StartDate: TDateTime; EndDate: TDateTime; aNoBuktiAwal: string; aNoBuktiAkhir: string; const ARequestFilter: string): TFDJSONDataSets;
begin
  if FSO_ByDateNoBuktiCommand = nil then
  begin
    FSO_ByDateNoBuktiCommand := FConnection.CreateCommand;
    FSO_ByDateNoBuktiCommand.RequestType := 'GET';
    FSO_ByDateNoBuktiCommand.Text := 'TDSReport.SO_ByDateNoBukti';
    FSO_ByDateNoBuktiCommand.Prepare(TDSReport_SO_ByDateNoBukti);
  end;
  FSO_ByDateNoBuktiCommand.Parameters[0].Value.AsDateTime := StartDate;
  FSO_ByDateNoBuktiCommand.Parameters[1].Value.AsDateTime := EndDate;
  FSO_ByDateNoBuktiCommand.Parameters[2].Value.SetWideString(aNoBuktiAwal);
  FSO_ByDateNoBuktiCommand.Parameters[3].Value.SetWideString(aNoBuktiAkhir);
  FSO_ByDateNoBuktiCommand.Execute(ARequestFilter);
  if not FSO_ByDateNoBuktiCommand.Parameters[4].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FSO_ByDateNoBuktiCommand.Parameters[4].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FSO_ByDateNoBuktiCommand.Parameters[4].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FSO_ByDateNoBuktiCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TDSReportClient.SO_ByDateNoBukti_Cache(StartDate: TDateTime; EndDate: TDateTime; aNoBuktiAwal: string; aNoBuktiAkhir: string; const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
begin
  if FSO_ByDateNoBuktiCommand_Cache = nil then
  begin
    FSO_ByDateNoBuktiCommand_Cache := FConnection.CreateCommand;
    FSO_ByDateNoBuktiCommand_Cache.RequestType := 'GET';
    FSO_ByDateNoBuktiCommand_Cache.Text := 'TDSReport.SO_ByDateNoBukti';
    FSO_ByDateNoBuktiCommand_Cache.Prepare(TDSReport_SO_ByDateNoBukti_Cache);
  end;
  FSO_ByDateNoBuktiCommand_Cache.Parameters[0].Value.AsDateTime := StartDate;
  FSO_ByDateNoBuktiCommand_Cache.Parameters[1].Value.AsDateTime := EndDate;
  FSO_ByDateNoBuktiCommand_Cache.Parameters[2].Value.SetWideString(aNoBuktiAwal);
  FSO_ByDateNoBuktiCommand_Cache.Parameters[3].Value.SetWideString(aNoBuktiAkhir);
  FSO_ByDateNoBuktiCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTFDJSONDataSets.Create(FSO_ByDateNoBuktiCommand_Cache.Parameters[4].Value.GetString);
end;

function TDSReportClient.PO_SLIP_ByDateNoBukti(StartDate: TDateTime; EndDate: TDateTime; aNoBuktiAwal: string; aNoBuktiAkhir: string; const ARequestFilter: string): TFDJSONDataSets;
begin
  if FPO_SLIP_ByDateNoBuktiCommand = nil then
  begin
    FPO_SLIP_ByDateNoBuktiCommand := FConnection.CreateCommand;
    FPO_SLIP_ByDateNoBuktiCommand.RequestType := 'GET';
    FPO_SLIP_ByDateNoBuktiCommand.Text := 'TDSReport.PO_SLIP_ByDateNoBukti';
    FPO_SLIP_ByDateNoBuktiCommand.Prepare(TDSReport_PO_SLIP_ByDateNoBukti);
  end;
  FPO_SLIP_ByDateNoBuktiCommand.Parameters[0].Value.AsDateTime := StartDate;
  FPO_SLIP_ByDateNoBuktiCommand.Parameters[1].Value.AsDateTime := EndDate;
  FPO_SLIP_ByDateNoBuktiCommand.Parameters[2].Value.SetWideString(aNoBuktiAwal);
  FPO_SLIP_ByDateNoBuktiCommand.Parameters[3].Value.SetWideString(aNoBuktiAkhir);
  FPO_SLIP_ByDateNoBuktiCommand.Execute(ARequestFilter);
  if not FPO_SLIP_ByDateNoBuktiCommand.Parameters[4].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FPO_SLIP_ByDateNoBuktiCommand.Parameters[4].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FPO_SLIP_ByDateNoBuktiCommand.Parameters[4].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FPO_SLIP_ByDateNoBuktiCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TDSReportClient.PO_SLIP_ByDateNoBukti_Cache(StartDate: TDateTime; EndDate: TDateTime; aNoBuktiAwal: string; aNoBuktiAkhir: string; const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
begin
  if FPO_SLIP_ByDateNoBuktiCommand_Cache = nil then
  begin
    FPO_SLIP_ByDateNoBuktiCommand_Cache := FConnection.CreateCommand;
    FPO_SLIP_ByDateNoBuktiCommand_Cache.RequestType := 'GET';
    FPO_SLIP_ByDateNoBuktiCommand_Cache.Text := 'TDSReport.PO_SLIP_ByDateNoBukti';
    FPO_SLIP_ByDateNoBuktiCommand_Cache.Prepare(TDSReport_PO_SLIP_ByDateNoBukti_Cache);
  end;
  FPO_SLIP_ByDateNoBuktiCommand_Cache.Parameters[0].Value.AsDateTime := StartDate;
  FPO_SLIP_ByDateNoBuktiCommand_Cache.Parameters[1].Value.AsDateTime := EndDate;
  FPO_SLIP_ByDateNoBuktiCommand_Cache.Parameters[2].Value.SetWideString(aNoBuktiAwal);
  FPO_SLIP_ByDateNoBuktiCommand_Cache.Parameters[3].Value.SetWideString(aNoBuktiAkhir);
  FPO_SLIP_ByDateNoBuktiCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTFDJSONDataSets.Create(FPO_SLIP_ByDateNoBuktiCommand_Cache.Parameters[4].Value.GetString);
end;

function TDSReportClient.SO_Test(const ARequestFilter: string): TFDJSONDataSets;
begin
  if FSO_TestCommand = nil then
  begin
    FSO_TestCommand := FConnection.CreateCommand;
    FSO_TestCommand.RequestType := 'GET';
    FSO_TestCommand.Text := 'TDSReport.SO_Test';
    FSO_TestCommand.Prepare(TDSReport_SO_Test);
  end;
  FSO_TestCommand.Execute(ARequestFilter);
  if not FSO_TestCommand.Parameters[0].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FSO_TestCommand.Parameters[0].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FSO_TestCommand.Parameters[0].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FSO_TestCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TDSReportClient.SO_Test_Cache(const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
begin
  if FSO_TestCommand_Cache = nil then
  begin
    FSO_TestCommand_Cache := FConnection.CreateCommand;
    FSO_TestCommand_Cache.RequestType := 'GET';
    FSO_TestCommand_Cache.Text := 'TDSReport.SO_Test';
    FSO_TestCommand_Cache.Prepare(TDSReport_SO_Test_Cache);
  end;
  FSO_TestCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTFDJSONDataSets.Create(FSO_TestCommand_Cache.Parameters[0].Value.GetString);
end;

constructor TDSReportClient.Create(ARestConnection: TDSRestConnection);
begin
  inherited Create(ARestConnection);
end;

constructor TDSReportClient.Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ARestConnection, AInstanceOwner);
end;

destructor TDSReportClient.Destroy;
begin
  FDO_GetDSNPCommand.DisposeOf;
  FDO_GetDSNPCommand_Cache.DisposeOf;
  FDO_GetDS_CheckListCommand.DisposeOf;
  FDO_GetDS_CheckListCommand_Cache.DisposeOf;
  FSO_ByDateCommand.DisposeOf;
  FSO_ByDateCommand_Cache.DisposeOf;
  FSO_ByDateNoBuktiCommand.DisposeOf;
  FSO_ByDateNoBuktiCommand_Cache.DisposeOf;
  FPO_SLIP_ByDateNoBuktiCommand.DisposeOf;
  FPO_SLIP_ByDateNoBuktiCommand_Cache.DisposeOf;
  FSO_TestCommand.DisposeOf;
  FSO_TestCommand_Cache.DisposeOf;
  inherited;
end;

end.

