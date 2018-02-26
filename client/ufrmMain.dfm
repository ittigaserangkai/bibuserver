object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = 'BIBU (Business Intelligence Of Business Unit)'
  ClientHeight = 444
  ClientWidth = 929
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object cxPCCPR: TcxPageControl
    Left = 0
    Top = 0
    Width = 929
    Height = 403
    Align = alClient
    TabOrder = 0
    Properties.ActivePage = cxTSGroupReportItem
    Properties.CustomButtons.Buttons = <>
    ClientRectBottom = 399
    ClientRectLeft = 4
    ClientRectRight = 925
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
        Width = 921
        Height = 375
        Align = alClient
        TabOrder = 0
        Properties.ActivePage = cxTSCPRSettingOverview
        Properties.CustomButtons.Buttons = <>
        ClientRectBottom = 371
        ClientRectLeft = 4
        ClientRectRight = 917
        ClientRectTop = 24
        object cxTSCPRSettingOverview: TcxTabSheet
          Caption = 'Overview'
          ImageIndex = 0
          object cxgrdCPRSettingOV: TcxGrid
            Left = 0
            Top = 0
            Width = 913
            Height = 347
            Align = alClient
            TabOrder = 0
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
            Width = 913
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
            Width = 913
            Height = 258
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
                HeaderAlignmentHorz = taCenter
              end
              object cxgrdclmnCPRSettingColumnNama: TcxGridColumn
                AlternateCaption = 'ID'
                Caption = 'Nama'
                PropertiesClassName = 'TcxExtLookupComboBoxProperties'
                HeaderAlignmentHorz = taCenter
              end
              object cxgrdclmnCPRSettingColumnUrutan: TcxGridColumn
                AlternateCaption = 'Urutan'
                Caption = 'Urutan'
                PropertiesClassName = 'TcxTextEditProperties'
                Properties.OnValidate = cxgrdclmnCPRSettingColumnUrutanPropertiesValidate
                HeaderAlignmentHorz = taCenter
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
    object cxTSGroupReport: TcxTabSheet
      Caption = 'Group Report'
      ImageIndex = 2
      object cxPCGroupReport: TcxPageControl
        Left = 0
        Top = 0
        Width = 921
        Height = 375
        Align = alClient
        TabOrder = 0
        Properties.ActivePage = cxTSGROverview
        Properties.CustomButtons.Buttons = <>
        ClientRectBottom = 371
        ClientRectLeft = 4
        ClientRectRight = 917
        ClientRectTop = 24
        object cxTSGROverview: TcxTabSheet
          Caption = 'Overview'
          ImageIndex = 0
          object cxgrdMRGroup: TcxGrid
            Left = 0
            Top = 0
            Width = 913
            Height = 347
            Align = alClient
            TabOrder = 0
            object cxGridDBTableMRGroup: TcxGridDBTableView
              Navigator.Buttons.CustomButtons = <>
              OnCellDblClick = cxGridDBTableMRGroupCellDblClick
              OnEditing = cxGridDBTableMRGroupEditing
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <>
              DataController.Summary.SummaryGroups = <>
            end
            object cxgrdlvlMRGroup: TcxGridLevel
              GridView = cxGridDBTableMRGroup
            end
          end
        end
        object cxTSGRInput: TcxTabSheet
          Caption = 'Input'
          ImageIndex = 1
          object lblKodeGR: TLabel
            Left = 6
            Top = 7
            Width = 24
            Height = 13
            Caption = 'Kode'
          end
          object lblNamaGR: TLabel
            Left = 3
            Top = 34
            Width = 27
            Height = 13
            Caption = 'Nama'
          end
          object edGRKode: TcxTextEdit
            Tag = 1
            Left = 49
            Top = 3
            TabOrder = 0
            Text = 'edGRKode'
            Width = 121
          end
          object edGRName: TcxTextEdit
            Tag = 1
            Left = 49
            Top = 30
            TabOrder = 1
            Text = 'edGRName'
            Width = 121
          end
        end
      end
    end
    object cxTSGroupReportItem: TcxTabSheet
      Caption = 'Group Report Item'
      ImageIndex = 3
      object cxPCGRI: TcxPageControl
        Left = 0
        Top = 0
        Width = 921
        Height = 375
        Align = alClient
        TabOrder = 0
        Properties.ActivePage = cxTSGRIInput
        Properties.CustomButtons.Buttons = <>
        ClientRectBottom = 371
        ClientRectLeft = 4
        ClientRectRight = 917
        ClientRectTop = 24
        object cxTSGRIOverview: TcxTabSheet
          Caption = 'Overview'
          ImageIndex = 0
          object cxgrdGRI: TcxGrid
            Left = 0
            Top = 0
            Width = 913
            Height = 347
            Align = alClient
            TabOrder = 0
            object cxGridDBTableGRI: TcxGridDBTableView
              Navigator.Buttons.CustomButtons = <>
              OnCellDblClick = cxGridDBTableGRICellDblClick
              OnEditing = cxGridDBTableMRGroupEditing
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <>
              DataController.Summary.SummaryGroups = <>
            end
            object cxgrdlvlGRI: TcxGridLevel
              GridView = cxGridDBTableGRI
            end
          end
        end
        object cxTSGRIInput: TcxTabSheet
          Caption = 'Input'
          ImageIndex = 1
          object lblKodeGRI: TLabel
            Left = 17
            Top = 62
            Width = 24
            Height = 13
            Caption = 'Kode'
          end
          object lblGRINama: TLabel
            Left = 14
            Top = 87
            Width = 27
            Height = 13
            Caption = 'Nama'
          end
          object lblGRIUnit: TLabel
            Left = 22
            Top = 12
            Width = 19
            Height = 13
            Caption = 'Unit'
          end
          object lblGRIGroup: TLabel
            Left = 12
            Top = 37
            Width = 29
            Height = 13
            Caption = 'Group'
          end
          object cbbGRIUnit: TcxExtLookupComboBox
            Tag = 99
            Left = 65
            Top = 8
            TabOrder = 0
            Width = 145
          end
          object cbbGRIGroup: TcxExtLookupComboBox
            Tag = 99
            Left = 65
            Top = 33
            TabOrder = 1
            Width = 145
          end
          object edGRIKode: TcxTextEdit
            Tag = 1
            Left = 65
            Top = 58
            TabOrder = 2
            Text = 'edGRIKode'
            Width = 121
          end
          object edGRINama: TcxTextEdit
            Tag = 1
            Left = 65
            Top = 83
            TabOrder = 3
            Text = 'edGRINama'
            Width = 121
          end
        end
      end
    end
  end
  object pnlButton: TPanel
    Left = 0
    Top = 403
    Width = 929
    Height = 41
    Align = alBottom
    TabOrder = 1
    object bSimpan: TcxButton
      Left = 853
      Top = 1
      Width = 75
      Height = 39
      Align = alRight
      Caption = 'Simpan'
      TabOrder = 0
      OnClick = bSimpanClick
    end
    object bClear: TcxButton
      Left = 778
      Top = 1
      Width = 75
      Height = 39
      Align = alRight
      Caption = 'Clear'
      TabOrder = 1
      OnClick = bClearClick
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
    end
    object bDelete: TcxButton
      Left = 703
      Top = 1
      Width = 75
      Height = 39
      Align = alRight
      Caption = 'Delete'
      TabOrder = 3
      OnClick = bDeleteClick
    end
  end
end
