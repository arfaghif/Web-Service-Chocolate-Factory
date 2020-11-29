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
public class ChocoList {
	@Resource
	  private WebServiceContext ws;

    @WebMethod
    public String getChocoList() {
    	try {
 
    		Statement stmt = SetDB.getConnection().createStatement();
    		System.out.println("Java");
    		String sql = "SELECT choc_avail.idcoklat AS idcoklat, choc_avail.nama AS choc, bahan.nama AS bahan, resep.jumlah AS jumlah FROM bahan, resep, choc_avail WHERE bahan.idbahan=resep.idbahan AND choc_avail.idcoklat = resep.idcoklat ORDER BY choc_avail.idcoklat";
    		
    		ResultSet rs = stmt.executeQuery(sql);
    		JSONObject jsonObject = new JSONObject();
    		JSONArray jsonArray = new JSONArray();
    		int id = 0;
    		while(rs.next()) {
    			JSONObject jsonObject2 = new JSONObject();
    			id = rs.getInt("idcoklat");
    			jsonObject2.put("_id", id);
    			jsonObject2.put("choco", rs.getString("choc"));
    			JSONArray jsonArray2 = new JSONArray();
    			for (int i=1;i<=3;++i) {		
    				JSONObject jsonObject3 = new JSONObject();
    				
//        			jsonObject3.put("bahan",rs.getString("bahan"));
//        			jsonObject3.put("jumlah", rs.getInt("jumlah"));
//        			jsonArray2.add(jsonObject3);
    				jsonArray2.add(rs.getString("jumlah") +" "+ rs.getString("bahan"));
        			if(i!=3) {
        				rs.next();
        			}
    			}
    			jsonObject2.put("receipts", jsonArray2);
    			jsonArray.add(jsonObject2);
    			
    		}
    		
    		jsonObject.put("list", jsonArray);
    		System.out.println(jsonObject.toJSONString());
    		return jsonObject.toJSONString();
    	}catch(Exception e) {
    		System.out.println(e.getMessage());
    		return "";
    	}
    }
}