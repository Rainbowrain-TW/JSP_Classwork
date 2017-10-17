<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登入失敗</title>
<style>
body{
	font-family: "微軟正黑體";
}
div{
	width:50%;
	height:600px;
	border: solid 1px #808080;
	border-radius:15px;
	text-align: center; 
	margin: 70px auto;
}
h1{
	color:#0A0A0A;
	padding-top:30px;
	font-size: 48px; 
}
p{
	color:#0047AB;
	font-size: 18px;
	padding-top:120px;
	font-weight: bold;
}
a{
	text-decoration:none;
	color:#E60000;
	font-weight: bold;
	font-size: 20px;
}
</style>
</head>
<body>
<%
// 使用者登入失敗
response.setHeader("refresh","3;URL=index.jsp") ;
%>

<div>
<h1>登錄失敗</h1>
<h3>帳號或密碼不符</h3>
<p>如果你的瀏覽器沒有自動跳轉，請點擊此鏈接</p>
<a href="index.jsp">回到首頁</a>
</div>
</body>
</html>