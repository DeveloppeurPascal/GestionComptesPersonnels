unit uDMStyle;

interface

uses
  System.SysUtils, System.Classes, FMX.Types, FMX.Controls;

type
  TDMStyle = class(TDataModule)
    StyleBook1: TStyleBook;
  private
    { D�clarations priv�es }
  public
    { D�clarations publiques }
  end;

var
  DMStyle: TDMStyle;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

end.
