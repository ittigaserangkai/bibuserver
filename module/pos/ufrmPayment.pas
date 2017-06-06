unit ufrmPayment;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Mask, ufraLookUpCC, uSpell, uNewPosTransaction,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer,
  cxEdit, cxTextEdit, cxCurrencyEdit, cxMaskEdit, Vcl.Grids, FireDAC.Comp.Client,
  uNewBarangStockSirkulasi, uNewBarang;

type
  VoucherDetail = record
    Nomor  : string;
    Jumlah : Integer;
    Nilai  : Currency;
  end;

type
  TfrmPayment = class(TForm)
    pnlTotal: TPanel;
    lblTotal: TLabel;
    lbl1: TLabel;
    Panel12: TPanel;
    Label5: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    edtTotalBelanja: TcxCurrencyEdit;
    edtDiscGMCNominal: TcxCurrencyEdit;
    edtBrgDiscGMC: TcxCurrencyEdit;
    edtDiscGMCPersen: TcxCurrencyEdit;
    pnlPayment: TPanel;
    lblResetVoucher: TLabel;
    lbl10: TLabel;
    lbl11: TLabel;
    lbl12: TLabel;
    lbl13: TLabel;
    lbl14: TLabel;
    lbl9: TLabel;
    bvl1: TBevel;
    lbl17: TLabel;
    lbl18: TLabel;
    lbl19: TLabel;
    lbl20: TLabel;
    lbl16: TLabel;
    bvl2: TBevel;
    Label16: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    lblCashback: TLabel;
    Label32: TLabel;
    strgTmpVoucher: TStringGrid;
    strgTempLainLain: TStringGrid;
    pnlPembulatan: TPanel;
    LblPembulatan: TLabel;
    Label18: TLabel;
    Panel10: TPanel;
    Edit1: TEdit;
    edtNilaiBayar: TcxCurrencyEdit;
    edtNilaiTunai: TcxCurrencyEdit;
    edtChargeCreditCard: TcxCurrencyEdit;
    edtNilaiCC: TcxCurrencyEdit;
    edtNomorCC: TcxMaskEdit;
    edtBotolValue: TcxCurrencyEdit;
    edtGoroValue: TcxCurrencyEdit;
    edtVoucherValue: TcxCurrencyEdit;
    edtJenisKartuCode: TcxCurrencyEdit;
    edtJenisKartuName: TcxCurrencyEdit;
    edtNoOtorisasiCC: TcxCurrencyEdit;
    edtNoTransBotol: TcxCurrencyEdit;
    edtNoVoucher: TcxCurrencyEdit;
    edtCashBack: TcxCurrencyEdit;
    fraLookUpCC: TfraLookUpCC;
    edtPilihan: TcxCurrencyEdit;
    mmoBackup: TMemo;
    mmoTemp: TMemo;
    mmoHeadStruk: TMemo;
    mmoIsiStruk: TMemo;
    mmoFooterStruk: TMemo;
    edtSisaUang: TcxCurrencyEdit;
    mmoIsiCB: TMemo;
    edtBotolQty: TcxCurrencyEdit;
    edtGoroQty: TcxCurrencyEdit;
    edtVoucherQty: TcxCurrencyEdit;
    tmrInfo: TTimer;
    pnlInfo: TPanel;
    lblInfo: TLabel;
    edtCCDisc: TcxCurrencyEdit;
    edtCCDiscNominal: TcxCurrencyEdit;
    Label1: TLabel;
    edtBayarCC: TcxCurrencyEdit;
    Label2: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtJenisKartuCodeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure fraLookUpCCsgLookupKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure fraLookUpCCedNamaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtJenisKartuCodeExit(Sender: TObject);
    procedure edtPilihanKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtNilaiCCKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtNomorCCKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtNoOtorisasiCCKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtNilaiTunaiKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtNoTransBotolKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCashBackKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtNilaiCCExit(Sender: TObject);
    procedure edtCashBackExit(Sender: TObject);
    procedure edtNoTransBotolExit(Sender: TObject);
    procedure tmrInfoTimer(Sender: TObject);
    procedure edtNoVoucherKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtNoVoucherExit(Sender: TObject);
    procedure edtVoucherQtyKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtVoucherValueKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure edtNoTransBotolKeyPress(Sender: TObject; var Key: Char);
    procedure edtBayarCCExit(Sender: TObject);
    procedure edtBayarCCKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtGoroQtyKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtGoroValueKeyDown(Sender: TObject; var Key: Word; Shift:
        TShiftState);
    procedure edtNilaiTunaiPropertiesChange(Sender: TObject);
    procedure edtNilaiCCPropertiesChange(Sender: TObject);
    procedure edtBayarCCPropertiesChange(Sender: TObject);
  private
    FCardID: Integer;
		FCashBackNilai: Currency;
		FCashNilai: Currency;
		FCCCharge: Currency;
    FCCChargePersen: Currency;
    FCCLimit: Currency;
		FCCNilai: Currency;
    FCC_Minimum: Currency;
    FCashback_Minimum: Currency;
    FCashback_Kelipatan: Currency;
    FCashback_Maximum: Currency;
    FCCBayar: Currency;
    FCCDisc: Double;
    FCCDiscNominal: Currency;
    FSisaUang_Maksimum: Currency;
		FDiscAMCPersen: Double;
		FDiscAMCRupiah: Currency;
    FIsCashbackCard: Boolean;
    FIsCreditCard: Boolean;
    FKonstantaPembulatan: Currency;
		FPembulatan: Currency;
    FShowFooterKembalian: Integer;
		FSisaUang: Currency;
		FTotalBarangAMC: Currency;
    FTotalBarangPPN: Currency;
    FTotalBarangCC: Currency;
		FTotalBayar: Currency;
		FTotalBelanja: Currency;
    FVoucherLainJumlah: TStrings;
    FVoucherLainNilai: TStrings;
    FVoucherAssalaamNomor: TStrings;
    FVoucherAssalaamJumlah: TStrings;
    FVoucherAssalaamNilai: TStrings;
    FVoucherLainJumlahTotal: Double;
    FVoucherLainNilaiTotal: Double;
    FTipeIDConcession: Integer;
    FIsConcession: Boolean;
    FIsSaved: Boolean;
    FNewBarang: TNewBarang;
    procedure ClearCCForm;
    function GetAmountNonJB(aRow: Integer): Double;
		function GetDiscAMCRupiah: Currency;
    function GetNewBarang: TNewBarang;
		function GetPembulatan: Currency;
		function GetTotalBayar: Currency;
    function GetVoucherLainJumlah: TStrings;
    function GetVoucherLainNilai: TStrings;
    function GetVoucherAssalaamNomor: TStrings;
    function GetVoucherAssalaamJumlah: TStrings;
    function GetVoucherAssalaamNilai: TStrings;
    procedure LoadCreditCard(ACode: String);
    //procedure LineReceived(Sender : TLineSocketBase; const line : string;
    //          complete : Boolean);
    procedure ParsingPrintStrukTrans;
    procedure SetCCDisc(const Value: Double);
    procedure SetCCDiscNominal(const Value: Currency);
    property IsSaved: Boolean read FIsSaved write FIsSaved;
  public
    procedure AddVoucherAssalaam(AVoucherNo: String; AVoucherNilai: Double);
    procedure AddVoucherLain(AVoucherQty, AVoucherNilai: Double);
    function CekPLUQtyInGrid(APLU: String; AQTY: Integer): Boolean;
    function GetCCChargePersen: Double;
		function GetKonstantaPembulatan: Currency;
    function GetKuponBotolStatus(ANoTransaksi: String): Integer;
    function GetVoucherStatus(ANoVoucher: String): Integer;
    function GetSisaBayar(AExclude: Double = 0): Currency;
    function Get_Qty_Precision: string;
    function HitungCCCharge: Currency;
		procedure HitungSisaUang;
		procedure ResetAll;
    procedure ShowCashBack;
    procedure HideCashBack;
    procedure HideInfo;
    //procedure LineReceived(Sender : TLineSocketBase; const line : string;
    //          complete : Boolean);
    procedure ParsingPrintCardValidasi;
    procedure ParsingPrintConsValidasi;
    procedure ResetVoucher;
    function SaveToDB: Boolean;
    procedure ShowInfo(AInfo: String; ALabelColor: TColor = clRed;
        ABackgroundColor: TColor = clYellow);
		procedure ShowTotalBayar;
    procedure UpdateDataLokal(ATotalBelanja, ATotalBarangAMC: Currency;
        ADiscAMCPersen: Double; ATotalBarangCC: Currency; ATotalBarangPPN:
        Currency);
    property CardID: Integer read FCardID write FCardID;
    property TipeIDConcession: Integer read FTipeIDConcession write
        FTipeIDConcession;
		property CashBackNilai: Currency read FCashBackNilai write FCashBackNilai;
		property CashNilai: Currency read FCashNilai write FCashNilai;
		property CCCharge: Currency read FCCCharge write FCCCharge;
    property CCChargePersen: Currency read FCCChargePersen write FCCChargePersen;
    property CCLimit: Currency read FCCLimit write FCCLimit;
		property CCNilai: Currency read FCCNilai write FCCNilai;
    property CC_Minimum: Currency read FCC_Minimum write FCC_Minimum;
    property Cashback_Minimum: Currency read FCashback_Minimum write
        FCashback_Minimum;
    property Cashback_Kelipatan: Currency read FCashback_Kelipatan write
        FCashback_Kelipatan;
    property Cashback_Maximum: Currency read FCashback_Maximum write
        FCashback_Maximum;
    property CCBayar: Currency read FCCBayar write FCCBayar;
    property CCDisc: Double read FCCDisc write SetCCDisc;
    property CCDiscNominal: Currency read FCCDiscNominal write SetCCDiscNominal;
    property SisaUang_Maksimum: Currency read FSisaUang_Maksimum write
        FSisaUang_Maksimum;
		property DiscAMCPersen: Double read FDiscAMCPersen write FDiscAMCPersen;
		property DiscAMCRupiah: Currency read GetDiscAMCRupiah write FDiscAMCRupiah;
    property IsCashbackCard: Boolean read FIsCashbackCard write FIsCashbackCard;
    property IsCreditCard: Boolean read FIsCreditCard write FIsCreditCard;
    property IsConcession: Boolean read FIsConcession write FIsConcession;
    property KonstantaPembulatan: Currency read FKonstantaPembulatan write
        FKonstantaPembulatan;
    property NewBarang: TNewBarang read GetNewBarang write FNewBarang;
		property Pembulatan: Currency read GetPembulatan write FPembulatan;
    property ShowFooterKembalian: Integer read FShowFooterKembalian write
        FShowFooterKembalian;
		property SisaUang: Currency read FSisaUang write FSisaUang;
		property TotalBarangAMC: Currency read FTotalBarangAMC write FTotalBarangAMC;
    property TotalBarangPPN: Currency read FTotalBarangPPN write FTotalBarangPPN;
    property TotalBarangCC: Currency read FTotalBarangCC write FTotalBarangCC;
		property TotalBayar: Currency read GetTotalBayar write FTotalBayar;
		property TotalBelanja: Currency read FTotalBelanja write FTotalBelanja;
    property VoucherLainJumlah: TStrings read GetVoucherLainJumlah write
        FVoucherLainJumlah;
    property VoucherLainNilai: TStrings read GetVoucherLainNilai write
        FVoucherLainNilai;
    property VoucherAssalaamNomor: TStrings read GetVoucherAssalaamNomor write
        FVoucherAssalaamNomor;
    property VoucherAssalaamJumlah: TStrings read GetVoucherAssalaamJumlah write
        FVoucherAssalaamJumlah;
    property VoucherAssalaamNilai: TStrings read GetVoucherAssalaamNilai write
        FVoucherAssalaamNilai;
    property VoucherLainJumlahTotal: Double read FVoucherLainJumlahTotal write
        FVoucherLainJumlahTotal;
    property VoucherLainNilaiTotal: Double read FVoucherLainNilaiTotal write
        FVoucherLainNilaiTotal;
  end;

var
  frmPayment: TfrmPayment;
  iEdit : Integer;

implementation

uses
  uTSCommonDlg, Math, ufrmMain, DB, ufrmTransaksi, StrUtils, uConstanta,
  HPHELP, DateUtils, uAppUtils , udmMain;

{$R *.dfm}

procedure TfrmPayment.AddVoucherAssalaam(AVoucherNo: String; AVoucherNilai:
    Double);
begin
  VoucherAssalaamNomor.Add(AVoucherNo);
  VoucherAssalaamJumlah.Add('1');
  VoucherAssalaamNilai.Add(FloatToStr(AVoucherNilai));
end;

procedure TfrmPayment.AddVoucherLain(AVoucherQty, AVoucherNilai: Double);
begin
  VoucherLainJumlah.Add(FloatToStr(AVoucherQty));
  VoucherLainNilai.Add(FloatToStr(AVoucherNilai));
  VoucherLainJumlahTotal := VoucherLainJumlahTotal + AVoucherQty;
  VoucherLainNilaiTotal := VoucherLainNilaiTotal + (AVoucherNilai * AVoucherQty);
end;

function TfrmPayment.CekPLUQtyInGrid(APLU: String; AQTY: Integer): Boolean;
var
  i: Integer;
begin
  Result := False;
  with frmTransaksi.sgTransaksi.DataController do
  begin
    for i := 0 to RecordCount - 1 do    // Iterate
    begin
      if Values[i, _KolPLU] = '' then Continue;
      if Trim(Values[i, _KolPLU]) = Trim(APLU) then
      begin
        if Values[i, _KolJumlah] >= AQTY then
        begin
          Result := True;
          Break;
        end;  
      end;
    end;    // for
  end;    // with
end;

procedure TfrmPayment.ClearCCForm;
begin
  CCChargePersen := 0;
  CCLimit := 0;
  CCCharge := 0;
  CCNilai := 0;
  IsCashbackCard := False;

  edtJenisKartuCode.Clear;
  edtJenisKartuName.Clear;
  edtChargeCreditCard.Value := 0;
  edtNilaiCC.Value := 0;
  edtCashBack.Value := 0;
end;

procedure TfrmPayment.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  //frmTransaksi.edNoPelanggan.Text := '';
  //frmTransaksi.edNoPelanggan.Text := '0';
  if not assigned(frmTransaksi) then
    frmTransaksi.FormShow(frmTransaksi);
  Action := caFree;  
end;

function TfrmPayment.GetDiscAMCRupiah: Currency;
begin
  FDiscAMCRupiah := 0;
  try
	  FDiscAMCRupiah := (TotalBarangAMC * DiscAMCPersen) / 100;
  except
  end;
	Result := FDiscAMCRupiah;
end;

function TfrmPayment.GetKonstantaPembulatan: Currency;
begin
	Result := KonstantaPembulatan;
end;

function TfrmPayment.GetPembulatan: Currency;
begin
  {
  FPembulatan := 0;
  try
    if CCNilai = 0 then
    begin
      dTemp := TotalBayar / GetKonstantaPembulatan;
      dTemp := dTemp + 0.5;
      dTemp := Round(dTemp) * GetKonstantaPembulatan;
      FPembulatan := 0;
    end;  
  except
  end;
  }
	Result := FPembulatan;
end;

function TfrmPayment.GetTotalBayar: Currency;
var
	dTemp: Currency;
begin
  FTotalBayar := 0;
  try
    FTotalBayar := (TotalBelanja + CCCharge)
    	- (DiscAMCRupiah + edtBotolValue.Value + edtGoroValue.Value + VoucherLainNilaiTotal )
  except
  end;

  FTotalBayar := Ceil(FTotalBayar);
  Pembulatan := 0;
  try
    if edtJenisKartuName.Text = '' then
    begin
      dTemp := FTotalBayar / GetKonstantaPembulatan;
//      dTemp := dTemp + 0.5;
//      dTemp := RoundTo(dTemp);
      dTemp := Ceil(dTemp);
      dTemp := dTemp * GetKonstantaPembulatan;
      Pembulatan := dTemp - FTotalBayar;
      FTotalBayar := dTemp;
    end;
  except
  end;

	Result := FTotalBayar;
end;

procedure TfrmPayment.HitungSisaUang;
begin
	SisaUang := (edtNilaiTunai.Value + edtBayarCC.Value)-(edtNilaiBayar.Value);
  if SisaUang < 0 then
  begin
    edtSisaUang.Style.Color := clRed;
    edtSisaUang.Style.Font.Color := clBlue;
  end
  else
  begin
    edtSisaUang.Style.Color := clGreen;
    edtSisaUang.Style.Font.Color := clYellow;
  end;

  //edtSisaUang.Value := SisaUang;
  edtSisaUang.Text := FormatFloat('#,##0.00',SisaUang);
end;

procedure TfrmPayment.ResetAll;
begin
	TotalBelanja := 0;
  TotalBarangAMC := 0;
  TotalBarangPPN := 0;
  DiscAMCPersen := 0;
  CashNilai := 0;
  CCNilai := 0;
  CCCharge := 0;
  CashBackNilai := 0;
  SisaUang := 0;
  Pembulatan := 0;
  CashBackNilai := 0;
  TotalBayar := 0;

  edtTotalBelanja.Value := RoundTo(TotalBelanja, 0);
  edtBrgDiscGMC.Value := TotalBarangAMC;
  edtDiscGMCPersen.Value := DiscAMCPersen;
  edtDiscGMCNominal.Value := DiscAMCRupiah;
  

  edtNilaiTunai.Value := CashNilai;

  edtJenisKartuCode.Clear;
  edtJenisKartuName.Clear;
  edtChargeCreditCard.Value := CCCharge;
  edtNilaiCC.Value := CCNilai;
  edtNomorCC.Clear;
  edtNoOtorisasiCC.Clear;
  edtCashBack.Value := CashBackNilai;

  edtNoTransBotol.Clear;
  edtNoTransBotolExit(edtNoTransBotol);
  ResetVoucher;
  
  ShowTotalBayar;
end;

procedure TfrmPayment.UpdateDataLokal(ATotalBelanja, ATotalBarangAMC: Currency;
    ADiscAMCPersen: Double; ATotalBarangCC: Currency; ATotalBarangPPN:
    Currency);
begin
  ResetAll;

  TotalBelanja      := ATotalBelanja;
  TotalBarangAMC    := ATotalBarangAMC;
  TotalBarangCC     := ATotalBarangCC;
  DiscAMCPersen     := ADiscAMCPersen;
  TotalBarangPPN    := ATotalBarangPPN;

	edtTotalBelanja.Value   := Ceil(TotalBelanja);
  edtBrgDiscGMC.Value     := TotalBarangAMC;
  edtDiscGMCPersen.Value  := DiscAMCPersen;
  edtDiscGMCNominal.Value := Floor(DiscAMCRupiah);

//  if DiscAMCRupiah < edtDiscGMCNominal.Value then
//  edtDiscGMCNominal.Value := edtDiscGMCNominal.Value-1;

  ShowTotalBayar;
  HitungSisaUang;

  edtPilihan.SetFocus;
  edtPilihan.SelectAll;
end;

procedure TfrmPayment.ShowTotalBayar;
var
  sPrec: string;
begin
  sPrec       := '';
	edtNilaiBayar.Value := TotalBayar;

  pnlPembulatan.Visible := False;
  LblPembulatan.Caption := FormatCurr('#,##0' + sPrec,0);
  if Pembulatan > 0 then
  begin
    pnlPembulatan.Visible := True;
    LblPembulatan.Caption := FormatCurr('#,##0' + sPrec,Pembulatan);
  end;

  HitungSisaUang;
end;

function TfrmPayment.GetCCChargePersen: Double;
begin
  Result := CCChargePersen;
end;

function TfrmPayment.HitungCCCharge: Currency;
begin
  Result := 0;
  try
    Result := Ceil(TotalBarangCC * GetCCChargePersen() / 100);
  except
  end;
  CCCharge := Result;
end;

procedure TfrmPayment.edtJenisKartuCodeKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key in [VK_ESCAPE] then
  begin
    edtPilihan.SetFocus;
  end
  else if Key in [VK_F5] then
  begin
    fraLookUpCC.Visible := True;
    fraLookUpCC.edNama.SetFocus;
  end
  else if Key in [VK_RETURN] then
  begin
//    edtBayarCC.SetFocus;
    LoadCreditCard(edtJenisKartuCode.Text);
    if edtJenisKartuName.Text = '' then
    begin
      edtPilihan.SetFocus;
    end
    else
    begin
      edtBayarCC.SetFocus; 
    end;
  end;
end;

procedure TfrmPayment.fraLookUpCCsgLookupKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  fraLookUpCC.cxGridViewKeyDown(Sender,Key,Shift);
  if Key in [VK_ESCAPE] then
  begin
    fraLookUpCC.Visible := False;
    edtJenisKartuCode.SetFocus;
    edtJenisKartuCode.SelectAll;
  end
  else if Key in [VK_RETURN] then
  begin  
    fraLookUpCC.Visible := False;
    edtJenisKartuCode.Text := fraLookUpCC.CC_Code;

    edtJenisKartuCodeExit(edtJenisKartuCode);
    edtBayarCC.SetFocus;
    edtBayarCC.SelectAll;
    iEdit := 0;
  end;
end;

procedure TfrmPayment.FormCreate(Sender: TObject);
begin
  fraLookUpCC.LoadData(frmMain.UnitID, 0);
  try
    //CC_Minimum := StrToCurr(getGlobalVar('POS_CC_MIN'));
    Cashback_Minimum    := StrToCurr(dmMain.getGlobalVar('POS_CASHBACK_MIN'));
    SisaUang_Maksimum   := StrToCurr(dmMain.getGlobalVar('POS_SISAUANG_MAX'));
    Cashback_Kelipatan  := StrToCurr(dmMain.getGlobalVar('POS_CASHBACK_KELIPATAN'));
    Cashback_Maximum    := StrToCurr(dmMain.getGlobalVar('POS_CASHBACK_MAX'));
    KonstantaPembulatan := StrToCurr(dmMain.getGlobalVar('POS_PEMBULATAN'));
    ShowFooterKembalian := StrToInt(dmMain.getGlobalVar('POS_SHOW_SISAKEMBALIAN'));
    TipeIDConcession    := StrToInt(dmMain.getGlobalVar('POS_CONCESSION'));
  except
  end;
end;

procedure TfrmPayment.fraLookUpCCedNamaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  fraLookUpCC.edNamaKeyDown(Sender,Key,Shift);
  if Key in [VK_ESCAPE] then
  begin
    fraLookUpCC.Visible := False;
    edtJenisKartuCode.SetFocus;
    edtJenisKartuCode.SelectAll;
  end;
end;

procedure TfrmPayment.LoadCreditCard(ACode: String);
var
  sSQL: string;
begin
  sSQL := 'select card_code, card_name, card_limit, card_charge, '
    +' card_is_cashback, card_is_credit, card_id, CARD_DISCOUNT'
    + ' from ref$credit_card '
    + ' where card_unt_id = ' + IntToStr(frmMain.UnitID)
    + ' and CARD_IS_ACTIVE = 1' // BP Was Here
    + ' and (CARD_IS_KRING = 0 or CARD_IS_KRING is null)'
    + ' and card_code = ' + QuotedStr(ACode)
    + ' order by card_code';

  ClearCCForm;

  with cOpenQuery(sSQL) do
  begin
    try
      if not eof then
      begin
        HideCashBack;
        CardID                 := Fields[6].AsInteger;
        edtJenisKartuCode.Text := Fields[0].AsString;
        edtJenisKartuName.Text := Fields[1].AsString;
        CCChargePersen         := Fields[3].AsCurrency;
        CCLimit                := Fields[2].AsCurrency;
        CCDisc                 := Fields[7].AsFloat;
        edtCCDisc.Value   := CCDisc;
        edtNilaiCC.Value  := 0;




        
        if Fields[5].AsInteger = 1 then
          IsCreditCard := True
        else
          IsCreditCard := False;     
        edtChargeCreditCard.Value := HitungCCCharge;

        CCBayar               := TotalBayar-edtNilaiTunai.Value;
        edtBayarCC.Text       := FormatFloat('#,##0',CCBayar);
        if CCDisc <> 0 then
        begin
//          CCBayar               := TotalBayar-edtNilaiTunai.Value;
//          edtBayarCC.Text       := FormatFloat('#,##0',CCBayar);
          CCDiscNominal         := (CCDisc/100)*(CCBayar);
          CCDiscNominal         := Floor(CCDiscNominal);
          edtCCDiscNominal.Text := FormatFloat('#,##0',CCDiscNominal);
          iEdit                 := 0;
        end
        else
        CCDiscNominal := 0;

        HitungSisaUang;


        if Fields[4].AsInteger = 1 then
        begin
          IsCashbackCard := True;
          ShowCashBack;
        end;
      end;// else
      //  ClearCCForm;
    finally
      Free;
    end;
  end;
  ShowTotalBayar;
end;

procedure TfrmPayment.ShowCashBack;
begin
  lblCashback.Visible := True;
  edtCashBack.Visible := True;
end;

procedure TfrmPayment.HideCashBack;
begin
  lblCashback.Visible := False;
  edtCashBack.Visible := False;
  edtCashBack.Value := 0;
end;

procedure TfrmPayment.edtJenisKartuCodeExit(Sender: TObject);
begin
  CCDisc                  := 0;
  CCDiscNominal           := 0;
  CCBayar                 := 0;
  edtBayarCC.Text         := '0';
  edtCCDisc.Text          := '0';
  edtCCDiscNominal.Text   := '0';

  LoadCreditCard(edtJenisKartuCode.Text);
  if (edtJenisKartuName.Text <> '') then
  begin
    edtNilaiCC.Text := FormatFloat('#,##0',CCBayar-CCDiscNominal);
    iEdit := 0;
  end;
end;

procedure TfrmPayment.edtPilihanKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  HideInfo;
//  if ((Key = VK_RETURN) or (Key = VK_TAB)) and (edtPilihan.Text<>'') then
//     Key := Ord(edtPilihan.Text[1]);
  case Key of    //
    Ord('1'), VK_NUMPAD1:
    begin
      edtNilaiTunai.Text := FormatFloat('#,##0',edtNilaiBayar.Value-edtBayarCC.Value);
      edtNilaiTunai.SetFocus;
      edtNilaiTunai.SelectAll;
    end;
    Ord('2'), VK_NUMPAD2:
    begin
      {//ditutup karena untuk debit card gak ada batas minimal
      if (edtNilaiBayar.Value - edtNilaiTunai.Value) < CC_Minimum  then
      begin
        CommonDlg.ShowError(CREDIT_CARD_MINIMUM + FormatFloat('#,##0',CC_Minimum));
        edtPilihan.SelectAll;
        Exit;
      end;
      }
      edtJenisKartuCode.SetFocus;
      edtJenisKartuCode.SelectAll;
    end;
    VK_F12:
    begin
      if CommonDlg.Confirm('Apakah Anda yakin me-reset voucher?') = mrYes then
      begin
        ResetVoucher;
      end;
    end;
    Ord('3'), VK_NUMPAD3:
    begin
      if GetSisaBayar(edtBotolValue.Value) > 0 then
      begin
        edtNoTransBotol.SetFocus;
        edtNoTransBotol.SelectAll;
      end;
    end;
    Ord('C'):
    begin
      if SisaUang >= 0 then
      begin
        if SisaUang <= SisaUang_Maksimum then
        begin
          TAppUtils.cShowWaitWindow('Mencetak Struk');
          Application.ProcessMessages;
          try
            if SaveToDB then
            begin

              ParsingPrintStrukTrans;

              frmTransaksi.Transaksi_ID := 0;
              {$IFDEF TSN}
              if IsConcession then
                 ParsingPrintConsValidasi;
              {$ENDIF}
              frmTransaksi.ResetTransaction;
              frmTransaksi.edNoPelanggan.Text := frmTransaksi.GetDefaultMember;

              Self.Close;
            end;
          finally
            TAppUtils.cCloseWaitWindow;
          end;
        end
        else
        begin
          //CommonDlg.ShowError(MSG_MAX_KEMBALIAN + FormatCurr('#,##0',SisaUang_Maksimum));
          ShowInfo(MSG_MAX_KEMBALIAN + FormatCurr('#,##0',SisaUang_Maksimum));
          Exit;
        end;
      end
      else
      begin
        //CommonDlg.ShowError(MSG_PAYMENT_NOT_VALID);
        ShowInfo(MSG_PAYMENT_NOT_VALID);
        Exit;
      end;
    end;
    {$IFDEF TSN}
    Ord('P'):
    begin
      if SisaUang >= 0 then
      begin
        if SisaUang <= SisaUang_Maksimum then
        begin
          cShowWaitWindow('Bayar tanpa cetak Struk');
          Application.ProcessMessages;
          try
            if SaveToDB then
            begin
              frmTransaksi.Transaksi_ID := 0;
              frmTransaksi.ResetTransaction;

              frmTransaksi.edNoPelanggan.Text := '';
              frmTransaksi.edNoPelanggan.Text := '0';

              Self.Close;
            end;
          finally
            cCloseWaitWindow;
          end
        end
        else
        begin
          //CommonDlg.ShowError(MSG_MAX_KEMBALIAN + FormatCurr('#,##0',SisaUang_Maksimum));
          ShowInfo(MSG_MAX_KEMBALIAN + FormatCurr('#,##0',SisaUang_Maksimum));
          Exit;
        end;
      end
      else
      begin
        //CommonDlg.ShowError(MSG_PAYMENT_NOT_VALID);
        ShowInfo(MSG_PAYMENT_NOT_VALID);
        Exit;
      end;
    end;
    {$ENDIF}
    VK_ESCAPE:
    begin
      Self.Close;
    end;
  end;    // case
end;

procedure TfrmPayment.edtNilaiCCKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key in [VK_ESCAPE] then
  begin
    edtJenisKartuCode.SetFocus;
  end;
end;

procedure TfrmPayment.edtNilaiCCPropertiesChange(Sender: TObject);
begin
//  if iEdit = 0 then
//  begin
//    CCNilai                 := edtNilaiCC.Value;
//    iEdit                   := 1;
//    ShowTotalBayar;
//  end
//  else
//  begin
//    CCNilai                 := edtNilaiCC.Value;
//    CCDiscNominal           := (CCDisc/100)*CCNilai;
//    edtCCDiscNominal.Text   := FormatFloat('#,##0',CCDiscNominal);
//    ShowTotalBayar;
//  end;
//  HitungSisaUang;
end;

procedure TfrmPayment.edtNomorCCKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key in [VK_ESCAPE] then
  begin
    edtNilaiCC.SetFocus;
  end;
end;

procedure TfrmPayment.edtNoOtorisasiCCKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key in [VK_ESCAPE] then
  begin
    edtNomorCC.SetFocus;
  end
  else if Key in [VK_RETURN] then
  begin
    if edtCashBack.Visible then
      edtCashBack.SetFocus
    else
      edtPilihan.SetFocus;
  end;
end;

procedure TfrmPayment.edtNilaiTunaiKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key in [VK_ESCAPE] then
  begin
    edtPilihan.SetFocus;
  end
  else if Key in [VK_RETURN] then
  begin
    edtPilihan.SetFocus;
  end;
end;

procedure TfrmPayment.edtNoTransBotolKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key in [VK_ESCAPE] then
  begin
    edtPilihan.SetFocus;
  end;
end;

procedure TfrmPayment.edtCashBackKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key in [VK_ESCAPE] then
  begin
    edtNoOtorisasiCC.SetFocus;
  end
  else if Key in [VK_RETURN] then
  begin
    edtPilihan.SetFocus;
  end;
end;

procedure TfrmPayment.ParsingPrintStrukTrans;
var
  i: Integer;
  isShowTotal: Boolean;
//  outFile: string;
  sTemp, sTerbilang: string;
  iRow: integer;
  aSpell: TSpell;
  DiscPersen : Double;
  dTotalNonJB: Double;
  lPosTrans: TPOSTransaction;
  lQ: TFDQuery;
  sDiscPersen : String;
  sPrice: string;
  sReportPath: string;
begin
  dTotalNonJB := 0;
  HideInfo;
  mmoBackup.Clear;
  mmoTemp.Clear;
  sReportPath := TAppUtils.GetAppPath;
  //mmoBackup.Lines.LoadFromFile(cGetAppPath + 'utils\' + FILE_HEADER);
  //Application.ProcessMessages;

  //outFile := cGetAppPath + 'utils\' + FILE_HEAD_STRUK;
  //if (FileExists(outFile)) then
     //DeleteFile(PChar(outFile));

  {Parsing data head struk}
  mmoHeadStruk.Clear;
  mmoHeadStruk.Lines.Add('POS / Kasir : ' + frmMain.FPOSCode + '/' + frmMain.FCashierCode + ' ' + frmMain.FCashierName);
  mmoHeadStruk.Lines.Add('No Trans    : ' + TAppUtils.StrPadRight(frmTransaksi.edNoTrnTerakhir.Text,18,' ') + FormatDateTime('dd/MM/yy',Now));
  mmoHeadStruk.Lines.Add('No Member   : ' + TAppUtils.StrPadRight(frmTransaksi.edNoPelanggan.Text,18,' ') + FormatDateTime('HH:nn:ss',Now));
  //mmoHeadStruk.Lines.SaveToFile(outFile);

  mmoBackup.Lines.AddStrings(mmoHeadStruk.Lines);
  Application.ProcessMessages;

  //outFile := cGetAppPath + 'utils\' + FILE_ISI_STRUK;
  //if (FileExists(outFile)) then
     //DeleteFile(PChar(outFile));

  mmoIsiStruk.Clear;
  mmoIsiStruk.Lines.Add(TAppUtils.StrPadRight('',41,'-'));
  iRow := frmTransaksi.sgTransaksi.DataController.RecordCount - 1;
  with frmTransaksi.sgTransaksi.DataController do
  begin
  for i := 1 to iRow do
  begin
    if (Values[i, _KolPLU] <> '') then
    begin
      sTemp := ' ';
      if CCNilai <> 0 then
      begin
        if (Values[i, _KolIsMailer] = '1') or (Values[i, _KolIsCharge] = '1')  then //kalo barang kena charge CC kasih @ di depan PLU
          sTemp := '@';
      end;

      if edtDiscGMCNominal.Value <> 0 then
      begin
        if Values[i, _KolIsDiscGMC] = '1' then //kalo barang discon AMC kasih bintang di depan PLU
          sTemp := sTemp + '*'
        else
          sTemp := sTemp + ' '
      end
      else
        sTemp := sTemp + ' ';

      mmoIsiStruk.Lines.Add(Values[i, _KolPLU] + sTemp + LeftStr(Values[i, _KolNamaBarang],40));
      {$IFDEF TSN}
        sTemp := TAppUtils.StrPadLeftCut(FormatFloat('#,##'+Get_Qty_Precision, Values[i, _KolJumlah]),8,' ') + ' ';
        sTemp := sTemp + TAppUtils.StrPadRight(Values[i, _KolUOM],5,' ') + 'x';
        sPrice := IfThen(Values[i, _KolDisc]>0,
            FormatFloat('#,##0',Values[i, _KolHarga]) + '-' + FormatFloat('#,#0',Values[i, _KolDiscP])+'%',
            FormatFloat('#,##0',Values[i, _KolHarga]-Values[i, _KolDisc]));

        if Values[i, _KolDiscMan] > 0 then
        begin
          DiscPersen  := RoundTo(Values[i, _KolDiscMan] / Values[i, _KolHarga] * 100, -2);
          sDiscPersen := '-' +  FormatFloat('#,#0',DiscPersen) + '%';
          sPrice := sPrice + sDiscPersen;
        end;

        sTemp := sTemp + TAppUtils.StrPadLeftCut(sPrice,12,' ');
        sTemp := sTemp + TAppUtils.StrPadLeftCut(FormatFloat('#,##0',Values[i, _KolTotal]),13,' ');

        mmoIsiStruk.Lines.Add(sTemp);
        dTotalNonJB := dTotalNonJB + GetAmountNonJB(i);
      {$ELSE}
        sTemp := TAppUtils.StrPadLeftCut(FormatFloat('#,##'+Get_Qty_Precision,Values[i, _KolJumlah]),10,' ') + ' '
          + TAppUtils.StrPadRight(Values[i, _KolUOM],5,' ') + 'x'
          + TAppUtils.StrPadLeftCut(FormatFloat('#,##0',Values[i, _KolHarga]-Values[i, _KolDisc]),10,' ')
          + TAppUtils.StrPadLeftCut(FormatFloat('#,##0',Values[i, _KolTotal]+(Values[i, _KolDiscMan]*Values[i, _KolJumlah])),13,' ');

        mmoIsiStruk.Lines.Add(sTemp);
        if Values[i, _KolDiscMan] > 0 then
        begin
            DiscPersen  :=  RoundTo(Values[i, _KolDiscMan] / Values[i, _KolHarga] * 100, -2);
            sDiscPersen := '(' + FloatToStr(DiscPersen) + '%)';
            While Length(sDiscPersen) < 10 do
            begin
              sDiscPersen :=  sDiscPersen + ' ';
            end;
            sTemp :='Disc Manual ' + sDiscPersen + TAppUtils.StrPadLeftCut(FormatFloat('#,##0',Values[i, _KolDiscMan]*Values[i, _KolJumlah]),18,' ');
            mmoIsiStruk.Lines.Add(sTemp);
        end;
      {$ENDIF}
    end;
  end;
  end;

  sTemp := '';
  mmoIsiStruk.Lines.Add(TAppUtils.StrPadRight('',40,'-'));
  //mmoIsiStruk.Lines.SaveToFile(outFile);

  mmoBackup.Lines.AddStrings(mmoIsiStruk.Lines);
  Application.ProcessMessages;

  //outFile := cGetAppPath + 'utils\' + FILE_FOOTER_STRUK;
  //if (FileExists(outFile)) then
     //DeleteFile(PChar(outFile));

  //Parsing data footer struk
  mmoFooterStruk.Clear;
  mmoFooterStruk.Lines.Add(TAppUtils.StrPadLeftCut('TOTAL BELANJA:',27,' ')
    + TAppUtils.StrPadLeftCut(FormatFloat('#,##0',edtTotalBelanja.Value),13,' '));

  isShowTotal := False;

  //besok tambahkan param disini, jika 0 mau ditampilkan atau tidak terserah admin
  if (edtDiscGMCNominal.Value <> 0) then
  begin
    mmoFooterStruk.Lines.Add('*Brg Disc AMC'
      + TAppUtils.StrPadLeftCut(FormatFloat('#,##0',edtBrgDiscGMC.Value),14,' '));

    mmoFooterStruk.Lines.Add(' Disc'
      + TAppUtils.StrPadLeftCut(FormatFloat('#,##0.00%',edtDiscGMCPersen.Value),22,' ')
      + TAppUtils.StrPadLeftCut(FormatFloat('-#,##0',edtDiscGMCNominal.Value),13,' '));

    isShowTotal := True;
  end;

  if (edtNilaiCC.Value > 0)
    and (edtChargeCreditCard.Value > 0) then //apabila ada barang yg kena charge card
  begin
    mmoFooterStruk.Lines.Add('@Card Charge'
      + TAppUtils.StrPadLeftCut(FormatFloat('#,##0',edtChargeCreditCard.Value),28,' '));

    isShowTotal := True;
  end else begin
  end;

  //voucher
  if (edtBotolValue.Value > 0) then
  begin
    mmoFooterStruk.Lines.Add('VCR [B]' + TAppUtils.StrPadLeftCut(FormatFloat('#,##0',edtBotolValue.Value),9,' '));
    if (edtGoroValue.Value = 0)
      and (edtVoucherValue.Value = 0) then
    begin
      mmoFooterStruk.Lines[mmoFooterStruk.Lines.Count-1] := mmoFooterStruk.Lines[mmoFooterStruk.Lines.Count-1]
        + TAppUtils.StrPadLeftCut('TOT VCR:',11,' ')
        + TAppUtils.StrPadLeftCut(FormatFloat('-#,##0',(edtBotolValue.Value + edtGoroValue.Value + edtVoucherValue.Value)),13,' ');
    end;
    isShowTotal := True;
  end;
  if (edtGoroValue.Value > 0) then
  begin
    if (edtBotolValue.Value > 0) then
      mmoFooterStruk.Lines.Add('    [A]' + TAppUtils.StrPadLeftCut(FormatFloat('#,##0',edtGoroValue.Value),9,' '))
    else
      mmoFooterStruk.Lines.Add('VCR [A]' + TAppUtils.StrPadLeftCut(FormatFloat('#,##0',edtGoroValue.Value),9,' '));

    if (edtVoucherValue.Value = 0) then
    begin
      mmoFooterStruk.Lines[mmoFooterStruk.Lines.Count-1] := mmoFooterStruk.Lines[mmoFooterStruk.Lines.Count-1]
        + TAppUtils.StrPadLeftCut('TOT VCR:',11,' ')
        + TAppUtils.StrPadLeftCut(FormatFloat('-#,##0',(edtBotolValue.Value + edtGoroValue.Value + edtVoucherValue.Value)),13,' ');
    end;
    isShowTotal := True;
  end;
  if (edtVoucherValue.Value > 0) then
  begin
    if (edtBotolValue.Value > 0)
      or (edtGoroValue.Value > 0) then
      mmoFooterStruk.Lines.Add('    [L]' + TAppUtils.StrPadLeftCut(FormatFloat('#,##0',edtVoucherValue.Value),9,' '))
    else
      mmoFooterStruk.Lines.Add('VCR [L]' + TAppUtils.StrPadLeftCut(FormatFloat('#,##0',edtVoucherValue.Value),9,' '));

    mmoFooterStruk.Lines[mmoFooterStruk.Lines.Count-1] := mmoFooterStruk.Lines[mmoFooterStruk.Lines.Count-1]
      + TAppUtils.StrPadLeftCut('TOT VCR:',11,' ')
      + TAppUtils.StrPadLeftCut(FormatFloat('-#,##0',(edtBotolValue.Value + edtGoroValue.Value + edtVoucherValue.Value)),13,' ');

    isShowTotal := True;
  end;

  if isShowTotal then
  begin
    mmoFooterStruk.Lines.Add(TAppUtils.StrPadLeftCut('TOTAL:',27,' ')
      + TAppUtils.StrPadLeftCut(FormatFloat('#,##0',edtNilaiBayar.Value),13,' '));
      //+ TAppUtils.StrPadLeftCut(FormatFloat('#,##0',edtTotalBelanja.Value - edtDiscGMCNominal.Value + edtChargeCreditCard.Value),13,' '));
  end;

  if edtNilaiCC.Value <> 0 then //apabila ada pembayaran pakai CARD
  begin
    sTemp := TAppUtils.StrRemoveChar(edtNomorCC.Text, ' ');
    sTemp := TAppUtils.StrRemoveChar(sTemp,'-');
    sTemp := TAppUtils.StrRemoveChar(sTemp,'*');

    mmoFooterStruk.Lines.Add('Jns Kartu: ' + TAppUtils.StrPadRight(edtJenisKartuName.Text,15,' '));
    mmoFooterStruk.Lines.Add('No. Kartu: ' + TAppUtils.StrPadRight(sTemp,16,' '));
    mmoFooterStruk.Lines.Add('Otorisasi: ' + TAppUtils.StrPadRight(edtNoOtorisasiCC.Text,11,' ')
      + 'CARD:' + TAppUtils.StrPadLeftCut(FormatFloat('#,##0',edtNilaiCC.Value),13,' '));
    mmoFooterStruk.Lines.Add(TAppUtils.StrPadLeftCut('DISC CARD:',27,' ')
    + TAppUtils.StrPadLeftCut(FormatFloat('#,##0',edtCCDiscNominal.Value),13,' '));

  end else begin
  end;

  if edtNilaiTunai.Value <> 0 then
  begin
    mmoFooterStruk.Lines.Add(TAppUtils.StrPadLeftCut('CASH:',27,' ')
      + TAppUtils.StrPadLeftCut(FormatFloat('#,##0',edtNilaiTunai.Value),13,' '));
  end;

  mmoFooterStruk.Lines.Add(TAppUtils.StrPadRight('',27,' ') + TAppUtils.StrPadRight('',13,'-'));

  mmoFooterStruk.Lines.Add('Colie' + TAppUtils.StrPadLeftCut(FormatFloat('#,##0', frmTransaksi.TotalColie),9,' ')
    + TAppUtils.StrPadLeftCut('Kembali:',13,' ') + TAppUtils.StrPadLeftCut(FormatFloat('#,##0',edtSisaUang.Value),13,' '));
  mmoFooterStruk.Lines.Add(TAppUtils.StrPadRight('',40,'-'));

  //Mencoba disini PAJAK !!!!
  mmoFooterStruk.Lines.Add('BKP :' + TAppUtils.StrPadLeftCut(FormatFloat('#,##0',frmTransaksi.TotalRupiahBarangBKP),7,' ')
    + TAppUtils.StrPadLeftCut('DISC :',21,' ') + TAppUtils.StrPadLeftCut(FormatFloat('#,##0',frmTransaksi.TotalRupiahBarangDiscount),7,' '));
  mmoFooterStruk.Lines.Add('DPP :' + TAppUtils.StrPadLeftCut(FormatFloat('#,##0',frmTransaksi.TotalRupiahBarangDPP),7,' ')
    + TAppUtils.StrPadLeftCut('PPN :',21,' ') + TAppUtils.StrPadLeftCut(FormatFloat('#,##0',frmTransaksi.TotalRupiahBarangPPN),7,' '));
  mmoFooterStruk.Lines.Add('Bebas PPN :' + TAppUtils.StrPadLeftCut(FormatFloat('#,##0',frmTransaksi.TotalRupiahBarangBebasPPN),7,' '));

  mmoFooterStruk.Lines.Add(TAppUtils.StrPadRight('',40,'-'));

  //sisa kembalian
  if ShowFooterKembalian = 1 then
  begin
    sTemp := 'Sisa Kembalian: ' + FormatFloat('#,##0',Pembulatan);
    mmoFooterStruk.Lines.Add(TAppUtils.StrPadLeftCut(sTemp,Length(sTemp) + ((40 - Length(sTemp)) div 2),' '));
    mmoTemp.Clear;
    mmoTemp.Lines.LoadFromFile(sReportPath + 'utils\' + FILE_FOOTER_SISA);
    mmoFooterStruk.Lines.AddStrings(mmoTemp.Lines);
  end;


  lQ := cOpenQuery('SELECT FOOTER FROM SP_HADIAH('+ QuotedStr(frmTransaksi.edNoTrnTerakhir.Text) +')');
  try
    while not lQ.Eof do
    begin
      mmoFooterStruk.Lines.Add(lQ.FieldbyName('FOOTER').AsString);
      lQ.Next;
    end;
  finally
    lQ.Free;
  end;
  mmoTemp.Lines.LoadFromFile(sReportPath + 'utils\' + FILE_FOOTER);
  mmoFooterStruk.Lines.AddStrings(mmoTemp.Lines);
  mmoBackup.Lines.AddStrings(mmoFooterStruk.Lines);
  Application.ProcessMessages;

  if (edtCashBack.Visible) and (edtCashBack.Value > 0) then
  begin
    mmoTemp.Lines.LoadFromFile(sReportPath + 'utils\' + FILE_HEADER_CASHBACK);
  end
  else
  begin
    mmoTemp.Lines.LoadFromFile(sReportPath + 'utils\' + FILE_HEADER);
  end;
  mmoBackup.Lines.AddStrings(mmoTemp.Lines);
  for i := mmoTemp.Lines.Count + 1 to 4 do    // Iterate
  begin
    mmoBackup.Lines.Add('');
  end;    // for
  //mmoBackup.Lines.Delete(mmoBackup.Lines.Count-1);
  Application.ProcessMessages;


  try
    begin
      //PrintFile(outFile);
      //outFile := sReportPath + 'utils\' + 'POS_STRUK.TXT';
      //mmoBackup.Lines.SaveToFile(outFile);

      lPosTrans := TPOSTransaction.Create(Self);
      Try
        Try
          lPosTrans.UpdateTransStruk(mmoBackup.Lines, frmTransaksi.Transaksi_ID);
        except
        end;
      Finally
        lPosTrans.Free;
      end;

      PrintStrings(mmoBackup.Lines);
    end;
  except
    //CommonDlg.ShowError('Gagal mencetak struk');
    ShowInfo('Gagal mencetak struk');
  end;
  {
  mmoFooterStruk.Lines.Add('');
  if FPromoTrans.Count > 0 then
    mmoFooterStruk.Lines.Add(arrSpasi[(47 - Length(PROMO_PREFIX)) div 2] + PROMO_PREFIX);

  for i := 0 to FPromoTrans.Count - 1 do
  begin
    mmoFooterStruk.Lines.Add(arrSpasi[(47 - Length(FPromoTrans[i])) div 2] + FPromoTrans[i]);
  end;
  mmoFooterStruk.Lines.Add('');

  //mmoFooterStruk.Lines.SaveToFile(outFile);
  //PrintFile(FApplicationDir + 'utils\' + FILE_FOOTER_STRUK);
  mmoBackup.Lines.AddStrings(mmoFooterStruk.Lines);
  Application.ProcessMessages;

  //PrintFile(FApplicationDir + 'utils\' + FILE_FOOTER);
  //add by didit: 02102007
  mmoTemp.Lines.LoadFromFile(FApplicationDir + 'utils\' + FILE_FOOTER);
  mmoBackup.Lines.AddStrings(mmoTemp.Lines);
  Application.ProcessMessages;
  }

  //print struk cashback---------------------------------
  if (edtCashBack.Visible) and (edtCashBack.Value > 0) then
  begin
    CommonDlg.ShowMessage('Tekan OK untuk mulai mencetak struk cashback');
    aSpell := TSpell.Create;

    //outFile := sReportPath + 'utils\' + FILE_ISI_CASHBACK;
    //if (FileExists(outFile)) then
       //DeleteFile(PChar(outFile));

    //Parsing data isi struk cashback
    mmoIsiCB.Clear;
    mmoIsiCB.Lines.Add('Tanggal / Jam : ' + FormatDateTime('dd/mm/yyyy',Now) + '  ' + FormatDateTime('HH:nn:ss',Now));
    mmoIsiCB.Lines.Add('No.Transaksi  : ' + frmTransaksi.edNoTrnTerakhir.Text);
    mmoIsiCB.Lines.Add('POS / Kasir   : ' + frmMain.FPOSCode + ' / ' + frmMain.FCashierCode + ' ' + frmMain.FCashierName);
    mmoIsiCB.Lines.Add(TAppUtils.StrPadRight('',40,'-'));
    mmoIsiCB.Lines.Add('Kode/Nama Kartu : ' + TAppUtils.StrPadRight(edtJenisKartuCode.Text,4,' ') + ' ' +
                         TAppUtils.StrPadRight(edtJenisKartuName.Text,16,' '));
    mmoIsiCB.Lines.Add('No. Kartu       : ' + TAppUtils.StrPadRight(edtNomorCC.Text,20,' '));
    mmoIsiCB.Lines.Add('No. Otorisasi   : ' + TAppUtils.StrPadRight(edtNoOtorisasiCC.Text,16,' '));
    mmoIsiCB.Lines.Add(TAppUtils.StrPadRight('',40,'-'));
    mmoIsiCB.Lines.Add('Tot Pengambilan : ' + TAppUtils.StrPadRight(edtCashBack.Text,20,' '));
    mmoIsiCB.Lines.Add('Terbilang       : ');
    sTerbilang := aSpell.Spell(edtCashBack.Text);
    mmoIsiCB.Lines.Add('[' + sTerbilang + ']');

    //mmoIsiCB.Lines.SaveToFile(outFile);
    //PrintFile(outFile);
//    PrintStrings(mmoIsiCB.Lines);
    mmoBackup.Lines.AddStrings(mmoIsiCB.Lines);
    Application.ProcessMessages;

    PrintFile(sReportPath + 'utils\' + FILE_FOOTER_CASHBACK);
    mmoTemp.Clear;
    mmoTemp.Lines.LoadFromFile(sReportPath + 'utils\' + FILE_FOOTER_CASHBACK);
    mmoBackup.Lines.AddStrings(mmoTemp.Lines);
    //mmoBackup.Lines.SaveToFile(sReportPath + 'utils\' + 'POS_STRUK.TXT');
    Application.ProcessMessages;

    aSpell.Destroy;
//    PrintStrings(mmoBackup.Lines);
    //PrintFile(sReportPath + 'utils\' + FILE_HEADER_CASHBACK);
  end;
  //----------------------- end print struk cashback ---------------------------
  {
  //save struk to file for backup
  try
    PathBackup := FPathBackupStruk+'\'+FPOSCode+'\'+
                  FormatDateTime('yyyymmdd', DateLocalPOS)+'\';
    if not directoryexists(PathBackup) then
      ForceDirectories(PathBackup);
    outFile := PathBackup+RightStr(edtNoTrnTerakhir.Text,4)+'.txt';
    //if (FileExists(outFile)) then
     // DeleteFile(PChar(outFile));
    mmoBackup.Lines.SaveToFile(outFile);
  except
    //mmoTemp.Free;
    //mmoBackup.Free;
  end;
  }
end;

function TfrmPayment.SaveToDB: Boolean;
var
  dItemsDiscCard: Double;
  dtTransaksi: TDateTime;
  lBarangStokSirkulasi: TBarangStockSirkulasiItems;
	bIsBKP: Boolean;
	bIsDiscAMC: Boolean;
  i: Integer;
  lDecimalSeparator: Char;
  ssSQL: TStrings;
begin
  //Tambahan agar tidak menyimpan berulang-ulang jika gagal print;
  if IsSaved then
  begin
    Result := True;
    Exit;
  end;

  Result := False;

  lDecimalSeparator := FormatSettings.DecimalSeparator;
  FormatSettings.DecimalSeparator := '.';

  ssSQL := TStringList.Create;
  try
    with frmTransaksi do
    begin
      if GetKuponBotolStatus(edtNoTransBotol.Text) = 1 then
      begin
        ShowInfo('Kupon botol sudah pernah digunakan');
        edtNoTransBotol.SetFocus;
        Exit;
      end;

      for i := 0 to VoucherAssalaamNomor.Count - 1 do    // Iterate
      begin
        if GetVoucherStatus(VoucherAssalaamNomor[i]) = 1 then
        begin
          ShowInfo('Voucher berikut sudah pernah digunakan: ' + VoucherAssalaamNomor[i]);
          edtPilihan.SetFocus;
          Exit;
        end;
      end;    // for
                 
      dtTransaksi := cGetServerDateTime;
      with TPOSTransaction.Create(Self) do
      begin
      	try
          If Trim(frmTransaksi.edNoTrnTerakhir.Text) = '' then
            frmTransaksi.edNoTrnTerakhir.Text := frmMain.GetTransactionNo(frmMain.FPOSCode, cGetServerDateTime);

        	UpdateData(edtNilaiCC.Value,edtNilaiTunai.Value,frmMain.FBeginningBalanceID,edtDiscGMCNominal.Value,
          	edtDiscGMCPersen.Value,frmTransaksi.Transaksi_ID,True,frmTransaksi.TrMemberID,frmMain.UnitID,
            frmTransaksi.edNoTrnTerakhir.Text,Self.Pembulatan,dtTransaksi,Self.TotalBayar,
            edtBrgDiscGMC.Value, Self.TotalBarangPPN,Self.TotalBelanja,edtNoTransBotol.Text,VoucherAssalaamNomor, frmMain.UserID,CCDiscNominal);

          if CCNilai > 0 then
          begin
            TransactionCard.UpdateData(CardID,
              0, edtCashBack.Value,
              edtChargeCreditCard.Value,
              0, True,
              frmMain.UnitID,
              edtNilaiCC.Value,
              edtNomorCC.Text,
              edtNoOtorisasiCC.Text,
              frmTransaksi.edNoTrnTerakhir.Text);
          end;

          for i := 0 to Self.VoucherLainJumlah.Count - 1 do    // Iterate
          begin
            with VoucherLains.Add.VoucherLain do
            begin
              UpdateData(0,True,frmMain.UnitID,
                StrToInt(Self.VoucherLainJumlah[i]),
                (StrToInt(Self.VoucherLainJumlah[i]) * StrToFloat(Self.VoucherLainNilai[i])),
                frmTransaksi.edNoTrnTerakhir.Text,
                StrToFloat(Self.VoucherLainNilai[i]));
            end;
          end;    // for

          //new simpan ke stock sirkulasi
          lBarangStokSirkulasi := TBarangStockSirkulasiItems.Create(TBarangStockSirkulasiItem);

          //ShowMessage(IntToStr(frmTransaksi.sgTransaksi.RowCount));
          with frmTransaksi.sgTransaksi.DataController do
          begin
            POSTransactionItems.Clear;
            for i := 0 to RecordCount - 1 do
            begin
              if Values[i, _KolPLU] = '' then Continue;

              bIsBKP := False;
              if Values[i, _KolIsBKP] = '1' then
                bIsBKP := True;

              bIsDiscAMC := False;
              if Values[i, _KolIsDiscGMC] = '1' then
                bIsDiscAMC := True;

              if edtJenisKartuName.Text <> '' then
              begin
                dItemsDiscCard := (CCDisc/100)* (Values[i, _KolHarga] - Values[i, _KolDisc]);
              end
              else
              begin
                dItemsDiscCard := 0;
              end;

              UpdatePOSTransactionItems(Values[i, _KolBHJID], //Barang harga jual ID
                Values[i, _KolCOGS], //COGS
                Values[i, _KolDetailID], //ID
                bIsBKP, bIsDiscAMC, //ID, IsBKP, IsDiscAMC
                Values[i, _KolLastCost], //last cost
                Values[i, _KolPPN], //PPN
                Values[i, _KolPPNBM], //PPNBM
                Values[i, _KolJumlah], //QTY
                Values[i, _KolHarga], //SellPrice
                Values[i, _KolHarga] - Values[i, _KolDisc], //SellPriceDisc
                Values[i, _KolTotal], //Total
                Values[i, _KolJumlah] * Values[i, _KolHargaExcPajak], //totalb4tax
                (Values[i, _KolTotal]), //total ceil
                frmTransaksi.edNoTrnTerakhir.Text,
                frmMain.UnitID,
                Values[i, _KolPLU],  //BrgCode
                Values[i, _KolTipeBarang], // Tipe Barang
                GetDiscItemAMCRp(i),
                Values[i, _KolUOM],
                dItemsDiscCard, //disc Card
                Values[i, _KolDiscMan],
                Values[i, _Koldiscoto]);

              with lBarangStokSirkulasi do
              begin
                with Add do
                begin
                  UpdateData(TPOSTransaction.GetHeaderFlag,
                    0,0,0,
                    'POS Transaction',
                    Values[i, _KolPLU],
                    frmMain.UnitID,
                    Values[i, _KolUom],
                    frmTransaksi.edNoTrnTerakhir.Text,
                    0 - Values[i, _KolJumlah],
                    dtTransaksi,
                    'POS',
                    0);
                  HargaTransaksi := Values[i, _KolHargaAvg];
                end;
              end;    // with
            end;
          end;    // with


          Try
            if SaveAllToDB then
            begin
            //  if lBarangStokSirkulasi.SaveToDatabase(frmTransaksi.edNoTrnTerakhir.Text,frmMain.UnitID) then
           //   begin

                cCommitTrans;
                Result := True;
                IsSaved := True;

         //     end
          //    else
           //   begin
          //      cRollbackTrans;
          //    end;
              //CommonDlg.ShowMessage('Sukses menyimpan ke database');
            end
          finally
            cRollbackTrans;
          end;

          frmTransaksi.Transaksi_ID := ID;
        finally
        	Free;
        end;
      end;

    end;    // with

  finally
    FormatSettings.DecimalSeparator := lDecimalSeparator;
    FreeAndNil(ssSQL);
  end;
end;

procedure TfrmPayment.edtNilaiCCExit(Sender: TObject);
begin
  //with trew
  HideInfo;
//  if CCDisc <> 0 then
//  begin
//    edtCCDiscNominal.Text := CurrToStr((CCDisc/100)*(TotalBayar-edtNilaiCC.Value));
//  end
//  else
//  begin
//    edtCCDiscNominal.Text := '0';
//  end;


  if edtNilaiCC.Value = 0 then
  begin
    edtJenisKartuCode.Clear;
    edtJenisKartuName.Clear;
    edtChargeCreditCard.Value := 0;
    HideCashBack;
    //edtNomorCC.Clear;
    //edtNoOtorisasiCC.Clear;
    ShowTotalBayar;

    edtPilihan.SetFocus;
    Exit;
  end;

  if IsCreditCard then
  begin
    if ((edtNilaiCC.Value) < CCLimit) and (edtNilaiCC.Value <> 0) then
    begin
      //CommonDlg.ShowError(MSG_CREDIT_CARD_MINIMUM + FormatFloat('#,##0',CC_Minimum));
      ShowInfo(MSG_CREDIT_CARD_MINIMUM + FormatFloat('#,##0',CCLimit));
      edtNilaiCC.SetFocus;
      edtNilaiCC.SelectAll;
      Exit;
    end;
  end
  else //Debit Card
    if ((CCLimit>0) and (edtNilaiCC.Value < CCLimit) and (edtNilaiCC.Value <> 0)) then
    begin
      ShowInfo(MSG_CREDIT_CARD_MINIMUM + FormatFloat('#,##0',CCLimit) + ' [DebitCard = ' + edtJenisKartuName.Text + ']');
      edtNilaiCC.SetFocus;
      edtNilaiCC.SelectAll;
      Exit;
    end;

  //if (edtNilaiCC.Value) > (edtNilaiBayar.Value - edtNilaiTunai.Value) then
//  if (edtNilaiCC.Value) > (GetSisaBayar(edtNilaiCC.Value)) then
  if (edtNilaiCC.Value) > (edtNilaiBayar.Value) then
  begin
    //CommonDlg.ShowError(MSG_CREDIT_CARD_MAXIMUM);
    ShowInfo(MSG_CREDIT_CARD_MAXIMUM);
    edtNilaiCC.SetFocus;
    edtNilaiCC.SelectAll;
    Exit;
  end;

  if (edtNilaiCC.Value >= Cashback_Minimum) and (IsCashbackCard) then
  begin
    ShowCashBack;
  end
  else
  begin
    HideCashBack;
  end;
end;

procedure TfrmPayment.edtCashBackExit(Sender: TObject);
begin
  HideInfo;
  CashBackNilai := edtCashBack.Value;
  if edtCashBack.Value = 0 then Exit;
    
  if (edtCashBack.Value > Cashback_Maximum) then
  begin
    ShowInfo(MSG_CASHBACK_MAXIMUM + FormatFloat('#,##0',Cashback_Maximum));
    edtCashBack.SetFocus;
    edtCashBack.SelectAll;
    Exit;
  end;    

  if (Ceil(edtCashBack.Value) mod Ceil(Cashback_Kelipatan)) <> 0 then
  begin
    //CommonDlg.ShowError(CASHBACK_KELIPATAN_INVALID + FormatFloat('#,##0',Cashback_Kelipatan));
    ShowInfo(MSG_CASHBACK_KELIPATAN_INVALID + FormatFloat('#,##0',Cashback_Kelipatan));
    edtCashBack.SetFocus;
    edtCashBack.SelectAll;
    Exit;
  end;    
end;

procedure TfrmPayment.edtNoTransBotolExit(Sender: TObject);
var
  sSQL: string;
begin
  HideInfo;
  //cari di trans botol
  edtBotolQty.Value := 0;
  edtBotolValue.Value := 0;
  ShowTotalBayar;
  
  if Trim(edtNoTransBotol.Text) = '' then
  begin
  end
  else
  begin
    sSQL := 'select a.tkb_status, sum(b.tkbd_qty) as qty, '
      + 'sum(b.tkbd_total_sell_price_disc) as harga '
      + 'from trans_kupon_botol a '
      + 'inner join trans_kupon_botol_detil b on a.tkb_no = b.tkbd_tkb_no '
      + '  and a.tkb_unt_id = b.tkbd_tkb_unt_id '
      + '  and a.tkb_unt_id = ' + IntToStr(frmMain.UnitID)
      + '  and a.tkb_no = ' + QuotedStr(edtNoTransBotol.Text)
      + ' group by a.tkb_status';

    with cOpenQuery(sSQL) do
    begin
      try
        if not eof then
        begin
          if UpperCase(Fields[0].AsString) = 'CLOSE' then
          begin
            ShowInfo('No voucher botol tersebut sudah pernah digunakan');
            edtNoTransBotol.SetFocus;
            edtNoTransBotol.SelectAll;
            Exit;
          end
          else if UpperCase(Fields[0].AsString) = 'PENDING' then
          begin
            ShowInfo('No voucher botol tersebut status pending');
            edtNoTransBotol.SetFocus;
            edtNoTransBotol.SelectAll;
            Exit;
          end
          else
          begin
            if Fields[2].AsFloat > edtNilaiBayar.Value then
            begin
              ShowInfo('Nilai voucher tidak boleh melebihi total belanja');
              edtNoTransBotol.SetFocus;
              edtNoTransBotol.SelectAll;
              Exit;
            end
            else
            begin
              //cek di kupon botol
              //semua PLU di kupon botol harus ada di transaksi POS dan PLU transaksi POS harus >= kupon
              sSQL := 'select b.tkbd_brg_code, b.tkbd_qty '
                + 'from trans_kupon_botol a '
                + 'inner join trans_kupon_botol_detil b on a.tkb_no = b.tkbd_tkb_no '
                + '  and a.tkb_unt_id = b.tkbd_tkb_unt_id '
                + '  and a.tkb_unt_id = ' + IntToStr(frmMain.UnitID)
                + '  and a.tkb_no = ' + QuotedStr(edtNoTransBotol.Text);

              with cOpenQuery(sSQL) do
              begin
                try
                  while not eof do
                  begin
                    if not CekPLUQtyInGrid(Fields[0].AsString,Fields[1].AsInteger) then
                    begin
                      ShowInfo('PLU : ' + Fields[0].AsString
                        + ' tidak ada atau QTY dalam transaksi < ' + FormatFloat('#,##0',Fields[1].AsInteger));
                      edtNoTransBotol.SetFocus;
                      edtNoTransBotol.SelectAll;
                      Exit;
                    end;
                    Next;
                  end;
                finally
                  Free;
                end;
              end;

              edtBotolQty.Value := Fields[1].AsInteger;
              edtBotolValue.Value := Fields[2].AsFloat;
              ShowTotalBayar;
            end;
          end;
        end
        else
        begin
          ShowInfo('No voucher botol tersebut tidak ditemukan');
          edtNoTransBotol.SetFocus;
          edtNoTransBotol.SelectAll;
        end;  
      finally
        Free;
      end;   
    end;
  end;
end;

function TfrmPayment.GetKuponBotolStatus(ANoTransaksi: String): Integer;
var
  sSQL: string;
begin
  Result := -1;
  sSQL := 'select a.tkb_status, sum(b.tkbd_qty) as qty, '
    + 'sum(b.tkbd_total_sell_price_disc) as harga '
    + 'from trans_kupon_botol a '
    + 'inner join trans_kupon_botol_detil b on a.tkb_no = b.tkbd_tkb_no '
    + '  and a.tkb_unt_id = b.tkbd_tkb_unt_id '
    + '  and a.tkb_unt_id = ' + IntToStr(frmMain.UnitID)
    + '  and a.tkb_no = ' + QuotedStr(ANoTransaksi)
    + ' group by a.tkb_status';

  with cOpenQuery(sSQL) do
  begin
    try
      if not eof then
      begin
        if UpperCase(Fields[0].AsString) = 'CLOSE' then
          Result := 1
        else if UpperCase(Fields[0].AsString) = 'OPEN' then
          Result := 0;
      end;
    finally
      Free;
    end;   
  end;
end;

function TfrmPayment.GetSisaBayar(AExclude: Double = 0): Currency;
begin
  if (edtNilaiCC.Value <> 0) or (edtNilaiCC.Text <> '') then
  Result := (TotalBayar)
    - (edtNilaiTunai.Value + edtNilaiCC.Value + edtCCDiscNominal.Value)
    + AExclude
  else
  Result := (edtNilaiBayar.Value)
    - (edtNilaiTunai.Value + edtNilaiCC.Value + edtCCDiscNominal.Value)
    + AExclude;
  if (edtChargeCreditCard.Value <> 0) or (edtChargeCreditCard.Text <> '') then
  Result := Result + edtChargeCreditCard.Value;
end;

function TfrmPayment.GetVoucherLainJumlah: TStrings;
begin
  if FVoucherLainJumlah = nil then
  begin
    FVoucherLainJumlah := TStringList.Create;
  end;
    
  Result := FVoucherLainJumlah;
end;

function TfrmPayment.GetVoucherLainNilai: TStrings;
begin
  if FVoucherLainNilai = nil then
  begin
    FVoucherLainNilai := TStringList.Create;
  end;
    
  Result := FVoucherLainNilai;
end;

function TfrmPayment.GetVoucherAssalaamNomor: TStrings;
begin
  if FVoucherAssalaamNomor = nil then
  begin
    FVoucherAssalaamNomor := TStringList.Create;
  end;
    
  Result := FVoucherAssalaamNomor;
end;

function TfrmPayment.GetVoucherAssalaamJumlah: TStrings;
begin
  if FVoucherAssalaamJumlah = nil then
  begin
    FVoucherAssalaamJumlah := TStringList.Create;
  end;
    
  Result := FVoucherAssalaamJumlah;
end;

function TfrmPayment.GetVoucherAssalaamNilai: TStrings;
begin
  if FVoucherAssalaamJumlah = nil then
  begin
    FVoucherAssalaamJumlah := TStringList.Create;
  end;
    
  Result := FVoucherAssalaamJumlah;
end;

procedure TfrmPayment.HideInfo;
begin
  if pnlInfo.Visible then
  begin
    lblInfo.Caption := '';
    tmrInfo.Enabled := False;
    pnlInfo.Visible := False;
  end;
end;

procedure TfrmPayment.ShowInfo(AInfo: String; ALabelColor: TColor = clRed;
    ABackgroundColor: TColor = clYellow);
begin
  lblInfo.Caption := AInfo;
  lblInfo.Font.Color := ALabelColor;
  pnlInfo.Color := ABackgroundColor;
  tmrInfo.Enabled := True;
  pnlInfo.Visible := True;  
end;

procedure TfrmPayment.tmrInfoTimer(Sender: TObject);
begin
  lblInfo.Visible := not lblInfo.Visible;
end;

procedure TfrmPayment.edtNoVoucherKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key in [VK_ESCAPE] then
  begin
    edtNoTransBotol.SetFocus;
  end
  else if Key in [VK_F12] then
  begin
    if CommonDlg.Confirm('Apakah Anda yakin me-reset voucher?') = mrYes then
    begin
      ResetVoucher;
    end;
  end;
end;

procedure TfrmPayment.edtNoVoucherExit(Sender: TObject);
var
  dtServerTime: TDateTime;
  sSQL: string;
  i   : integer;
  sNamaVoucher : String;
begin
  HideInfo;
  {$IFDEF TSN}
  sNamaVoucher := '';
  {$ELSE}
  sNamaVoucher := 'Assaalaam';
  {$ENDIF}

  //cari di voucher
  dtServerTime := cGetServerDateTime;
  if Trim(edtNoVoucher.Text) = '' then
  begin
    //edtGoroQty.Value := 0;
    //edtGoroValue.Value := 0;
    ShowTotalBayar;
  end
  else
  begin
    //get retur value
    if LeftStr(edtNoVoucher.Text,3) = 'RN/' then
    begin
      for i := 0 to VoucherAssalaamNomor.Count - 1 do    // Iterate
      begin
        if (VoucherAssalaamNomor[i] = edtNoVoucher.Text) then
        begin
          ShowInfo('Retur berikut sudah dimasukkan: ' + VoucherAssalaamNomor[i]);
          edtNoVoucher.SetFocus;
          Exit;
        end;
      end;    // for
      sSQL := 'select TRANSRET_POS_TRANS_NO as Nomor, '
            + ' TRANSRET_TOTAL_PRICE as Harga '
            + ' from TRANSAKSI_RETUR_NOTA '
            + ' where TRANSRET_UNT_ID = ' + IntToStr(frmMain.UnitID)
            + ' and TRANSRET_NO = ' + QuotedStr(edtNoVoucher.Text);

      with cOpenQuery(sSQL) do
      begin
        try
          if not eof then
          begin
            if Trim(FieldByName('Nomor').AsString) <> '' then
            begin
              ShowInfo('No Retur tersebut sudah pernah digunakan');
              edtNoVoucher.SetFocus;
              edtNoVoucher.SelectAll;
              Exit;
            end
            else
            begin
              if FieldByName('Harga').AsFloat > edtNilaiBayar.Value then
              begin
                ShowInfo('Nilai Retur tidak boleh melebihi total belanja');
                edtNoVoucher.SetFocus;
                edtNoVoucher.SelectAll;
                Exit;
              end
              else
              begin
                AddVoucherAssalaam(edtNoVoucher.Text,FieldByName('Harga').AsFloat);
                edtGoroQty.Value := edtGoroQty.Value + 1;
                edtGoroValue.Value := edtGoroValue.Value + FieldByName('Harga').AsFloat;
                ShowTotalBayar;
                ShowInfo('No Retur berhasil: ' + edtNoVoucher.Text
                  + ' Rp. ' + FormatFloat('#,##0',FieldByName('Harga').AsFloat),clGreen);
                edtNoVoucher.Clear;
                edtNoVoucher.SetFocus;
              end;
            end;
          end
          else
          begin
            ShowInfo('No Voucher ' + sNamaVoucher + ' tersebut tidak ditemukan');
            edtNoVoucher.SetFocus;
            edtNoVoucher.SelectAll;
          end;
        finally
          Free;
        end;
      end;
    end
    else
    begin
      for i := 0 to VoucherAssalaamNomor.Count - 1 do    // Iterate
      begin
        if (VoucherAssalaamNomor[i] = edtNoVoucher.Text) then
        begin
          ShowInfo('Voucher berikut sudah dimasukkan: ' + VoucherAssalaamNomor[i]);
          edtNoVoucher.SetFocus;
          Exit;
        end;
      end;    // for
      sSQL := 'select b.vcrd_status, a.vcr_start_date, a.vcr_expire_date, '
            + 'sum(b.vcrd_nominal) as harga '
            + 'from voucher a '
            + 'inner join voucher_detil b on a.vcr_id = b.vcrd_vcr_id '
            + '  and a.vcr_unt_id = b.vcrd_vcr_unt_id '
            + '  and a.vcr_unt_id = ' + IntToStr(frmMain.UnitID)
            + '  and b.vcrd_no = ' + QuotedStr(edtNoVoucher.Text)
            + ' group by b.vcrd_status, a.vcr_start_date, a.vcr_expire_date';

      with cOpenQuery(sSQL) do
      begin
        try
          if not eof then
          begin
            if UpperCase(Fields[0].AsString) = 'CLOSE' then
            begin
              ShowInfo('No Voucher ' + sNamaVoucher + ' tersebut sudah pernah digunakan');
              edtNoVoucher.SetFocus;
              edtNoVoucher.SelectAll;
              Exit;
            end
            else if DateOf(Fields[1].AsDateTime) > DateOf(dtServerTime) then
            begin
              ShowInfo('No Voucher ' + sNamaVoucher + ' tersebut baru akan berlaku tanggal: '
                + FormatDateTime('dd MMMM yyyy',Fields[1].AsDateTime));
              edtNoVoucher.SetFocus;
              edtNoVoucher.SelectAll;
              Exit;
            end
            else if DateOf(Fields[2].AsDateTime) < DateOf(dtServerTime) then
            begin
              ShowInfo('No Voucher ' + sNamaVoucher + ' tersebut telah expired tanggal: '
                + FormatDateTime('dd MMMM yyyy',Fields[2].AsDateTime));
              edtNoVoucher.SetFocus;
              edtNoVoucher.SelectAll;
              Exit;
            end
            else
            begin
              if Fields[3].AsFloat > edtNilaiBayar.Value then
              begin
                ShowInfo('Nilai voucher tidak boleh melebihi total belanja');
                edtNoVoucher.SetFocus;
                edtNoVoucher.SelectAll;
                Exit;
              end
              else
              begin
                AddVoucherAssalaam(edtNoVoucher.Text,Fields[3].AsFloat);
                edtGoroQty.Value := edtGoroQty.Value + 1;
                edtGoroValue.Value := edtGoroValue.Value + Fields[3].AsFloat;
                ShowTotalBayar;
                ShowInfo('No Voucher ' + sNamaVoucher + ' berhasil: ' + edtNoVoucher.Text
                  + ' Rp. ' + FormatFloat('#,##0',Fields[3].AsFloat),clGreen);
                edtNoVoucher.Clear;
                edtNoVoucher.SetFocus;
              end;
            end;
          end
          else
          begin
            ShowInfo('No Voucher ' + sNamaVoucher + ' tersebut tidak ditemukan');
            edtNoVoucher.SetFocus;
            edtNoVoucher.SelectAll;
          end;
        finally
          Free;
        end;
      end;
    end;
  end;
end;

procedure TfrmPayment.edtVoucherQtyKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key in [VK_ESCAPE] then
  begin
    edtNoVoucher.SetFocus;
  end
  else if Key in [VK_F12] then
  begin
    if CommonDlg.Confirm('Apakah Anda yakin me-reset voucher?') = mrYes then
    begin
      ResetVoucher;
    end;
  end
  else if Key in [VK_RETURN] then
  begin
    if (edtVoucherQty.Text = '')
      or (edtVoucherQty.Text = '0') then
    begin
      edtVoucherQty.Value := VoucherLainJumlahTotal;
      edtVoucherValue.Value := VoucherLainNilaiTotal;
      edtPilihan.SetFocus;
      edtPilihan.SelectAll;
    end
    else
    begin
      edtVoucherValue.SetFocus;
      edtVoucherValue.Clear;
    end;
  end;
end;

procedure TfrmPayment.ResetVoucher;
begin
  edtNoTransBotol.Clear;
  edtBotolQty.Value := 0;
  edtBotolValue.Value := 0;

  VoucherAssalaamNomor.Clear;
  VoucherAssalaamJumlah.Clear;
  VoucherAssalaamNilai.Clear;
  edtNoVoucher.Clear;
  edtGoroQty.Value := 0;
  edtGoroValue.Value := 0;

  edtVoucherQty.Value := 0;
  edtVoucherValue.Value := 0;
  VoucherLainJumlahTotal := 0;
  VoucherLainNilaiTotal := 0;
  VoucherLainNilai.Clear;
  VoucherLainJumlah.Clear;

  ShowTotalBayar;
end;

procedure TfrmPayment.edtVoucherValueKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key in [VK_ESCAPE] then
  begin
    edtVoucherQty.Clear;
    edtVoucherQty.SetFocus;
  end
  else if Key in [VK_F12] then
  begin
    if CommonDlg.Confirm('Apakah Anda yakin me-reset voucher?') = mrYes then
    begin
      ResetVoucher;
    end;
  end
  else if Key in [VK_RETURN] then
  begin
    if (edtVoucherQty.Text = '')
      or (edtVoucherQty.Text = '0')
      or (edtVoucherValue.Text = '')
      or (edtVoucherValue.Text = '0') then
    begin
      edtVoucherQty.Value := VoucherLainJumlahTotal;
      edtVoucherValue.Value := VoucherLainNilaiTotal;
      ShowTotalBayar;
      edtPilihan.SetFocus;
      Exit;
    end;

    if edtVoucherValue.Value > edtNilaiBayar.Value then
    begin
      ShowInfo('Nilai voucher tidak boleh melebihi total belanja');
      edtVoucherValue.SetFocus;
      edtVoucherValue.SelectAll;
      Exit;
    end
    else
    begin
      AddVoucherLain(edtVoucherQty.Value,edtVoucherValue.Value);

      edtVoucherQty.Value := VoucherLainJumlahTotal;
      edtVoucherValue.Value := VoucherLainNilaiTotal;
      ShowTotalBayar;

      edtVoucherQty.Clear;
      edtVoucherQty.SetFocus;
    end;
  end;
end;

procedure TfrmPayment.FormShow(Sender: TObject);
begin
  ResetVoucher;
  ShowTotalBayar;
  IsConcession := False;
  IsSaved := False;
end;

function TfrmPayment.GetVoucherStatus(ANoVoucher: String): Integer;
var
  sSQL: string;
begin
  Result := -1;
  sSQL := 'select b.vcrd_status '
    + 'from voucher a '
    + 'inner join voucher_detil b on a.vcr_id = b.vcrd_vcr_id '
    + '  and a.vcr_unt_id = b.vcrd_vcr_unt_id '
    + '  and a.vcr_unt_id = ' + IntToStr(frmMain.UnitID)
    + '  and b.vcrd_no = ' + QuotedStr(ANoVoucher);

  with cOpenQuery(sSQL) do
  begin
    try
      if not eof then
      begin
        if UpperCase(Fields[0].AsString) = 'CLOSE' then
          Result := 1
        else if UpperCase(Fields[0].AsString) = 'OPEN' then
          Result := 0;
      end;
    finally
      Free;
    end;   
  end;
end;

procedure TfrmPayment.edtNoTransBotolKeyPress(Sender: TObject;
  var Key: Char);
begin
  Key := UpCase(Key);
end;

function TfrmPayment.Get_Qty_Precision: string;
var
   i : Smallint;
begin
   Result := '0.';
   for i := 1 to (igQty_Precision * -1) do
   begin
       Result := Result + '0';
   end;
end;

procedure TfrmPayment.SetCCDisc(const Value: Double);
begin
  if FCCDisc <> Value then
  begin
    FCCDisc := Value;
  end;
end;

procedure TfrmPayment.SetCCDiscNominal(const Value: Currency);
begin
  if FCCDiscNominal <> Value then
  begin
    FCCDiscNominal := Value;
  end;
end;

procedure TfrmPayment.edtBayarCCExit(Sender: TObject);
begin
  if pnlInfo.Visible then
  begin
    HideInfo;
    edtJenisKartuCode.Clear;
    edtJenisKartuName.Clear;
    edtChargeCreditCard.Value  := 0;
    edtBayarCC.Value           := 0;
    edtNilaiCC.Value           := 0;
    edtNilaiBayar.Text              := '0';
    edtCCDiscNominal.Value     := 0;
  end;


  if edtBayarCC.Value = 0 then
  begin
    edtJenisKartuCode.Clear;
    edtJenisKartuName.Clear;
    edtChargeCreditCard.Value := 0;
    CCCharge := 0;
    CCChargePersen := 0;
    CCNilai := 0;
    HideCashBack;
    ShowTotalBayar;

    edtPilihan.SetFocus;
    Exit;
  end;

  if IsCreditCard then
  begin
    if ((edtNilaiCC.Value) < CCLimit) and (edtNilaiCC.Value <> 0) then
    begin
      ShowInfo(MSG_CREDIT_CARD_MINIMUM + FormatFloat('#,##0',CCLimit));
      edtBayarCC.SetFocus;
      edtBayarCC.SelectAll;
      Exit;
    end;
  end
  else //Debit Card
    if ((CCLimit>0) and (edtNilaiCC.Value < CCLimit) and (edtNilaiCC.Value <> 0)) then
    begin
      ShowInfo(MSG_CREDIT_CARD_MINIMUM + FormatFloat('#,##0',CCLimit) + ' [DebitCard = ' + edtJenisKartuName.Text + ']');
      edtBayarCC.SetFocus;
      edtBayarCC.SelectAll;
      Exit;
    end;

  if (edtNilaiCC.Value) > (edtNilaiBayar.Value) then
  begin
    ShowInfo(MSG_CREDIT_CARD_MAXIMUM);
    edtBayarCC.SetFocus;
    edtBayarCC.SelectAll;
    Exit;
  end;

  if (edtNilaiCC.Value >= Cashback_Minimum) and (IsCashbackCard) then
  begin
    ShowCashBack;
  end
  else
  begin
    HideCashBack;
  end;
end;

procedure TfrmPayment.edtBayarCCKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key in [VK_ESCAPE] then
  begin
    edtJenisKartuCode.SetFocus;
  end
  else if Key in [VK_RETURN, VK_Tab] then
  begin
    edtNilaiCC.SetFocus;
  end;

end;

procedure TfrmPayment.edtBayarCCPropertiesChange(Sender: TObject);
begin
  CCBayar                   := edtBayarCC.Value;
  CCDiscNominal             := Floor((CCDisc/100)*CCBayar);
  CCNilai                   := CCBayar-CCDiscNominal;
  edtCCDiscNominal.Text     := FormatFloat('#,##0',CCDiscNominal);
  edtNilaiCC.Text           := FormatFloat('#,##0',CCNilai);
  ShowTotalBayar;
  HitungSisaUang;
end;

procedure TfrmPayment.edtGoroQtyKeyDown(Sender: TObject; var Key: Word; Shift:
    TShiftState);
begin
  if Key in [VK_F12] then
  begin
    if CommonDlg.Confirm('Apakah Anda yakin me-reset voucher?') = mrYes then
    begin
      ResetVoucher;
    end;
  end
end;

procedure TfrmPayment.edtGoroValueKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
  if Key in [VK_F12] then
  begin
    if CommonDlg.Confirm('Apakah Anda yakin me-reset voucher?') = mrYes then
    begin
      ResetVoucher;
    end;
  end;
end;

procedure TfrmPayment.edtNilaiTunaiPropertiesChange(Sender: TObject);
begin
  CashNilai := edtNilaiTunai.Value;
  HitungSisaUang;
end;

function TfrmPayment.GetAmountNonJB(aRow: Integer): Double;
begin
  Result := 0;

  if NewBarang.LoadByKode(frmTransaksi.sgTransaksi.DataController.Values[aRow, _KolPLU]) then
  begin
    if Trim(UpperCase(NewBarang.TipeBarang.Kode)) <> 'JB' then
      Result := frmTransaksi.sgTransaksi.DataController.Values[aRow, _KolTotal];
  end;
end;

function TfrmPayment.GetNewBarang: TNewBarang;
begin
  if FNewBarang = nil then
    FNewBarang := TNewBarang.Create(Self);

  Result := FNewBarang;
end;

procedure TfrmPayment.ParsingPrintCardValidasi;
var
  outFile: string;
  aSpell: TSpell;
begin
  HideInfo;
  mmoBackup.Clear;
  mmoTemp.Clear;
//  if edtNilaiCC.Value <> 0 then //Validasi apabila ada pembayaran pakai CARD
  if CommonDlg.ShowMessage(2, 'Cetak Validasi', 'Transaksi Kartu ' + #13#10 +
                          'Tekan Enter/Yes untuk mencetak validasi Kartu !', mtConfirmation) = mrYes then
  begin
    aSpell := TSpell.Create;

    outFile := TAppUtils.GetAppPath + 'utils\' + FILE_VALIDASI;
    if (FileExists(outFile)) then
       DeleteFile(PChar(outFile));

    mmoIsiCB.Clear;
    mmoIsiCB.Lines.Add('Tanggal / Jam : ' + FormatDateTime('dd/mm/yyyy',Now) + '  ' + FormatDateTime('HH:nn:ss',Now));
    mmoIsiCB.Lines.Add('No.Transaksi  : ' + frmTransaksi.edNoTrnTerakhir.Text);
    mmoIsiCB.Lines.Add('POS / Kasir   : ' + frmMain.FPOSCode + ' / ' + frmMain.FCashierCode + ' ' + frmMain.FCashierName);
    mmoIsiCB.Lines.Add(TAppUtils.StrPadRight('',40,'-'));
    mmoIsiCB.Lines.Add('Kode/Nama Kartu : ' + TAppUtils.StrPadRight(edtJenisKartuCode.Text,4,' ') + ' ' +
                         TAppUtils.StrPadRight(edtJenisKartuName.Text,16,' '));
    mmoIsiCB.Lines.Add('No. Kartu       : ' + TAppUtils.StrPadRight(edtNomorCC.Text,20,' '));
    mmoIsiCB.Lines.Add('No. Otorisasi   : ' + TAppUtils.StrPadRight(edtNoOtorisasiCC.Text,16,' '));
    mmoIsiCB.Lines.Add(TAppUtils.StrPadRight('',40,'-'));

    mmoIsiCB.Lines.SaveToFile(outFile);
    PrintFile(outFile);
    Application.ProcessMessages;

    aSpell.Destroy;
  end;
  //----------------------- end print validasi  ---------------------------

end;

procedure TfrmPayment.ParsingPrintConsValidasi;
var
  i: Integer;
  outFile, sTemp: string;
  iRow: integer;
  aSpell: TSpell;
begin
  HideInfo;
  mmoBackup.Clear;
  mmoTemp.Clear;

  if CommonDlg.ShowMessage(2, 'Cetak Validasi', 'Transaksi Concession ' + #13#10 +
                          'Tekan Enter/Yes untuk mencetak validasi struk !', mtConfirmation) = mrYes then
  begin
    aSpell := TSpell.Create;

    outFile := TAppUtils.GetAppPath + 'utils\' + FILE_VALIDASI;
    if (FileExists(outFile)) then
       DeleteFile(PChar(outFile));

    mmoIsiCB.Clear;
    mmoIsiCB.Lines.Add('Tanggal / Jam : ' + FormatDateTime('dd/mm/yyyy',Now) + '  ' + FormatDateTime('HH:nn:ss',Now));
    mmoIsiCB.Lines.Add('No.Transaksi  : ' + frmTransaksi.edNoTrnTerakhir.Text);
    mmoIsiCB.Lines.Add('POS / Kasir   : ' + frmMain.FPOSCode + ' / ' + frmMain.FCashierCode + ' ' + frmMain.FCashierName);
    mmoIsiCB.Lines.Add(TAppUtils.StrPadRight('',40,'-'));

    mmoIsiCB.Lines.SaveToFile(outFile);
    Application.ProcessMessages;

    aSpell.Destroy;

    mmoIsiCB.Lines.SaveToFile(outFile);

    outFile := TAppUtils.GetAppPath + 'utils\' + FILE_ISI_STRUK;
    if (FileExists(outFile)) then
       DeleteFile(PChar(outFile));

    mmoIsiStruk.Clear;
    iRow := frmTransaksi.sgTransaksi.DataController.RecordCount - 1;
    with frmTransaksi.sgTransaksi.DataController do
    begin
    for i := 0 to iRow do
    begin
      if (Values[i, _KolPLU] <> '') and (Values[i, _KolTipeBarang] = TipeIDConcession)  then //kalo barang jenis JB
      begin
        sTemp := '&';
        mmoIsiStruk.Lines.Add(Values[i, _KolPLU] + sTemp + Values[i, _KolNamaBarang]);
        sTemp := TAppUtils.StrPadLeftCut(FormatFloat('#,##'+Get_Qty_Precision,Values[i, _KolJumlah]),8,' ') + ' '
          + TAppUtils.StrPadRight(Values[i, _KolUOM],5,' ') + 'x'
          + IfThen(Values[i, _KolDisc]>0,
            TAppUtils.StrPadLeftCut(FormatFloat('#,##0',Values[i, _KolHarga]) + '-'+FormatFloat('#,#0',Values[i, _KolDiscP])+'%',12,' '),
            TAppUtils.StrPadLeftCut(FormatFloat('#,##0',Values[i, _KolHarga]-Values[i, _KolDisc]),12,' '))
          + TAppUtils.StrPadLeftCut(FormatFloat('#,##0',Values[i, _KolTotal]),13,' ');
        mmoIsiStruk.Lines.Add(sTemp);
      end;
    end;
    end;

    sTemp := '';
    mmoIsiStruk.Lines.Add(TAppUtils.StrPadRight('',40,'-'));
    mmoIsiStruk.Lines.SaveToFile(outFile);

    mmoBackup.Lines.AddStrings(mmoIsiCB.Lines);
    mmoBackup.Lines.AddStrings(mmoIsiStruk.Lines);
    Application.ProcessMessages;

    mmoBackup.Lines.Add('');

    Application.ProcessMessages;

    outFile := TAppUtils.GetAppPath + 'utils\' + 'POS_VALID.TXT';
    mmoBackup.Lines.SaveToFile(outFile);
    try
      begin
      PrintFile(outFile);
      end;
    except
      //CommonDlg.ShowError('Gagal mencetak struk');
      ShowInfo('Gagal mencetak struk');
    end;
  end;

end;

end.
