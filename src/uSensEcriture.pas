unit uSensEcriture;

interface

type
{$SCOPEDENUMS ON}
  TSensEcriture = (Depense, Recette);
{$SCOPEDENUMS ON}
function getSensEcritureFromPlusMoins(ASens: char): TSensEcriture;
function getPlusMoinsFromSensEcriture(ASensEcriture: TSensEcriture): char;

implementation

uses
  system.SysUtils;

function getSensEcritureFromPlusMoins(ASens: char): TSensEcriture;
begin
  if ASens = '+' then
    result := TSensEcriture.Recette
  else if ASens = '-' then
    result := TSensEcriture.Depense
  else
    raise exception.create('sens d''ecriture "' + ASens + '" inconnu');
end;

function getPlusMoinsFromSensEcriture(ASensEcriture: TSensEcriture): char;
begin
  case ASensEcriture of
    TSensEcriture.Depense:
      result := '-';
    TSensEcriture.Recette:
      result := '+';
  else
    raise exception.create('sens d''ecriture inconnu');
  end;
end;

end.
