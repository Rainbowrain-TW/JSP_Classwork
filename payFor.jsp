<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="css/jquery-ui.min.css">
<script type="text/javascript" src="js/jquery-3.2.1.js"></script>
<script type="text/javascript" src="js/jquery-ui.min.js"></script>
<title>訂單明細</title>
<script>
$(function() {
	$("button").button();
	 
});
</script>
<style>
body{
  	
	width:1900px;
	font-family:"微軟正黑體";
	min-height: 1400px;

}
table{  
	margin: 0 auto;
	border-color:#808080;
}
th{
	color:#B22222;
	width:170px;
	font-weight:bold;
	font-size: 22px;
	text-align: right;
	padding: 5px;
}
td{
	font-size: 22px;
	margin:auto auto;
	color:#808080; 
	text-align: right;
	padding: 5px;
}
.div1{
	width:80%;
	margin:0px auto;
	border: solid 1px #808080;
	border-radius:12px;
	text-align: center;
	margin-top: 15px;
	
}
.div2{
	font-weight:bold;
	text-align: left;
	padding-top: 15px;
	padding-left: 50px;
	color:#808080;
}
.div3{
	text-align: left;
	padding-top: 15px;
	padding-left: 15px;
	font-size: 27px;
	color:#808080;
	font-weight: bold;
}
button{
	margin-top: 12px;
	margin-left: 80%;
	margin-bottom: 20px;
}
</style>
</head>
<body>
<div class="div2">親愛的&nbsp;<span style="color:#B22222;font-size:18px;">${requestScope.name}</span>&nbsp;${requestScope.title}您好，感謝您的訂購，您的訂單編號為:<span style="color:#B22222;font-size:18px;">${requestScope.order_id}</span></div>
<div class="div2">您的手機號碼是:&nbsp;<span style="color:#B22222;font-size:18px;">${requestScope.phone}</span></div> 
<div class="div2">取貨門市為&nbsp;&nbsp;<span style="color:#B22222;font-size:18px;">${requestScope.shop}</span></div> 
	<div class="div1">
	<div class="div3"><img src="images/cart001.png" style="vertical-align:middle;margin-right:10px;" />購物明細</div>
	<table rules="rows" frame="below">
		<tr> 
			<th style="width:550px; text-align:center;">商品名稱</th>
			<th>數量</th>
			<th>單價</th>
			<th>小計</th>
		</tr>	
			<c:forEach var="item" items="${sessionScope.cartItems}">
		<tr>
			<td style="text-align:left;"><img src="${item.image}" width="120" style="vertical-align:middle;margin-right: 30px;"/><span >${item.name}</span></td>
			<td>${item.quantity}</td>
			<td>${item.price}</td>
			<td>${item.total}</td>
		</tr>
			</c:forEach>
		<tr style="border-color: white;">
			<td></td>
			<td></td>
			<td style="font-weight:bold;">商品金額總計</td>
			<td style="font-weight:bold;">NT$&nbsp;${sessionScope.total}</td>
		</tr>	
		<tr style="border-color: white;">
			<td></td>
			<td></td>
			<td style="font-weight:bold;">運費小計</td>
			<td style="font-weight:bold;">NT$&nbsp;0</td>
		</tr>	
		<tr>
			<td style="border-color: white;"></td>
			<td style="border-color: white;"></td>
			<td style="font-weight:bold;">帳戶扣抵</td>
			<td style="font-weight:bold;">NT$&nbsp;0</td>
		</tr>	
		<tr style="border-color: white;">
			<td></td>
			<td></td>
			<td style="color:#B22222;font-weight:bold;">總計</td>
			<td style="color:#B22222;font-weight:bold;">NT$&nbsp;${sessionScope.total}</td>
		</tr>			 
	</table>
		<a href="index.jsp"><button type="button" class="btn">確認並回首頁</button></a>
	</div>
</body>
</html>