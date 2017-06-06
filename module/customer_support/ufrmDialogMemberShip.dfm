inherited frmDialogMemberShip: TfrmDialogMemberShip
  Left = 196
  Top = 126
  Caption = 'Dialog MemberShip'
  ClientHeight = 472
  ClientWidth = 742
  Constraints.MinHeight = 32
  OldCreateOrder = True
  ExplicitWidth = 758
  ExplicitHeight = 511
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 742
    Height = 416
    BorderWidth = 10
    ExplicitWidth = 742
    ExplicitHeight = 416
    inherited cxGrid: TcxGrid
      Left = 12
      Top = 201
      Width = 718
      Height = 162
      TabOrder = 2
      ExplicitLeft = 12
      ExplicitTop = 201
      ExplicitWidth = 718
      ExplicitHeight = 162
      inherited cxGridView: TcxGridDBTableView
        object cxGridViewColumn1: TcxGridDBColumn
          Caption = 'ID CARD NO.'
          Width = 88
        end
        object cxGridViewColumn2: TcxGridDBColumn
          Caption = 'MEMBER NAME'
          Width = 86
        end
        object cxGridViewColumn4: TcxGridDBColumn
          Caption = 'CARD TYPE'
          Width = 102
        end
        object cxGridViewColumn5: TcxGridDBColumn
          Caption = 'TYPE MEMBER'
          Width = 89
        end
      end
    end
    object pnl1: TPanel
      Left = 12
      Top = 12
      Width = 718
      Height = 189
      Align = alTop
      ParentColor = True
      TabOrder = 0
      object lblInput: TLabel
        Left = 24
        Top = 79
        Width = 71
        Height = 16
        Caption = 'Company Type'
      end
      object lblComboGrid: TLabel
        Left = 24
        Top = 53
        Width = 75
        Height = 16
        Caption = 'Company Name'
      end
      object lbl9: TLabel
        Left = 24
        Top = 107
        Width = 76
        Height = 16
        Caption = 'References No.'
      end
      object lbl8: TLabel
        Left = 24
        Top = 133
        Width = 38
        Height = 16
        Caption = 'N.P.W.P'
      end
      object lbl1: TLabel
        Left = 24
        Top = 161
        Width = 39
        Height = 16
        Caption = 'Address'
      end
      object lbl6: TLabel
        Left = 467
        Top = 53
        Width = 21
        Height = 16
        Caption = 'City'
      end
      object lbl7: TLabel
        Left = 467
        Top = 25
        Width = 49
        Height = 16
        Caption = 'Kelurahan'
      end
      object lbl10: TLabel
        Left = 467
        Top = 79
        Width = 49
        Height = 16
        Caption = 'Post Code'
      end
      object lbl11: TLabel
        Left = 467
        Top = 106
        Width = 49
        Height = 16
        Caption = 'Telephone'
      end
      object lbl12: TLabel
        Left = 467
        Top = 134
        Width = 38
        Height = 16
        Caption = 'Fax No.'
      end
      object lbl13: TLabel
        Left = 467
        Top = 160
        Width = 58
        Height = 16
        Caption = 'Doc. Status'
      end
      object lbl3: TLabel
        Left = 24
        Top = 25
        Width = 69
        Height = 16
        Caption = 'Register Date'
      end
      object edtCompName: TEdit
        Left = 104
        Top = 50
        Width = 295
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 1
      end
      object edtAdrress: TEdit
        Left = 104
        Top = 158
        Width = 293
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 4
      end
      object edtNPWP: TEdit
        Left = 104
        Top = 131
        Width = 295
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 3
      end
      object edtKelurahan: TEdit
        Left = 547
        Top = 23
        Width = 140
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 5
      end
      object edtCity: TEdit
        Left = 547
        Top = 50
        Width = 140
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 6
      end
      object edtPostCode: TEdit
        Left = 547
        Top = 77
        Width = 79
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 7
      end
      object edtTelephone: TEdit
        Left = 547
        Top = 104
        Width = 140
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 8
      end
      object edtFaxNo: TEdit
        Left = 547
        Top = 131
        Width = 140
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 9
      end
      object cbpCompType: TcxExtLookupComboBox
        Left = 104
        Top = 77
        TabOrder = 2
        Width = 295
      end
      object cbbDocStatus: TComboBox
        Left = 547
        Top = 158
        Width = 88
        Height = 24
        BevelKind = bkSoft
        CharCase = ecUpperCase
        Ctl3D = False
        ItemIndex = 1
        ParentCtl3D = False
        TabOrder = 10
        Text = 'COMPLETE'
        Items.Strings = (
          'INCOMPLETE'
          'COMPLETE')
      end
      object dtRegister: TcxDateEdit
        Left = 104
        Top = 23
        TabStop = False
        Properties.ShowTime = False
        TabOrder = 0
        Width = 95
      end
      object edtReference: TEdit
        Left = 104
        Top = 104
        Width = 295
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 11
      end
    end
    object pnl2: TPanel
      Left = 12
      Top = 363
      Width = 718
      Height = 41
      Align = alBottom
      BevelInner = bvRaised
      BevelOuter = bvLowered
      BorderWidth = 5
      Color = 15198183
      TabOrder = 1
      object lblAddRow: TcxLabel
        Left = 10
        Top = 8
        Caption = 'New Row (Ctrl + T)'
        ParentFont = False
        Transparent = True
      end
      object lblDeleteRow: TcxLabel
        Left = 127
        Top = 8
        Caption = 'Delete Row (Ctrl + R)'
        ParentFont = False
        Transparent = True
      end
      object lblDetilPersonal: TcxLabel
        Left = 262
        Top = 8
        Caption = 'Detil Personal (Ctrl-D)'
        ParentFont = False
        Transparent = True
      end
    end
  end
  inherited footerDialogMaster: TfraFooterDialog3Button
    Top = 416
    Width = 742
    ExplicitTop = 416
    ExplicitWidth = 742
    inherited pnlFooter: TPanel
      Width = 742
      ExplicitWidth = 742
      inherited btnClose: TcxButton
        Left = 665
        Action = actCancel
        ExplicitLeft = 665
      end
      inherited btnSave: TcxButton
        Left = 572
        Action = actSave
        ExplicitLeft = 572
      end
      inherited btnDelete: TcxButton
        Action = actDelete
        Visible = False
      end
      inherited btnPrint: TcxButton
        Left = 495
      end
    end
    inherited pnlSortCut: TPanel
      Width = 742
      ExplicitWidth = 742
      inherited lbCTRLEnter: TLabel
        Left = 567
        Height = 15
        ExplicitLeft = 567
      end
      inherited lbEscape: TLabel
        Left = 658
        Height = 15
        ExplicitLeft = 658
      end
      inherited lbCTRLDel: TLabel
        Height = 15
      end
      inherited lblCTRLP: TLabel
        Left = 491
      end
    end
  end
  inherited actlstMasterDialog: TActionList
    Left = 514
    Top = 216
  end
end
