package net.codejava;

import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.jws.WebResult;
import javax.jws.WebService;
import javax.jws.soap.SOAPBinding;
import javax.jws.soap.SOAPBinding.Style;
import javax.servlet.Filter;

@WebService
@SOAPBinding(style = Style.RPC)
public class hello {

	//@WebMethod(operationName="Bonjour")
	//@WebResult(name="ResponseMessage")
	public String bonjour(String name) {
		return  "Bonjour "+ name;
	}
	
}
