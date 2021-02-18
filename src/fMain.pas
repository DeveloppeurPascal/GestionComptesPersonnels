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
