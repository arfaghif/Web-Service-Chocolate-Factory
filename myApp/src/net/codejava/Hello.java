package net.codejava;

import javax.annotation.Resource;
import javax.jws.WebParam;
import javax.xml.ws.WebServiceContext;
import javax.jws.WebMethod;
import javax.jws.WebService;
import javax.jws.soap.SOAPBinding;
import javax.jws.soap.SOAPBinding.Style;
 
@WebService
@SOAPBinding(style = Style.RPC)
public class Hello {
	@Resource
	  private WebServiceContext ws;
	
    @WebMethod
    public String[] bonjour(String name, String name2) {
        String[] arr = {"Bounjour" + name , "Bounjour"+name2};
        return arr;
    }
}