inherited frmAbout: TfrmAbout
  Left = 357
  Top = 260
  Caption = 'About Head Office'
  ClientHeight = 269
  ClientWidth = 272
  Constraints.MaxHeight = 308
  Constraints.MaxWidth = 288
  Constraints.MinHeight = 308
  Constraints.MinWidth = 288
  OldCreateOrder = True
  OnShow = FormShow
  ExplicitWidth = 288
  ExplicitHeight = 308
  PixelsPerInch = 96
  TextHeight = 16
  inherited footerDialogMaster: TfraFooterDialog2Button
    Top = 213
    Width = 272
    ExplicitTop = 213
    ExplicitWidth = 272
    inherited pnlFooter: TPanel
      Width = 272
      ExplicitWidth = 272
      inherited btnClose: TcxButton
        Left = 190
        ExplicitLeft = 190
      end
      inherited btnSave: TcxButton
        Left = 103
        ExplicitLeft = 103
      end
    end
    inherited pnlSortCut: TPanel
      Width = 272
      ExplicitWidth = 272
      inherited lbl4: TLabel
        Left = 87
        ExplicitLeft = 87
      end
      inherited lbl5: TLabel
        Left = 182
        ExplicitLeft = 182
      end
    end
  end
  inherited pnlBody: TPanel
    Width = 272
    Height = 213
    ExplicitWidth = 272
    ExplicitHeight = 213
    object lbx2: TcxLabel
      Left = 32
      Top = 96
      Caption = 'lbx2'
    end
    object lbx1: TcxLabel
      Left = 32
      Top = 70
      Caption = 'lbx1'
    end
    object lbx5: TcxLabel
      Left = 32
      Top = 122
      Caption = 'lbx5'
    end
  end
end
