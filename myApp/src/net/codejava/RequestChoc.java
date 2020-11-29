package net.codejava;

import java.util.*;
import javax.annotation.Resource;
import javax.jws.WebParam;
import javax.xml.ws.WebServiceContext;
import javax.jws.WebMethod;
import javax.jws.WebService;
import javax.jws.soap.SOAPBinding;
import javax.jws.soap.SOAPBinding.Style;
import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.SQLException;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

 
@WebService
@SOAPBinding(style = Style.RPC)
public class RequestChoc {
 @Resource
   private WebServiceContext ws;

    @WebMethod
    public String getReqChoc() {
     try {
      
      System.out.println("Java");
      Statement stmt = SetDB.getConnection().createStatement();
      System.out.println("Java");
      String sql = "SELECT idreq,nama,request_stock.jumlah as qty,status FROM request_stock JOIN choc_avail ON request_stock.idcoklat = choc_avail.idcoklat";
      
      ResultSet rs = stmt.executeQuery(sql);
      JSONObject jsonObject = new JSONObject();
      JSONArray jsonArray = new JSONArray();
      
      while(rs.next()) {
       
       JSONObject record = new JSONObject();
       record.put("idreq", rs.getInt("idreq"));
       record.put("nama", rs.getString("nama") );
       record.put("qty", rs.getInt("qty"));
       if  (rs.getInt("status")==1) {
        record.put("status","approved");
       }
       else {
        record.put("status","pending");
       }
       
       
       jsonArray.add(record);
      }
      
      jsonObject.put("RequestData", jsonArray);
      
      System.out.println(jsonObject.toJSONString());
      return jsonObject.toJSONString();
     }catch(Exception e) {
      System.out.println(e.getMessage());
      return "something's wrong";
     }
    }
}