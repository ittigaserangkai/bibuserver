unit ufrmGeneratePOForAll;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMaster, StdCtrls, ExtCtrls, ufraFooter1Button,
  ActnList, ComCtrls, System.Actions,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, dxCore, cxDateUtils, Vcl.Menus, cxProgressBar, cxButtons,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxLookupEdit,
  cxDBLookupEdit, cxDBExtLookupComboBox, ufrmMasterDialog,
  ufraFooterDialog3Button, Datasnap.DBClient, uDBUtils, uDXUtils, uAppUtils,
  uDMClient, uRetnoUnit, uModUnit;

type
  TfrmGeneratePOforAll = class(TfrmMasterDialog)
    fraFooter1Button1: TfraFooter1Button;
    lbl3: TLabel;
    lbl4: TLabel;
    dtDateSO: TcxDateEdit;
    dtDatePO: TcxDateEdit;
    lbl1: TLabel;
    bvl1: TBevel;
    btnProcessPO: TcxButton;
    actlst1: TActionList;
    actProcessPO: TAction;
    pbProcess: TcxProgressBar;
    pnl1: TPanel;
    lblKet: TLabel;
    btnDetailPO: TcxButton;
    actDetailPO: TAction;
    lblSupplierMG: TLabel;
    cbbSupplierMG: TcxExtLookupComboBox;
    cbbSO: TcxExtLookupComboBox;
    procedure actDetailPOExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure actProcessPOExecute(Sender: TObject);
//    procedure btn1Click(Sender: TObject);
    procedure cbbSOExit(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtNoSOChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtNoSOKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure pnlBodyDblClick(Sender: TObject);
    procedure cbbSOPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure cbbSOPropertiesEditValueChanged(Sender: TObject);
  private
    isSOFound: Boolean;
//    FIsGenerated: Boolean;
//    DataSODetil: TSODetil;
    FCDSSO: TClientDataSet;
    FCDSSUPMG: TClientDataSet;
//    FNoPO: string;
//    FNoPODetil: Integer;
    procedure InisialisasiCBBSO;
    procedure InisialisasiCBBSupMG; overload;
//    procedure SearchSONo(ASONo: String);
  public
    { Public declarations }
  end;

var
  frmGeneratePOforAll: TfrmGeneratePOforAll;

implementation

uses uTSCommonDlg, uConstanta, ufrmSearchPO, ufrmSearchSO, DB,
  ufrmDialogGeneratePO, ufrmMain;

{$R *.dfm}

procedure TfrmGeneratePOforAll.actDetailPOExecute(Sender: TObject);
begin
  inherited;
  if not assigned(frmDialogDetailGeneratePO) then
    frmDialogDetailGeneratePO := TfrmDialogDetailGeneratePO.Create(Application);
  with frmDialogDetailGeneratePO do
  begin
//    edtSO_NO.Text:= Self.edtNoSO.Text;
    dtPO.Date:= Self.dtDatePO.Date;
    dtSO.Date:= Self.dtDateSO.Date;
    ShowModal;
    FreeAndNil(frmDialogDetailGeneratePO);
  end;
end;

procedure TfrmGeneratePOforAll.FormCreate(Sender: TObject);
begin
  inherited;
//  lblHeader.Caption := 'GENERATE PURCHASING ORDER FOR ALL';
  dtDatePO.Date := now;
  pbProcess.Position := 0;

  InisialisasiCBBSO;
  InisialisasiCBBSUPMG
end;

procedure TfrmGeneratePOforAll.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmGeneratePOforAll.FormDestroy(Sender: TObject);
begin
  inherited;
  frmGeneratePOforAll := nil;
end;

procedure TfrmGeneratePOforAll.actProcessPOExecute(Sender: TObject);
begin
  try
    DMClient.CrudPOClient.GeneratePO(cbbSO.EditValueText, cbbSupplierMG.EditValueText);
    Self.Close;
  except
    on E : Exception do
      TAppUtils.Error(E.Message);
  end;
end;



procedure TfrmGeneratePOforAll.cbbSOExit(Sender: TObject);
begin
  inherited;
//  InisialisasiCBBSupMG;
end;

procedure TfrmGeneratePOforAll.cbbSOPropertiesEditValueChanged(Sender: TObject);
begin
  inherited;
  InisialisasiCBBSupMG;
end;

procedure TfrmGeneratePOforAll.cbbSOPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  inherited;
  if FCDSSO <> nil then
  begin
    dtDateSO.Date :=  FCDSSO.FieldByName('SO_DATE').AsDateTime;
    //
  end;
end;

procedure TfrmGeneratePOforAll.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
//  if(Key = VK_F2) then
//    btn1Click(self);
  if(Key = VK_F5) then
    btnProcessPO.Click;
  if(Key = VK_F3) then
    btnDetailPO.Click;
end;

procedure TfrmGeneratePOforAll.edtNoSOChange(Sender: TObject);
begin
  inherited;
  dtDateSO.Clear;
  isSOFound:= False;
  pbProcess.Position := 0;
  lblKet.Caption := '';
  btnProcessPO.Enabled := True;
  btnDetailPO.Enabled := False;
end;

procedure TfrmGeneratePOforAll.FormShow(Sender: TObject);
begin
  inherited;
  isSOFound:= False;
//  edtNoSO.Clear;
  dtDatePO.Date:= Now;
end;

procedure TfrmGeneratePOforAll.edtNoSOKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
//  if Key=#13 then
//    SearchSONo(TAppUtils.StrPadLeft(edtNoSO.Text, 10, '0'))
//  else
//  if not(Key in['0'..'9',Chr(VK_BACK)]) then
//    Key:=#0;
end;

//procedure TfrmGeneratePOforAll.SearchSONo(ASONo: String);
//var data: TDataSet;
//    tmpSODetil: TDataSet;
//    i: Integer;
//begin
  {if(not Assigned(SearchSO))then
    SearchSO := TSearchSO.Create;
  data := SearchSO.GetListSOByNo(ASONo);
  if data.RecordCount>0 then
  begin
    edtNoSO.Text:= data.FieldByName('SO_NO').AsString;
    dtDateSO.Date:= data.FieldByName('SO_DATE').AsDateTime;
    dtDatePO.Date := Now;
    isSOFound:= True;

    if(not Assigned(DataSO))then
      DataSO := TDataSO.Create;
    DataSO.UnitId := frmMain.UnitId;
    tmpSODetil:= DataSO.GetSODetilBySONo(ASONo);
    with tmpSODetil do
    if not IsEmpty then
    begin
      i:=0;
      SetLength(DataSODetil,RecordCount);
      while not Eof do
      begin
        DataSODetil[i].SOD_ID:= FieldByName('SOD_ID').AsInteger;
        DataSODetil[i].SOD_UNT_ID:= FieldByName('SOD_UNT_ID').AsInteger;
        DataSODetil[i].SOD_SO_NO:= FieldByName('SOD_SO_NO').AsString;
        DataSODetil[i].SOD_SO_UNT_ID:= FieldByName('SOD_SO_UNT_ID').AsInteger;
        DataSODetil[i].SOD_BRGSUP_ID:= FieldByName('SOD_BRGSUP_ID').AsInteger;
        DataSODetil[i].SOD_BRGSUP_UNT_ID:= FieldByName('SOD_BRGSUP_UNT_ID').AsInteger;
        DataSODetil[i].SOD_QTY:= FieldByName('SOD_QTY').AsFloat;
        DataSODetil[i].SOD_QTY_COMMON:= FieldByName('SOD_QTY_COMMON').AsFloat;
        DataSODetil[i].SOD_QTY_TRADER:= FieldByName('SOD_QTY_TRADER').AsFloat;
        DataSODetil[i].SOD_QTY_ASSGROS:= FieldByName('SOD_QTY_ASSGROS').AsFloat;
        DataSODetil[i].SOD_SAT_CODE:= FieldByName('SOD_SAT_CODE').AsString;
        DataSODetil[i].SOD_SAT_UNT_ID:= FieldByName('SOD_SAT_UNT_ID').AsInteger;
        DataSODetil[i].SOD_PRICE:= FieldByName('SOD_PRICE').AsCurrency;
        DataSODetil[i].SOD_TOTAL:= FieldByName('SOD_TOTAL').AsCurrency;
        DataSODetil[i].SOD_DISC1:= FieldByName('SOD_DISC1').AsCurrency;
        DataSODetil[i].SOD_DISC2:= FieldByName('SOD_DISC2').AsCurrency;
        DataSODetil[i].SOD_DISC3:= FieldByName('SOD_DISC3').AsCurrency;
        DataSODetil[i].SOD_TOTAL_TEMP:= FieldByName('SOD_TOTAL_TEMP').AsCurrency;
        DataSODetil[i].SOD_TOTAL_DISC:= FieldByName('SOD_TOTAL_DISC').AsCurrency;
        DataSODetil[i].SOD_IS_ORDERED:= FieldByName('SOD_IS_ORDERED').AsInteger;
        DataSODetil[i].SOD_IS_BKP:= FieldByName('SOD_IS_BKP').AsInteger;
        DataSODetil[i].SOD_IS_REGULAR:= FieldByName('SOD_IS_REGULAR').AsInteger;
        DataSODetil[i].OP_CREATE:= FieldByName('OP_CREATE').AsInteger;
        DataSODetil[i].DATE_CREATE:= FieldByName('DATE_CREATE').AsDateTime;
        DataSODetil[i].OP_MODIFY:= FieldByName('OP_MODIFY').AsInteger;
        DataSODetil[i].SOD_BRG_CODE:= FieldByName('SOD_BRG_CODE').AsString;
        DataSODetil[i].SOD_BRG_UNT_ID:= FieldByName('SOD_BRG_UNT_ID').AsInteger;
        DataSODetil[i].SOD_SUP_CODE:= FieldByName('SOD_SUP_CODE').AsString;
        DataSODetil[i].SOD_SUP_UNT_ID:= FieldByName('SOD_SUP_UNT_ID').AsInteger;
        DataSODetil[i].SOD_MERCHANGRUP_ID:= FieldByName('SOD_MERCHANGRUP_ID').AsInteger;
        DataSODetil[i].SOD_MERCHANGRUP_UNT_ID:= FieldByName('SOD_MERCHANGRUP_UNT_ID').AsInteger;
        DataSODetil[i].BRGSUP_SUPMG_SUB_CODE:= FieldByName('BRGSUP_SUPMG_SUB_CODE').AsString;
        DataSODetil[i].PJK_PPN:= FieldByName('PJK_PPN').AsCurrency;
        DataSODetil[i].PJK_PPNBM:= FieldByName('PJK_PPNBM').AsCurrency;
        DataSODetil[i].SUPMG_LEAD_TIME:= FieldByName('SUPMG_LEAD_TIME').AsInteger;
        DataSODetil[i].BRG_IS_STOCK:= FieldByName('BRG_IS_STOCK').AsInteger;
        Next;
        inc(i);
      end;
    end;
  end;
  }
//end;

procedure TfrmGeneratePOforAll.FormActivate(Sender: TObject);
begin
  inherited;
  frmGeneratePOforAll.Caption:= 'GENERATE PURCHASING ORDER FOR ALL';
//  frmMain.CreateMenu((Sender as TForm));
end;

procedure TfrmGeneratePOforAll.InisialisasiCBBSO;
var
  lUnit: TModUnit;
begin
  try
    lUnit := TModUnit.CreateID(TRetno.UnitStore.ID);
    try
      FCDSSO := TDBUtils.DSToCDS(DMClient.DSProviderClient.SO_GetDSOLookUpGeneratePO(lUnit), Self)
    finally
      lUnit.Free;
    end;
    cbbSO.Properties.LoadFromCDS(FCDSSO,'SO_ID','SO_NO',['SO_ID'],Self);
    cbbSO.Properties.SetMultiPurposeLookup;
  except
    raise
  end;
end;

procedure TfrmGeneratePOforAll.InisialisasiCBBSupMG;
begin
  if VarIsNull(cbbSO.EditValue) then Exit;

  FCDSSUPMG := TDBUtils.DSToCDS(DMClient.DSProviderClient.SupMGByOutstandingSO_GetDSLookup(cbbSO.EditValue), Self);
  cbbSupplierMG.Properties.LoadFromCDS(FCDSSUPMG,'SUPLIER_MERCHAN_GRUP_ID','SUPMG_NAME',['SO_ID','SUPLIER_MERCHAN_GRUP_ID'],Self);
  cbbSupplierMG.Properties.SetMultiPurposeLookup;
end;

procedure TfrmGeneratePOforAll.pnlBodyDblClick(Sender: TObject);
begin
  inherited;
  btnDetailPO.Enabled := not btnDetailPO.Enabled;
end;

end.
