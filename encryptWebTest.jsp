<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.or.koroad.dlv.util.*"%>
<%
String client_secret = "8117a5d75e9909eb7858b5638803d72c707fb744";
String data = "[";
for(int i=0;i<10;i++) {
	if (i != 0) 
		data += ",";
	data += "{\"f_license_no\" : \"1212345612\","+
			"\"f_resident_name\" : \"홍길동\","+
			"\"f_resident_date\" : \"123456\","+
			"\"f_seq_no\" : \"123456\","+
			"\"f_licn_con_code\" : \"11\","+
			"\"f_from_date\" : \"20170728\","+
			"\"f_to_date\" : \"20170728\"}";
}
data += "]";
String key = Base64.encode(client_secret.getBytes());
String encStr = Base64.encode(data.getBytes());
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
var Base64 = {

		// private property
		_keyStr : "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=",

		// public method for encoding
		encode : function (input) {
			var output = "";
			var chr1, chr2, chr3, enc1, enc2, enc3, enc4;
			var i = 0;

			while (i < input.length) {

			  chr1 = input.charCodeAt(i++);
			  chr2 = input.charCodeAt(i++);
			  chr3 = input.charCodeAt(i++);

			  enc1 = chr1 >> 2;
			  enc2 = ((chr1 & 3) << 4) | (chr2 >> 4);
			  enc3 = ((chr2 & 15) << 2) | (chr3 >> 6);
			  enc4 = chr3 & 63;

			  if (isNaN(chr2)) {
				  enc3 = enc4 = 64;
			  } else if (isNaN(chr3)) {
				  enc4 = 64;
			  }

			  output = output +
				  this._keyStr.charAt(enc1) + this._keyStr.charAt(enc2) +
				  this._keyStr.charAt(enc3) + this._keyStr.charAt(enc4);

			}

			return output;
		},

		// public method for decoding
		decode : function (input)
		{
		    var output = "";
		    var chr1, chr2, chr3;
		    var enc1, enc2, enc3, enc4;
		    var i = 0;

		    input = input.replace(/[^A-Za-z0-9+/=]/g, "");

		    while (i < input.length)
		    {
		        enc1 = this._keyStr.indexOf(input.charAt(i++));
		        enc2 = this._keyStr.indexOf(input.charAt(i++));
		        enc3 = this._keyStr.indexOf(input.charAt(i++));
		        enc4 = this._keyStr.indexOf(input.charAt(i++));

		        chr1 = (enc1 << 2) | (enc2 >> 4);
		        chr2 = ((enc2 & 15) << 4) | (enc3 >> 2);
		        chr3 = ((enc3 & 3) << 6) | enc4;

		        output = output + String.fromCharCode(chr1);

		        if (enc3 != 64) {
		            output = output + String.fromCharCode(chr2);
		        }
		        if (enc4 != 64) {
		            output = output + String.fromCharCode(chr3);
		        }
		    }

		    return output;
		}
	}
var form = {
			"key" : "<%=key%>",
			"encText" : "<%=encStr%>"
	};
var form1 = {
		"key" : "<%=key%>",	
		"decText" : ""
};	 
var dataTemp;
	
	$.ajax({
	    url: "http://localhost:9028/encryptv2.do",
	    method: "post",
	    beforeSend : function(xhr){
	    	console.time("calculatingTime");
	    },
	    type: "json",
	    data: JSON.stringify(form),
	    contentType: "application/json",
	    success: function(data) {
	        console.timeEnd("calculatingTime");
	        console.log(data);
	        dataTemp = data.encText;
   	        $("#client_secret").val("<%=client_secret%>");
   	        $("#data").val('<%=data%>');
   	        $("#base64_Encode_key").val("<%=key%>");
   	        $("#base64_Encode_data").val("<%=encStr%>");
   	        $("#return_base64_Encode_enc_data").val(data.encText);
   	        $("#return_enc_data").val(Base64.decode(data.encText));
	    }
	});
	
	function decodeCall() {
		form1.decText = dataTemp;
		
		$.ajax({
		    url: "http://localhost:9028/decryptv2.do",
		    method: "post",
		    type: "json",
		    beforeSend : function(xhr){
		    	console.time("calculatingTime1");
		    },
		    data: JSON.stringify(form1),
		    contentType: "application/json",
		    success: function(data) {
		        console.timeEnd("calculatingTime1");
		        console.log(data);
		        $("#return_base64_Encode_dec_data").val(dataTemp);
		        $("#return_dec_data").val(unescape(Base64.decode(data.decText)));
		    }
		});

	}
</script>
</head>
<body>
	<input type="text" style="width:50%;" id="client_secret"></input><br/>
	<input type="text" style="width:50%;" id="data"></input><br/>
	<input type="text" style="width:50%;" id="base64_Encode_key"></input><br/>
	<input type="text" style="width:50%;" id="base64_Encode_data"></input><br/>
	<input type="text" style="width:50%;" id="return_base64_Encode_enc_data"></input><br/>
	<input type="text" style="width:50%;" id="return_enc_data"></input><br/>
	
	<br/><br/>
	
	<a href="#" onClick="decodeCall()">다시 복호화</a>
	<br/>
	<input type="text" style="width:50%;" id="return_base64_Encode_dec_data"></input><br/>
	<input type="text" style="width:50%;" id="return_dec_data"></input><br/>
</body>
</html>