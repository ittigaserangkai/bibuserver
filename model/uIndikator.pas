unit uIndikator;

interface
uses
  uModApp, uUnit;

type
  TModIndikator = class(TModApp)
  private
    FKODE: string;
    FINDIKATOR: string;
    FUNITUSAHA : TModUnit;
  public
    class function GetTableName: String; override;
  published
    [AttributeOfCode]
    property KODE: string read FKODE write FKODE;
    property INDIKATOR: string read FINDIKATOR write FINDIKATOR;

    [AttributeOfForeign('UNIT')]
    property UNITUSAHA: TModUnit read FUNITUSAHA write FUNITUSAHA;

  end;

implementation


{ TModIndikator }

class function TModIndikator.GetTableName: String;
begin
  Result := 'TIndikator';
end;

initialization
  TModIndikator.RegisterRTTI;
end.
