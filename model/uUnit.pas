unit uUnit;

interface
uses
  uModApp;

type
  TModUnit = class(TModApp)
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


{ TModUnit }

class function TModUnit.GetTableName: String;
begin
  Result := 'TUNIT';
end;

initialization
  TModUnit.RegisterRTTI;
end.
