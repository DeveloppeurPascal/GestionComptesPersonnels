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
