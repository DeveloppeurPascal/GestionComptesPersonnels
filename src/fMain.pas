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
  Signature : e8e828c876bb559fc0889c67674c5270f19bfea9
  ***************************************************************************
*)

unit fMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls;

type
  TfrmMain = class(TForm)
    btnComptes: TButton;
    btnCategories: TButton;
    btnEcritures: TButton;
    btnQuitter: TButton;
    procedure btnQuitterClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnComptesClick(Sender: TObject);
    procedure btnCategoriesClick(Sender: TObject);
    procedure btnEcrituresClick(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.fmx}

uses fComptes, fCategories, fEcritures;

procedure TfrmMain.btnCategoriesClick(Sender: TObject);
begin
  if not assigned(frmCategories) then
    frmCategories := TfrmCategories.Create(Self);
{$IF Defined(ANDROID) or Defined(IOS)}
  frmCategories.Show;
{$ELSE}
  frmCategories.showmodal;
{$ENDIF}
end;

procedure TfrmMain.btnComptesClick(Sender: TObject);
begin
  if not assigned(frmcomptes) then
    frmcomptes := TfrmComptes.Create(Self);
{$IF Defined(ANDROID) or Defined(IOS)}
  frmcomptes.Show;
{$ELSE}
  frmcomptes.showmodal;
{$ENDIF}
end;

procedure TfrmMain.btnEcrituresClick(Sender: TObject);
begin
  if not assigned(frmecritures) then
    frmecritures := Tfrmecritures.Create(Self);
{$IF Defined(ANDROID) or Defined(IOS)}
  frmecritures.Show;
{$ELSE}
  frmecritures.showmodal;
{$ENDIF}
end;

procedure TfrmMain.btnQuitterClick(Sender: TObject);
begin
  close;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
{$IF Defined(ANDROID) or Defined(IOS)}
  btnQuitter.Visible := false;
{$ENDIF}
end;

initialization

ReportMemoryLeaksOnShutdown := true;

end.
