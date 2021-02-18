unit fComptes;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, uDB,
  System.Rtti, FMX.Grid.Style, Data.Bind.Controls, FMX.StdCtrls, FMX.Layouts,
  FMX.Bind.Navigator, FMX.Controls.Presentation, FMX.ScrollBox, FMX.Grid,
  Data.Bind.EngExt, FMX.Bind.DBEngExt, FMX.Bind.Grid, System.Bindings.Outputs,
  FMX.Bind.Editors, Data.Bind.Components, Data.Bind.Grid, Data.Bind.DBScope;

type
  TfrmComptes = class(TForm)
    StringGrid1: TStringGrid;
    BindNavigator1: TBindNavigator;
    btnRetour: TButton;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    procedure btnRetourClick(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  frmComptes: TfrmComptes;

implementation

{$R *.fmx}

procedure TfrmComptes.btnRetourClick(Sender: TObject);
begin
  Close;
end;

end.
