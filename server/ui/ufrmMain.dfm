object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = 'Head Office :: ASSALAAM HYPERMARKET'
  ClientHeight = 507
  ClientWidth = 800
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Trebuchet MS'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = mmMainMenu
  OldCreateOrder = False
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 16
  object pnlHeader: TPanel
    Left = 0
    Top = 0
    Width = 800
    Height = 80
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Color = 10150911
    TabOrder = 0
    object imgHeader: TImage
      Left = 2
      Top = 2
      Width = 796
      Height = 76
      Align = alClient
      Transparent = True
      ExplicitLeft = 4
      ExplicitTop = 4
    end
  end
  object sbMain: TdxStatusBar
    Left = 0
    Top = 487
    Width = 800
    Height = 20
    Panels = <
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        Text = 'User login:'
        Width = 110
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        Text = 'Role: '
        Width = 110
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        Text = 'Database:'
        Width = 250
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
      end>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
  end
  object pnlUnit: TPanel
    Left = 0
    Top = 80
    Width = 800
    Height = 38
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 2
    ExplicitLeft = -10
    ExplicitTop = 139
    ExplicitWidth = 810
    object lbl1: TLabel
      Left = 360
      Top = 8
      Width = 127
      Height = 16
      Caption = '&Unit Store [Ctrl+Shift+U]:'
    end
    object lbl2: TLabel
      Left = 8
      Top = 8
      Width = 149
      Height = 16
      Caption = '&Company Code [Ctrl+Shift+C]:'
    end
    object cbbUnit: TComboBox
      Left = 489
      Top = 5
      Width = 216
      Height = 24
      BevelKind = bkSoft
      Style = csDropDownList
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 1
    end
    object cbbCompCode: TComboBox
      Left = 159
      Top = 4
      Width = 194
      Height = 24
      BevelKind = bkSoft
      Style = csDropDownList
      Ctl3D = False
      ItemIndex = 0
      ParentCtl3D = False
      TabOrder = 0
      Text = '01 - [MG] MULTIGROSIR'
      Items.Strings = (
        '01 - [MG] MULTIGROSIR'
        '10 - [HO] HEAD OFFICE'
        '20 - ASGROSS')
    end
  end
  object mmMainMenu: TMainMenu
    Left = 520
    Top = 224
    object mmSistem1: TMenuItem
      Caption = '&System'
      object miLogin1: TMenuItem
        Action = actOnLogin
      end
      object miLogout1: TMenuItem
        Action = actOnLogout
      end
      object MenuItem1: TMenuItem
        Caption = '-'
      end
      object miExit1: TMenuItem
        Action = actOnExit
      end
    end
    object mmSetting1: TMenuItem
      Caption = 'Se&tting'
      object miConnectionDatabase1: TMenuItem
        Caption = 'Connection Database'
      end
      object MenuItem2: TMenuItem
        Caption = '-'
      end
      object miGlobalParameter1: TMenuItem
        Caption = 'Global Parameter'
      end
    end
    object mmWindow1: TMenuItem
      Caption = '&Window'
      object miCascade1: TMenuItem
        Action = actCascade
      end
      object miTile1: TMenuItem
        Action = actTile
      end
      object miArrange1: TMenuItem
        Action = actArrange
      end
      object MenuItem3: TMenuItem
        Caption = '-'
      end
      object miCloseAll1: TMenuItem
        Action = actCloseAll
      end
      object SysParam1: TMenuItem
        Caption = 'System Parameter'
      end
    end
    object mmAbout1: TMenuItem
      Caption = '&Help'
      object miHeadOfficeHelp1: TMenuItem
        Caption = 'Head Office Help'
        ShortCut = 112
      end
      object MenuItem4: TMenuItem
        Caption = '-'
      end
      object miAbout1: TMenuItem
        Caption = 'About...'
      end
    end
  end
  object actlstMain: TActionList
    Left = 399
    Top = 216
    object actOnCreateForm: TAction
      Caption = 'actOnCreateForm'
    end
    object actOnLogout: TAction
      Category = 'Sistem'
      Caption = 'Logout'
      ShortCut = 24652
      OnExecute = actOnLogoutExecute
    end
    object actOnLogin: TAction
      Category = 'Sistem'
      Caption = 'Login'
      ShortCut = 16460
    end
    object actOnExit: TAction
      Category = 'Sistem'
      Caption = 'Exit'
      ShortCut = 32883
    end
    object actModule1: TAction
      Category = 'Contoh'
      Caption = 'Module 1'
    end
    object actCascade: TAction
      Category = 'Window'
      Caption = '&Cascade'
    end
    object actTile: TAction
      Category = 'Window'
      Caption = '&Tile'
    end
    object actArrange: TAction
      Category = 'Window'
      Caption = '&Arrange'
    end
    object actCloseAll: TAction
      Category = 'Window'
      Caption = 'Clo&se All'
      OnExecute = actCloseAllExecute
    end
    object actAuthentikasiModul: TAction
      Category = 'Contoh'
      Caption = 'Module Authentication'
    end
    object actPajak: TAction
      Category = 'References'
      Caption = 'Pajak'
    end
    object actSupplierType: TAction
      Category = 'References'
      Caption = 'Supplier Type'
    end
    object actUOM: TAction
      Category = 'References'
      Caption = 'Unit Of Measure'
    end
    object actGroupSubGroupCat: TAction
      Category = 'References'
      Caption = 'Group/Sub Group/Category'
    end
    object actMerchanGroup: TAction
      Category = 'References'
      Caption = 'Merchandise Group'
    end
    object actSalesOutlet: TAction
      Category = 'References'
      Caption = 'Sales Outlet'
    end
    object actUnitStore: TAction
      Category = 'References'
      Caption = 'Unit Store'
    end
    object actCompanyType: TAction
      Category = 'References'
      Caption = 'Company Type'
    end
    object actBank: TAction
      Category = 'References'
      Caption = 'Bank'
    end
    object actProductType: TAction
      Category = 'References'
      Caption = 'Product Type'
    end
    object actDataSupplier: TAction
      Category = 'Merchandise'
      Caption = 'Master &Supplier'
    end
    object actSupplierProduct: TAction
      Category = 'Merchandise'
      Caption = 'Supplier'#39's Product'
    end
    object actDataProduct: TAction
      Category = 'Merchandise'
      Caption = 'Master &Product'
    end
    object actDataCompetitor: TAction
      Category = 'Merchandise'
      Caption = 'Data Competitor'
    end
    object actCompetitorProduct: TAction
      Category = 'Merchandise'
      Caption = 'Competitor'#39's Product'
    end
    object actTipePembayaran: TAction
      Category = 'Merchandise'
      Caption = 'actTipePembayaran'
    end
    object actTipePengirimanPO: TAction
      Category = 'Merchandise'
      Caption = 'actTipePengirimanPO'
    end
    object actHariLibur: TAction
      Category = 'References'
      Caption = 'Day Off'
    end
    object actClaimFaktur: TAction
      Category = 'Finance'
      Caption = '&Claim Faktur'
    end
    object actAdjustmentFaktur: TAction
      Category = 'Finance'
      Caption = '&Adjustment Faktur'
    end
    object actMonitoringCekGiro: TAction
      Category = 'Finance'
      Caption = '&Monitoring Cek/Giro'
    end
    object actPaymentFaktur: TAction
      Category = 'Finance'
      Caption = '&Payment Faktur'
    end
    object actIGRADesc: TAction
      Category = 'References'
      Caption = 'IGRA Desc'
    end
    object actLokasi: TAction
      Category = 'References'
      Caption = 'Lokasi'
    end
    object actListAPBalance: TAction
      Category = 'Finance'
      Caption = 'actListAPBalance'
    end
    object actClaimContrabon: TAction
      Category = 'Finance'
      Caption = 'C&laim Contrabon'
    end
    object actPaymentContrabon: TAction
      Category = 'Finance'
      Caption = 'P&ayment Contrabon'
    end
    object actListARBalance: TAction
      Category = 'Finance'
      Caption = 'actListARBalance'
    end
    object actImportEOD: TAction
      Category = 'Finance'
      Caption = '&Import EOD'
    end
    object actInputContrabon: TAction
      Category = 'Finance'
      Caption = 'I&nput Contrabon'
    end
    object actPotonganTagihan: TAction
      Category = 'Finance'
      Caption = '&Potongan Tagihan'
    end
    object actInvoiceSewaToko: TAction
      Category = 'Finance'
      Caption = 'In&voice Sewa Toko'
    end
    object actMasterAgreement: TAction
      Category = 'Finance'
      Caption = '&Master Agreement'
    end
    object actMasterAdjustment: TAction
      Category = 'Finance'
      Caption = '&Master Adjustment'
    end
    object actAdjustmentJurnalCode: TAction
      Category = 'Finance'
      Caption = '&Adjustment Jurnal Code'
    end
    object actListNP: TAction
      Category = 'Finance'
      Caption = 'actListNP'
    end
    object actExportSync: TAction
      Category = 'EOD'
      Caption = '&Export Sync'
    end
    object actListDisbursement: TAction
      Category = 'Finance'
      Caption = 'List Disbursement'
    end
    object actListARPayment: TAction
      Category = 'Finance'
      Caption = 'actListARPayment'
    end
    object actListAgreementDetil: TAction
      Category = 'Finance'
      Caption = 'Listing Agreement Detil'
    end
    object actImportSync: TAction
      Category = 'EOD'
      Caption = '&Import Sync'
    end
    object actUOMNBD: TAction
      Category = 'References'
      Caption = 'Unit Of Measure NBD'
    end
    object actProductTypeNBD: TAction
      Category = 'References'
      Caption = 'Product Type NBD'
    end
    object actMasterProductNBD: TAction
      Category = 'References'
      Caption = 'Master Product NBD'
    end
    object actUserGroup: TAction
      Category = 'Management User'
      Caption = 'User &Group'
    end
    object actUser: TAction
      Category = 'Management User'
      Caption = '&User'
    end
    object actMasterCustomer: TAction
      Category = 'References'
      Caption = 'Master Customer'
    end
    object actValidateContrabon: TAction
      Category = 'Finance'
      Caption = 'actValidateContrabon'
    end
    object actARPayment: TAction
      Category = 'Finance'
      Caption = 'Pa&yment'
    end
    object actDisburstment: TAction
      Category = 'Finance'
      Caption = '&Disburstment'
    end
    object actReceipt: TAction
      Category = 'Finance'
      Caption = '&Receipt'
    end
    object actTransferDeposit: TAction
      Category = 'Finance'
      Caption = '&Transfer / Deposit'
    end
    object actAPPayment: TAction
      Category = 'Finance'
      Caption = '&Payment'
    end
    object actVoucher: TAction
      Category = 'Accounting'
      Caption = '&Voucher'
    end
    object actSetupCashManagement: TAction
      Category = 'Finance'
      Caption = 'actSetupCashManagement'
    end
    object actPendingCheque: TAction
      Category = 'Finance'
      Caption = 'P&ending Cheque'
    end
    object actStandardJournal: TAction
      Category = 'Accounting'
      Caption = '&Standard Journal'
    end
    object actFixAsset: TAction
      Category = 'Accounting'
      Caption = 'actFixAsset'
    end
    object actSetupFixAsset: TAction
      Category = 'Accounting'
      Caption = 'actSetupFixAsset'
    end
    object actMasterAmortisasi: TAction
      Category = 'Accounting'
      Caption = 'actMasterAmortisasi'
    end
    object actSellingAsset: TAction
      Category = 'Accounting'
      Caption = 'actSellingAsset'
    end
    object actDisplayDepreciationSchedule: TAction
      Category = 'Accounting'
      Caption = 'actDisplayDepreciationSchedule'
    end
    object actListingClaim: TAction
      Category = 'Finance'
      Caption = 'actListingClaim'
    end
    object actADSMasuk: TAction
      Category = 'Merchandise'
      Caption = 'actADSMasuk'
    end
    object actADSKeluar: TAction
      Category = 'Merchandise'
      Caption = 'actADSKeluar'
    end
    object actMenuPrintSalesAnalys: TAction
      Category = 'Finance'
      Caption = 'Print Sales Analysis'
    end
    object actPostingDeprAmor: TAction
      Category = 'Accounting'
      Caption = 'Posting Depresiasi Amortisasi'
    end
    object actAccountingPeriode: TAction
      Category = 'Accounting'
      Caption = 'Accounting Periode'
    end
    object actInvoice: TAction
      Category = 'Finance'
      Caption = 'Invoice'
    end
    object actAutomaticAccrual: TAction
      Category = 'Finance'
      Caption = 'Automatic Accrual'
    end
    object actPrintTransferList: TAction
      Category = 'Finance'
      Caption = 'Print Transfer List'
    end
    object actTrialBalance: TAction
      Category = 'Accounting'
      Caption = 'Trial Balance'
    end
    object actGeneralLedger: TAction
      Category = 'Accounting'
      Caption = '&General Ledger'
    end
    object actRekening: TAction
      Category = 'Accounting'
      Caption = 'Rekening'
    end
    object actBalanceSheet: TAction
      Category = 'Accounting'
      Caption = '&Balance Sheet'
    end
    object actProfitLoss: TAction
      Category = 'Accounting'
      Caption = '&Profit Loss'
    end
    object actListingJurnal: TAction
      Category = 'Accounting'
      Caption = 'Listing Jurnal'
    end
    object actClosingFiscalYear: TAction
      Category = 'Accounting'
      Caption = 'Closing Fiscal Year'
    end
    object actJurnalEntry: TAction
      Category = 'Accounting'
      Caption = 'Jurnal Entry'
    end
    object actOpeningFiscalYear: TAction
      Category = 'Accounting'
      Caption = 'actOpeningFiscalYear'
    end
    object actPemakaianBarcode: TAction
      Category = 'Finance'
      Caption = 'Pemakaian Barcode'
    end
    object actListPemakaianBarcode: TAction
      Category = 'Finance'
      Caption = 'actListPemakaianBarcode'
    end
    object actPostingJournal: TAction
      Category = 'Accounting'
      Caption = 'Posting Journal'
    end
    object actUnpostingJournal: TAction
      Category = 'Accounting'
      Caption = 'actUnpostingJournal'
    end
    object actJournalAutomatic: TAction
      Category = 'Accounting'
      Caption = 'Journal Automatic'
    end
    object actGeneralLedgerCY: TAction
      Category = 'Accounting'
      Caption = 'G&eneral Ledger Closing Year'
    end
    object actBalanceSheetCY: TAction
      Category = 'Accounting'
      Caption = 'B&alance Sheet'
    end
    object actProfitLossCY: TAction
      Category = 'Accounting'
      Caption = 'P&rofit Loss'
    end
    object actPaymentClaimContrabon: TAction
      Category = 'Finance'
      Caption = 'Payment Claim Contrabon'
    end
    object actElectricCustomer: TAction
      Category = 'Finance'
      Caption = 'actElectricCustomer'
    end
    object actElectricTransaction: TAction
      Category = 'Finance'
      Caption = 'actElectricTransaction'
    end
    object actElectricInvoice: TAction
      Category = 'Finance'
      Caption = 'actElectricInvoice'
    end
    object actCashFlow: TAction
      Category = 'Accounting'
      Caption = '&Cash Flow'
    end
    object actCashBalance: TAction
      Category = 'Accounting'
      Caption = 'Cash Ba&lance'
    end
    object actDailyBalance: TAction
      Category = 'Accounting'
      Caption = '&Daily Balance'
    end
    object actPaymentClaimTransfer: TAction
      Category = 'Finance'
      Caption = 'actPaymentClaimTransfer'
    end
    object actElectricPayment: TAction
      Category = 'Finance'
      Caption = 'actElectricPayment'
    end
    object actQuotation: TAction
      Category = 'Merchandise'
      Caption = 'actQuotation'
    end
    object actMarkUpSellingPrice: TAction
      Category = 'Merchandise'
      Caption = 'Markup Selling Price'
    end
    object actHistoryPrice: TAction
      Category = 'Merchandise'
      Caption = 'History Price'
    end
    object actListingAgreement: TAction
      Category = 'Finance'
      Caption = 'Listing Agreement'
    end
    object actInvoiceAssgros: TAction
      Category = 'Finance'
      Caption = 'Invoice AsGross'
    end
    object actPaymentAssgros: TAction
      Category = 'Finance'
      Caption = 'Payment Assgros'
    end
    object actListDoOutstanding: TAction
      Category = 'Finance'
      Caption = 'actListDoOutstanding'
    end
    object actListingAgingInvoiceAssgros: TAction
      Category = 'Finance'
      Caption = 'actListingAgingInvoiceAssgros'
    end
    object actListAPPayment: TAction
      Category = 'Finance'
      Caption = 'actListAPPayment'
    end
    object actListClaimFakturPajak: TAction
      Category = 'Finance'
      Caption = 'actListClaimFakturPajak'
    end
    object actPendingCekOutCekAPNBD: TAction
      Category = 'Finance'
      Caption = 'actPendingCekOutCekAPNBD'
    end
    object actListingReceipt: TAction
      Category = 'Finance'
      Caption = 'actListingReceipt'
    end
    object actListingGeneralLedger: TAction
      Category = 'Accounting'
      Caption = 'actListingGeneralLedger'
    end
    object actListCNOutstanding: TAction
      Category = 'Finance'
      Caption = 'List CN Outstanding'
    end
    object actListMonthlyDepreciation: TAction
      Category = 'Accounting'
      Caption = 'List Monthly Depreciation'
    end
    object actListChequeGiroRegister: TAction
      Category = 'Finance'
      Caption = 'actListChequeGiroRegister'
    end
    object actCustomerVoucher: TAction
      Category = 'Marketing'
      Caption = 'Customer Voucher'
    end
    object actAgreementVoucher: TAction
      Category = 'Marketing'
      Caption = 'Agreement Voucher'
    end
    object actGenerateVoucher: TAction
      Category = 'Marketing'
      Caption = 'Generate Voucher'
    end
    object actListQuotation: TAction
      Category = 'Merchandise'
      Caption = 'actListQuotation'
    end
    object actListBankDeposit: TAction
      Category = 'Finance'
      Caption = 'actListBankDeposit'
    end
    object actJournalAutomaticFinance: TAction
      Category = 'Finance'
      Caption = 'Journal Automatic Finance'
    end
    object actListScheduleAgreement: TAction
      Category = 'Finance'
      Caption = 'actListScheduleAgreement'
    end
    object actDailySalesReport: TAction
      Category = 'Finance'
      Caption = 'actDailySalesReport'
    end
    object actPrintWorksheet: TAction
      Category = 'Finance'
      Caption = 'actPrintWorksheet'
    end
    object actCashierCollectionReport: TAction
      Category = 'Finance'
      Caption = 'actCashierCollectionReport'
    end
    object actListRecapCreditDebetCard: TAction
      Category = 'Finance'
      Caption = 'actListRecapCreditDebetCard'
    end
    object actPrintPurchaseOrder: TAction
      Category = 'Finance'
      Caption = 'actPrintPurchaseOrder'
    end
    object actListingPOByMerchandisingGroup: TAction
      Category = 'Finance'
      Caption = 'actListingPOByMerchandisingGroup'
    end
    object actPrintRecapitulationPO: TAction
      Category = 'Finance'
      Caption = 'actPrintRecapitulationPO'
    end
    object actHistoryPO: TAction
      Category = 'Finance'
      Caption = 'actHistoryPO'
    end
    object actPrintHistoryPOBySupplier: TAction
      Category = 'Finance'
      Caption = 'actPrintHistoryPOBySupplier'
    end
    object actListPOCancel: TAction
      Category = 'Finance'
      Caption = 'actListPOCancel'
    end
    object actListingReceivingProduct: TAction
      Category = 'Finance'
      Caption = 'actListingReceivingProduct'
    end
    object actRekapitulasiCN: TAction
      Category = 'Finance'
      Caption = 'actRekapitulasiCN'
    end
    object actListAdjustmentProduct: TAction
      Category = 'Finance'
      Caption = 'actListAdjustmentProduct'
    end
    object actListOutstandingDOAssgros: TAction
      Category = 'Finance'
      Caption = 'actListOutstandingDOAssgros'
    end
    object actListPODOReceive: TAction
      Category = 'Finance'
      Caption = 'actListPODOReceive'
    end
    object actListOmzet: TAction
      Category = 'Finance'
      Caption = 'actListOmzet'
    end
    object actSalesReportContrabon: TAction
      Category = 'Finance'
      Caption = 'actSalesReportContrabon'
    end
    object actDailySalesAnalysis: TAction
      Category = 'Finance'
      Caption = 'actDailySalesAnalysis'
    end
    object actListCNDamage: TAction
      Category = 'Finance'
      Caption = 'actListCNDamage'
    end
    object actListCashBalance: TAction
      Category = 'Accounting'
      Caption = 'Listing Cash Balance'
    end
    object actListProduct: TAction
      Category = 'Merchandise'
      Caption = 'Listing Product'
    end
    object actListSupplier: TAction
      Category = 'Merchandise'
      Caption = 'Listing Supplier'
    end
    object actSupplierNBD: TAction
      Category = 'Merchandise'
      Caption = 'actSupplierNBD'
    end
    object actListInvoice: TAction
      Category = 'Finance'
      Caption = 'Listing Invoice'
    end
    object actPriceConfirmation: TAction
      Category = 'Merchandise'
      Caption = 'Price Confirmation'
    end
    object actListChangeSellingPrice: TAction
      Category = 'Merchandise'
      Caption = 'List Change Selling Price'
    end
    object actAturanBonus: TAction
      Category = 'Merchandise'
      Caption = 'actAturanBonus'
    end
    object actQuotationPromo: TAction
      Category = 'Merchandise'
      Caption = 'actQuotationPromo'
    end
    object actSettingJurnal: TAction
      Category = 'EOD'
      Caption = 'actSettingJurnal'
    end
    object actGenerateJurnal: TAction
      Category = 'EOD'
      Caption = 'actGenerateJurnal'
    end
    object actQuotationHargaBeli: TAction
      Category = 'Merchandise'
      Caption = 'actQuotationHargaBeli'
    end
    object actGenerateJurnalManual: TAction
      Category = 'EOD'
      Caption = 'actGenerateJurnalManual'
    end
    object actTransaksiJurnal: TAction
      Category = 'Accounting'
      Caption = 'actTransaksiJurnal'
    end
    object actPurchaseSuggestion: TAction
      Category = 'Merchandise'
      Caption = 'actPurchaseSuggestion'
    end
    object actGenPO: TAction
      Category = 'Merchandise'
      Caption = 'actGenPO'
    end
    object actPrintPO: TAction
      Category = 'Merchandise'
      Caption = 'actPrintPO'
    end
    object actApprovalPO: TAction
      Category = 'Merchandise'
      Caption = 'actApprovalPO'
    end
    object actCancPO: TAction
      Category = 'Merchandise'
      Caption = 'actCancPO'
    end
    object actDispPO: TAction
      Category = 'Merchandise'
      Caption = 'actDispPO'
    end
    object actChangeStatPO: TAction
      Category = 'Merchandise'
      Caption = 'actChangeStatPO'
    end
    object actActionList: TAction
      Category = 'Management User'
      Caption = 'actActionList'
    end
    object actSysParameter: TAction
      Caption = 'actSysParameter'
    end
    object actSupplierGroup: TAction
      Category = 'Merchandise'
      Caption = 'SupplierGroup'
    end
    object actReprintNP: TAction
      Caption = 'actReprintNP'
    end
    object actJurnal: TAction
      Category = 'Accounting'
      Caption = 'actJurnal'
    end
    object actListingProductNBD: TAction
      Caption = 'Listing Produk NBD'
    end
    object actRumusJurnal: TAction
      Caption = 'Rumus Jurnal'
    end
    object actPkmAvg: TAction
      Caption = 'PKM Average'
    end
    object actListQuotMailer: TAction
      Caption = 'Listing Quotation Mailer'
    end
    object actListQuotHargaBeli: TAction
      Caption = 'Listing Quotation Harga Beli'
    end
    object actEODHO: TAction
      Caption = 'EOD HO'
    end
    object actMasterSupNBD: TAction
      Caption = 'actMasterSupNBD'
    end
    object actListBankBalance: TAction
      Caption = 'actListBankBalance'
    end
    object actBankDeposit: TAction
      Caption = 'actBankDeposit'
    end
    object actDetilAgrment: TAction
      Caption = 'actDetilAgrment'
    end
    object actUserGroupMerchan: TAction
      Category = 'Management User'
      Caption = 'actUserGroupMerchan'
    end
    object actSuplierUnitLeadTime: TAction
      Category = 'Merchandise'
      Caption = 'actSuplierUnitLeadTime'
    end
    object actUnitLeadTime: TAction
      Category = 'Merchandise'
      Caption = 'actUnitLeadTime'
    end
    object actLaporanKonsinyasi: TAction
      Category = 'Inventory'
      Caption = 'Laporan Konsinyasi'
    end
    object actLapInvMovementQty: TAction
      Category = 'Inventory'
      Caption = 'Laporan Inventory Movement Qty'
    end
    object actDisplayPO: TAction
      Category = 'Merchandise'
      Caption = 'actDisplayPO'
    end
    object actUbahQtyDisk: TAction
      Category = 'Merchandise'
      Caption = 'actUbahQtyDisk'
    end
    object actLaporanKonsinyasiAll: TAction
      Category = 'Inventory'
      Caption = 'actLaporanKonsinyasiAll'
    end
    object actLaporanMutasiKeluar: TAction
      Category = 'Inventory'
      Caption = 'actLaporanMutasiKeluar'
    end
    object actLaporanMutasiMasuk: TAction
      Category = 'Inventory'
      Caption = 'actLaporanMutasiMasuk'
    end
    object actStatusEximp: TAction
      Category = 'EOD'
      Caption = 'actStatusEximp'
    end
    object actLapReturSup: TAction
      Category = 'Inventory'
      Caption = 'actLapReturSup'
    end
    object actLaporanTransaksiDetil: TAction
      Category = 'Finance'
      Caption = 'actLaporanTransaksiDetil'
    end
    object actAuthor: TAction
      Category = 'References'
      Caption = 'actAuthor'
    end
    object actSOconsole: TAction
      Category = 'Inventory'
      Caption = 'actSOconsole'
    end
    object actPOBonus: TAction
      Category = 'Merchandise'
      Caption = 'actPOBonus'
    end
  end
end
