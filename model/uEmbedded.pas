unit uEmbedded;

interface

uses
  uModApp;

type
  TModEmbedded = class(TModApp)
  private
    FREPORTNAME: string;
    FEMBEDDED_LINK: string;
    FIS_HOME: Boolean;
  public
    class function GetTableName: String; override;
  published
    property REPORTNAME: string read FREPORTNAME write FREPORTNAME;
    property EMBEDDED_LINK: string read FEMBEDDED_LINK write FEMBEDDED_LINK;
    property IS_HOME: Boolean read FIS_HOME write FIS_HOME;

  end;

implementation

{ TModEmbedded }

class function TModEmbedded.GetTableName: String;
begin
  Result := 'TEmbeddedReport';
end;

initialization
  TModEmbedded.RegisterRTTI;

end.
