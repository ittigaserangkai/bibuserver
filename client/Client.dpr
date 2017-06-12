program Client;

uses
  Vcl.Forms,
  ClientClassesUnit in 'ClientClassesUnit.pas',
  ClientModuleUnit in 'ClientModuleUnit.pas' {ClientModule: TDataModule},
  ufrmMain in 'ufrmMain.pas' {frmMain},
  uCPR in '..\model\uCPR.pas',
  uIndikator in '..\model\uIndikator.pas',
  uModApp in '..\model\uModApp.pas',
  uUnit in '..\model\uUnit.pas',
  HPHELP in '..\lib\HPHELP.PAS',
  uAppUtils in '..\lib\uAppUtils.pas',
  uConn in '..\lib\uConn.pas',
  uDBUtils in '..\lib\uDBUtils.pas',
  uDSUtils in '..\lib\uDSUtils.pas',
  uNetUtils in '..\lib\uNetUtils.pas',
  uSpell in '..\lib\uSpell.pas',
  uTSINIFile in '..\lib\uTSINIFile.pas',
  uConstanta in '..\server\unit\uConstanta.pas',
  uDXUtils in '..\lib\uDXUtils.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TClientModule, ClientModule);
  Application.Run;
end.
