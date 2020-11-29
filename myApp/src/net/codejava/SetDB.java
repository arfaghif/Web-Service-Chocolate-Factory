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
public class SetDB {
	
	
//	Set SQl config
	static private final String userName = "root";
	static private final String password = "";
	static private final String serverName = "localhost";
	static private final int portNumber = 3306;
	static private final String dbName = "factory";
	
	//Set connection sql
	static public Connection getConnection() throws Exception {
		Class.forName("org.mariadb.jdbc.Driver");
		Connection conn = null;
		Properties prop = new Properties();
		prop.put("user","root");
		prop.put("password","");
		conn = DriverManager.getConnection("jdbc:mariadb://"
				+ SetDB.serverName + ":" + SetDB.portNumber + "/" + SetDB.dbName,
				prop);
		return conn;
	}
	
}