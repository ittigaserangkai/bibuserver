object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = 'BIBU (Business Intelligence Of Business Unit)'
  ClientHeight = 445
  ClientWidth = 819
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object cxPCCPR: TcxPageControl
    Left = 0
    Top = 0
    Width = 819
    Height = 404
    Align = alClient
    TabOrder = 0
    Properties.ActivePage = cxTSCPRSetting
    Properties.CustomButtons.Buttons = <>
    ClientRectBottom = 400
    ClientRectLeft = 4
    ClientRectRight = 815
    ClientRectTop = 24
    object cxTSCPR: TcxTabSheet
      Caption = 'CPR'
      ImageIndex = 0
    end
    object cxTSCPRSetting: TcxTabSheet
      Caption = 'CPR Setting'
      ImageIndex = 1
      object cxPCCPRSetting: TcxPageControl
        Left = 0
        Top = 0
        Width = 811
        Height = 376
        Align = alClient
        TabOrder = 0
        Properties.ActivePage = cxTSCPRSettingOverview
        Properties.CustomButtons.Buttons = <>
        ClientRectBottom = 372
        ClientRectLeft = 4
        ClientRectRight = 807
        ClientRectTop = 24
        object cxTSCPRSettingOverview: TcxTabSheet
          Caption = 'Overview'
          ImageIndex = 0
          object cxgrdCPRSettingOV: TcxGrid
            Left = 0
            Top = 0
            Width = 803
            Height = 348
            Align = alClient
            TabOrder = 0
            ExplicitLeft = 280
            ExplicitTop = 72
            ExplicitWidth = 250
            ExplicitHeight = 200
            object cxGridDBTableCPRSettingOV: TcxGridDBTableView
              Navigator.Buttons.CustomButtons = <>
              OnCellDblClick = cxGridDBTableCPRSettingOVCellDblClick
              OnEditing = cxGridDBTableCPRSettingOVEditing
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <>
              DataController.Summary.SummaryGroups = <>
            end
            object cxgrdlvlCPRSettingLvl: TcxGridLevel
              GridView = cxGridDBTableCPRSettingOV
            end
          end
        end
        object cxTSCPRInput: TcxTabSheet
          Caption = 'Input'
          ImageIndex = 1
          object pnlHeaderCPRSetting: TPanel
            Left = 0
            Top = 0
            Width = 803
            Height = 89
            Align = alTop
            TabOrder = 0
            object lblUnitUsaha: TLabel
              Left = 10
              Top = 13
              Width = 52
              Height = 13
              Caption = 'Unit Usaha'
            end
            object lblNama: TLabel
              Left = 35
              Top = 38
              Width = 27
              Height = 13
              Caption = 'Nama'
            end
            object lblStatus: TLabel
              Left = 31
              Top = 63
              Width = 31
              Height = 13
              Caption = 'Status'
            end
            object edNama: TcxTextEdit
              Left = 75
              Top = 34
              TabOrder = 1
              Text = 'edNama'
              Width = 209
            end
            object cbbIsActive: TcxComboBox
              Left = 75
              Top = 59
              Properties.DropDownListStyle = lsFixedList
              Properties.Items.Strings = (
                'AKTIF'
                'NON AKTIF')
              TabOrder = 2
              Text = 'AKTIF'
              Width = 209
            end
            object cbbUnit: TcxExtLookupComboBox
              Left = 75
              Top = 9
              TabOrder = 0
              Width = 209
            end
          end
          object cxgrdCPRSetting: TcxGrid
            Left = 0
            Top = 89
            Width = 803
            Height = 259
            Align = alClient
            TabOrder = 1
            RootLevelOptions.DetailTabsPosition = dtpTop
            object cxgrdtblvwCPRSetting: TcxGridTableView
              Navigator.Buttons.CustomButtons = <>
              DataController.Options = [dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding, dcoInsertOnNewItemRowFocusing]
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <>
              DataController.Summary.SummaryGroups = <>
              OptionsBehavior.FocusFirstCellOnNewRecord = True
              OptionsBehavior.GoToNextCellOnEnter = True
              OptionsData.Appending = True
              object cxgrdclmnCPRSettingColumnIndikator: TcxGridColumn
                AlternateCaption = 'Indikator'
                Caption = 'Kode'
                PropertiesClassName = 'TcxExtLookupComboBoxProperties'
                Properties.OnValidate = cxgrdclmnCPRSettingColumnIndikatorPropertiesValidate
              end
              object cxgrdclmnCPRSettingColumnNama: TcxGridColumn
                AlternateCaption = 'ID'
                Caption = 'Nama'
                PropertiesClassName = 'TcxExtLookupComboBoxProperties'
              end
            end
            object cxgrdlvlCPRSetting: TcxGridLevel
              Caption = 'Indikator'
              GridView = cxgrdtblvwCPRSetting
            end
          end
        end
      end
    end
  end
  object pnlButton: TPanel
    Left = 0
    Top = 404
    Width = 819
    Height = 41
    Align = alBottom
    TabOrder = 1
    object bSimpan: TcxButton
      Left = 743
      Top = 1
      Width = 75
      Height = 39
      Align = alRight
      Caption = 'Simpan'
      TabOrder = 0
      OnClick = bSimpanClick
      ExplicitLeft = 728
      ExplicitTop = 6
      ExplicitHeight = 25
    end
    object bClear: TcxButton
      Left = 668
      Top = 1
      Width = 75
      Height = 39
      Align = alRight
      Caption = 'Clear'
      TabOrder = 1
      OnClick = bClearClick
      ExplicitLeft = 647
      ExplicitTop = 6
      ExplicitHeight = 25
    end
    object bRefresh: TcxButton
      Left = 1
      Top = 1
      Width = 75
      Height = 39
      Align = alLeft
      Caption = 'Refresh'
      TabOrder = 2
      OnClick = bRefreshClick
      ExplicitLeft = 15
      ExplicitTop = 6
      ExplicitHeight = 25
    end
    object bDelete: TcxButton
      Left = 593
      Top = 1
      Width = 75
      Height = 39
      Align = alRight
      Caption = 'Delete'
      TabOrder = 3
      OnClick = bDeleteClick
      ExplicitLeft = 647
      ExplicitTop = 6
      ExplicitHeight = 25
    end
  end
end
