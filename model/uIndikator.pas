unit uIndikator;

interface
uses
  uModApp, uUnit;

type
  TModIndikator = class(TModApp)
  private
    FKODE: string;
    FNAMA: string;
    FUNITUSAHA : TModUnit;
  public
    class function GetTableName: String; override;
  published
    [AttributeOfCode]
    property KODE: string read FKODE write FKODE;
    property NAMA: string read FNAMA write FNAMA;

    [AttributeOfForeign]
    property UNITUSAHA: TModUnit read FUNITUSAHA write FUNITUSAHA;

  end;

implementation


{ TModIndikator }

class function TModIndikator.GetTableName: String;
begin
  Result := 'TModIndikator';
end;

initialization
  TModIndikator.RegisterRTTI;
end.