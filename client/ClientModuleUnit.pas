unit ClientModuleUnit;

interface

uses
  System.SysUtils, System.Classes, ClientClassesUnit, IPPeerClient,
  Datasnap.DSClientRest;

type
  TClientModule = class(TDataModule)
    DSRestConnection: TDSRestConnection;
  private
    FInstanceOwner: Boolean;
    FServerMethodsClient: TServerMethodsClient;
    FTestMethodClient: TTestMethodClient;
    FCrudClient: TCrudClient;
    FDSReportClient: TDSReportClient;
    FDSProviderClient: TDSProviderClient;
    function GetServerMethodsClient: TServerMethodsClient;
    function GetTestMethodClient: TTestMethodClient;
    function GetCrudClient: TCrudClient;
    function GetDSReportClient: TDSReportClient;
    function GetDSProviderClient: TDSProviderClient;
    { Private declarations }
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property InstanceOwner: Boolean read FInstanceOwner write FInstanceOwner;
    property ServerMethodsClient: TServerMethodsClient read GetServerMethodsClient write FServerMethodsClient;
    property TestMethodClient: TTestMethodClient read GetTestMethodClient write FTestMethodClient;
    property CrudClient: TCrudClient read GetCrudClient write FCrudClient;
    property DSReportClient: TDSReportClient read GetDSReportClient write FDSReportClient;
    property DSProviderClient: TDSProviderClient read GetDSProviderClient write
        FDSProviderClient;

end;

var
  ClientModule: TClientModule;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

constructor TClientModule.Create(AOwner: TComponent);
begin
  inherited;
  FInstanceOwner := False;
end;

destructor TClientModule.Destroy;
begin
  FServerMethodsClient.Free;
  FTestMethodClient.Free;
  FCrudClient.Free;
  FDSReportClient.Free;
  inherited;
end;

function TClientModule.GetServerMethodsClient: TServerMethodsClient;
begin
  if FServerMethodsClient = nil then
    FServerMethodsClient:= TServerMethodsClient.Create(DSRestConnection, FInstanceOwner);
  Result := FServerMethodsClient;
end;
function TClientModule.GetTestMethodClient: TTestMethodClient;
begin
  if FTestMethodClient = nil then
    FTestMethodClient:= TTestMethodClient.Create(DSRestConnection, FInstanceOwner);
  Result := FTestMethodClient;
end;
function TClientModule.GetCrudClient: TCrudClient;
begin
  if FCrudClient = nil then
    FCrudClient:= TCrudClient.Create(DSRestConnection, FInstanceOwner);
  Result := FCrudClient;
end;
function TClientModule.GetDSReportClient: TDSReportClient;
begin
  if FDSReportClient = nil then
    FDSReportClient:= TDSReportClient.Create(DSRestConnection, FInstanceOwner);
  Result := FDSReportClient;
end;

function TClientModule.GetDSProviderClient: TDSProviderClient;
begin
  if FDSProviderClient = nil then
    FDSProviderClient:= TDSProviderClient.Create(DSRestConnection, FInstanceOwner);
  Result := FDSProviderClient;
end;

end.
