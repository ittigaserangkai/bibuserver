unit ufrmMaster;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Vcl.StdCtrls, Vcl.ExtCtrls, uCompany, uFormProperty, ufrmMasterDialog,
  ActnList;

type

  TfrmMaster = class(TForm)
    pnlBody: TPanel;
    pnlHeader: TPanel;
    lblHeader: TLabel;
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    //procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FMasterCompany: TCompany;
    FMasterNewUnit: integer;//TUnit;
    TList: TStrings;
    function GetMasterCompany: TCompany;
    function GetMasterNewUnit: integer;//TUnit;
    procedure GetUserModule;
  protected
  public
    FLoginFullname  : string;
    FLoginRole      : string;
    FLoginUsername  : string;
    FLoginId        : Integer;
    FLoginUnitId    : Integer;
    FMasterIsStore  : Integer;
    FMasterIsHO     : Integer;
    FFilePathReport : String;
    FHostClient     : string;
    FIpClient       : string;
    FLoginIsStore   : Integer;
    FTipeApp        : TTipeApp;

    property MasterCompany: TCompany read GetMasterCompany write FMasterCompany;
    property MasterNewUnit: integer{TUnit} read GetMasterNewUnit write FMasterNewUnit;

    constructor Create(AOwner: TComponent); override;
    constructor CreateWithUser(aOwner: TComponent; aFormProperty : TFormProperty);
        overload;
    procedure Authenticate;            
    function SetFormPropertyAndShowDialog(aFrmMasterDialog : TFrmMasterDialog;
        aIsModal: Boolean = True): Boolean;
  end;

var
  frmMaster: TfrmMaster;

implementation

uses uTSCommonDlg;

{$R *.dfm}

constructor TfrmMaster.Create(AOwner: TComponent);
begin
  KeyPreview        := true;
  TList             := TStringList.Create;
  with FormatSettings do
  begin
    CurrencyString    := 'Rp. ';
    CurrencyFormat    := 2;
    CurrencyDecimals  := 2;
    DecimalSeparator  := '.';
    ThousandSeparator := ',';
  end;

  inherited Create(AOwner);
end;

constructor TfrmMaster.CreateWithUser(aOwner: TComponent; aFormProperty :
    TFormProperty);
begin
//  MasterCompany    := TCompany.Create(Self);
//  MasterNewUnit    := 0;//TUnit.Create(Self);
//
//  FMasterIsStore   := aFormProperty.FMasterIsStore;
//  FMasterIsHO      := aFormProperty.FMasterIsHo;
//  FLoginFullname   := aFormProperty.FLoginFullname;
//  FLoginRole       := aFormProperty.FLoginRole;
//  FLoginUsername   := aFormProperty.FLoginUsername;
//  FLoginId         := aFormProperty.FLoginId;
//  FLoginUnitId     := aFormProperty.FLoginUnitId;
//  FLoginIsStore    := aFormProperty.FLoginIsStore;
//  FTipeApp         := aFormProperty.FTipeApp;
//
//  FFilePathReport  := aFormProperty.FFilePathReport;
//  FHostClient      := aFormProperty.FHostClient;
//  FIpClient        := aFormProperty.FIpClient;

//  if MasterCompany.LoadByID(aFormProperty.FSelfCompanyID) then
//  begin
////    if not MasterNewUnit.LoadByID(aFormProperty.FSelfUnitID) then
//    begin
//      CommonDlg.ShowError('Unit Belum Dipilih');
//      //Self := nil;
//      Exit;
//    end;
//  end else begin
//    CommonDlg.ShowError('Company Belum Dipilih');
//    //Self := nil;
//    Exit;
//  end;

  Create(aOwner);
end;

//constructor TfrmMaster.CreateWithUser(aOwner: TComponent; afrmMaster :
//    TfrmMaster);
//begin
//  MasterCompany    := TCompany.Create(Self);
//  MasterNewUnit    := TUnit.Create(Self);
//
//  FMasterIsStore   := afrmMaster.FMasterIsStore;
//  FLoginFullname   := afrmMaster.FLoginFullname;
//  FLoginRole       := afrmMaster.FLoginRole;
//  FLoginUsername   := afrmMaster.FLoginUsername;
//  FLoginId         := afrmMaster.FLoginId;
//  FLoginUnitId     := afrmMaster.FLoginUnitId;
//  FLoginIsStore    := afrmMaster.FLoginIsStore;
//
//  FFilePathReport  := afrmMaster.FFilePathReport;
//  FHostClient      := afrmMaster.FHostClient;
//  FIpClient        := afrmMaster.FIpClient;
//
//  if MasterCompany.LoadByID(afrmMaster.MasterCompany.ID) then
//  begin
//    if not MasterNewUnit.LoadByID(afrmMaster.MasterNewUnit.ID) then
//    begin
//      CommonDlg.ShowError('Unit Belum Dipilih');
//      //Self := nil;
//      Exit;
//    end;
//  end
//  else
//  begin
//    CommonDlg.ShowError('Company Belum Dipilih');
//    //Self := nil;
//    Exit;
//  end;
//
//  Create(aOwner);
//end;

procedure TfrmMaster.FormDestroy(Sender: TObject);
begin
  FreeAndNil(TList);
  FreeAndNil(frmMaster); // := nil;
end;

procedure TfrmMaster.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmMaster.Authenticate;
var
  i: word;
  idx: integer;
begin
  GetUserModule;
  for i := 0 to ComponentCount-1 do
    if Components[i] is TAction then begin
      idx := TList.IndexOf(LowerCase(Components[i].Name));
      if idx <> -1 then
        (Components[i] as TAction).Enabled := true
      else
        (Components[i] as TAction).Enabled := false;
    end;
end;

function TfrmMaster.SetFormPropertyAndShowDialog(aFrmMasterDialog :
    TFrmMasterDialog; aIsModal: Boolean = True): Boolean;
begin
  Result := False;
  if Assigned(aFrmMasterDialog) then
  begin
    aFrmMasterDialog.FMasterIsStore   := FMasterIsStore;
    aFrmMasterDialog.FLoginFullname   := FLoginFullname;
    aFrmMasterDialog.FLoginRole       := FLoginRole;
    aFrmMasterDialog.FLoginUsername   := FLoginUsername;
    aFrmMasterDialog.FLoginId         := FLoginId;
    aFrmMasterDialog.FLoginUnitId     := FLoginUnitId;
    aFrmMasterDialog.FLoginIsStore    := FLoginIsStore;
    aFrmMasterDialog.FFilePathReport  := FFilePathReport;

//    aFrmMasterDialog.DialogCompany    :=  MasterCompany.ID;
    aFrmMasterDialog.DialogUnit := 0;//MasterNewUnit.ID;

    aFrmMasterDialog.FDialogUnitCOde  := '';//MasterNewUnit.Kode;
    aFrmMasterDialog.FDialogUnitName  := '';//MasterNewUnit.Nama;
    Result := True;
  end else begin
    CommonDlg.ShowError('Form Belum Dicreate' +#13 + 'Kesalahan Ada Pada Developer');
    Exit;
  end;

  if ((Result) and (aIsModal)) then
    aFrmMasterDialog.ShowModal
  else if (Result and (aIsModal = False)) then
    aFrmMasterDialog.Show
  else if not Result then
  begin
    CommonDlg.ShowError('Gagal Melakukan Setting Property Form');
    Exit;
  end;   
end;

procedure TfrmMaster.GetUserModule;
var
  sTipe: string;
  sSQL    : string;
  strNama : string;
begin
  strNama := Name;
  sTipe   := 'View';
//  sSQL  := 'SELECT m.mod_action'
//        + ' FROM aut$module m'
//        + ' LEFT JOIN aut$group_module gm ON m.mod_id = gm.gmod_mod_id'
//        + ' and m.MOD_UNT_ID = gm.GMOD_MOD_UNT_ID'
//        + ' LEFT JOIN aut$user_group ug ON gm.gmod_gro_id = ug.ug_gro_id'
//        + ' and gm.GMOD_GRO_UNT_ID = ug.UG_GRO_UNT_ID'
//        + ' LEFT JOIN aut$user u ON ug.ug_usr_id = u.usr_id'
//        + ' and ug.UG_USR_UNT_ID = u.USR_UNT_ID'
//        + ' WHERE m.mod_name = '+ QuotedStr(strNama)
//        + ' AND u.usr_username = '+ QuotedStr(FLoginUsername)
//        + ' AND ( u.USR_UNT_ID = ' + IntToStr(FLoginUnitId) +')';
  sSQL  := 'SELECT MOD.MOD_ACTION '
         + ' FROM AUT$MENU_STRUCTURE MS '
         + ' LEFT OUTER JOIN AUT$MENU M ON (MS.MENUS_ID = M.MENU_ID) '
         + ' AND (MS.MENUS_UNT_ID = M.MENU_UNT_ID) '
         + ' LEFT OUTER JOIN AUT$USER_GROUP UG ON (M.MENU_GRO_ID = UG.UG_GRO_ID) '
         + ' AND (M.MENU_GRO_UNT_ID = UG.UG_GRO_UNT_ID) '
         + ' LEFT OUTER JOIN AUT$USER U ON (UG.UG_USR_ID = U.USR_ID) '
         + ' AND (UG.UG_USR_UNT_ID = U.USR_UNT_ID) '
         + ' INNER JOIN AUT$MODULE MOD ON (MS.MENUS_MOD_ID = MOD.MOD_ID) '
         + ' AND (MS.MENUS_MOD_UNT_ID = MOD.MOD_UNT_ID) '
         + ' WHERE U.USR_USERNAME = '+ QuotedStr(FLoginUsername)
         + ' AND U.USR_UNT_ID = '+ IntToStr(FLoginUnitId)
         + ' AND MOD.MOD_LABEL <> ' + QuotedStr(sTipe)
         + ' AND UPPER(MOD.MOD_NAME) = ' + QuotedStr(UpperCase(strNama));
  {
  with dmMain.qrMultiPurpose do begin
    SQL.Text := sSQL;
//      'SELECT m.mod_action FROM aut$module m ' +
//      'LEFT JOIN aut$group_module gm ON m.mod_id = gm.gmod_mod_id ' +
//      'LEFT JOIN aut$user_group ug ON gm.gmod_gro_id = ug.ug_gro_id ' +
//      'LEFT JOIN aut$user u ON ug.ug_usr_id = u.usr_id ' +
//      'WHERE m.mod_name = :module AND u.usr_username = :username';
//    Params[0].AsString := strNama;
//    Params[1].AsString := FLoginUsername;
    Open;
    if not IsEmpty then
      while not Eof do begin
        TList.Add(LowerCase(Fields[0].AsString));
        Next;
      end;
  end;
  }
end;

{procedure TfrmMaster.FormCreate(Sender: TObject);
begin
  FFormState := FFormState - [fsVisible];

  KeyPreview        := true;
  TList             := TStringList.Create;
  CurrencyString    := 'Rp. ';
  CurrencyFormat    := 2;
  CurrencyDecimals  := 2;
  DecimalSeparator  := '.';
  ThousandSeparator := ',';

  MasterCompany     := TCompany.Create(Self);
  MasterNewUnit     := TUnit.Create(Self);




end;
}

procedure TfrmMaster.FormShow(Sender: TObject);
begin
//  Authenticate;
//  frmMain.pnlHeader.Hide;
end;

procedure TfrmMaster.FormActivate(Sender: TObject);
begin
  //frmMain.pnlHeader.Hide;
end;

function TfrmMaster.GetMasterCompany: TCompany;
begin
  Result := FMasterCompany;
  if not Assigned(FMasterCompany) then
  begin
    CommonDlg.ShowError('Company Belum Dipilih');
    Application.Terminate;
  end{ else if FMasterCompany.ID = 0 then
  begin
    CommonDlg.ShowError('Company Belum Dipilih');
    Application.Terminate;
  end};

end;

function TfrmMaster.GetMasterNewUnit: integer;//TUnit;
begin
  Result := FMasterNewUnit;
  
//  if not Assigned(FMasterNewUnit) then
  begin
    CommonDlg.ShowError('Unit Belum Dipilih');
    Application.Terminate;
  end{ else if FMasterNewUnit.ID = 0 then
  begin
    CommonDlg.ShowError('Unit Belum Dipilih');
    Application.Terminate;
  end};

end;

procedure TfrmMaster.FormCreate(Sender: TObject);
begin
  // do nothing, jangan diilangi ya
end;

end.


