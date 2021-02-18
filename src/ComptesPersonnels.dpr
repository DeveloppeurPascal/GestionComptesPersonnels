program ComptesPersonnels;

uses
  System.StartUpCopy,
  FMX.Forms,
  fMain in 'fMain.pas' {frmMain},
  uDB in 'uDB.pas' {db: TDataModule},
  uDMStyle in 'uDMStyle.pas' {DMStyle: TDataModule},
  fCategories in 'fCategories.pas' {frmCategories},
  fComptes in 'fComptes.pas' {frmComptes},
  fEcritures in 'fEcritures.pas' {frmEcritures},
  fEcrituresAjout in 'fEcrituresAjout.pas' {frmEcrituresAjout},
  uSensEcriture in 'uSensEcriture.pas',
  uDateTools in 'uDateTools.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TDMStyle, DMStyle);
  Application.CreateForm(Tdb, db);
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
