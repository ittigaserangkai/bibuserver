unit uIndikator;

interface
uses
  uModApp, uUnit;

type
  TModIndikator = class(TModApp)
  private
    FKODE: string;
    FINDIKATOR: string;
    FGROUP_INDIKATOR: string;
  public
    class function GetTableName: String; override;
  published
    [AttributeOfCode]
    property KODE: string read FKODE write FKODE;
    property INDIKATOR: string read FINDIKATOR write FINDIKATOR;
    [AttributeOfCode]
    property GROUP_INDIKATOR: string read FGROUP_INDIKATOR write FGROUP_INDIKATOR;

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
