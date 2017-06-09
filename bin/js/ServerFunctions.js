// 
// Created by the DataSnap proxy generator.
// 6/8/2017 2:03:14 PM
// 

package com.embarcadero.javaandroid;

import java.util.Date;

public class DSProxy {
  public static class TServerMethods extends DSAdmin {
    public TServerMethods(DSRESTConnection Connection) {
      super(Connection);
    }
    
    
    private DSRESTParameterMetaData[] TServerMethods_EchoString_Metadata;
    private DSRESTParameterMetaData[] get_TServerMethods_EchoString_Metadata() {
      if (TServerMethods_EchoString_Metadata == null) {
        TServerMethods_EchoString_Metadata = new DSRESTParameterMetaData[]{
          new DSRESTParameterMetaData("Value", DSRESTParamDirection.Input, DBXDataTypes.WideStringType, "string"),
          new DSRESTParameterMetaData("", DSRESTParamDirection.ReturnValue, DBXDataTypes.WideStringType, "string"),
        };
      }
      return TServerMethods_EchoString_Metadata;
    }

    /**
     * @param Value [in] - Type on server: string
     * @return result - Type on server: string
     */
    public String EchoString(String Value) throws DBXException {
      DSRESTCommand cmd = getConnection().CreateCommand();
      cmd.setRequestType(DSHTTPRequestType.GET);
      cmd.setText("TServerMethods.EchoString");
      cmd.prepare(get_TServerMethods_EchoString_Metadata());
      cmd.getParameter(0).getValue().SetAsString(Value);
      getConnection().execute(cmd);
      return  cmd.getParameter(1).getValue().GetAsString();
    }
    
    
    private DSRESTParameterMetaData[] TServerMethods_ReverseString_Metadata;
    private DSRESTParameterMetaData[] get_TServerMethods_ReverseString_Metadata() {
      if (TServerMethods_ReverseString_Metadata == null) {
        TServerMethods_ReverseString_Metadata = new DSRESTParameterMetaData[]{
          new DSRESTParameterMetaData("Value", DSRESTParamDirection.Input, DBXDataTypes.WideStringType, "string"),
          new DSRESTParameterMetaData("", DSRESTParamDirection.ReturnValue, DBXDataTypes.WideStringType, "string"),
        };
      }
      return TServerMethods_ReverseString_Metadata;
    }

    /**
     * @param Value [in] - Type on server: string
     * @return result - Type on server: string
     */
    public String ReverseString(String Value) throws DBXException {
      DSRESTCommand cmd = getConnection().CreateCommand();
      cmd.setRequestType(DSHTTPRequestType.GET);
      cmd.setText("TServerMethods.ReverseString");
      cmd.prepare(get_TServerMethods_ReverseString_Metadata());
      cmd.getParameter(0).getValue().SetAsString(Value);
      getConnection().execute(cmd);
      return  cmd.getParameter(1).getValue().GetAsString();
    }
  }

  public static class TTestMethod extends DSAdmin {
    public TTestMethod(DSRESTConnection Connection) {
      super(Connection);
    }
    
    
    private DSRESTParameterMetaData[] TTestMethod_Hallo_Metadata;
    private DSRESTParameterMetaData[] get_TTestMethod_Hallo_Metadata() {
      if (TTestMethod_Hallo_Metadata == null) {
        TTestMethod_Hallo_Metadata = new DSRESTParameterMetaData[]{
          new DSRESTParameterMetaData("aTanggal", DSRESTParamDirection.Input, DBXDataTypes.DateTimeType, "TDateTime"),
          new DSRESTParameterMetaData("", DSRESTParamDirection.ReturnValue, DBXDataTypes.WideStringType, "string"),
        };
      }
      return TTestMethod_Hallo_Metadata;
    }

    /**
     * @param aTanggal [in] - Type on server: TDateTime
     * @return result - Type on server: string
     */
    public String Hallo(Date aTanggal) throws DBXException {
      DSRESTCommand cmd = getConnection().CreateCommand();
      cmd.setRequestType(DSHTTPRequestType.GET);
      cmd.setText("TTestMethod.Hallo");
      cmd.prepare(get_TTestMethod_Hallo_Metadata());
      cmd.getParameter(0).getValue().SetAsDateTime(aTanggal);
      getConnection().execute(cmd);
      return  cmd.getParameter(1).getValue().GetAsString();
    }
  }

  public static class TCrud extends DSAdmin {
    public TCrud(DSRESTConnection Connection) {
      super(Connection);
    }
    
    
    private DSRESTParameterMetaData[] TCrud_SaveToDB_Metadata;
    private DSRESTParameterMetaData[] get_TCrud_SaveToDB_Metadata() {
      if (TCrud_SaveToDB_Metadata == null) {
        TCrud_SaveToDB_Metadata = new DSRESTParameterMetaData[]{
          new DSRESTParameterMetaData("AObject", DSRESTParamDirection.Input, DBXDataTypes.JsonValueType, "TModApp"),
          new DSRESTParameterMetaData("", DSRESTParamDirection.ReturnValue, DBXDataTypes.BooleanType, "Boolean"),
        };
      }
      return TCrud_SaveToDB_Metadata;
    }

    /**
     * @param AObject [in] - Type on server: TModApp
     * @return result - Type on server: Boolean
     */
    public boolean SaveToDB(TJSONObject AObject) throws DBXException {
      DSRESTCommand cmd = getConnection().CreateCommand();
      cmd.setRequestType(DSHTTPRequestType.POST);
      cmd.setText("TCrud.SaveToDB");
      cmd.prepare(get_TCrud_SaveToDB_Metadata());
      cmd.getParameter(0).getValue().SetAsJSONValue(AObject);
      getConnection().execute(cmd);
      return  cmd.getParameter(1).getValue().GetAsBoolean();
    }
    
    
    private DSRESTParameterMetaData[] TCrud_DeleteFromDB_Metadata;
    private DSRESTParameterMetaData[] get_TCrud_DeleteFromDB_Metadata() {
      if (TCrud_DeleteFromDB_Metadata == null) {
        TCrud_DeleteFromDB_Metadata = new DSRESTParameterMetaData[]{
          new DSRESTParameterMetaData("AObject", DSRESTParamDirection.Input, DBXDataTypes.JsonValueType, "TModApp"),
          new DSRESTParameterMetaData("", DSRESTParamDirection.ReturnValue, DBXDataTypes.BooleanType, "Boolean"),
        };
      }
      return TCrud_DeleteFromDB_Metadata;
    }

    /**
     * @param AObject [in] - Type on server: TModApp
     * @return result - Type on server: Boolean
     */
    public boolean DeleteFromDB(TJSONObject AObject) throws DBXException {
      DSRESTCommand cmd = getConnection().CreateCommand();
      cmd.setRequestType(DSHTTPRequestType.POST);
      cmd.setText("TCrud.DeleteFromDB");
      cmd.prepare(get_TCrud_DeleteFromDB_Metadata());
      cmd.getParameter(0).getValue().SetAsJSONValue(AObject);
      getConnection().execute(cmd);
      return  cmd.getParameter(1).getValue().GetAsBoolean();
    }
    
    
    private DSRESTParameterMetaData[] TCrud_OpenQuery_Metadata;
    private DSRESTParameterMetaData[] get_TCrud_OpenQuery_Metadata() {
      if (TCrud_OpenQuery_Metadata == null) {
        TCrud_OpenQuery_Metadata = new DSRESTParameterMetaData[]{
          new DSRESTParameterMetaData("S", DSRESTParamDirection.Input, DBXDataTypes.WideStringType, "string"),
          new DSRESTParameterMetaData("", DSRESTParamDirection.ReturnValue, DBXDataTypes.TableType, "TDataSet"),
        };
      }
      return TCrud_OpenQuery_Metadata;
    }

    /**
     * @param S [in] - Type on server: string
     * @return result - Type on server: TDataSet
     */
    public TDataSet OpenQuery(String S) throws DBXException {
      DSRESTCommand cmd = getConnection().CreateCommand();
      cmd.setRequestType(DSHTTPRequestType.GET);
      cmd.setText("TCrud.OpenQuery");
      cmd.prepare(get_TCrud_OpenQuery_Metadata());
      cmd.getParameter(0).getValue().SetAsString(S);
      getConnection().execute(cmd);
      return (TDataSet) cmd.getParameter(1).getValue().GetAsTable();
    }
    
    
    private DSRESTParameterMetaData[] TCrud_Retrieve_Metadata;
    private DSRESTParameterMetaData[] get_TCrud_Retrieve_Metadata() {
      if (TCrud_Retrieve_Metadata == null) {
        TCrud_Retrieve_Metadata = new DSRESTParameterMetaData[]{
          new DSRESTParameterMetaData("ModClassName", DSRESTParamDirection.Input, DBXDataTypes.WideStringType, "string"),
          new DSRESTParameterMetaData("AID", DSRESTParamDirection.Input, DBXDataTypes.WideStringType, "string"),
          new DSRESTParameterMetaData("", DSRESTParamDirection.ReturnValue, DBXDataTypes.JsonValueType, "TModApp"),
        };
      }
      return TCrud_Retrieve_Metadata;
    }

    /**
     * @param ModClassName [in] - Type on server: string
     * @param AID [in] - Type on server: string
     * @return result - Type on server: TModApp
     */
    public TJSONObject Retrieve(String ModClassName, String AID) throws DBXException {
      DSRESTCommand cmd = getConnection().CreateCommand();
      cmd.setRequestType(DSHTTPRequestType.GET);
      cmd.setText("TCrud.Retrieve");
      cmd.prepare(get_TCrud_Retrieve_Metadata());
      cmd.getParameter(0).getValue().SetAsString(ModClassName);
      cmd.getParameter(1).getValue().SetAsString(AID);
      getConnection().execute(cmd);
      return (TJSONObject) cmd.getParameter(2).getValue().GetAsJSONValue();
    }
    
    
    private DSRESTParameterMetaData[] TCrud_GenerateCustomNo_Metadata;
    private DSRESTParameterMetaData[] get_TCrud_GenerateCustomNo_Metadata() {
      if (TCrud_GenerateCustomNo_Metadata == null) {
        TCrud_GenerateCustomNo_Metadata = new DSRESTParameterMetaData[]{
          new DSRESTParameterMetaData("aTableName", DSRESTParamDirection.Input, DBXDataTypes.WideStringType, "string"),
          new DSRESTParameterMetaData("aFieldName", DSRESTParamDirection.Input, DBXDataTypes.WideStringType, "string"),
          new DSRESTParameterMetaData("aCountDigit", DSRESTParamDirection.Input, DBXDataTypes.Int32Type, "Integer"),
          new DSRESTParameterMetaData("", DSRESTParamDirection.ReturnValue, DBXDataTypes.WideStringType, "string"),
        };
      }
      return TCrud_GenerateCustomNo_Metadata;
    }

    /**
     * @param aTableName [in] - Type on server: string
     * @param aFieldName [in] - Type on server: string
     * @param aCountDigit [in] - Type on server: Integer
     * @return result - Type on server: string
     */
    public String GenerateCustomNo(String aTableName, String aFieldName, int aCountDigit) throws DBXException {
      DSRESTCommand cmd = getConnection().CreateCommand();
      cmd.setRequestType(DSHTTPRequestType.GET);
      cmd.setText("TCrud.GenerateCustomNo");
      cmd.prepare(get_TCrud_GenerateCustomNo_Metadata());
      cmd.getParameter(0).getValue().SetAsString(aTableName);
      cmd.getParameter(1).getValue().SetAsString(aFieldName);
      cmd.getParameter(2).getValue().SetAsInt32(aCountDigit);
      getConnection().execute(cmd);
      return  cmd.getParameter(3).getValue().GetAsString();
    }
    
    
    private DSRESTParameterMetaData[] TCrud_GenerateNo_Metadata;
    private DSRESTParameterMetaData[] get_TCrud_GenerateNo_Metadata() {
      if (TCrud_GenerateNo_Metadata == null) {
        TCrud_GenerateNo_Metadata = new DSRESTParameterMetaData[]{
          new DSRESTParameterMetaData("aClassName", DSRESTParamDirection.Input, DBXDataTypes.WideStringType, "string"),
          new DSRESTParameterMetaData("", DSRESTParamDirection.ReturnValue, DBXDataTypes.WideStringType, "string"),
        };
      }
      return TCrud_GenerateNo_Metadata;
    }

    /**
     * @param aClassName [in] - Type on server: string
     * @return result - Type on server: string
     */
    public String GenerateNo(String aClassName) throws DBXException {
      DSRESTCommand cmd = getConnection().CreateCommand();
      cmd.setRequestType(DSHTTPRequestType.GET);
      cmd.setText("TCrud.GenerateNo");
      cmd.prepare(get_TCrud_GenerateNo_Metadata());
      cmd.getParameter(0).getValue().SetAsString(aClassName);
      getConnection().execute(cmd);
      return  cmd.getParameter(1).getValue().GetAsString();
    }
    
    
    private DSRESTParameterMetaData[] TCrud_RetrieveSingle_Metadata;
    private DSRESTParameterMetaData[] get_TCrud_RetrieveSingle_Metadata() {
      if (TCrud_RetrieveSingle_Metadata == null) {
        TCrud_RetrieveSingle_Metadata = new DSRESTParameterMetaData[]{
          new DSRESTParameterMetaData("ModClassName", DSRESTParamDirection.Input, DBXDataTypes.WideStringType, "string"),
          new DSRESTParameterMetaData("AID", DSRESTParamDirection.Input, DBXDataTypes.WideStringType, "string"),
          new DSRESTParameterMetaData("", DSRESTParamDirection.ReturnValue, DBXDataTypes.JsonValueType, "TModApp"),
        };
      }
      return TCrud_RetrieveSingle_Metadata;
    }

    /**
     * @param ModClassName [in] - Type on server: string
     * @param AID [in] - Type on server: string
     * @return result - Type on server: TModApp
     */
    public TJSONObject RetrieveSingle(String ModClassName, String AID) throws DBXException {
      DSRESTCommand cmd = getConnection().CreateCommand();
      cmd.setRequestType(DSHTTPRequestType.GET);
      cmd.setText("TCrud.RetrieveSingle");
      cmd.prepare(get_TCrud_RetrieveSingle_Metadata());
      cmd.getParameter(0).getValue().SetAsString(ModClassName);
      cmd.getParameter(1).getValue().SetAsString(AID);
      getConnection().execute(cmd);
      return (TJSONObject) cmd.getParameter(2).getValue().GetAsJSONValue();
    }
    
    
    private DSRESTParameterMetaData[] TCrud_RetrieveByCode_Metadata;
    private DSRESTParameterMetaData[] get_TCrud_RetrieveByCode_Metadata() {
      if (TCrud_RetrieveByCode_Metadata == null) {
        TCrud_RetrieveByCode_Metadata = new DSRESTParameterMetaData[]{
          new DSRESTParameterMetaData("ModClassName", DSRESTParamDirection.Input, DBXDataTypes.WideStringType, "string"),
          new DSRESTParameterMetaData("aCode", DSRESTParamDirection.Input, DBXDataTypes.WideStringType, "string"),
          new DSRESTParameterMetaData("", DSRESTParamDirection.ReturnValue, DBXDataTypes.JsonValueType, "TModApp"),
        };
      }
      return TCrud_RetrieveByCode_Metadata;
    }

    /**
     * @param ModClassName [in] - Type on server: string
     * @param aCode [in] - Type on server: string
     * @return result - Type on server: TModApp
     */
    public TJSONObject RetrieveByCode(String ModClassName, String aCode) throws DBXException {
      DSRESTCommand cmd = getConnection().CreateCommand();
      cmd.setRequestType(DSHTTPRequestType.GET);
      cmd.setText("TCrud.RetrieveByCode");
      cmd.prepare(get_TCrud_RetrieveByCode_Metadata());
      cmd.getParameter(0).getValue().SetAsString(ModClassName);
      cmd.getParameter(1).getValue().SetAsString(aCode);
      getConnection().execute(cmd);
      return (TJSONObject) cmd.getParameter(2).getValue().GetAsJSONValue();
    }
    
    
    private DSRESTParameterMetaData[] TCrud_SaveToDBLog_Metadata;
    private DSRESTParameterMetaData[] get_TCrud_SaveToDBLog_Metadata() {
      if (TCrud_SaveToDBLog_Metadata == null) {
        TCrud_SaveToDBLog_Metadata = new DSRESTParameterMetaData[]{
          new DSRESTParameterMetaData("AObject", DSRESTParamDirection.Input, DBXDataTypes.JsonValueType, "TModApp"),
          new DSRESTParameterMetaData("", DSRESTParamDirection.ReturnValue, DBXDataTypes.BooleanType, "Boolean"),
        };
      }
      return TCrud_SaveToDBLog_Metadata;
    }

    /**
     * @param AObject [in] - Type on server: TModApp
     * @return result - Type on server: Boolean
     */
    public boolean SaveToDBLog(TJSONObject AObject) throws DBXException {
      DSRESTCommand cmd = getConnection().CreateCommand();
      cmd.setRequestType(DSHTTPRequestType.POST);
      cmd.setText("TCrud.SaveToDBLog");
      cmd.prepare(get_TCrud_SaveToDBLog_Metadata());
      cmd.getParameter(0).getValue().SetAsJSONValue(AObject);
      getConnection().execute(cmd);
      return  cmd.getParameter(1).getValue().GetAsBoolean();
    }
    
    
    private DSRESTParameterMetaData[] TCrud_SaveToDBID_Metadata;
    private DSRESTParameterMetaData[] get_TCrud_SaveToDBID_Metadata() {
      if (TCrud_SaveToDBID_Metadata == null) {
        TCrud_SaveToDBID_Metadata = new DSRESTParameterMetaData[]{
          new DSRESTParameterMetaData("AObject", DSRESTParamDirection.Input, DBXDataTypes.JsonValueType, "TModApp"),
          new DSRESTParameterMetaData("", DSRESTParamDirection.ReturnValue, DBXDataTypes.WideStringType, "string"),
        };
      }
      return TCrud_SaveToDBID_Metadata;
    }

    /**
     * @param AObject [in] - Type on server: TModApp
     * @return result - Type on server: string
     */
    public String SaveToDBID(TJSONObject AObject) throws DBXException {
      DSRESTCommand cmd = getConnection().CreateCommand();
      cmd.setRequestType(DSHTTPRequestType.POST);
      cmd.setText("TCrud.SaveToDBID");
      cmd.prepare(get_TCrud_SaveToDBID_Metadata());
      cmd.getParameter(0).getValue().SetAsJSONValue(AObject);
      getConnection().execute(cmd);
      return  cmd.getParameter(1).getValue().GetAsString();
    }
    
    
    private DSRESTParameterMetaData[] TCrud_TestGenerateSQL_Metadata;
    private DSRESTParameterMetaData[] get_TCrud_TestGenerateSQL_Metadata() {
      if (TCrud_TestGenerateSQL_Metadata == null) {
        TCrud_TestGenerateSQL_Metadata = new DSRESTParameterMetaData[]{
          new DSRESTParameterMetaData("AObject", DSRESTParamDirection.Input, DBXDataTypes.JsonValueType, "TModApp"),
          new DSRESTParameterMetaData("", DSRESTParamDirection.ReturnValue, DBXDataTypes.JsonValueType, "TStrings"),
        };
      }
      return TCrud_TestGenerateSQL_Metadata;
    }

    /**
     * @param AObject [in] - Type on server: TModApp
     * @return result - Type on server: TStrings
     */
    public TJSONObject TestGenerateSQL(TJSONObject AObject) throws DBXException {
      DSRESTCommand cmd = getConnection().CreateCommand();
      cmd.setRequestType(DSHTTPRequestType.POST);
      cmd.setText("TCrud.TestGenerateSQL");
      cmd.prepare(get_TCrud_TestGenerateSQL_Metadata());
      cmd.getParameter(0).getValue().SetAsJSONValue(AObject);
      getConnection().execute(cmd);
      return (TJSONObject) cmd.getParameter(1).getValue().GetAsJSONValue();
    }
    
    
    private DSRESTParameterMetaData[] TCrud_AfterExecuteMethod_Metadata;
    private DSRESTParameterMetaData[] get_TCrud_AfterExecuteMethod_Metadata() {
      if (TCrud_AfterExecuteMethod_Metadata == null) {
        TCrud_AfterExecuteMethod_Metadata = new DSRESTParameterMetaData[]{
        };
      }
      return TCrud_AfterExecuteMethod_Metadata;
    }

    public void AfterExecuteMethod() throws DBXException {
      DSRESTCommand cmd = getConnection().CreateCommand();
      cmd.setRequestType(DSHTTPRequestType.GET);
      cmd.setText("TCrud.AfterExecuteMethod");
      cmd.prepare(get_TCrud_AfterExecuteMethod_Metadata());
      getConnection().execute(cmd);
      return;
    }
  }

  public static class TDSProvider extends DSAdmin {
    public TDSProvider(DSRESTConnection Connection) {
      super(Connection);
    }
    
    
    private DSRESTParameterMetaData[] TDSProvider_Indikator_GetDSLookup_Metadata;
    private DSRESTParameterMetaData[] get_TDSProvider_Indikator_GetDSLookup_Metadata() {
      if (TDSProvider_Indikator_GetDSLookup_Metadata == null) {
        TDSProvider_Indikator_GetDSLookup_Metadata = new DSRESTParameterMetaData[]{
          new DSRESTParameterMetaData("", DSRESTParamDirection.ReturnValue, DBXDataTypes.TableType, "TDataSet"),
        };
      }
      return TDSProvider_Indikator_GetDSLookup_Metadata;
    }

    /**
     * @return result - Type on server: TDataSet
     */
    public TDataSet Indikator_GetDSLookup() throws DBXException {
      DSRESTCommand cmd = getConnection().CreateCommand();
      cmd.setRequestType(DSHTTPRequestType.GET);
      cmd.setText("TDSProvider.Indikator_GetDSLookup");
      cmd.prepare(get_TDSProvider_Indikator_GetDSLookup_Metadata());
      getConnection().execute(cmd);
      return (TDataSet) cmd.getParameter(0).getValue().GetAsTable();
    }
    
    
    private DSRESTParameterMetaData[] TDSProvider_Unit_GetDSLookup_Metadata;
    private DSRESTParameterMetaData[] get_TDSProvider_Unit_GetDSLookup_Metadata() {
      if (TDSProvider_Unit_GetDSLookup_Metadata == null) {
        TDSProvider_Unit_GetDSLookup_Metadata = new DSRESTParameterMetaData[]{
          new DSRESTParameterMetaData("", DSRESTParamDirection.ReturnValue, DBXDataTypes.TableType, "TDataSet"),
        };
      }
      return TDSProvider_Unit_GetDSLookup_Metadata;
    }

    /**
     * @return result - Type on server: TDataSet
     */
    public TDataSet Unit_GetDSLookup() throws DBXException {
      DSRESTCommand cmd = getConnection().CreateCommand();
      cmd.setRequestType(DSHTTPRequestType.GET);
      cmd.setText("TDSProvider.Unit_GetDSLookup");
      cmd.prepare(get_TDSProvider_Unit_GetDSLookup_Metadata());
      getConnection().execute(cmd);
      return (TDataSet) cmd.getParameter(0).getValue().GetAsTable();
    }
    
    
    private DSRESTParameterMetaData[] TDSProvider_Indikator_GetDSOverview_Metadata;
    private DSRESTParameterMetaData[] get_TDSProvider_Indikator_GetDSOverview_Metadata() {
      if (TDSProvider_Indikator_GetDSOverview_Metadata == null) {
        TDSProvider_Indikator_GetDSOverview_Metadata = new DSRESTParameterMetaData[]{
          new DSRESTParameterMetaData("", DSRESTParamDirection.ReturnValue, DBXDataTypes.TableType, "TDataSet"),
        };
      }
      return TDSProvider_Indikator_GetDSOverview_Metadata;
    }

    /**
     * @return result - Type on server: TDataSet
     */
    public TDataSet Indikator_GetDSOverview() throws DBXException {
      DSRESTCommand cmd = getConnection().CreateCommand();
      cmd.setRequestType(DSHTTPRequestType.GET);
      cmd.setText("TDSProvider.Indikator_GetDSOverview");
      cmd.prepare(get_TDSProvider_Indikator_GetDSOverview_Metadata());
      getConnection().execute(cmd);
      return (TDataSet) cmd.getParameter(0).getValue().GetAsTable();
    }
    
    
    private DSRESTParameterMetaData[] TDSProvider_CPRSetting_GetDSLookup_Metadata;
    private DSRESTParameterMetaData[] get_TDSProvider_CPRSetting_GetDSLookup_Metadata() {
      if (TDSProvider_CPRSetting_GetDSLookup_Metadata == null) {
        TDSProvider_CPRSetting_GetDSLookup_Metadata = new DSRESTParameterMetaData[]{
          new DSRESTParameterMetaData("", DSRESTParamDirection.ReturnValue, DBXDataTypes.TableType, "TDataSet"),
        };
      }
      return TDSProvider_CPRSetting_GetDSLookup_Metadata;
    }

    /**
     * @return result - Type on server: TDataSet
     */
    public TDataSet CPRSetting_GetDSLookup() throws DBXException {
      DSRESTCommand cmd = getConnection().CreateCommand();
      cmd.setRequestType(DSHTTPRequestType.GET);
      cmd.setText("TDSProvider.CPRSetting_GetDSLookup");
      cmd.prepare(get_TDSProvider_CPRSetting_GetDSLookup_Metadata());
      getConnection().execute(cmd);
      return (TDataSet) cmd.getParameter(0).getValue().GetAsTable();
    }
    
    
    private DSRESTParameterMetaData[] TDSProvider_CPR_GetDSLookup_Metadata;
    private DSRESTParameterMetaData[] get_TDSProvider_CPR_GetDSLookup_Metadata() {
      if (TDSProvider_CPR_GetDSLookup_Metadata == null) {
        TDSProvider_CPR_GetDSLookup_Metadata = new DSRESTParameterMetaData[]{
          new DSRESTParameterMetaData("", DSRESTParamDirection.ReturnValue, DBXDataTypes.TableType, "TDataSet"),
        };
      }
      return TDSProvider_CPR_GetDSLookup_Metadata;
    }

    /**
     * @return result - Type on server: TDataSet
     */
    public TDataSet CPR_GetDSLookup() throws DBXException {
      DSRESTCommand cmd = getConnection().CreateCommand();
      cmd.setRequestType(DSHTTPRequestType.GET);
      cmd.setText("TDSProvider.CPR_GetDSLookup");
      cmd.prepare(get_TDSProvider_CPR_GetDSLookup_Metadata());
      getConnection().execute(cmd);
      return (TDataSet) cmd.getParameter(0).getValue().GetAsTable();
    }
    
    
    private DSRESTParameterMetaData[] TDSProvider_Unit_GetDSOverview_Metadata;
    private DSRESTParameterMetaData[] get_TDSProvider_Unit_GetDSOverview_Metadata() {
      if (TDSProvider_Unit_GetDSOverview_Metadata == null) {
        TDSProvider_Unit_GetDSOverview_Metadata = new DSRESTParameterMetaData[]{
          new DSRESTParameterMetaData("", DSRESTParamDirection.ReturnValue, DBXDataTypes.TableType, "TDataSet"),
        };
      }
      return TDSProvider_Unit_GetDSOverview_Metadata;
    }

    /**
     * @return result - Type on server: TDataSet
     */
    public TDataSet Unit_GetDSOverview() throws DBXException {
      DSRESTCommand cmd = getConnection().CreateCommand();
      cmd.setRequestType(DSHTTPRequestType.GET);
      cmd.setText("TDSProvider.Unit_GetDSOverview");
      cmd.prepare(get_TDSProvider_Unit_GetDSOverview_Metadata());
      getConnection().execute(cmd);
      return (TDataSet) cmd.getParameter(0).getValue().GetAsTable();
    }
    
    
    private DSRESTParameterMetaData[] TDSProvider_CPRSetting_GetDSOverview_Metadata;
    private DSRESTParameterMetaData[] get_TDSProvider_CPRSetting_GetDSOverview_Metadata() {
      if (TDSProvider_CPRSetting_GetDSOverview_Metadata == null) {
        TDSProvider_CPRSetting_GetDSOverview_Metadata = new DSRESTParameterMetaData[]{
          new DSRESTParameterMetaData("", DSRESTParamDirection.ReturnValue, DBXDataTypes.TableType, "TDataSet"),
        };
      }
      return TDSProvider_CPRSetting_GetDSOverview_Metadata;
    }

    /**
     * @return result - Type on server: TDataSet
     */
    public TDataSet CPRSetting_GetDSOverview() throws DBXException {
      DSRESTCommand cmd = getConnection().CreateCommand();
      cmd.setRequestType(DSHTTPRequestType.GET);
      cmd.setText("TDSProvider.CPRSetting_GetDSOverview");
      cmd.prepare(get_TDSProvider_CPRSetting_GetDSOverview_Metadata());
      getConnection().execute(cmd);
      return (TDataSet) cmd.getParameter(0).getValue().GetAsTable();
    }
    
    
    private DSRESTParameterMetaData[] TDSProvider_CPR_GetDSOverview_Metadata;
    private DSRESTParameterMetaData[] get_TDSProvider_CPR_GetDSOverview_Metadata() {
      if (TDSProvider_CPR_GetDSOverview_Metadata == null) {
        TDSProvider_CPR_GetDSOverview_Metadata = new DSRESTParameterMetaData[]{
          new DSRESTParameterMetaData("", DSRESTParamDirection.ReturnValue, DBXDataTypes.TableType, "TDataSet"),
        };
      }
      return TDSProvider_CPR_GetDSOverview_Metadata;
    }

    /**
     * @return result - Type on server: TDataSet
     */
    public TDataSet CPR_GetDSOverview() throws DBXException {
      DSRESTCommand cmd = getConnection().CreateCommand();
      cmd.setRequestType(DSHTTPRequestType.GET);
      cmd.setText("TDSProvider.CPR_GetDSOverview");
      cmd.prepare(get_TDSProvider_CPR_GetDSOverview_Metadata());
      getConnection().execute(cmd);
      return (TDataSet) cmd.getParameter(0).getValue().GetAsTable();
    }
  }

  public static class TDSReport extends DSAdmin {
    public TDSReport(DSRESTConnection Connection) {
      super(Connection);
    }
    
    
    private DSRESTParameterMetaData[] TDSReport_DO_GetDSNP_Metadata;
    private DSRESTParameterMetaData[] get_TDSReport_DO_GetDSNP_Metadata() {
      if (TDSReport_DO_GetDSNP_Metadata == null) {
        TDSReport_DO_GetDSNP_Metadata = new DSRESTParameterMetaData[]{
          new DSRESTParameterMetaData("ANONP", DSRESTParamDirection.Input, DBXDataTypes.WideStringType, "string"),
          new DSRESTParameterMetaData("", DSRESTParamDirection.ReturnValue, DBXDataTypes.JsonValueType, "TFDJSONDataSets"),
        };
      }
      return TDSReport_DO_GetDSNP_Metadata;
    }

    /**
     * @param ANONP [in] - Type on server: string
     * @return result - Type on server: TFDJSONDataSets
     */
    public TJSONObject DO_GetDSNP(String ANONP) throws DBXException {
      DSRESTCommand cmd = getConnection().CreateCommand();
      cmd.setRequestType(DSHTTPRequestType.GET);
      cmd.setText("TDSReport.DO_GetDSNP");
      cmd.prepare(get_TDSReport_DO_GetDSNP_Metadata());
      cmd.getParameter(0).getValue().SetAsString(ANONP);
      getConnection().execute(cmd);
      return (TJSONObject) cmd.getParameter(1).getValue().GetAsJSONValue();
    }
    
    
    private DSRESTParameterMetaData[] TDSReport_DO_GetDS_CheckList_Metadata;
    private DSRESTParameterMetaData[] get_TDSReport_DO_GetDS_CheckList_Metadata() {
      if (TDSReport_DO_GetDS_CheckList_Metadata == null) {
        TDSReport_DO_GetDS_CheckList_Metadata = new DSRESTParameterMetaData[]{
          new DSRESTParameterMetaData("ANONP", DSRESTParamDirection.Input, DBXDataTypes.WideStringType, "string"),
          new DSRESTParameterMetaData("", DSRESTParamDirection.ReturnValue, DBXDataTypes.JsonValueType, "TFDJSONDataSets"),
        };
      }
      return TDSReport_DO_GetDS_CheckList_Metadata;
    }

    /**
     * @param ANONP [in] - Type on server: string
     * @return result - Type on server: TFDJSONDataSets
     */
    public TJSONObject DO_GetDS_CheckList(String ANONP) throws DBXException {
      DSRESTCommand cmd = getConnection().CreateCommand();
      cmd.setRequestType(DSHTTPRequestType.GET);
      cmd.setText("TDSReport.DO_GetDS_CheckList");
      cmd.prepare(get_TDSReport_DO_GetDS_CheckList_Metadata());
      cmd.getParameter(0).getValue().SetAsString(ANONP);
      getConnection().execute(cmd);
      return (TJSONObject) cmd.getParameter(1).getValue().GetAsJSONValue();
    }
    
    
    private DSRESTParameterMetaData[] TDSReport_SO_ByDate_Metadata;
    private DSRESTParameterMetaData[] get_TDSReport_SO_ByDate_Metadata() {
      if (TDSReport_SO_ByDate_Metadata == null) {
        TDSReport_SO_ByDate_Metadata = new DSRESTParameterMetaData[]{
          new DSRESTParameterMetaData("StartDate", DSRESTParamDirection.Input, DBXDataTypes.DateTimeType, "TDateTime"),
          new DSRESTParameterMetaData("EndDate", DSRESTParamDirection.Input, DBXDataTypes.DateTimeType, "TDateTime"),
          new DSRESTParameterMetaData("", DSRESTParamDirection.ReturnValue, DBXDataTypes.JsonValueType, "TFDJSONDataSets"),
        };
      }
      return TDSReport_SO_ByDate_Metadata;
    }

    /**
     * @param StartDate [in] - Type on server: TDateTime
     * @param EndDate [in] - Type on server: TDateTime
     * @return result - Type on server: TFDJSONDataSets
     */
    public TJSONObject SO_ByDate(Date StartDate, Date EndDate) throws DBXException {
      DSRESTCommand cmd = getConnection().CreateCommand();
      cmd.setRequestType(DSHTTPRequestType.GET);
      cmd.setText("TDSReport.SO_ByDate");
      cmd.prepare(get_TDSReport_SO_ByDate_Metadata());
      cmd.getParameter(0).getValue().SetAsDateTime(StartDate);
      cmd.getParameter(1).getValue().SetAsDateTime(EndDate);
      getConnection().execute(cmd);
      return (TJSONObject) cmd.getParameter(2).getValue().GetAsJSONValue();
    }
    
    
    private DSRESTParameterMetaData[] TDSReport_SO_ByDateNoBukti_Metadata;
    private DSRESTParameterMetaData[] get_TDSReport_SO_ByDateNoBukti_Metadata() {
      if (TDSReport_SO_ByDateNoBukti_Metadata == null) {
        TDSReport_SO_ByDateNoBukti_Metadata = new DSRESTParameterMetaData[]{
          new DSRESTParameterMetaData("StartDate", DSRESTParamDirection.Input, DBXDataTypes.DateTimeType, "TDateTime"),
          new DSRESTParameterMetaData("EndDate", DSRESTParamDirection.Input, DBXDataTypes.DateTimeType, "TDateTime"),
          new DSRESTParameterMetaData("aNoBuktiAwal", DSRESTParamDirection.Input, DBXDataTypes.WideStringType, "string"),
          new DSRESTParameterMetaData("aNoBuktiAkhir", DSRESTParamDirection.Input, DBXDataTypes.WideStringType, "string"),
          new DSRESTParameterMetaData("", DSRESTParamDirection.ReturnValue, DBXDataTypes.JsonValueType, "TFDJSONDataSets"),
        };
      }
      return TDSReport_SO_ByDateNoBukti_Metadata;
    }

    /**
     * @param StartDate [in] - Type on server: TDateTime
     * @param EndDate [in] - Type on server: TDateTime
     * @param aNoBuktiAwal [in] - Type on server: string
     * @param aNoBuktiAkhir [in] - Type on server: string
     * @return result - Type on server: TFDJSONDataSets
     */
    public TJSONObject SO_ByDateNoBukti(Date StartDate, Date EndDate, String aNoBuktiAwal, String aNoBuktiAkhir) throws DBXException {
      DSRESTCommand cmd = getConnection().CreateCommand();
      cmd.setRequestType(DSHTTPRequestType.GET);
      cmd.setText("TDSReport.SO_ByDateNoBukti");
      cmd.prepare(get_TDSReport_SO_ByDateNoBukti_Metadata());
      cmd.getParameter(0).getValue().SetAsDateTime(StartDate);
      cmd.getParameter(1).getValue().SetAsDateTime(EndDate);
      cmd.getParameter(2).getValue().SetAsString(aNoBuktiAwal);
      cmd.getParameter(3).getValue().SetAsString(aNoBuktiAkhir);
      getConnection().execute(cmd);
      return (TJSONObject) cmd.getParameter(4).getValue().GetAsJSONValue();
    }
    
    
    private DSRESTParameterMetaData[] TDSReport_PO_SLIP_ByDateNoBukti_Metadata;
    private DSRESTParameterMetaData[] get_TDSReport_PO_SLIP_ByDateNoBukti_Metadata() {
      if (TDSReport_PO_SLIP_ByDateNoBukti_Metadata == null) {
        TDSReport_PO_SLIP_ByDateNoBukti_Metadata = new DSRESTParameterMetaData[]{
          new DSRESTParameterMetaData("StartDate", DSRESTParamDirection.Input, DBXDataTypes.DateTimeType, "TDateTime"),
          new DSRESTParameterMetaData("EndDate", DSRESTParamDirection.Input, DBXDataTypes.DateTimeType, "TDateTime"),
          new DSRESTParameterMetaData("aNoBuktiAwal", DSRESTParamDirection.Input, DBXDataTypes.WideStringType, "string"),
          new DSRESTParameterMetaData("aNoBuktiAkhir", DSRESTParamDirection.Input, DBXDataTypes.WideStringType, "string"),
          new DSRESTParameterMetaData("", DSRESTParamDirection.ReturnValue, DBXDataTypes.JsonValueType, "TFDJSONDataSets"),
        };
      }
      return TDSReport_PO_SLIP_ByDateNoBukti_Metadata;
    }

    /**
     * @param StartDate [in] - Type on server: TDateTime
     * @param EndDate [in] - Type on server: TDateTime
     * @param aNoBuktiAwal [in] - Type on server: string
     * @param aNoBuktiAkhir [in] - Type on server: string
     * @return result - Type on server: TFDJSONDataSets
     */
    public TJSONObject PO_SLIP_ByDateNoBukti(Date StartDate, Date EndDate, String aNoBuktiAwal, String aNoBuktiAkhir) throws DBXException {
      DSRESTCommand cmd = getConnection().CreateCommand();
      cmd.setRequestType(DSHTTPRequestType.GET);
      cmd.setText("TDSReport.PO_SLIP_ByDateNoBukti");
      cmd.prepare(get_TDSReport_PO_SLIP_ByDateNoBukti_Metadata());
      cmd.getParameter(0).getValue().SetAsDateTime(StartDate);
      cmd.getParameter(1).getValue().SetAsDateTime(EndDate);
      cmd.getParameter(2).getValue().SetAsString(aNoBuktiAwal);
      cmd.getParameter(3).getValue().SetAsString(aNoBuktiAkhir);
      getConnection().execute(cmd);
      return (TJSONObject) cmd.getParameter(4).getValue().GetAsJSONValue();
    }
    
    
    private DSRESTParameterMetaData[] TDSReport_SO_Test_Metadata;
    private DSRESTParameterMetaData[] get_TDSReport_SO_Test_Metadata() {
      if (TDSReport_SO_Test_Metadata == null) {
        TDSReport_SO_Test_Metadata = new DSRESTParameterMetaData[]{
          new DSRESTParameterMetaData("", DSRESTParamDirection.ReturnValue, DBXDataTypes.JsonValueType, "TFDJSONDataSets"),
        };
      }
      return TDSReport_SO_Test_Metadata;
    }

    /**
     * @return result - Type on server: TFDJSONDataSets
     */
    public TJSONObject SO_Test() throws DBXException {
      DSRESTCommand cmd = getConnection().CreateCommand();
      cmd.setRequestType(DSHTTPRequestType.GET);
      cmd.setText("TDSReport.SO_Test");
      cmd.prepare(get_TDSReport_SO_Test_Metadata());
      getConnection().execute(cmd);
      return (TJSONObject) cmd.getParameter(0).getValue().GetAsJSONValue();
    }
  }

}
