inherited frmMerchandiseGroup: TfrmMerchandiseGroup
  Caption = 'Data Merchandise Group'
  ClientHeight = 395
  ClientWidth = 637
  ExplicitTop = 8
  ExplicitWidth = 653
  ExplicitHeight = 434
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 637
    Height = 306
    ExplicitWidth = 637
    ExplicitHeight = 306
    inherited pgcBrowse: TcxPageControl
      Width = 615
      Height = 284
      ExplicitWidth = 615
      ExplicitHeight = 284
      ClientRectBottom = 283
      ClientRectRight = 614
      inherited tsBrowse: TcxTabSheet
        ExplicitLeft = 1
        ExplicitTop = 1
        ExplicitWidth = 613
        ExplicitHeight = 282
        inherited cxGrid: TcxGrid
          Width = 613
          Height = 282
          ExplicitWidth = 613
          ExplicitHeight = 282
        end
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 637
    ExplicitWidth = 637
    inherited lblFilterData: TcxLabel
      Left = 283
      ExplicitLeft = 283
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 344
      ExplicitLeft = 344
      ExplicitHeight = 23
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 460
      ExplicitLeft = 460
      ExplicitHeight = 23
    end
    inherited btnSearch: TcxButton
      Left = 555
      ExplicitLeft = 555
    end
    inherited lblsdFilter: TcxLabel
      Left = 436
      ExplicitLeft = 436
      AnchorY = 17
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Top = 339
    Width = 637
    ExplicitTop = 339
    ExplicitWidth = 637
    inherited pnlFooter: TPanel
      Width = 637
      ExplicitWidth = 637
      inherited btnAdd: TcxButton
        Action = actAdd
      end
      inherited btnUpdate: TcxButton
        Action = actEdit
      end
      inherited btnPrint: TcxButton
        Action = actPrint
      end
      inherited btnClose: TcxButton
        Left = 560
        Action = actClose
        ExplicitLeft = 560
      end
      inherited cxButton1: TcxButton
        Action = actExport
      end
    end
    inherited pnlShortCut: TPanel
      Width = 637
      ExplicitWidth = 637
      inherited lbEscape: TLabel
        Left = 563
        Height = 17
        ExplicitLeft = 563
      end
    end
  end
  inherited actlstBrowse: TActionList
    inherited actAdd: TAction
      OnExecute = actAddExecute
    end
    inherited actEdit: TAction
      OnExecute = actEditExecute
    end
  end
end
