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
<script>
$(function() {
	
	$("#bg").hide();
	$("#re").click(function(){
		$("#bg").fadeOut(300);
	});
	$("#bg").click(function(){
		$("#bg").fadeOut(300);
	});
	
	$(".button,.button2").button();
	$(".alert").hide();
	$(".button").click(function(){
		
		if(!$("#text1").val()){
			$("#textName.alert").show();
			return false;
		}else{
			$("#textName.alert").hide();
		}
		if(!$("#text2").val()){
			$("#textPhone.alert").show();
			return false;
		}else{
			$("#textPhone.alert").hide();
		}
		
		if($("select").val()=="none"){
			$("#selectSection.alert").show();
			return false;
		}else{
			$("#selectSection.alert").hide();
		}
		$("#bg").fadeIn(300);
	});
	
	 
}); 
</script>
<title>Insert title here</title>
</head>
<style>
body{
  	
	width:1900px;
	font-family:"微軟正黑體";
	background-color:#35495C;
	min-height: 1400px;
}
.div1{
	width:80%;
	margin:0px auto;
	border: solid 1px white;
	border-radius:8px;
	text-align: center;
	background-color:#FFF;
	
}
header{
	color: #FFCC00;
    text-align: center;
    font-size: 35px;
    padding: 70px 0;
    font-weight: bold;  
}
table{ 
	margin: 0 auto;
	border-color:#DDDDDD;
}
th{
	color:#EC8519;
	width:170px;
	font-weight:bold;
	font-size: 22px;
	padding: 8px;
}
td{
	font-size: 22px;
	margin:auto auto;
	color:#272727;
	padding: 8px;
}
.title{
	color:#FF4D40;
	font-weight:bold;
	font-size: 24px;
	margin-left:45%;
	margin-top: 5%;
	
}
.inform{
	color:#EC8519;
	font-size: 23px;
	text-align: left;
	font-weight:bold;
	padding-left: 15px;
}
input[type="text"]{
	padding:5px;
	font-size:20px;
	letter-spacing:2px;
	color:#333;
	border:1px solid #CCC;
	background:#EFEFEF;
	
}
.div2{
	text-align:left;
	font-size:21px;
	margin-top: 12px;
	color:#808080;
	padding-left: 15px;
}
select{
	font-size:18px;
}
.button{
	margin-top: 12px;
	margin-left: 60%;
	margin-bottom: 15px;
}
.button2{
	margin-top: 12px;
	margin-bottom: 15px;
}
.alert{
	font-size:16px;
	color:red;
	padding-left: 5px;
}
#bg{
	position:fixed;
	left:0;
	top:0;
	height:100%;
	width:100%;
	background:rgba(0, 0, 0, .5);
}

#alertBox{
	margin:200px auto 0;
	text-align:center;
	padding-top:25px;
	width:340px;
	height:200px;
	background:#FFF;
	border-radius:8px;
	box-shadow:2px 2px rgba(0, 0, 0, .3);
}
#re,#ok{
	font-size:16px;
	width:100px;
	height:40px;
	cursor:pointer;
	border:none;
	color:#FFF;
    background:#45ABB5;
	border-radius:3px;
	margin-left: 15px;
	margin-top: 10px;
}
#re:hover,#ok:hover{
	background:#3A8E96;
	transition:background .3s;
}


</style>
<body>
<header>填寫訂單資料</header>
	<div class="div1">
	<form method="post" action="Pay" >
	<table rules="all">
		<tr> 
			<th style="width:550px;">商品名稱</th>
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
	</table>
		<div class="title">總計NT:$&nbsp;${sessionScope.total}</div>
		<hr/>
		<div class="inform">訂貨人資訊</div>
		<div class="div2">中文姓名&nbsp;<input type="text" name="name" id="text1"/>&nbsp;先生<input type="radio" name="title" value="先生" checked="checked"/>&nbsp;小姐<input type="radio" name="title" value="小姐"/><span class="alert" id="textName">*請輸入姓名</span></div>
		<div class="div2">手機號碼&nbsp;<input type="text" name="phone" id="text2"/><span class="alert" id="textPhone">*請輸入手機號碼</span></div>
		<div class="div2">取貨門市&nbsp;
		<select name="shop">
		<option value="none"></option>
		<optgroup label="台北">
		<option value="福權門市：台北市中山區民權東路二段96號98號1樓">福權門市：台北市中山區民權東路二段96號98號1樓</option>
		<option value="延年門市：台北市大同區延平北路三段61-5號">延年門市：台北市大同區延平北路三段61-5號</option>
		<option value="克難門市：台北市萬華區萬青街168號">克難門市：台北市萬華區萬青街168號</option>
		<optgroup label="台中">
		<option value="新立德門市：台中市東區復興路四段4號台中路45號">新立德門市：台中市東區復興路四段4號台中路45號</option>
		<option value="忠明義門市：台中市西區忠明南路16號16之1號18號1樓">忠明義門市：台中市西區忠明南路16號16之1號18號1樓</option>
		<option value="新東峰門市：台中市北區東光路340號">新東峰門市：台中市北區東光路340號</option>
		<optgroup label="台南">
		<option value="新興門市：台南市南區新興路6鄰529號531號1樓">新興門市：台南市南區新興路6鄰529號531號1樓</option>
		<option value="席悅門市：台南市東區東興路138號1樓">席悅門市：台南市東區東興路138號1樓</option>
		<option value="天公門市：台南市中西區忠義路二段109號">天公門市：台南市中西區忠義路二段109號</option>
		<optgroup label="高雄">
		<option value="愛河門市：高雄市前金區河東路8號1樓 ">愛河門市：高雄市前金區河東路8號1樓 </option>
		<option value="正心門市：高雄市苓雅區輔仁路一段145號1樓">正心門市：高雄市苓雅區輔仁路一段145號1樓</option>
		<option value="信賢門市：高雄市新興區七賢一路432號1樓">信賢門市：高雄市新興區七賢一路432號1樓</option>
		</select><span class="alert" id="selectSection">*請選擇取貨門市</span>
		</div>
		<div>
		<button type="button" class="button">確定結帳</button>
		<a href="index.html"><button type="button" class="button2">取消並回首頁</button></a>
		</div>
		
		<div id="bg">
			<div id="alertBox">
				<p><strong>溫馨提示!</strong></p>
				<p style="font-size:14px;">訂單送出後，將無法修改!</p>
				<p style="font-size:14px;">如欲取消訂單請至&nbsp;<strong>"訂單查詢"</strong>&nbsp;做取消。</p>
				<button type="button" id="re">檢視訂單</button><button id="ok" type="submit">確認送出</button>
			</div>
		</div>
	</form>
	</div>
</body>
</html> 