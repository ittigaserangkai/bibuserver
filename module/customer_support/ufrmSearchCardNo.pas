unit ufrmSearchCardNo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterDialogBrowse, ExtCtrls,
  System.Actions, Vcl.ActnList, ufraFooterDialog3Button, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, Vcl.Menus,
  cxButtons, cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, Vcl.StdCtrls;

type
  TModul = (tmMutasiStock, tmCardNoIGRA, tmReturDmg, tmReturRep, tmDoForReplace, tmWastageDmg, tmWastageObrl, tmNull);
  TfrmDialogSearchCardNo = class(TfrmMasterDialogBrowse)
    pnl1: TPanel;
    lbl2: TLabel;
    edtCardNoName: TEdit;
    btnSearch: TcxButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure footerDialogMasterbtnSaveClick(Sender: TObject);
    procedure edtCardNoNameChange(Sender: TObject);
    procedure strgGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCardNoNameKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure strgGridDblClickCell(Sender: TObject; ARow, ACol: Integer);
  private
    FIsProcessSuccessfull: boolean;
    procedure SetIsProcessSuccessfull(const Value: boolean);
    procedure FindDataOnGrid(AText: String);
  public
    { Public declarations }
    CardNoName: string;
    untID,CardNoID: Integer;

  published
    property IsProcessSuccessfull: boolean read FIsProcessSuccessfull write SetIsProcessSuccessfull;
  end;

var
  frmDialogSearchCardNo: TfrmDialogSearchCardNo;

implementation

{$R *.dfm}

procedure TfrmDialogSearchCardNo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmDialogSearchCardNo.FormDestroy(Sender: TObject);
begin
  inherited;
  frmDialogSearchCardNo := nil;
end;

procedure TfrmDialogSearchCardNo.FormShow(Sender: TObject);
var dataBarang: TDataSet;
    i, countData: integer;
begin
  {SetLength(arrParam,1);
  arrParam[0].tipe := ptInteger;
  arrParam[0].data := untID;
  countData := dataBarang.RecordCount;

  with strgGrid do
  begin
    Clear;
    RowCount := countData + 1;
    ColCount := 3;
    Cells[0,0] := 'CARD NO.';
    Cells[1,0] := 'NAME';
    Cells[2,0] := 'ADDRESS';

    if RowCount > 1 then
    begin
      i := 1;
      while not dataBarang.Eof do
      begin
        with strgGrid do
        begin
          Cells[0, i] := dataBarang.FieldByName('MEMBER_CARD_NO').AsString;
          Cells[1, i] := dataBarang.FieldByName('MEMBER_NAME').AsString;
          Cells[2, i] := dataBarang.FieldByName('MEMBER_ADDRESS').AsString;
        end;
        Inc(i);
        dataBarang.Next;
      end;
    end
    else
    begin
      RowCount := 2;
      Cells[0, 1] := '';
    end;
    FixedRows := 1;
    AutoSize := true;
  end;
  }
end;

procedure TfrmDialogSearchCardNo.SetIsProcessSuccessfull(
  const Value: boolean);
begin
  FIsProcessSuccessfull := Value;
end;

procedure TfrmDialogSearchCardNo.footerDialogMasterbtnSaveClick(
  Sender: TObject);
begin
//  CardNoName := strgGrid.Cells[0,strgGrid.Row];
  IsProcessSuccessfull := True;
  Close;
end;

procedure TfrmDialogSearchCardNo.FindDataOnGrid(AText: String);
var
  resPoint: TPoint;
begin
  {if (AText <> '') then
  begin
    resPoint := strgGrid.Find(Point(0,0),AText,[fnIncludeFixed]);
    if (resPoint.Y <> -1) then
    begin
      strgGrid.ScrollInView(resPoint.X, resPoint.Y);
      strgGrid.SelectRows(resPoint.Y, 1);
    end;
  end;
  }
end;

procedure TfrmDialogSearchCardNo.edtCardNoNameChange(Sender: TObject);
begin
  FindDataOnGrid(edtCardNoName.Text);
end;

procedure TfrmDialogSearchCardNo.strgGridKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  {add by didit: 19112007}
  if (Key = VK_UP) then
//    if (strgGrid.Row = 1) then
    begin
      edtCardNoName.SetFocus;
      edtCardNoName.SelectAll;
    end;

  if Key = VK_RETURN then
    footerDialogMasterbtnSaveClick(Sender);
end;

procedure TfrmDialogSearchCardNo.edtCardNoNameKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin         
  if (Key=VK_Down) then
    cxGrid.SetFocus;
end;

procedure TfrmDialogSearchCardNo.strgGridDblClickCell(Sender: TObject;
  ARow, ACol: Integer);
begin
  inherited;
  footerDialogMasterbtnSaveClick(Sender);
end;

end.
