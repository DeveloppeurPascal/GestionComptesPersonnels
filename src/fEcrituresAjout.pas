unit fEcrituresAjout;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts, FMX.EditBox,
  FMX.NumberBox, FMX.Edit, FMX.DateTimeCtrls, FMX.ListBox, uSensEcriture, uDB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TfrmEcrituresAjout = class(TForm)
    Layout1: TLayout;
    btnOk: TButton;
    btnCancel: TButton;
    lblCategorie: TLabel;
    cbCategorie: TComboBox;
    VertScrollBox1: TVertScrollBox;
    lblDate: TLabel;
    edtDate: TDateEdit;
    lblLibelle: TLabel;
    lblMontant: TLabel;
    edtLibelle: TEdit;
    edtMontant: TNumberBox;
    qryCategories: TFDQuery;
    procedure btnCancelClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FSensEcriture: TSensEcriture;
    FCompte_ID: integer;
    FonActionSuiteAAjout: TNotifyEvent;
    procedure SetCompte_ID(const Value: integer);
    procedure SetSensEcriture(const Value: TSensEcriture);
    procedure SetonActionSuiteAAjout(const Value: TNotifyEvent);
    { Déclarations privées }
  public
    { Déclarations publiques }
    property Compte_ID: integer read FCompte_ID write SetCompte_ID;
    property SensEcriture: TSensEcriture read FSensEcriture
      write SetSensEcriture;
    property onActionSuiteAAjout: TNotifyEvent read FonActionSuiteAAjout
      write SetonActionSuiteAAjout;
    class procedure execute(ACompte_ID: integer; ASensEcriture: TSensEcriture;
      AOkAction: TNotifyEvent);
  end;

var
  frmEcrituresAjout: TfrmEcrituresAjout;

implementation

{$R *.fmx}

uses uDateTools;

procedure TfrmEcrituresAjout.btnCancelClick(Sender: TObject);
begin
  close;
end;

procedure TfrmEcrituresAjout.btnOkClick(Sender: TObject);
begin
  if cbCategorie.ItemIndex = -1 then
  begin
    cbCategorie.SetFocus;
    raise exception.Create('Catégorie obligatoire !');
  end;
  if edtLibelle.Text.IsEmpty then
  begin
    edtLibelle.SetFocus;
    raise exception.Create('Libellé obligatoire !');
  end;
  if edtMontant.Value = 0 then
  begin
    edtMontant.SetFocus;
    raise exception.Create('Montant obligatoire !');
  end;
  DB.tabEcritures.Insert;
  DB.tabEcritures.fieldbyname('compte_id').AsInteger := Compte_ID;
  DB.tabEcritures.fieldbyname('categorie_id').AsInteger := cbCategorie.ListItems
    [cbCategorie.ItemIndex].Tag;
  DB.tabEcritures.fieldbyname('libelle').AsString := edtLibelle.Text;
  DB.tabEcritures.fieldbyname('montant').AsCurrency := edtMontant.Value;
  DB.tabEcritures.fieldbyname('date').AsString := DateToaaAAMMJJ(edtDate.Date);
  DB.tabEcritures.fieldbyname('sens').AsString :=
    getPlusMoinsFromSensEcriture(SensEcriture);
  DB.tabEcritures.post;
  if assigned(FonActionSuiteAAjout) then
    FonActionSuiteAAjout(Sender);
  close;
end;

class procedure TfrmEcrituresAjout.execute(ACompte_ID: integer;
  ASensEcriture: TSensEcriture; AOkAction: TNotifyEvent);
var
  f: TfrmEcrituresAjout;
begin
  f := TfrmEcrituresAjout.Create(application.mainform);
  f.Compte_ID := ACompte_ID;
  f.SensEcriture := ASensEcriture;
  f.onActionSuiteAAjout := AOkAction;
{$IF Defined(ANDROID) or Defined(IOS)}
  f.Show;
{$ELSE}
  f.showmodal;
{$ENDIF}
end;

procedure TfrmEcrituresAjout.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  tthread.ForceQueue(nil,
    procedure
    begin
      self.Free;
    end);
end;

procedure TfrmEcrituresAjout.FormCreate(Sender: TObject);
begin
  cbCategorie.beginupdate;
  cbCategorie.Items.Clear;
  qryCategories.Open;
  try
    while not qryCategories.eof do
    begin
      cbCategorie.ListItems
        [cbCategorie.Items.Add(qryCategories.fieldbyname('libelle').AsString)
        ].Tag := qryCategories.fieldbyname('id').AsInteger;
      qryCategories.Next;
    end;
  finally
    qryCategories.close;
  end;
  cbCategorie.endupdate;
  if cbCategorie.Count > 0 then
    cbCategorie.ItemIndex := 0;
end;

procedure TfrmEcrituresAjout.SetonActionSuiteAAjout(const Value: TNotifyEvent);
begin
  FonActionSuiteAAjout := Value;
end;

procedure TfrmEcrituresAjout.SetCompte_ID(const Value: integer);
begin
  FCompte_ID := Value;
end;

procedure TfrmEcrituresAjout.SetSensEcriture(const Value: TSensEcriture);
begin
  FSensEcriture := Value;
  if FSensEcriture = TSensEcriture.Depense then
    caption := 'Ajout d''une dépense'
  else
    caption := 'Ajout d''une recette';
end;

end.
