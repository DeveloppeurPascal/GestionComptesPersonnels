unit fEcritures;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, System.Rtti, FMX.Grid.Style,
  Data.Bind.Controls, FMX.Layouts, FMX.Bind.Navigator, FMX.ScrollBox, FMX.Grid,
  System.ImageList, FMX.ImgList, uDB, Data.Bind.EngExt, FMX.Bind.DBEngExt,
  FMX.Bind.Grid, System.Bindings.Outputs, FMX.Bind.Editors,
  Data.Bind.Components, Data.Bind.Grid, Data.Bind.DBScope, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, FMX.ListBox;

type
  TfrmEcritures = class(TForm)
    btnRetour: TButton;
    StringGrid1: TStringGrid;
    BindNavigator1: TBindNavigator;
    Layout1: TLayout;
    btnAddRecette: TButton;
    btnAddDepense: TButton;
    ImageList1: TImageList;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    cbComptes: TComboBox;
    qryComptes: TFDQuery;
    qryEcritures: TFDQuery;
    BindSourceDB2: TBindSourceDB;
    qryEcrituresid: TFDAutoIncField;
    qryEcritureslibelle: TStringField;
    qryEcrituresmontant: TBCDField;
    qryEcrituressens: TStringField;
    qryEcrituresdate: TStringField;
    qryEcriturescategorie_id: TIntegerField;
    qryEcriturescompte_id: TIntegerField;
    qryEcriturescategorie_libelle: TStringField;
    LinkGridToDataSourceBindSourceDB2: TLinkGridToDataSource;
    qryEcrituresMontantPlusMoins: TCurrencyField;
    qryEcrituresDateNormale: TStringField;
    procedure btnRetourClick(Sender: TObject);
    procedure btnAddDepenseClick(Sender: TObject);
    procedure btnAddRecetteClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cbComptesChange(Sender: TObject);
    procedure qryEcrituresCalcFields(DataSet: TDataSet);
  private
    { Déclarations privées }
    procedure ActionSuiteAAjoutEcriture(Sender: TObject);
  public
    { Déclarations publiques }
  end;

var
  frmEcritures: TfrmEcritures;

implementation

{$R *.fmx}

uses fEcrituresAjout, uSensEcriture, uDateTools;

procedure TfrmEcritures.ActionSuiteAAjoutEcriture(Sender: TObject);
begin
  qryEcritures.Refresh;
end;

procedure TfrmEcritures.btnAddDepenseClick(Sender: TObject);
begin
  if (cbComptes.itemindex >= 0) then
    TfrmEcrituresAjout.execute(cbComptes.ListItems[cbComptes.itemindex].tag,
      tsensecriture.depense, ActionSuiteAAjoutEcriture);
end;

procedure TfrmEcritures.btnAddRecetteClick(Sender: TObject);
begin
  if (cbComptes.itemindex >= 0) then
    TfrmEcrituresAjout.execute(cbComptes.ListItems[cbComptes.itemindex].tag,
      tsensecriture.Recette, ActionSuiteAAjoutEcriture);
end;

procedure TfrmEcritures.btnRetourClick(Sender: TObject);
begin
  close;
end;

procedure TfrmEcritures.cbComptesChange(Sender: TObject);
begin
  if qryEcritures.Active then
    qryEcritures.close;
  if (cbComptes.itemindex >= 0) then
    qryEcritures.Open
      ('select ecritures.*, categories.libelle as categorie_libelle from ecritures left join categories where (ecritures.categorie_id=categories.id) and (compte_id=:ci) order by date desc,id',
      [cbComptes.ListItems[cbComptes.itemindex].tag]);
end;

procedure TfrmEcritures.FormShow(Sender: TObject);
begin
  cbComptes.beginupdate;
  cbComptes.Items.Clear;
  qryComptes.Open;
  try
    while not qryComptes.eof do
    begin
      cbComptes.ListItems[cbComptes.Items.Add(qryComptes.fieldbyname('libelle')
        .AsString)].tag := qryComptes.fieldbyname('id').AsInteger;
      qryComptes.Next;
    end;
  finally
    qryComptes.close;
  end;
  cbComptes.endupdate;
  if cbComptes.Count > 0 then
    cbComptes.itemindex := 0;
end;

procedure TfrmEcritures.qryEcrituresCalcFields(DataSet: TDataSet);
begin
  DataSet.fieldbyname('DateNormale').AsDateTime :=
    AAAAMMJJToDate(DataSet.fieldbyname('date').AsString);
  if DataSet.fieldbyname('sens').AsString = '-' then
    DataSet.fieldbyname('MontantPlusMoins').AsCurrency :=
      -1 * DataSet.fieldbyname('montant').AsCurrency
  else
    DataSet.fieldbyname('MontantPlusMoins').AsCurrency :=
      DataSet.fieldbyname('montant').AsCurrency;
end;

end.
