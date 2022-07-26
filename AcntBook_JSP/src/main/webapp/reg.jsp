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
	}
	.regBox{
		float: left;
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

	out.print("regNum: " + regNum+"<br>");
	out.print("regDate: " + regDate+"<br>");
	out.print("year: " + year+"<br>");
	out.print("month: " + month+"<br>");
	out.print("dat: " + dat+"<br>");
%>
<form action="Addmoney" method="post">
<div id="div_1">
	<input type="hidden" class="input" name="regNum" value="<%= regNum %>" readonly>
	<input type="hidden" class="input" name="regDate" value="<%= regDate %>" readonly>
	<input type="hidden" class="input" name="year" value="<%= year %>" readonly>
	<input type="hidden" class="input" name="month" value="<%= Integer.parseInt(month) + 1 %>" readonly>
	<input type="hidden" class="input" name="dat" value="<%= dat %>" readonly>
</div>
	<table class="table table-dark" border="1">
		<tr>
			
		</tr>
		<tr>
			<td>내용</td>
			<td><input type="text" name="item" id="item"></td>
		</tr>
		<tr>
			<td>금액</td>
			<td><input type="text" name="price" id="price"></td>
		</tr>
		<tr>
			<td align="center">
				<input type="submit" name="kind" value="수입" onClick="return chkReg('a')">
			</td>
			<td>
				<input type="submit" name="kind" value="지출" onClick="return chkReg('b')">
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