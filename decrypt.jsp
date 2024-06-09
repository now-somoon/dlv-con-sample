<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.co.grutech.anyauth2.client.*" %>
<%@ page import="kr.or.koroad.dlv.crypt.aria.cipher.*"%>
<%@ page import="kr.or.koroad.dlv.util.*"%>
<%@ page import="org.json.simple.*"%>
<%@ page import="org.json.simple.parser.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.UnsupportedEncodingException"%>
<%
String jsonBody = "{\"f_license_no\" : \"119861652071\","+
		"\"f_resident_name\" : \"김종덕\","+
		"\"f_resident_date\" : \"780628\","+
		"\"f_seq_no\" : \"123456\","+
		"\"f_licn_con_code\" : \"12\","+
		"\"f_vaild_key\" : \"\","+
		"\"f_from_date\" : \"20180221\","+
		"\"f_to_date\" : \"20180226\"}";
String client_secret = "8117a5d75e9909eb7858b5638803d72c707fb744";
ARIACipher256 ac1 = new ARIACipher256(Base64.encode(client_secret.getBytes()));
byte[] encBody = ac1.encrypt(jsonBody.getBytes("EUC-KR"));
String encStr = Base64.encode(encBody);
System.out.println(encStr);
String jsonStr = "{\"body\":\"4fZ4kc/7uciy5+l1DyXmtxuHLsrMEKoGQDr9EwCdFf3EqiEIDe4JqNRgOQtbKdKHe1MXPirDIcd5xq5wasmZ4Q==\",\"header\":\"{\\\"f_request_date\\\":\\\"20180502\\\",\\\"f_send_cnt\\\":\\\"1\\\",\\\"f_pin_info\\\":\\\"VVNFUl9JRF8xMjM0NTpQVzEyMzQ=\\\"}\"}";
JSONObject req = new JSONObject();
JSONParser parser = new JSONParser();
JSONObject header = new JSONObject();
	System.out.println(jsonStr);
try {
	String key = "8117a5d75e9909eb7858b5638803d72c707fb744";

	//req = (JSONObject) parser.parse( jsonStr );
	/*
	String han = "이은승";
	String originalStr = new String(han.getBytes("EUC-KR"),"UTF-8"); // 테스트 
	String [] charSet = {"utf-8","euc-kr","ksc5601","iso-8859-1","x-windows-949"};
	  
	for (int i=0; i<charSet.length; i++) {
	 for (int k=0; k<charSet.length; k++) {
		 originalStr = new String(han.getBytes(charSet[k]),charSet[i]);
	 for (int j=0; j<charSet.length; j++) {
	  try {
	   System.out.println("[" + charSet[i] +"," + charSet[j] +"] = " + new String(originalStr.getBytes(charSet[i]), charSet[j]));
	   
		  //System.out.println("[" + charSet[i] +"," + charSet[j] +"] = " + new String(originalStr.getBytes(), charSet[j]));
	  } catch (UnsupportedEncodingException e) {
	   e.printStackTrace();
	  }
	 }
	 }
	}
	//System.out.println(new String(han.getBytes("EUC-KR")));
	String utf8 = new String(han.getBytes("UTF-8"));
	//System.out.println(new String(han.getBytes("ISO-8859-1")));
	*/
	//header = (JSONObject)req.get("header");
	//String body = (String)req.get("body");
	ARIACipher256 ac = new ARIACipher256(Base64.encode(key.getBytes()));
	//System.out.println(ac.decrypt(Base64.decode("4fZ4kc/7uciy5+l1DyXmtxuHLsrMEKoGQDr9EwCdFf3EqiEIDe4JqNRgOQtbKdKHe1MXPirDIcd5xq5wasmZ4Q==")));
	//byte[] encBody1 = Base64.decode("4fZ4kc/7uciy5+l1DyXmtxuHLsrMEKoGQDr9EwCdFf3EqiEIDe4JqNRgOQtbKdKHe1MXPirDIcd5xq5wasmZ4Q==");
	byte[] encBody1 = Base64.decode("rxY8wpPJKiG/KsxE/Be+pAV5n1F4kdM65W7pPkBOSSvsVgMXgqXa0Vc8J8r7J07DXMpzdcA9k9myPKUc0o7qPw==");
	byte[] decBody = ac.decrypt(encBody1);
	String decStr = new String (decBody,"ISO-8859-1");
	System.out.println(decStr);
	//req.put("body", (JSONObject) parser.parse( decStr ));
	//String n = (String)req.get("f_resident_name");
	JSONObject te = (JSONObject) parser.parse(decStr);
	String n = new String(((String)te.get("f_resident_name")).getBytes("ISO-8859-1"),"EUC-KR");
	System.out.println(n);
	//TODO String orderId = (String)te.get("f_resident_name");
	//te.put("f_resident_name", n);
	//req.put("body", te);
	//JSONObject jsonObj = (JSONObject) parser.parse( decStr );
	
} catch (Exception e) {
	e.printStackTrace();
}
%>
