<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.co.grutech.anyauth2.client.*" %>
<%@ page import="kr.or.koroad.dlv.util.*" %>
<%@ page import="java.util.*" %>
<%
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인페이지로 이동</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function() {
	var param = {
		client_id : "9980228a-1fd8-4501-be77-ce8e98eed18c",
		client_secret : "8117a5d75e9909eb7858b5638803d72c707fb744"
	};
	
	var param1 = {
		client_id : "e4afc842-bad8-4726-8a20-42d15460eb9b",
		client_secret : "4a985267229891d1036629a4424332ffe2f51f7b"
	};
	
	var authorizeUrl = "http://localhost:8081/koroad_client/token.jsp";
	
	$("#authorize1").click(function() {
		//location.href=authorizeUrl + "?" + $.param(param);
		document.myform.submit();
	});
	$("#authorize2").click(function() {
		//location.href=authorizeUrl + "?" + $.param(param1);
		document.myform1.submit();
	});
	$("#authorize21").click(function() {
		//location.href=authorizeUrl + "?" + $.param(param1);
		document.myform2.submit();
	});
	$("#authorize3").click(function() {
		location.href="encryptLibTest.jsp";		
	});
	$("#authorize4").click(function() {
		location.href="encryptLibTest1.jsp";		
	});
	$("#authorize31").click(function() {
		location.href="encryptWebTest.jsp";		
	});
	$("#authorize41").click(function() {
		location.href="encryptWebTest1.jsp";		
	});
});
</script>
</head>
<body>
Client ID : 9980228a-1fd8-4501-be77-ce8e98eed18c<br>
Client Secret : 8117a5d75e9909eb7858b5638803d72c707fb744<br>
Client Name : 단건TestApp1<br>
Description : 단건조회 TestApp1 입니다.<br>
<form name="myform" id="myform" method="post" action="run.jsp">
<input type="hidden" name="client_id" id="client_id" value="9980228a-1fd8-4501-be77-ce8e98eed18c"><br/>
<input type="hidden" name="client_secret" id="client_secret" value="8117a5d75e9909eb7858b5638803d72c707fb744"><br/>
운전면허정보(12자리)<input type="text" name="lno" id="lno" value="181206186721"><br/>
이름<input type="text" name="lnm" id="lnm" value="김범수"><br/>
생년월일(YYMMDD)<input type="text" name="bno" id="bno" value="940608"><br/>
암호일련번호<input type="text" name="sno" id="sno" value="6E1N80"><br/>
대여기간(YYYY-MM-DD)<input type="text" name="sdt" id="sdt" value="2017-08-23">~<input type="text" name="edt" id="edt" value="2017-08-23"><br/>
면허종별(아래코드)<input type="text" name="ltno" id="ltno" value="12"><br/>
1종대형(11), 1종보통(12), 1종소형(13), 1종대형견인차(14), 10종구난차(15), 1종소형견인차(16)<br/>
2종보통(32), 2종소형(33), 2종원동기(38)
</form>
<P>
<button id="authorize1">단건조회</button>
<br>
<br>
<br>
<form name="myform1" id="myform1" method="post" action="run1.jsp">
<input type="hidden" name="client_id" id="client_id" value="7d9332a3-3c79-480b-b7e1-8a2cf55d0b39"><br/>
<input type="hidden" name="client_secret" id="client_secret" value="18fd8e9d06a82f11edd36ad3025d2390f4bf180e2f16fd4048e93661db931889"><br/>
운전면허정보(12자리)<input type="text" name="lno" id="lno" value="181206186721"><br/>
이름<input type="text" name="lnm" id="lnm" value="김범수"><br/>
생년월일(YYMMDD)<input type="text" name="bno" id="bno" value="940608"><br/>
암호일련번호<input type="text" name="sno" id="sno" value="6E1N80"><br/>
대여기간(YYYY-MM-DD)<input type="text" name="sdt" id="sdt" value="2017-08-23">~<input type="text" name="edt" id="edt" value="2017-08-23"><br/>
면허종별(아래코드)<input type="text" name="ltno" id="ltno" value="12"><br/>
1종대형(11), 1종보통(12), 1종소형(13), 1종대형견인차(14), 10종구난차(15), 1종소형견인차(16)<br/>
2종보통(32), 2종소형(33), 2종원동기(38)
</form>
<P>
<button id="authorize2">단건조회 암호변경</button>
<br>
<br>
<br>
<form name="myform2" id="myform2" method="post" action="run1.jsp">
<input type="hidden" name="client_id" id="client_id" value="9980228a-1fd8-4501-be77-ce8e98eed18c"><br/>
<input type="hidden" name="client_secret" id="client_secret" value="8117a5d75e9909eb7858b5638803d72c707fb744"><br/>
운전면허정보(12자리)<input type="text" name="lno" id="lno" value="181206186721"><br/>
이름<input type="text" name="lnm" id="lnm" value="김범수"><br/>
생년월일(YYMMDD)<input type="text" name="bno" id="bno" value="940608"><br/>
암호일련번호<input type="text" name="sno" id="sno" value="6E1N80"><br/>
대여기간(YYYY-MM-DD)<input type="text" name="sdt" id="sdt" value="2017-08-23">~<input type="text" name="edt" id="edt" value="2017-08-23"><br/>
면허종별(아래코드)<input type="text" name="ltno" id="ltno" value="12"><br/>
1종대형(11), 1종보통(12), 1종소형(13), 1종대형견인차(14), 10종구난차(15), 1종소형견인차(16)<br/>
2종보통(32), 2종소형(33), 2종원동기(38)
</form>
<P>
<button id="authorize21">단건조회 암호변경(기존키)</button>

<br>
<br>
<br>
Client Secret : 8117a5d75e9909eb7858b5638803d72c707fb744<br>
평문 : 운전면허 자동검증 시스템
<P>

<button id="authorize3">암호화 테스트(라이브러리 제공방식)</button>

<br>
<br>
<br>
Client Secret : 8117a5d75e9909eb7858b5638803d72c707fb744<br>
평문 : 운전면허 자동검증 시스템
<P>

<button id="authorize4">암호화 테스트(라이브러리 제공방식 - 암호화 변경)</button>

<br>
<br>
<br>
Client Secret : 8117a5d75e9909eb7858b5638803d72c707fb744<br>
평문 : 운전면허 자동검증 시스템
<P>
<button id="authorize31">암호화 테스트(웹 서비스 제공방식)</button>

<br>
<br>
<br>
Client Secret : 8117a5d75e9909eb7858b5638803d72c707fb744<br>
평문 : 운전면허 자동검증 시스템
<P>
<button id="authorize41">암호화 테스트(웹 서비스 제공방식 - 암호화 변경)</button>

</body>
</html>