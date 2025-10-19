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
  File last update : 2025-10-16T10:44:30.965+02:00
  Signature : be04e8b3cc0c606e355881848521001d228bb264
  ***************************************************************************
*)

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
