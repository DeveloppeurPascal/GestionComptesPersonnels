unit uDB;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.FMXUI.Wait,
  FireDAC.Stan.ExprFuncs, FireDAC.Phys.SQLiteWrapper.Stat,
  FireDAC.Phys.SQLiteDef, FireDAC.Comp.ScriptCommands, FireDAC.Stan.Util,
  FireDAC.Comp.Script, FireDAC.Phys.SQLite, Data.DB, FireDAC.Comp.Client,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet;

type
  Tdb = class(TDataModule)
    dbc: TFDConnection;
    FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink;
    FDScript1: TFDScript;
    tabComptes: TFDTable;
    tabEcritures: TFDTable;
    tabCategories: TFDTable;
    tabComptesid: TFDAutoIncField;
    tabCompteslibelle: TStringField;
    tabEcrituresid: TFDAutoIncField;
    tabEcritureslibelle: TStringField;
    tabEcrituresmontant: TBCDField;
    tabEcrituressens: TStringField;
    tabEcrituresdate: TStringField;
    tabEcriturescategorie_id: TIntegerField;
    tabEcriturescompte_id: TIntegerField;
    tabCategoriesid: TFDAutoIncField;
    tabCategorieslibelle: TStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure dbcBeforeConnect(Sender: TObject);
    procedure dbcAfterConnect(Sender: TObject);
  private
    { Déclarations privées }
    fCreateDatabase: boolean;
    function getDBFileName: string;
  public
    { Déclarations publiques }
  end;

var
  DB: Tdb;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}
{$R *.dfm}

uses
  System.IOUtils;

procedure Tdb.DataModuleCreate(Sender: TObject);
begin
  dbc.Open;
end;

procedure Tdb.dbcAfterConnect(Sender: TObject);
var
  version: integer;
  DBFileName, DBVersionFileName: string;
begin
  if fCreateDatabase then
  begin
    DBFileName := getDBFileName;
    DBVersionFileName := DBFileName.Replace('.db', '.ver');
    if tfile.Exists(DBVersionFileName) then
      version := tfile.ReadAllText(DBVersionFileName, tencoding.UTF8).ToInteger
    else
      version := -1;
    while version < FDScript1.SQLScripts.Count - 1 do
    begin
      inc(version);
      FDScript1.ExecuteScript(FDScript1.SQLScripts[version].SQL);
    end;
    tfile.WriteAllText(DBVersionFileName, version.ToString, tencoding.UTF8);
  end;
  tabComptes.Open;
  tabCategories.Open;
  tabEcritures.Open;
end;

procedure Tdb.dbcBeforeConnect(Sender: TObject);
var
  DBFileName: string;
begin
  DBFileName := getDBFileName;
  dbc.Params.Values['Database'] := DBFileName;
  fCreateDatabase := not tfile.Exists(DBFileName);
end;

function Tdb.getDBFileName: string;
begin
{$IFDEF DEBUG}
  result := tpath.Combine(tpath.GetDocumentsPath,
    'GestionComptesPersonnels-debug.db');
{$ELSE}
  result := tpath.Combine(tpath.GetDocumentsPath,
    'GestionComptesPersonnels.db');
{$ENDIF}
end;

end.
