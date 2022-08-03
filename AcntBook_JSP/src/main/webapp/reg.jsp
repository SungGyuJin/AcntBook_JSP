<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="Dao.DBcon"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String sql = "Select max(regNum)+1 max From acntAdd";
	Connection con = DBcon.getConnection();
	Statement stmt = con.createStatement();
	ResultSet rs = stmt.executeQuery(sql);
	rs.next();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#regFm{
		table-layout: fixed;
	}
	.input{
		border: none;
		font-size: 0;
		width: 100%;
	}
	.regBox{
		float: left;
	}
	td{
		text-align: center;
		font-size: xx-large;
	}
	.item_input{
		width: 70%;
		text-align: center;
		border-radius: 15px;
	}
	.price_input{
		width: 70%;
		text-align: center;
		border-radius: 15px;
	}
	.left_btn_input{
		width: 100%;
		font-size: 40px;
		background: #00CCCC;
		border-radius: 20px;
	}
	.left_btn_input:hover{
		background: #20B2AA;
	}
	.right_btn_input{
		width: 100%;
		font-size: 40px;
		background: #FF6699;
		border-radius: 20px;
	}
	.right_btn_input:hover{
		background: #DB7093;
	}
</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
<%
	String regNum = request.getParameter("regNum");

	if(rs.getString("max") == null){
		regNum = "1";
	}else{
		regNum = rs.getString("max");
	}
	
	String regDate = request.getParameter("regDate");
	String year = request.getParameter("year");
	String month = request.getParameter("month");
	String dat = request.getParameter("param");

	/* out.print("regNum: " + regNum+"<br>");
	out.print("regDate: " + regDate+"<br>");
	out.print("year: " + year+"<br>");
	out.print("month: " + (month)+"<br>");
	out.print("dat: " + dat+"<br>"); */
%>
<form action="Addmoney" method="post">
<div id="div_1">
	<input type="hidden" class="input" name="regNum" value="<%= regNum %>" readonly>
	<input type="hidden" class="input" name="regDate" value="<%= regDate %>" readonly>
	<input type="hidden" class="input" name="year" value="<%= year %>" readonly>
	<input type="hidden" class="input" name="month" value="<%= Integer.parseInt(month) + 1 %>" readonly>
	<input type="hidden" class="input" name="dat" value="<%= dat %>" readonly>
</div>
	<table id="regFm" class="table table-dark">
		<tr>
			<td>내&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;용</td>
			<td><input type="text" class="item_input" name="item" id="item" placeholder="내용을 입력해주세요."></td>
		</tr>
		<tr>
			<td>금&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;액</td>
			<td><input type="text" class="price_input" id="price" placeholder="금액을 입력해주세요."></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<div class="left">
					<input type="submit" class="left_btn_input" name="kind" value="수입" onClick="return chkReg();">
				</div>
				<div class="right">
					<input type="submit" class="right_btn_input" name="kind" value="지출" onClick="return chkReg();">
				</div>
			</td>
		</tr>
	</table>
	<input type="hidden" class="price_input" name="priceRemoveComma" id="priceRemoveComma">
</form>
<script>
	var item = document.querySelector("#item");
	var p1 = document.querySelector("#price");
	var priceRemoveComma = document.querySelector("#priceRemoveComma");
	
	function chkReg(){
		if(item.value == ""){
			item.focus();
			return false;
		}else if(price.value == ""){
			price.focus();
			return false;
		}
	}
	
	const price_input = document.querySelector('#price');
	price_input.addEventListener('keyup', function(e) {
	  let value = e.target.value;
	  value = Number(value.replaceAll(',', ''));
	  if(isNaN(value)) {
		  price_input.value = "";
	  }else {
	    const formatValue = value.toLocaleString('ko-KR');
	    price_input.value = formatValue;
	  }
	});
	
	function removeComma(str){
		n = parseInt(str.replace(/,/g,""));
		return n;
	}
	
	// submit 와 servlet 중간사이의 작업, 쉽게말해 servlet 가기전 콤마제거 작업
	price.addEventListener('keyup', function(e){
		
		priceRemoveComma.value = price.value.replace(/,/g,"");
		
	});
	
</script>
</body>
</html>