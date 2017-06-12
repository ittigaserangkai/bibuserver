unit uIndikator;

interface
uses
  uModApp, uUnit;

type
  TModIndikator = class(TModApp)
  private
    FKODE: string;
    FNAMA: string;
  public
    class function GetTableName: String; override;
  published
    [AttributeOfCode]
    property KODE: string read FKODE write FKODE;
    property NAMA: string read FNAMA write FNAMA;

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
