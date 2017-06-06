unit uServerDSProvider;

interface
uses
  System.Classes, uModApp, uDBUtils, Rtti, Data.DB, SysUtils,
  StrUtils, uModUnit, System.Generics.Collections, Data.FireDACJSONReflect,
  FireDAC.Stan.Storage, FireDAC.Stan.StorageBin, uServerClasses,
  FireDAC.Comp.Client;

type
  {$METHODINFO ON}
  TDSProvider = class(TComponent)
  private
  public
    function Bank_GetDSOverview: TDataSet;
    function Rekening_GetDSLookup: TDataSet;
    function RefPajak_GetDSOverview: TDataSet;
    function RefTipeBarang_GetDSOverview: TDataSet;
    function GroupRekening_GetDSLookup: TDataSet;
    function Rekening_GetDSOverview: TDataSet;
    function Member_GetDSOverview: TDataSet;
    function MemberActivasi_GetDSOverview: TDataSet;
    function RefDiscMember_GetDSOverview: TDataSet;
    function MemberKeluarga_GetDSOverview: TDataSet;
    function RefGrupMember_GetDSOverview: TDataSet;
    function Satuan_GetDSLookup: TDataSet;
    function CostCenter_GetDSLookup: TDataSet;
    function Company_GetDSLookup: TDataSet;
    function CostCenter_GetDSOverview: TDataSet;
    function Company_GetDSOverview: TDataSet;
    function TipePembayaran_GetDSOverview: TDataSet;
    function TipePerusahaan_GetDSOverview: TDataSet;
    function Outlet_GetDSLookup: TDataSet;
    function Lokasi_GetDSLookup: TDataSet;
    function Merchandise_GetDSLookup: TDataSet;
    function MerchandiseGroup_GetDSLookup: TDataSet;
    function SubGroup_GetDSLookup: TDataSet;
    function Satuan_GetDSOverview: TDataSet;
    function Kategori_GetDSLookup: TDataSet;
    function Merk_GetDSLookUp: TDataSet;
    function RefPajak_GetDSLookup: TDataSet;
    function RefTipeBarang_GetDSLookup: TDataSet;
    function TipeSuplier_GetDSOverview: TDataSet;
    function Unit_GetDSOverview: TDataSet;
    function Unit_GetDSLookUp: TDataSet;
    function UnitType_GetDSLookUp: TDataSet;
    function UnitType_GetDSOverview: TDataSet;
    function App_GetDSLookUp: TDataSet;
    function App_GetDSOverview: TDataSet;
    function Bank_GetDSLookup: TDataSet;
    function Barang_GetDSOverview(aMerchanGroupID: string): TDataSet;
    function Gudang_GetDSOverview: TDataSet;
    function RefTipeMember_GetDSOverview: TDataSet;
    function AutAPP_GetDSLookup: TDataSet;
    function TipeKirimPO_GetDSOverview: TDataSet;
    function SuplierGroup_GetDSOverview1: TDataSet;
    function SuplierGroup_GetDSLookup: TDataSet;
    function Suplier_GetDSOverview: TDataSet;
    function TipePerusahaan_GetDSLookup: TDataSet;
    function TipeSuplier_GetDSLookup: TDataSet;
    function Propinsi_GetDSLookUp: TDataSet;
    function Kabupaten_GetDSLookUp: TDataSet;
    function MataUang_GetDSOverview: TDataSet;
    function Agama_GetDSLookup: TDataSet;
    function TipeBonus_GetDSOverview: TDataSet;
    function Document_GetDSOverview: TDataSet;
    function Agama_GetDSOverview: TDataSet;
    function AutUnit_GetDSLookup: TDataSet;
    function BarangSupp_GetDSLookup(aMerchandise: String): TDataSet;
    function BarangSupp_GetDSLookup2(aMerchandise: String): TFDJSONDataSets;
    function Barang_ByPOLookUp(APONO : String): TDataset;
    function GET_MEMBER_PAS_NO(ATPMEMBER: String): String;
    function Merchandise_GetDSOverview: TDataSet;
    function PO_GetDSOverview(ATglAwal , ATglAkhir : TDateTime;
        AkodeSupplierMGAwal, AKodeSupplierMGAkhir : String; AStatusPOID : String;
        AUnit : TModUnit = nil): TDataset;
    function SupMGByOutstandingSO_GetDSLookup(ID: string): TDataset;
    function PO_GetDSOverviewDetil(ATglAwal , ATglAkhir : TDateTime; AUnit :
        TModUnit = nil): TDataset;
    function StatusPO_GetDSLookup: TDataSet;
    function TipeHarga_GetDSLookup: TDataSet;
    function RefWilayah_GetDSLookup: TDataSet;
    function Suplier_GetDSLookup: TDataSet;
    function RefTipeMember_GetDSLookup: TDataSet;
    function TipePO_GetDSOverview: TDataSet;
    function TipeCN_GetDSOverview: TDataSet;
    function SO_GetDSOverview(ATglAwal , ATglAkhir : TDateTime; AUnit : TModUnit =
        nil): TDataSet;
    function SO_GetDSOLookUp(AUnit : TModUnit = nil): TDataSet;
    function SubGroup_GetDSOverview: TDataSet;
    function SuplierMerchan_GetDSLookup: TDataSet;
    function DO_GetDSLookUp: TDataSet;
    function DO_GetDSOverview(ATglAwal , ATglAkhir : TDateTime;AUnitID,
        ASupMGCodeID : String): TDataSet;
    function Kompetitor_GetDSOverview: TDataSet;
    function PO_GetDSOLookUp(AUnitID : String): TDataset;
    function SO_GetDSOLookUpGeneratePO(AUnit : TModUnit = nil): TDataSet;
    function PORevisi_GetDSOverview(ID: string): TDataset;
    function PO_GetDSOLookUpForGR(AUnitID : String): TDataset;
    function PO_SLIP_GetDSOverview(ATglAwal , ATglAkhir : TDateTime; AUnit :
        TModUnit = nil): TDataSet;
    function RefCreditCard_GetDSOverview: TDataSet;


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

function TDSProvider.Bank_GetDSOverview: TDataSet;
var
  S: string;
begin
  S := 'SELECT * FROM V_BANK';

  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.Rekening_GetDSLookup: TDataSet;
var
  S: string;
begin
  S := 'select REKENING_ID, REK_CODE, REK_NAME, REK_DESCRIPTION, REF$GRUP_REKENING_ID from REKENING';
  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.RefPajak_GetDSOverview: TDataSet;
var
  S: string;
begin
  S := 'SELECT * from REF$PAJAK';
  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.RefTipeBarang_GetDSOverview: TDataSet;
var
  S: string;
begin
  S := 'SELECT TPBRG_CODE, TPBRG_NAME, REF$TIPE_BARANG_ID from REF$TIPE_BARANG';
  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.GroupRekening_GetDSLookup: TDataSet;
var
  S: string;
begin
  S := 'select REF$GRUP_REKENING_ID, GROREK_NAME, GROREK_DESCRIPTION from REF$GRUP_REKENING';
  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.Rekening_GetDSOverview: TDataSet;
var
  S: string;
begin
  S := 'select REKENING_ID, (REK_CODE + '' - ''+ REK_NAME) as REKENING, REK_CODE, REK_NAME, REK_DESCRIPTION, REKENING_PARENT_ID, REF$GRUP_REKENING_ID from REKENING';
  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.Member_GetDSOverview: TDataSet;
var
  S: string;
begin
  S := 'select A.MEMBER_ID, A.MEMBER_CARD_NO AS NOMOR_KARTU, A.MEMBER_POIN, A.MEMBER_KTP_NO AS NO_IDENTITAS, A.MEMBER_NAME AS NAMA, '
    +' A.MEMBER_ADDRESS+'', ''+A.MEMBER_KELURAHAN+'', ''+A.MEMBER_KECAMATAN AS ALAMAT, A.MEMBER_KOTA AS KOTA,'
    +' A.MEMBER_POST_CODE AS POST_CODE, A.MEMBER_TELP, '
    +' A.MEMBER_PLACE_OF_BIRTH AS TEMPAT_LAHIR, A.MEMBER_DATE_OF_BIRTH AS TANGGAL_LAHIR,'
    +' B.AGAMA_NAME AS AGAMA,'
    +' CASE WHEN A.MEMBER_SEX = 0 THEN ''L'' ELSE ''P'' END AS JK, '
    +' CASE WHEN A.IS_TRADER = 0 THEN ''END USER'' ELSE ''TRADER'' END AS KELOMPOK,'
    +' F.TPMEMBER_NAME AS TIPE_MEMBER, '
    +' CASE WHEN F.IS_POIN = 0 THEN ''TIDAK DAPAT'' ELSE ''DAPAT'' END AS POIN,'
    +' CASE WHEN F.IS_UNDIAN = 0 THEN ''TIDAK DAPAT'' ELSE ''DAPAT'' END AS UNDIAN,'
    +' A.REF$GRUP_MEMBER_ID, A.REF$DISC_MEMBER_ID, A.MEMBER_ACTIVASI_ID, A.MEMBER_KELUARGA_ID'
    +' FROM MEMBER A'
    +' LEFT JOIN REF$TIPE_MEMBER F ON A.REF$TIPE_MEMBER_ID = F.REF$TIPE_MEMBER_ID'
    +' LEFT JOIN REF$AGAMA B ON A.REF$AGAMA_id = B.REF$AGAMA_ID';
  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.MemberActivasi_GetDSOverview: TDataSet;
var
  S: string;
begin
  S := 'select * from MEMBER_ACTIVASI';
  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.RefDiscMember_GetDSOverview: TDataSet;
var
  S: string;
begin
  S := 'select * from REF$DISC_MEMBER';
  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.MemberKeluarga_GetDSOverview: TDataSet;
var
  S: string;
begin
  S := 'select * from MEMBER_KELUARGA';
  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.RefGrupMember_GetDSOverview: TDataSet;
var
  S: string;
begin
  S := 'select * from REF$GRUP_MEMBER';
  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.Satuan_GetDSLookup: TDataSet;
var
  S: string;
begin
  S := 'select sat_name, sat_code, sat_group, ref$satuan_id' +
       ' from ref$satuan' +
       ' ORDER by sat_code';

  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.CostCenter_GetDSLookup: TDataSet;
var
  S: string;
begin
  S := 'select COCTER_CODE, COCTER_NAME, COST_CENTER_ID from COST_CENTER';

  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.Company_GetDSLookup: TDataSet;
var
  S: string;
begin
  S := 'select COMP_CODE, COMP_NAME, COMPANY_ID from COMPANY';

  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.Satuan_GetDSOverview: TDataSet;
var
  S: string;
begin
  S := 'select sat_code, sat_name,sat_group, ref$satuan_id' +
       ' from ref$satuan' +
       ' ORDER by sat_code';

  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.CostCenter_GetDSOverview: TDataSet;
var
  S: string;
begin
  S := 'select COCTER_CODE, COCTER_NAME, COST_CENTER_ID from COST_CENTER';

  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.Company_GetDSOverview: TDataSet;
var
  S: string;
begin
  S := 'select COMP_CODE, COMP_NAME, COMPANY_ID from COMPANY';
  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.TipePembayaran_GetDSOverview: TDataSet;
var
  S: string;
begin
  S := 'select REF$TIPE_PEMBAYARAN_ID, TPBYR_CODE, TPBYR_NAME from REF$TIPE_PEMBAYARAN';
  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.TipePerusahaan_GetDSOverview: TDataSet;
var
  S: string;
begin
  S := 'select TPPERSH_CODE, TPPERSH_NAME, REF$TIPE_PERUSAHAAN_ID'
        +' from REF$TIPE_PERUSAHAAN';
  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.Outlet_GetDSLookup: TDataSet;
var
  S: string;
begin
  S := 'select OUTLET_NAME, OUTLET_CODE, OUTLET_DESCRIPTION, REF$OUTLET_ID'
      +' from REF$OUTLET';
  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.Lokasi_GetDSLookup: TDataSet;
var
  S: string;
begin
  S := 'select REF$LOKASI_ID, LOK_NAME, LOK_CODE, LOK_DESCRIPTION,'
      +' LOK_RACK, LOK_BAY, LOK_SHELVE, LOK_POSITION, LOK_TYPE'
      +' from REF$LOKASI ORDER BY LOK_CODE';
  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.Merchandise_GetDSLookup: TDataSet;
var
  S: string;
begin
  S := 'select MERCHAN_NAME, MERCHAN_CODE, REF$MERCHANDISE_ID'
      +' FROM REF$MERCHANDISE ORDER BY MERCHAN_CODE';
  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.MerchandiseGroup_GetDSLookup: TDataSet;
var
  S: string;
begin
   S := 'select A.REF$MERCHANDISE_ID, A.REF$MERCHANDISE_GRUP_ID,'
      +' A.MERCHANGRUP_CODE, A.MERCHANGRUP_NAME, B.MERCHAN_NAME'
      +' from REF$MERCHANDISE_GRUP A'
      +' INNER JOIN REF$MERCHANDISE B ON A.REF$MERCHANDISE_ID = B.REF$MERCHANDISE_ID';

  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.SubGroup_GetDSLookup: TDataSet;
var
  S: string;
begin
  S := 'SELECT A.SUBGRUP_NAME, A.SUBGRUP_CODE, B.MERCHANGRUP_NAME,'
      +' A.REF$SUB_GRUP_ID , A.REF$MERCHANDISE_GRUP_ID'
      +' FROM REF$SUB_GRUP A'
      +' INNER JOIN REF$MERCHANDISE_GRUP B'
      +' ON A.REF$MERCHANDISE_GRUP_ID = B.REF$MERCHANDISE_GRUP_ID';

  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.Kategori_GetDSLookup: TDataSet;
var
  S: string;
begin
  S := 'Select A.KAT_NAME, A.KAT_CODE, B.SUBGRUP_NAME, A.REF$KATEGORI_ID, A.REF$SUB_GRUP_ID'
      +' from REF$KATEGORI A'
      +' INNER JOIN REF$SUB_GRUP B ON A.REF$SUB_GRUP_ID=B.REF$SUB_GRUP_ID'
      +' ORDER BY KAT_CODE';
  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.Merk_GetDSLookUp: TDataSet;
var
  S: string;
begin
  S := 'select Merk_Name,Merk_Description, Merk_ID from Merk';
//  if Test <> nil then
//    Test.fields[0].AsString;
  Result := TDBUtils.OpenQuery(S);
//  Test := Result;
end;

function TDSProvider.RefPajak_GetDSLookup: TDataSet;
var
  S: string;
begin
  S := 'Select PJK_NAME, PJK_CODE, Ref$Pajak_ID FROM REF$PAJAK';
  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.RefTipeBarang_GetDSLookup: TDataSet;
var
  S: string;
begin
  S := 'Select TPBRG_NAME, TPBRG_CODE, REF$TIPE_BARANG_ID FROM REF$TIPE_BARANG';
  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.TipeSuplier_GetDSOverview: TDataSet;
var
  S: string;
begin
  S := 'select TPSUP_CODE, TPSUP_NAME, REF$TIPE_SUPLIER_ID from REF$TIPE_SUPLIER';
  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.Unit_GetDSOverview: TDataSet;
var
  S: string;
begin
  S := 'SELECT * FROM V_AUT$UNIT';
  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.Unit_GetDSLookUp: TDataSet;
var
  S: string;
begin
  S := 'SELECT UNT_NAME, UNT_CODE, AUT$UNIT_ID FROM AUT$UNIT';
  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.UnitType_GetDSLookUp: TDataSet;
var
  S: string;
begin
  S := 'SELECT TYPE_NAME, TYPE_DESC, UNIT_TYPE_ID from UNIT_TYPE';
  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.UnitType_GetDSOverview: TDataSet;
var
  S: string;
begin
  S := 'SELECT TYPE_NAME, TYPE_DESC, UNIT_TYPE_ID from UNIT_TYPE';
  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.App_GetDSLookUp: TDataSet;
var
  S: string;
begin
  S := 'select APP_CODE, APP_NAME, APP_DESCRIPTION,AUT$APP_ID from AUT$APP';
  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.App_GetDSOverview: TDataSet;
var
  S: string;
begin
  S := 'select APP_CODE, APP_NAME, APP_DESCRIPTION,AUT$APP_ID from AUT$APP';
  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.Bank_GetDSLookup: TDataSet;
var
  S: string;
begin
  S := 'SELECT Bank_ID, BANK_CODE, BANK_NAME, BANK_BRANCH, BANK_ADDRESS,'
      +' BANK_REK_CODE'
      +' FROM BANK';

  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.Barang_GetDSOverview(aMerchanGroupID: string): TDataSet;
var
  S: string;
begin
  S := 'SELECT A.BARANG_ID,'
      +' A.BRG_CODE, A.BRG_CATALOG,'
      +' I.MERK_NAME, A.BRG_NAME, B.MERCHAN_NAME, C.MERCHANGRUP_NAME,'
      +' E.SUBGRUP_NAME, D.KAT_NAME, F.TPBRG_NAME, G.SAT_NAME, H.OUTLET_NAME'
      +' FROM BARANG A'
      +' INNER JOIN REF$MERCHANDISE B ON A.REF$MERCHANDISE_ID = B.REF$MERCHANDISE_ID'
      +' INNER JOIN REF$MERCHANDISE_GRUP C ON C.REF$MERCHANDISE_GRUP_ID = A.REF$MERCHANDISE_GRUP_ID'
      +' LEFT JOIN REF$KATEGORI D ON D.REF$KATEGORI_ID=A.REF$KATEGORI_ID'
      +' LEFT JOIN REF$SUB_GRUP E ON E.REF$SUB_GRUP_ID=D.REF$SUB_GRUP_ID'
      +' LEFT JOIN REF$TIPE_BARANG F ON A.REF$TIPE_BARANG_ID=F.REF$TIPE_BARANG_ID '
      +' LEFT JOIN REF$SATUAN G ON G.REF$SATUAN_ID = A.REF$SATUAN_STOCK'
      +' LEFT JOIN REF$OUTLET H ON H.REF$OUTLET_ID = A.REF$OUTLET_ID'
      +' INNER JOIN MERK I ON I.MERK_ID = A.MERK_ID';

  if aMerchanGroupID <> '' then
    S := S + ' WHERE A.REF$MERCHANDISE_GRUP_ID = ' + QuotedStr(aMerchanGroupID);

  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.Gudang_GetDSOverview: TDataSet;
var
  S: string;
begin
  S:= 'select GUDANG_ID, GUD_CODE as KODE, GUD_NAME as NAMA, GUD_ADDRESS as ALAMAT, GUD_TELP as TELEPON,'
      + ' GUD_FAX as FAX, GUD_CITY as KOTA, GUD_POST_CODE as [KODE POS], GUD_CONTACT_PERSON as KONTAK'
      + ' from GUDANG'  ;
  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.RefTipeMember_GetDSOverview: TDataSet;
var
  S: string;
begin
  S := 'SELECT * from REF$TIPE_MEMBER';
  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.AutAPP_GetDSLookup: TDataSet;
var
  S: string;
begin
  S := 'select APP_CODE, APP_NAME, APP_DESCRIPTION, AUT$APP_ID from aut$APP';

  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.TipeKirimPO_GetDSOverview: TDataSet;
var
  S: string;
begin
  S := 'select TPKRMPO_CODE, TPKRMPO_NAME, REF$TIPE_KIRIM_PO_ID'
      +' from REF$TIPE_KIRIM_PO';

  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.SuplierGroup_GetDSOverview1: TDataSet;
var
  S: string;
begin
  S := 'select GROUP_CODE,GROUP_NAME, GROUP_DESCRIPTION, SUPLIER_GROUP_ID'
  +' from SUPLIER_GROUP';
  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.SuplierGroup_GetDSLookup: TDataSet;
var
  S: string;
begin
  S := 'select GROUP_CODE, GROUP_NAME, GROUP_DESCRIPTION, SUPLIER_GROUP_ID'
  +' from SUPLIER_GROUP';
  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.Suplier_GetDSOverview: TDataSet;
var
  S: string;
begin
  S := 'select SUPLIER_ID, SUP_CODE, SUP_NAME, SUP_CITY, SUP_TELP, SUP_FAX'
  +' from'
  +' SUPLIER';
  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.TipePerusahaan_GetDSLookup: TDataSet;
var
  S: string;
begin
  S := 'select TPPERSH_CODE, TPPERSH_NAME, REF$TIPE_PERUSAHAAN_ID'
        +' from REF$TIPE_PERUSAHAAN';
  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.TipeSuplier_GetDSLookup: TDataSet;
var
  S: string;
begin
  S := 'select TPSUP_CODE, TPSUP_NAME, REF$TIPE_SUPLIER_ID from REF$TIPE_SUPLIER';
  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.Propinsi_GetDSLookUp: TDataSet;
var
  S: string;
begin
  S := 'select PROP_NAME as NAME, PROPINSI_ID from PROPINSI';
  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.Kabupaten_GetDSLookUp: TDataSet;
var
  S: string;
begin
  S := 'select KAB_NAME as NAME,PROPINSI_ID, KABUPATEN_ID from KABUPATEN';
  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.MataUang_GetDSOverview: TDataSet;
var
  S: string;
begin
  S := 'select REF$MATAUANG_ID, UANG_CODE, UANG_SYMBOL, UANG_NAME, UANG_SCALE'
  +' from'
  +' REF$MATAUANG';
  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.Agama_GetDSLookup: TDataSet;
var
  S: string;
begin
  S := 'select REF$AGAMA_ID, AGAMA_NAME from REF$AGAMA';
  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.TipeBonus_GetDSOverview: TDataSet;
var
  S: string;
begin
  S := 'select REF$TIPE_BONUS_ID, TPBNS_CODE, TPBNS_NAME'
  +' from'
  +' REF$TIPE_BONUS';
  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.Document_GetDSOverview: TDataSet;
var
  S: string;
begin
  S := 'select DOC_NAME, REF$DOCUMENT_ID'
  +' from'
  +' REF$DOCUMENT';
  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.Agama_GetDSOverview: TDataSet;
var
  S: string;
begin
  S := 'select AGAMA_NAME, REF$AGAMA_ID'
  +' from'
  +' REF$AGAMA';
  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.AutUnit_GetDSLookup: TDataSet;
var
  S: string;
begin
  S := 'select AUT$UNIT_ID, UNT_NAME from AUT$UNIT';

  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.BarangSupp_GetDSLookup(aMerchandise: String): TDataSet;
var
  S: string;
begin
  S := 'SELECT  * FROM V_BARANGSUP_LOOKUP'
      +' where REF$MERCHANDISE_ID = ' + QuotedStr(aMerchandise);

  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.BarangSupp_GetDSLookup2(aMerchandise: String):
    TFDJSONDataSets;
var
  S: string;
begin
  Result := TFDJSONDataSets.Create;

  S := 'SELECT  * FROM V_BARANGSUP_LOOKUP'
      +' where REF$MERCHANDISE_ID = ' + QuotedStr(aMerchandise);

  TFDJSONDataSetsWriter.ListAdd(Result, TDBUtils.OpenMemTable(S));
end;

function TDSProvider.Barang_ByPOLookUp(APONO : String): TDataset;
var
  sSQL: string;
begin
  sSQL := 'select c.BARANG_ID, c.BRG_CODE, c.BRG_NAME from po a' +
          ' INNER JOIN PO_DETAIL b on a.PO_ID = b.PO_ID' +
          ' inner JOIN BARANG c on b.BARANG_ID = c.BARANG_ID' +
          ' where a.PO_NO = ' + QuotedStr(APONO);

  Result := TDBUtils.OpenDataset(sSQL);
end;

function TDSProvider.GET_MEMBER_PAS_NO(ATPMEMBER: String): String;
var
  S: String;
begin
  S := 'SELECT DBO.FN_NOMEMBER (' + quotedSTR( ATPMEMBER ) + ')';
  Result := '';
  with TDBUtils.OpenQuery(S) DO
    Begin
      try
        Result := Fields[0].AsString;
      finally
        free;
      end;
    End;
end;

function TDSProvider.Merchandise_GetDSOverview: TDataSet;
var
  S: string;
begin
  S := 'select MERCHAN_CODE, MERCHAN_NAME, REF$MERCHANDISE_ID'
      +' FROM REF$MERCHANDISE ORDER BY MERCHAN_CODE';
  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.TipeHarga_GetDSLookup: TDataSet;
var
  S: string;
begin
  S := 'select REF$TIPE_HARGA_ID, TPHRG_NAME ,TPHRG_MARKUP, TPHRG_IS_CALC from Ref$Tipe_harga';
  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.Suplier_GetDSLookup: TDataSet;
var
  S: string;
begin
  S := 'SELECT SUPLIER_ID, SUP_NAME, SUP_CODE, SUP_ADDRESS FROM SUPLIER'
      +' WHERE SUP_IS_ACTIVE=1';
  Result := TDBUtils.OpenQuery(S);
end;


function TDSProvider.RefWilayah_GetDSLookup: TDataSet;
var
  S: string;
begin
  S := 'Select * FROM REF$WILAYAH';
  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.RefTipeMember_GetDSLookup: TDataSet;
var
  S: string;
begin
  S := 'SELECT REF$TIPE_MEMBER_ID, TPMEMBER_NAME from REF$TIPE_MEMBER';
  Result := TDBUtils.OpenQuery(S);
end;


function TDSProvider.TipePO_GetDSOverview: TDataSet;
var
  S: string;
begin
  S := 'select TPPO_CODE, TPPO_NAME, REF$TIPE_PO_ID'
  +' from'
  +' REF$TIPE_PO';
  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.TipeCN_GetDSOverview: TDataSet;
var
  S: string;
begin
  S := 'select REF$TIPE_CN_ID, TPCN_CODE, TPCN_NAME'
  +' from'
  +' REF$TIPE_CN';
  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.SO_GetDSOverview(ATglAwal , ATglAkhir : TDateTime; AUnit :
    TModUnit = nil): TDataSet;
var
  sSQL: string;
begin
  sSQL := 'select * from V_SO ' +
          ' where SO_DATE between ' + TDBUtils.QuotDt(StartOfTheDay(ATglAwal)) +
          ' and ' + TDBUtils.QuotDt(EndOfTheDay(ATglAkhir));

  if AUnit <> nil then
    sSQL := sSQL + ' and AUT$UNIT_ID = ' + QuotedStr(AUnit.ID);


  Result := TDBUtils.OpenQuery(sSQL);
end;

function TDSProvider.PO_GetDSOverview(ATglAwal , ATglAkhir : TDateTime;
    AkodeSupplierMGAwal, AKodeSupplierMGAkhir : String; AStatusPOID : String;
    AUnit : TModUnit = nil): TDataset;
var
  sSQL: string;
begin
  sSQL := 'SELECT * from V_PO ' +
          ' WHERE PO_DATE BETWEEN ' + TDBUtils.QuotDt(StartOfTheDay(ATglAwal)) +
          ' AND ' + TDBUtils.QuotDt(EndOfTheDay(ATglAkhir));

  if AUnit <> nil then
    sSQL := sSQL + ' and AUT$UNIT_ID = ' + QuotedStr(AUnit.ID);

  if (Trim(AkodeSupplierMGAwal) <> 'xyz') and (Trim(AkodeSupplierMGAkhir) <> 'xyz') then
    sSQL := sSQL + ' and KODE_SUPPLIER_MERCHANDISE_GROUP BETWEEN ' + QuotedStr(AkodeSupplierMGAwal)
            + ' AND ' + QuotedStr(AKodeSupplierMGAkhir);

  if (Trim(AStatusPOID) <> 'xyz') then
    sSQL := sSQL + ' AND REF$STATUS_PO_ID = ' + QuotedStr(AStatusPOID);

  Result := TDBUtils.OpenQuery(sSQL);
end;

function TDSProvider.SupMGByOutstandingSO_GetDSLookup(ID: string): TDataset;
var
  sSQL: string;
begin
  sSQL := 'SELECT DISTINCT SO_ID,SUPLIER_MERCHAN_GRUP_ID,SUPMG_SUB_CODE,SUPMG_NAME'
         +' FROM V_SO_FOR_GENERATE_PO WHERE SO_ID = ' + TDBUtils.Quot(ID);
  Result := TDBUtils.OpenQuery(sSQL);
end;

function TDSProvider.PO_GetDSOverviewDetil(ATglAwal , ATglAkhir : TDateTime;
    AUnit : TModUnit = nil): TDataset;
var
  sSQL: string;
begin
  sSQL := 'select * from V_PO_DETIL ' +
          ' where PO_DATE between ' + TDBUtils.QuotDt(StartOfTheDay(ATglAwal)) +
          ' and ' + TDBUtils.QuotDt(EndOfTheDay(ATglAkhir));

  if AUnit <> nil then
    sSQL := sSQL + ' and AUT$UNIT_ID = ' + QuotedStr(AUnit.ID);

  sSQL := sSQL + ' ORDER BY PO_ID';

  Result := TDBUtils.OpenQuery(sSQL);
end;

function TDSProvider.SO_GetDSOLookUp(AUnit : TModUnit = nil): TDataSet;
var
  sSQL: string;
begin
  sSQL := 'select distinct SO_ID,SO_NO, SO_DATE from SO where 1 = 1 ' ;

  if AUnit <> nil then
    sSQL := sSQL + ' and AUT$UNIT_ID = ' + QuotedStr(AUnit.ID);


  sSQL := sSQL + ' order by SO_NO';
  Result := TDBUtils.OpenQuery(sSQL);
end;

function TDSProvider.StatusPO_GetDSLookup: TDataSet;
var
  S: string;
begin
  S := 'select ref$status_po_id, STAPO_NAME, STAPO_CODE' +
       ' from V_STATUSPO ' +
       ' ORDER BY URUTAN ';

  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.SubGroup_GetDSOverview: TDataSet;
var
  S: string;
begin
  S := 'SELECT A.SUBGRUP_CODE, A.SUBGRUP_NAME, B.MERCHANGRUP_NAME,'
      +' A.REF$SUB_GRUP_ID , A.REF$MERCHANDISE_GRUP_ID'
      +' FROM REF$SUB_GRUP A'
      +' INNER JOIN REF$MERCHANDISE_GRUP B'
      +' ON A.REF$MERCHANDISE_GRUP_ID = B.REF$MERCHANDISE_GRUP_ID';

  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.SuplierMerchan_GetDSLookup: TDataSet;
var
  S: string;
begin
  S := 'select * from V_SUPPLIER_MERCHANDISE_GROUP ORDER BY SUPMG_SUB_CODE';
  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.DO_GetDSLookUp: TDataSet;
var
  S: string;
begin
  S := 'SELECT * FROM V_DO';
  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.DO_GetDSOverview(ATglAwal , ATglAkhir : TDateTime;AUnitID,
    ASupMGCodeID : String): TDataSet;
var
  sSQL: string;
begin
  sSQL := 'SELECT * FROM V_DO' +
       ' where DO_DATE BETWEEN ' + TDBUtils.QuotDt(StartOfTheDay(ATglAwal)) +
       ' and ' + TDBUtils.QuotDt(EndOfTheDay(ATglAkhir));

  if AUnitID <> '' then
    sSQL := sSQL + ' and AUT$UNIT_ID = ' + QuotedStr(AUnitID);

  if ASupMGCodeID <> '' then
    sSQL := sSQL + ' and SUPLIER_MERCHAN_GRUP_ID = ' + QuotedStr(ASupMGCodeID);

  Result := TDBUtils.OpenQuery(sSQL);
end;

function TDSProvider.Kompetitor_GetDSOverview: TDataSet;
var
  sSQL: string;
begin
  sSQL   := 'SELECT * FROM V_KOMPETITOR';
  Result := TDBUtils.OpenQuery(sSQL);
end;

function TDSProvider.PO_GetDSOLookUp(AUnitID : String): TDataset;
var
  sSQL: string;
begin
  sSQL := 'select * from V_PO ' +
          ' where 1 = 1';

  if AUnitID <> '' then
    sSQL := sSQL + ' and AUT$UNIT_ID = ' + QuotedStr(AUnitID);

  sSQL :=sSQL + ' order by PO_NO';

  
  Result := TDBUtils.OpenQuery(sSQL);
end;

function TDSProvider.SO_GetDSOLookUpGeneratePO(AUnit : TModUnit = nil):
    TDataSet;
var
  sSQL: string;
begin
  sSQL := 'select distinct SO_ID,SO_NO, SO_DATE from V_SO_FOR_GENERATE_PO where 1 = 1 ' ;

  if AUnit <> nil then
    sSQL := sSQL + ' and AUT$UNIT_ID = ' + QuotedStr(AUnit.ID);


  sSQL := sSQL + ' order by SO_NO';
  Result := TDBUtils.OpenQuery(sSQL);
end;

function TDSProvider.PORevisi_GetDSOverview(ID: string): TDataset;
var
  sSQL: string;
begin
  sSQL := 'select* from PO_DETAIL where PO_ID = ' + TDBUtils.Quot(ID);
  Result := TDBUtils.OpenQuery(sSQL);
end;

function TDSProvider.PO_GetDSOLookUpForGR(AUnitID : String): TDataset;
var
  sSQL: string;
begin
  sSQL := 'select * from V_PO_FOR_GR ' +
          ' where 1 = 1';

  if AUnitID <> '' then
    sSQL := sSQL + ' and AUT$UNIT_ID = ' + QuotedStr(AUnitID);

  sSQL := sSQL + ' order by PO_NO';


  Result := TDBUtils.OpenQuery(sSQL);
end;

function TDSProvider.PO_SLIP_GetDSOverview(ATglAwal , ATglAkhir : TDateTime;
    AUnit : TModUnit = nil): TDataSet;
var
  sSQL: string;
begin
  sSQL := 'select * from V_PO_SLIP ' +
          ' where PO_DATE between ' + TDBUtils.QuotDt(StartOfTheDay(ATglAwal)) +
          ' and ' + TDBUtils.QuotDt(EndOfTheDay(ATglAkhir));

  if AUnit <> nil then
    sSQL := sSQL + ' and AUT$UNIT_ID = ' + QuotedStr(AUnit.ID);


  Result := TDBUtils.OpenQuery(sSQL);
end;

function TDSProvider.RefCreditCard_GetDSOverview: TDataSet;
var
  sSQL: string;
begin
  sSQL   := 'SELECT * FROM V_CREDIT$CARD';
  Result := TDBUtils.OpenQuery(sSQL);
end;

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
