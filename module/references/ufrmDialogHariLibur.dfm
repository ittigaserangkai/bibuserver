inherited frmDialogHariLibur: TfrmDialogHariLibur
  Left = 271
  Top = 200
  Caption = 'frmDialogHariLibur'
  ClientHeight = 141
  ClientWidth = 367
  Constraints.MinHeight = 32
  OldCreateOrder = True
  ExplicitWidth = 383
  ExplicitHeight = 180
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 367
    Height = 85
    ExplicitWidth = 369
    ExplicitHeight = 111
    object Label1: TLabel
      Left = 28
      Top = 8
      Width = 24
      Height = 16
      Caption = 'Date'
    end
    object Label2: TLabel
      Left = 28
      Top = 40
      Width = 27
      Height = 16
      Caption = 'Name'
    end
    object edtNamaHariLibur: TEdit
      Left = 72
      Top = 38
      Width = 249
      Height = 22
      CharCase = ecUpperCase
      Ctl3D = False
      MaxLength = 20
      ParentCtl3D = False
      TabOrder = 0
    end
    object dtTglHariLibur: TDateTimePicker
      Left = 72
      Top = 8
      Width = 137
      Height = 24
      Date = 42794.000000000000000000
      Time = 42794.000000000000000000
      TabOrder = 1
    end
  end
  inherited footerDialogMaster: TfraFooterDialog3Button
    Top = 85
    Width = 367
    ExplicitTop = 111
    ExplicitWidth = 369
    inherited pnlFooter: TPanel
      Width = 367
      ExplicitWidth = 369
      inherited btnClose: TcxButton
        Left = 285
        ExplicitLeft = 287
      end
      inherited btnSave: TcxButton
        Left = 198
        Action = actSave
        OnClick = footerDialogMasterbtnSaveClick
        ExplicitLeft = 200
      end
      inherited btnDelete: TcxButton
        Action = actDelete
      end
    end
    inherited pnlSortCut: TPanel
      Width = 367
      ExplicitWidth = 369
      inherited lbCTRLEnter: TLabel
        Height = 16
        ExplicitHeight = 16
      end
      inherited lbEscape: TLabel
        Height = 16
      end
      inherited lbCTRLDel: TLabel
        Height = 16
        ExplicitHeight = 16
      end
    end
  end
end
