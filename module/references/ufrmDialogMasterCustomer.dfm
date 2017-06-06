inherited frmDialogMasterCustomer: TfrmDialogMasterCustomer
  Left = 281
  Top = 104
  Caption = 'frmDialogMasterCustomer'
  ClientHeight = 436
  ClientWidth = 534
  Constraints.MinHeight = 32
  OldCreateOrder = True
  ExplicitWidth = 550
  ExplicitHeight = 475
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 534
    Height = 380
    ExplicitWidth = 536
    ExplicitHeight = 406
    object Panel1: TPanel
      Left = 2
      Top = 2
      Width = 530
      Height = 86
      Align = alTop
      TabOrder = 0
      ExplicitWidth = 532
      object lbl5: TLabel
        Left = 16
        Top = 9
        Width = 87
        Height = 16
        AutoSize = False
        Caption = 'Customer Code'
      end
      object lbl1: TLabel
        Left = 16
        Top = 34
        Width = 87
        Height = 16
        AutoSize = False
        Caption = 'Customer Name'
      end
      object lbl12: TLabel
        Left = 16
        Top = 63
        Width = 87
        Height = 16
        AutoSize = False
        Caption = 'Contact Person'
      end
      object lbl8: TLabel
        Left = 352
        Top = 60
        Width = 29
        Height = 16
        AutoSize = False
        Caption = 'Title'
      end
      object edtCustCode: TEdit
        Left = 110
        Top = 7
        Width = 77
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        MaxLength = 8
        ParentCtl3D = False
        TabOrder = 0
      end
      object edtCustName: TEdit
        Left = 110
        Top = 32
        Width = 389
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        MaxLength = 128
        ParentCtl3D = False
        TabOrder = 1
      end
      object edtContactPerson: TEdit
        Left = 110
        Top = 57
        Width = 196
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        MaxLength = 20
        ParentCtl3D = False
        TabOrder = 2
      end
      object edtTitle: TEdit
        Left = 385
        Top = 57
        Width = 113
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        MaxLength = 16
        ParentCtl3D = False
        TabOrder = 3
      end
    end
    object Panel2: TPanel
      Left = 2
      Top = 88
      Width = 530
      Height = 86
      Align = alTop
      TabOrder = 1
      ExplicitWidth = 532
      object lbl2: TLabel
        Left = 20
        Top = 9
        Width = 87
        Height = 16
        AutoSize = False
        Caption = 'Address'
      end
      object lbl3: TLabel
        Left = 20
        Top = 34
        Width = 87
        Height = 16
        AutoSize = False
        Caption = 'City'
      end
      object lbl4: TLabel
        Left = 20
        Top = 59
        Width = 87
        Height = 16
        AutoSize = False
        Caption = 'Telephone'
      end
      object lbl7: TLabel
        Left = 316
        Top = 34
        Width = 60
        Height = 16
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Post. Code'
      end
      object lbl11: TLabel
        Left = 316
        Top = 59
        Width = 60
        Height = 16
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Fax No.'
      end
      object edtAddress: TEdit
        Left = 110
        Top = 6
        Width = 389
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        MaxLength = 128
        ParentCtl3D = False
        TabOrder = 0
      end
      object edtCity: TEdit
        Left = 110
        Top = 31
        Width = 196
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        MaxLength = 64
        ParentCtl3D = False
        TabOrder = 1
      end
      object edtTelephone: TEdit
        Left = 110
        Top = 56
        Width = 195
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        MaxLength = 16
        ParentCtl3D = False
        TabOrder = 2
      end
      object edtPostCode: TEdit
        Left = 385
        Top = 31
        Width = 114
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        MaxLength = 8
        ParentCtl3D = False
        TabOrder = 3
      end
      object edtFaxNo: TEdit
        Left = 385
        Top = 56
        Width = 114
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        MaxLength = 16
        ParentCtl3D = False
        TabOrder = 4
      end
    end
    object Panel3: TPanel
      Left = 2
      Top = 174
      Width = 530
      Height = 91
      Align = alTop
      TabOrder = 2
      ExplicitWidth = 532
      object lbl13: TLabel
        Left = 227
        Top = 7
        Width = 41
        Height = 16
        AutoSize = False
        Caption = 'Tax No.'
      end
      object lbl15: TLabel
        Left = 20
        Top = 7
        Width = 87
        Height = 16
        AutoSize = False
        Caption = 'PKP/NON PKP'
      end
      object lbl14: TLabel
        Left = 20
        Top = 34
        Width = 87
        Height = 16
        AutoSize = False
        Caption = 'PPH/NON PPH'
      end
      object lbl16: TLabel
        Left = 227
        Top = 34
        Width = 41
        Height = 16
        AutoSize = False
        Caption = 'NPWP'
      end
      object lbl23: TLabel
        Left = 20
        Top = 61
        Width = 81
        Height = 16
        Caption = 'Type of Payment'
      end
      object lbl24: TLabel
        Left = 227
        Top = 61
        Width = 82
        Height = 16
        Caption = 'Term of Payment'
      end
      object lbl27: TLabel
        Left = 345
        Top = 61
        Width = 24
        Height = 16
        Caption = 'Days'
      end
      object cbbPKP: TComboBox
        Left = 110
        Top = 3
        Width = 98
        Height = 24
        BevelKind = bkSoft
        Style = csDropDownList
        Ctl3D = False
        ItemIndex = 1
        ParentCtl3D = False
        TabOrder = 0
        Text = 'PKP'
        Items.Strings = (
          'NON PKP'
          'PKP')
      end
      object edtTaxNo: TEdit
        Left = 269
        Top = 4
        Width = 139
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        MaxLength = 64
        ParentCtl3D = False
        TabOrder = 1
      end
      object cbbPPH: TComboBox
        Left = 110
        Top = 30
        Width = 98
        Height = 24
        BevelKind = bkSoft
        Style = csDropDownList
        Ctl3D = False
        ItemIndex = 1
        ParentCtl3D = False
        TabOrder = 2
        Text = 'PPH'
        Items.Strings = (
          'NON PPH'
          'PPH')
      end
      object edtNPWP: TEdit
        Left = 269
        Top = 31
        Width = 139
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        MaxLength = 32
        ParentCtl3D = False
        TabOrder = 3
      end
      object edtTermOP: TEdit
        Left = 317
        Top = 58
        Width = 24
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 5
        Text = '0'
      end
      object cbpTypeOfPay: TComboBox
        Left = 110
        Top = 57
        Width = 98
        Height = 24
        BevelKind = bkSoft
        Style = csDropDownList
        Ctl3D = False
        ItemIndex = 1
        ParentCtl3D = False
        TabOrder = 4
        Text = 'PPH'
        Items.Strings = (
          'NON PPH'
          'PPH')
      end
    end
    object Panel4: TPanel
      Left = 2
      Top = 265
      Width = 530
      Height = 113
      Align = alClient
      TabOrder = 3
      ExplicitWidth = 532
      ExplicitHeight = 139
      object lbl10: TLabel
        Left = 20
        Top = 6
        Width = 87
        Height = 16
        AutoSize = False
        Caption = 'Customer Desc'
      end
      object lblSubCode: TLabel
        Left = 20
        Top = 60
        Width = 87
        Height = 16
        AutoSize = False
        Caption = 'Supplier Code'
        Visible = False
      end
      object edtCustDesc: TEdit
        Left = 110
        Top = 3
        Width = 389
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        MaxLength = 512
        ParentCtl3D = False
        TabOrder = 0
      end
      object chkPrincipal: TCheckBox
        Left = 110
        Top = 31
        Width = 81
        Height = 17
        Caption = 'Is Principal'
        TabOrder = 1
        OnClick = chkPrincipalClick
      end
      object edtSupName: TEdit
        Left = 197
        Top = 57
        Width = 302
        Height = 22
        TabStop = False
        CharCase = ecUpperCase
        Ctl3D = False
        MaxLength = 20
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 2
        Visible = False
      end
      object edtSupMGCode: TcxButtonEdit
        Left = 112
        Top = 56
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.OnButtonClick = edtSupMGCodePropertiesButtonClick
        TabOrder = 3
        OnExit = edtSupMGCodeExit
        OnKeyPress = edtSupMGCodeKeyPress
        OnKeyUp = edtSupMGCodeKeyUp
        Width = 81
      end
    end
  end
  inherited footerDialogMaster: TfraFooterDialog3Button
    Top = 380
    Width = 534
    ExplicitTop = 406
    ExplicitWidth = 536
    inherited pnlFooter: TPanel
      Width = 534
      ExplicitWidth = 536
      inherited btnClose: TcxButton
        Left = 452
        ExplicitLeft = 454
      end
      inherited btnSave: TcxButton
        Left = 365
        Action = actSave
        OnClick = footerDialogMasterbtnSaveClick
        ExplicitLeft = 367
      end
      inherited btnDelete: TcxButton
        Action = actDelete
      end
    end
    inherited pnlSortCut: TPanel
      Width = 534
      ExplicitWidth = 536
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
