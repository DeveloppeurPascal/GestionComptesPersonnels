(* C2PP
  ***************************************************************************

  Gestion de Comptes Personnels

  Copyright 2022-2025 Patrick PREMARTIN under AGPL 3.0 license.

  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
  THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
  FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
  DEALINGS IN THE SOFTWARE.

  ***************************************************************************

  Author(s) :
  Patrick PREMARTIN

  Site :
  https://comptespersonnels.olfsoftware.fr

  Project site :
  https://github.com/DeveloppeurPascal/GestionComptesPersonnels

  ***************************************************************************
  File last update : 2025-10-16T10:44:30.950+02:00
  Signature : 615e3f2d6459e9158c9fcd7ea5392abd0d8d0609
  ***************************************************************************
*)

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
