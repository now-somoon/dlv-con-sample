<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
String accesToken = request.getParameter("access_token");
String tokenType = request.getParameter("token_type");
String issuedAt = request.getParameter("issued_at");
String authHeader = OAuth2ClientUtil.generateBearerTokenHeaderString(accesToken);
String jsonBody = "{\"f_license_no\" : \"110924583361\","+
					"\"f_resident_name\" : \"홍길동\","+
					"\"f_resident_date\" : \"123456\","+
					"\"f_seq_no\" : \"123456\","+
					"\"f_licn_con_code\" : \"11\","+
					"\"f_from_date\" : \"20170728\","+
					"\"f_to_date\" : \"20170728\"}";
//String client_secret = "18fd8e9d06a82f11edd36ad3025d2390f4bf180e2f16fd4048e93661db931889";
String client_secret = "8117a5d75e9909eb7858b5638803d72c707fb744";
ARIACipher256 ac = new ARIACipher256(Base64.encode(client_secret.getBytes()));
byte[] encBody = ac.encrypt(jsonBody.getBytes("EUC-KR"));
String encStr = Base64.encode(encBody);
System.out.println(encStr);

HttpClient client = new HttpClient();

BufferedReader br = null;
PostMethod post = new PostMethod("http://localhost:8080/api/onevalidatorv2.do");
post.setRequestHeader("Authorization", authHeader);
String reqStr = "{\"header\" : {\"f_send_cnt\" : \"1\",\"f_request_date\" : \"20170823\",\"f_pin_info\" : \""+Base64.encode("1234567890:1234565".getBytes())+"\"},\"body\" : \""+encStr+"\"}";
StringRequestEntity postingString = new StringRequestEntity(reqStr,"application/json","UTF-8");
post.setRequestEntity(postingString);
try {
		
	int returnCode = client.executeMethod(post);
	if(returnCode == HttpStatus.SC_OK) {
		br = new BufferedReader(new InputStreamReader(post.getResponseBodyAsStream()));
		String readLine;
		StringBuffer st = new StringBuffer();
		while(((readLine = br.readLine()) != null)) {
			st.append(readLine);
		}
		System.out.println(st.toString());
		JSONParser parser = new JSONParser();
		JSONObject jsonObj = (JSONObject) parser.parse(st.toString());
		System.out.println(jsonObj.toJSONString());
		System.out.println("0".equals((String)((JSONObject)jsonObj.get("header")).get("f_rtn_cd")));
		System.out.println(" encstr :"+jsonObj.get("body"));
		if (!"0".equals((String)((JSONObject)jsonObj.get("header")).get("f_rtn_cd"))) {
			System.out.println(" header :"+jsonObj.toJSONString());
		} else {
			byte[] encBody1 = Base64.decode((String)jsonObj.get("body"));
			byte[] decBody = ac.decrypt(encBody1);
			JSONObject bodys = (JSONObject) parser.parse(new String(decBody,"UTF-8"));
			JSONObject headers = (JSONObject)jsonObj.get("header");
			System.out.println(" header :"+headers.toJSONString());
			System.out.println(" body :"+bodys.toJSONString());
		}
	}
} catch (Exception e) {
	e.printStackTrace();
} finally {
  //method.releaseConnection();
  if(br != null) try { br.close(); } catch (Exception fe) {}
}
%>