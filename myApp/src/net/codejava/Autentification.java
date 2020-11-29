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
public class Autentification {
	@Resource
	  private WebServiceContext ws;

	
    @WebMethod
    public boolean tryLogin(String name, String pass) {
//    	System.out.println("Java");
    	try {
    		
//    		System.out.println("Java");
    		Statement stmt = SetDB.getConnection().createStatement();
//    		System.out.println("Java");
    		String sql = "SELECT * FROM user WHERE username ='" +name +"' AND password = '" + pass +"'";
    		
    		
    		ResultSet rs = stmt.executeQuery(sql);
    		rs.next();
//    		System.out.println("Java");
    		return rs.next();
    	}catch(Exception e) {
    		System.out.println(e.getMessage());
    		return false;
    	}
    }
    public boolean trySignUp(String name, String pass1, String pass2) {
//    	System.out.println("Java");
    	if (pass1.equals(pass2)) {
    		return false;
    	}
    	try {
    		
//    		System.out.println("Java");
    		Statement stmt = SetDB.getConnection().createStatement();
//    		System.out.println("Java");
    		String sql = "SELECT * FROM user WHERE username ='" +name +"' AND password = '" + pass1 +"'";
    		
    		
    		ResultSet rs = stmt.executeQuery(sql);
    		if(rs.next()) {
    			return false;
    		}
    		sql = "INSERT INTO user VALUES('"+name+"','"+pass1+"')";
//    		System.out.println("Java");
    		rs = stmt.executeQuery(sql);
    		return true;
    	}catch(Exception e) {
    		System.out.println(e.getMessage());
    		return false;
    	}
    }
}
