unit ufrmMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, IPPeerClient, Data.Bind.Components,
  Data.Bind.ObjectScope, REST.Client, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, Data.Bind.EngExt,
  Vcl.Bind.DBEngExt, System.Rtti, System.Bindings.Outputs, Vcl.Bind.Editors,
  cxTextEdit, uUnit, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Grids, Vcl.Bind.Grid,
  Data.Bind.Grid, Data.Bind.DBScope, dxBarBuiltInMenu, cxPC, cxMaskEdit,
  cxDropDownEdit, ClientModuleUnit, uDBUtils, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, Datasnap.DBClient, cxDBExtLookupComboBox,
  Vcl.Menus, cxButtons, uCPR, cxCheckListBox, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxNavigator, Data.DB, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, uIndikator, uAppUtils;

type
  TfrmMain = class(TForm)
    cxPCCPR: TcxPageControl;
    cxTSCPR: TcxTabSheet;
    cxTSCPRSetting: TcxTabSheet;
    pnlButton: TPanel;
    bSimpan: TcxButton;
    bClear: TcxButton;
    cxPCCPRSetting: TcxPageControl;
    cxTSCPRSettingOverview: TcxTabSheet;
    cxTSCPRInput: TcxTabSheet;
    pnlHeaderCPRSetting: TPanel;
    lblUnitUsaha: TLabel;
    lblNama: TLabel;
    lblStatus: TLabel;
    edNama: TcxTextEdit;
    cbbIsActive: TcxComboBox;
    cbbUnit: TcxExtLookupComboBox;
    cxgrdCPRSetting: TcxGrid;
    cxgrdlvlCPRSetting: TcxGridLevel;
    cxgrdtblvwCPRSetting: TcxGridTableView;
    cxgrdclmnCPRSettingColumnIndikator: TcxGridColumn;
    cxgrdclmnCPRSettingColumnNama: TcxGridColumn;
    bRefresh: TcxButton;
    cxgrdCPRSettingOV: TcxGrid;
    cxGridDBTableCPRSettingOV: TcxGridDBTableView;
    cxgrdlvlCPRSettingLvl: TcxGridLevel;
    bDelete: TcxButton;
    cxgrdclmnCPRSettingColumnUrutan: TcxGridColumn;
    procedure ADPBind1CreateAdapter(Sender: TObject;
      var ABindSourceAdapter: TBindSourceAdapter);
    procedure bClearClick(Sender: TObject);
    procedure bDeleteClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bSimpanClick(Sender: TObject);
    procedure cxgrdclmnCPRSettingColumnIndikatorPropertiesValidate(
      Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
    procedure bRefreshClick(Sender: TObject);
    procedure cxGridDBTableCPRSettingOVCellDblClick(Sender: TcxCustomGridTableView;
        ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift:
        TShiftState; var AHandled: Boolean);
    procedure cxGridDBTableCPRSettingOVEditing(Sender: TcxCustomGridTableView;
        AItem: TcxCustomGridTableItem; var AAllow: Boolean);
    procedure cxgrdclmnCPRSettingColumnUrutanPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
  private
    FCDSCPRSEttingIndikator: TClientDataset;
    FCDSCPRSettingOverview: TClientDataset;
    FCDSUNIT: TClientDataset;
    FCPRSetting: TModCPRSetting;
    funitusaha: tmodunit;
    procedure ClearCPRSetting;
    function DeleteCPRSetting: Boolean;
    function GetCPRSetting: TModCPRSetting;
    function getunitusaha: tmodunit;
    procedure InisialisasiCPRSettingIndikator;
    function LoadCPRSetting(AID : String): Boolean;
    procedure RefreshCPRSetting;
    procedure SimpanCPRSetting;
    { Private declarations }
  protected
    procedure InisialisasiCBBUnit;
    property CPRSetting: TModCPRSetting read GetCPRSetting write FCPRSetting;
  public
    { Public declarations }
  published
    property UnitUsaha : tmodunit read getunitusaha write funitusaha;
//    property Binding : tbinding read funitusaha write funitusaha;

  end;

var
  frmMain: TfrmMain;

implementation
uses  uDXUtils;

{$R *.dfm}

procedure TfrmMain.ADPBind1CreateAdapter(Sender: TObject;
  var ABindSourceAdapter: TBindSourceAdapter);
begin
  UnitUsaha.KODE := 'AS';
  UnitUsaha.NAMA := 'Aan S';
  ABindSourceAdapter := TObjectBindSourceAdapter<TModUnit>.Create(Self, UnitUsaha);
end;

procedure TfrmMain.bClearClick(Sender: TObject);
begin
  if cxPCCPR.ActivePage = cxTSCPRSetting then
    ClearCPRSetting;

end;

procedure TfrmMain.bDeleteClick(Sender: TObject);
begin
  if cxPCCPR.ActivePage = cxTSCPRSetting then
    DeleteCPRSetting;
end;

procedure TfrmMain.bRefreshClick(Sender: TObject);
begin
  if cxPCCPR.ActivePage = cxTSCPRSetting then
    RefreshCPRSetting;

end;

procedure TfrmMain.bSimpanClick(Sender: TObject);
begin
  if cxPCCPR.ActivePage = cxTSCPRSetting then
    SimpanCPRSetting;

//  end;
end;

procedure TfrmMain.ClearCPRSetting;
begin
  ClearByTag([0,1]);
  FreeAndNil(FCPRSetting);
end;

procedure TfrmMain.cxgrdclmnCPRSettingColumnIndikatorPropertiesValidate(
  Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
var
  iBaris: Integer;
begin
  iBaris := cxgrdtblvwCPRSetting.DataController.FocusedRecordIndex;
  cxgrdtblvwCPRSetting.DataController.Values[iBaris, cxgrdclmnCPRSettingColumnNama.Index] := FCDSCPRSEttingIndikator.FieldByName('id').AsString;
end;

procedure TfrmMain.cxgrdclmnCPRSettingColumnUrutanPropertiesValidate(
  Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
var
  iAngka: Integer;
begin
  if not TryStrToInt(DisplayValue, iAngka) then
  begin
    Error := True;
    ErrorText := 'Urutan harus data numeric';
  end;

end;

procedure TfrmMain.cxGridDBTableCPRSettingOVCellDblClick(Sender:
    TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
    AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
 if LoadCPRSetting(FCDSCPRSettingOverview.FieldByName('ID').AsString) then
   cxPCCPRSetting.ActivePageIndex := 1;
end;

procedure TfrmMain.cxGridDBTableCPRSettingOVEditing(Sender:
    TcxCustomGridTableView; AItem: TcxCustomGridTableItem; var AAllow: Boolean);
begin
  AAllow := False;
end;

function TfrmMain.DeleteCPRSetting: Boolean;
begin
  Result := False;

  if not TAppUtils.Confirm('Anda Yakin Akan Menghapus Data CPR Setting ?') then
    Exit;

  if cxPCCPRSetting.ActivePageIndex = 0 then
    LoadCPRSetting(FCDSCPRSettingOverview.FieldByName('ID').AsString);

  if ClientModule.CrudClient.DeleteFromDB(CPRSetting) then
  begin
    ClearCPRSetting;
  end;


end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
  ClearByTag([0,1]);
  InisialisasiCBBUnit;
  InisialisasiCPRSettingIndikator;
end;

function TfrmMain.GetCPRSetting: TModCPRSetting;
begin
  if FCPRSetting = nil then
    FCPRSetting := TModCPRSetting.Create;

  Result := FCPRSetting;
end;

function TfrmMain.getunitusaha: tmodunit;
begin
  if funitusaha = nil then
  begin
    funitusaha := TModUnit.Create;
  end;
  Result := funitusaha;
end;

procedure TfrmMain.InisialisasiCBBUnit;
begin
  FCDSUNIT := TDBUtils.DSToCDS(ClientModule.DSProviderClient.Unit_GetDSLookup(''), Self);
  cbbUnit.Properties.LoadFromCDS(FCDSUNIT,'ID','KODE',['ID'],Self);
  cbbUnit.Properties.SetMultiPurposeLookup;
end;

procedure TfrmMain.InisialisasiCPRSettingIndikator;
begin
  FCDSCPRSEttingIndikator := TDBUtils.DSToCDS(ClientModule.DSProviderClient.Indikator_GetDSOverview(''), Self);
  TcxExtLookupComboBoxProperties(cxgrdclmnCPRSettingColumnIndikator.Properties).LoadFromCDS(FCDSCPRSEttingIndikator,'ID','KODE',['ID'],Self);
  TcxExtLookupComboBoxProperties(cxgrdclmnCPRSettingColumnIndikator.Properties).SetMultiPurposeLookup;

  TcxExtLookupComboBoxProperties(cxgrdclmnCPRSettingColumnNama.Properties).LoadFromCDS(FCDSCPRSEttingIndikator,'ID','indikator',['ID'],Self);
  TcxExtLookupComboBoxProperties(cxgrdclmnCPRSettingColumnNama.Properties).SetMultiPurposeLookup;
end;

function TfrmMain.LoadCPRSetting(AID : String): Boolean;
var
  I: Integer;
begin
  Result := False;

  ClearByTag([0,1]);
  FreeAndNil(FCPRSetting);
  FCPRSetting := TModCPRSetting(ClientModule.CrudClient.Retrieve(TModCPRSetting.ClassName, AID));

  if FCPRSetting = nil then
    Exit;

  if FCPRSetting.ID = '' then
    Exit;

  cbbUnit.EditValue     := FCPRSetting.UnitUsaha.ID;
  edNama.Text           := FCPRSetting.NAMA;

  if FCPRSetting.IsActive = 1then
    cbbIsActive.ItemIndex := 0
  else
    cbbIsActive.ItemIndex := 1;

  cxgrdtblvwCPRSetting.ClearRows;
  for I := 0 to CPRSetting.CPRSettingItems.Count - 1 do
  begin
    cxgrdtblvwCPRSetting.DataController.AppendRecord;
    cxgrdtblvwCPRSetting.SetValue(i,cxgrdclmnCPRSettingColumnIndikator.Index, CPRSetting.CPRSettingItems[i].Indikator.ID);
    cxgrdtblvwCPRSetting.SetValue(i,cxgrdclmnCPRSettingColumnNama.Index, CPRSetting.CPRSettingItems[i].Indikator.ID);
    cxgrdtblvwCPRSetting.SetValue(i,cxgrdclmnCPRSettingColumnUrutan.Index, CPRSetting.CPRSettingItems[i].Urutan);
  end;

  Result := True;
end;

procedure TfrmMain.RefreshCPRSetting;
begin
  FCDSCPRSettingOverview := TDBUtils.DSToCDS(ClientModule.DSProviderClient.CPRSetting_GetDSOverview(), Self);
  cxGridDBTableCPRSettingOV.LoadFromCDS(FCDSCPRSettingOverview);
  cxGridDBTableCPRSettingOV.SetVisibleColumns(['id','unitusahaid'],False);
end;

procedure TfrmMain.SimpanCPRSetting;
var
  I: Integer;
  lCPRSettingItem: TModCPRSettingItem;
begin
  if cbbIsActive.ItemIndex = 0then
    CPRSetting.IsActive := 1
  else
    CPRSetting.IsActive := 0;

  CPRSetting.NAMA := edNama.Text;
  CPRSetting.UnitUsaha := TModUnit.CreateID(cbbUnit.EditValue);

  CPRSetting.CPRSettingItems.Clear;
  for I := 0 to cxgrdtblvwCPRSetting.DataController.RecordCount - 1 do
  begin
    lCPRSettingItem := TModCPRSettingItem.Create();
    lCPRSettingItem.Indikator := TModIndikator.CreateID(cxgrdtblvwCPRSetting.DataController.Values[i, cxgrdclmnCPRSettingColumnIndikator.Index]);
    lCPRSettingItem.Urutan    := cxgrdtblvwCPRSetting.Int(i, cxgrdclmnCPRSettingColumnUrutan.Index);
    CPRSetting.CPRSettingItems.Add(lCPRSettingItem);
  end;


  ClientModule.CrudClient.SaveToDB(CPRSetting);
end;

end.
