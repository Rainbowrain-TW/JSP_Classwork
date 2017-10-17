<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="css/jquery-ui.min.css">
<script type="text/javascript" src="js/jquery-3.2.1.js"></script>
<script type="text/javascript" src="js/jquery-ui.min.js"></script>
<title>查詢訂單</title>
<script>
$(function() {
	$(".btn").button();

});
</script>
<style>
body{
  	
	width:1900px;
	font-family:"微軟正黑體";
	min-height: 1400px;

}
table{  
	border-color:#808080;
}
th{
	color:#B22222;
	width:170px;
	font-weight:bold;
	font-size: 18px;
	text-align: right;
	padding: 5px;
}
td{
	font-size: 18px;
	margin:auto auto;
	color:#808080; 
	text-align: right;
	padding: 5px;
}
.div1{
	width:95%;
	margin-left:1%;
	border: solid 1px #808080;
	border-radius:12px;
	text-align: center;
	margin-top: 15px;
	
}
.div3{
	text-align: left;
	padding-top: 15px;
	padding-left: 15px;
	font-size: 27px;
	color:#808080;
	font-weight: bold;
}
.btn{
	margin-top: 12px;
	margin-left: 80%;
	margin-bottom: 20px;
}
.btn2{
	width:65px;
	background-color: #45ABB5;
	border-radius:3px;
	cursor:pointer;
	border:none;
	height:30px;
}
a{
text-decoration: none;
font-size:20px;
font-weight: bold;
color:#FFF;
}
p{
color:red;
font-weight: bold;
text-align: right;
padding-right: 5%;
}
</style>
</head>
<body>
<sql:setDataSource 	driver="com.microsoft.sqlserver.jdbc.SQLServerDriver" 
							url="jdbc:sqlserver://localhost:1433;databaseName=JspWork;" 
							user="sa" 
							password="as" 
	/> 
<sql:query var="result">

select p.pic,t.name,t.quantity,t.price,t.total,o.address,t.ship,o.order_id,t.item_id
from orders o inner join orderdetail t 
on(o.order_id=t.order_id) inner join products p
on(t.item_id=p.item_id)
where o.email='${param.Email}'
order by o.orderdate desc

</sql:query>
<p>${param.Email}&nbsp;的訂單</p>
<div class="div1">
	<div class="div3"><img src="images/cart001.png" style="vertical-align:middle;margin-right:10px;" />訂單查詢</div>
<table rules="rows" frame="below">
		<tr> 
			<th>訂單編號</th>
			<th style="width:640px; text-align:center;">商品名稱</th>
			<th>數量</th>
			<th>單價</th>
			<th>小計</th>
			<th style="width:600px;text-align:center;">取貨門市</th>
			<th>寄送狀態</th>		
			<th style="width:80px;text-align:center;">&nbsp;</th>
		</tr>	
			<c:forEach var="row" items="${result.rows}">
		<tr>
			<td>${row.order_id}</td>
			<td style="text-align:left;"><img src="${row.pic}" width="120" style="vertical-align:middle;margin-right: 30px;"/>${row.name}</td>
			<td>${row.quantity}</td>
			<td>${row.price}</td>
			<td>${row.total}</td>
			<td>${row.address}</td>
			<c:choose>	
			<c:when test="${row.ship!='0'}"> 
			<td>已寄送</td>
			</c:when>
			<c:otherwise>
			<td>尚未寄送</td>
			</c:otherwise>
			</c:choose> 
			<c:choose>	
			<c:when test="${row.ship!='0'}"> 
			</c:when>
			<c:otherwise>
			<td><button type="button" class="btn2"><a href="reject?Email=${param.Email}&order_id=${row.order_id}&item_id=${row.item_id}" class="a1">退貨</a></button></td>
			</c:otherwise>
			</c:choose>
		</tr>
			</c:forEach>
			 
</table>
</div>
<a href="index.jsp"><button type="button" class="btn">確認並回首頁</button></a>
</body>
</html>