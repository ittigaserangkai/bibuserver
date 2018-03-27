program BIBU;
{$APPTYPE GUI}

{$R *.dres}

uses
  Vcl.Forms,
  Web.WebReq,
  IdHTTPWebBrokerBridge,
  ufrmMain in 'ufrmMain.pas' {frmMain},
  ServerMethodsUnit in 'ServerMethodsUnit.pas' {ServerMethods: TDataModule},
  ServerContainerUnit in 'ServerContainerUnit.pas' {ServerContainer: TDataModule},
  WebModuleRetnoUnit in 'WebModuleRetnoUnit.pas' {WebModuleRetno: TWebModule},
  uDBUtils in '..\lib\uDBUtils.pas',
  uModApp in '..\model\uModApp.pas',
  uDSUtils in '..\lib\uDSUtils.pas',
  uTSINIFile in '..\lib\uTSINIFile.pas',
  uServerDSProvider in 'unit\uServerDSProvider.pas',
  uUnit in '..\model\uUnit.pas',
  uCPR in '..\model\uCPR.pas',
  uServerClasses in 'unit\uServerClasses.pas',
  uEmbedded in '..\model\uEmbedded.pas',
  uIndikator in '..\model\uIndikator.pas',
  uUser in '..\model\uUser.pas',
  uMRGroupReport in '..\model\uMRGroupReport.pas',
  uJSONUtils in 'unit\uJSONUtils.pas',
  uMR in '..\model\uMR.pas',
  uPNL in '..\model\uPNL.pas';

{$R *.res}


begin
  if WebRequestHandler <> nil then
    WebRequestHandler.WebModuleClass := WebModuleClass;

  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
