<%@ page import="kr.co.grutech.anyauth2.client.*"%>
<%@ page import="kr.or.koroad.dlv.crypt.aria.cipher.*"%>
<%@ page import="kr.or.koroad.dlv.util.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="org.json.simple.*"%>
<%@ page import="org.json.simple.parser.*"%>
<%@ page import="org.apache.commons.httpclient.*"%>
<%@ page import="org.apache.commons.httpclient.methods.*"%>
<%
	String client_id = request.getParameter("client_id");
	String client_secret = request.getParameter("client_secret");
	System.out.println(client_id);
	System.out.println(client_secret);
	String authHeader = OAuth2ClientUtil.generateBasicAuthHeaderString(client_id,
			client_secret);
	HttpClient client = new HttpClient();

	BufferedReader br = null;
	GetMethod method = new GetMethod("http://localhost:8080/oauth2/token2");
	method.setQueryString(new NameValuePair[] {
		    new NameValuePair("grantType", "password")
		});
	Header header = new Header();
	header.setName("Authorization");
	header.setValue(authHeader);
	method.setRequestHeader(header);

	try{
		int returnCode = client.executeMethod(method);
		String rtnMsg = "";
		if(returnCode == HttpStatus.SC_OK) {
		
		}
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
	  method.releaseConnection();
	  if(br != null) try { br.close(); } catch (Exception fe) {}
	}
%>