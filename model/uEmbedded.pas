unit uEmbedded;

interface

uses
  uModApp, uUnit, uUser, System.Generics.Defaults, System.Generics.Collections;

type
  TModEmbeddedUnit = class;

  TModEmbedded = class(TModApp)
  private
    FREPORTNAME: string;
    FEMBEDDED_LINK: string;
    FIS_HOME: Boolean;
    FGROUPNAME: string;
    FORDERINDEX: Integer;
    FICON: string;
    FUNITS: TObjectList<TModEmbeddedUnit>;
    function GetUNITS: TObjectList<TModEmbeddedUnit>;
  public
    class function GetTableName: String; override;
    property UNITS: TObjectList<TModEmbeddedUnit> read GetUNITS write FUNITS;
  published
    property REPORTNAME: string read FREPORTNAME write FREPORTNAME;
    property EMBEDDED_LINK: string read FEMBEDDED_LINK write FEMBEDDED_LINK;
    property IS_HOME: Boolean read FIS_HOME write FIS_HOME;
    property GROUPNAME: string read FGROUPNAME write FGROUPNAME;
    property ORDERINDEX: Integer read FORDERINDEX write FORDERINDEX;
    property ICON: string read FICON write FICON;

  end;


  TModEmbeddedUnit = class(TModApp)
  private
    FEMBEDDEDREPORT: TModEmbedded;
    FEMBEDDEDUNIT: TModUnit;
  public
    class function GetTableName: String; override;
  published
    [AttributeofHeader]
    property EMBEDDEDREPORT: TModEmbedded read FEMBEDDEDREPORT write
        FEMBEDDEDREPORT;
    property EMBEDDEDUNIT: TModUnit read FEMBEDDEDUNIT write FEMBEDDEDUNIT;

  end;

implementation

{ TModEmbedded }

class function TModEmbedded.GetTableName: String;
begin
  Result := 'TEmbeddedReport';
end;

{
************************************************************* TModEmbedded *************************************************************
}
function TModEmbedded.GetUNITS: TObjectList<TModEmbeddedUnit>;
begin
  if FUNITS = nil then
    FUNITS := TObjectList<TModEmbeddedUnit>.Create;

  Result := FUNITS;
end;

{ TModEmbeddedUnit }

class function TModEmbeddedUnit.GetTableName: String;
begin
  Result := 'TEmbeddedReportUnit';
end;

initialization
  TModEmbedded.RegisterRTTI;
  TModEmbeddedUnit.RegisterRTTI;

end.
