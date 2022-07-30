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
	}
	.price_input{
		width: 70%;
		text-align: center;
	}
	.left_btn_input{
		width: 100%;
		font-size: 40px;
		background: #00CCCC;
	}
	.right_btn_input{
		width: 100%;
		font-size: 40px;
		background: #FF6699;
	}
</style>
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
	<table class="table table-dark">
		<tr>
			<td>내&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;용</td>
			<td><input type="text" class="item_input" name="item" id="item" placeholder="내용을 입력해주세요."></td>
		</tr>
		<tr>
			<td>금&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;액</td>
			<td><input type="text" class="price_input" name="price" id="price" placeholder="숫자만 입력해주세요."></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<div class="left">
					<input type="submit" class="left_btn_input" name="kind" value="수입" onClick="return chkReg('a')">
				</div>
				<div class="right">
					<input type="submit" class="right_btn_input" name="kind" value="지출" onClick="return chkReg('b')">
				</div>
			</td>
		</tr>
	</table>
</form>
<script>
	var item = document.querySelector("#item");
	var price = document.querySelector("#price");
	function chkReg(str){
		if(item.value == ""){
			alert("내용 미입력!!");
			item.focus();
			return false;
		}else if(price.value == ""){
			alert("금액 미입력!!");
			price.focus();
			return false;
		}
		if(str == "a"){
			alert("수입등록완료!!");
		}else{
			alert("지출등록완료!!");
		}
	}
</script>
</body>
</html>