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

 
@WebService
@SOAPBinding(style = Style.RPC)
public class Saldo {
	@Resource
	  private WebServiceContext ws;
	
	
//	Set SQl config
	private final String userName = "root";
	private final String password = "";
	private final String serverName = "localhost";
	private final int portNumber = 3306;
	private final String dbName = "factory";
	
	//Set connection sql
	private Connection getConnection() throws Exception {
		Class.forName("org.mariadb.jdbc.Driver");
		Connection conn = null;
		Properties prop = new Properties();
		prop.put("user","root");
		prop.put("password","");
		conn = DriverManager.getConnection("jdbc:mariadb://"
				+ this.serverName + ":" + this.portNumber + "/" + this.dbName,
				prop);
		
		

		return conn;
	}
	
    @WebMethod
    public int getSaldo() {
//    	System.out.println("Java");
    	try {
    		
//    		System.out.println("Java");
    		Statement stmt = this.getConnection().createStatement();
//    		System.out.println("Java");
    		String sql = "SELECT value FROM saldo";
    		
    		ResultSet rs = stmt.executeQuery(sql);
    		rs.next();
//    		System.out.println("Java");
    		return rs.getInt("value");
    	}catch(Exception e) {
    		System.out.println(e.getMessage());
    		return 0;
    	}
    }
}