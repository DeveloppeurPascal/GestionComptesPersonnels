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
  Signature : 1fa60405e5dd2c6758c288ed687cac4de364e8af
  ***************************************************************************
*)

unit uDateTools;

interface

function DateToAAAAMMJJ(ADate: TDate): string;

function AAAAMMJJToDate(AAAAAMMJJ: string): TDate;

implementation

uses
  System.SysUtils;

function DateToAAAAMMJJ(ADate: TDate): string;
begin
  result := formatdatetime('yyyymmdd', ADate);
end;

function AAAAMMJJToDate(AAAAAMMJJ: string): TDate;
begin
  result := EncodeDate(AAAAAMMJJ.Substring(0, 4).ToInteger,
    AAAAAMMJJ.Substring(4, 2).ToInteger, AAAAAMMJJ.Substring(6, 2).ToInteger);
end;

end.
