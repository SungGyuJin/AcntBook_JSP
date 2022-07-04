<%@page import="Dao.DBcon"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
Calendar ca = Calendar.getInstance();
	
	int yearIns = ca.get(Calendar.YEAR);
	int monthIns = ca.get(Calendar.MONTH);
	int today = ca.get(Calendar.DATE);
	
	String year = request.getParameter("year");
	String month = request.getParameter("month");
	if(year == null){
		year = Integer.toString(yearIns);
	}
	if(month == null){
		month = Integer.toString(monthIns);
	}
	String sql = "Select year, month, kind, sum(price) price From acntAdd "
		+"Group by year, month, kind Having month = "+ (Integer.parseInt(month)+1) +" and year = "+ year +" "
		+"Order by kind asc";
	Connection conn = DBcon.getConnection();
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery(sql);
	
	ArrayList<String> list = new ArrayList<>();
	while(rs.next()){
		list.add(rs.getString("kind"));
		list.add(rs.getString("price"));
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>		
	#fm{
		font-size: x-large;
		text-align: center;
		background-color: white;
		margin: auto;
	}
	#add{
		width: 200px;
		font-size: xx-large;
		text-align: right;
		font-style: normal;
		border: none;
		font-style: italic;
	}
	#sub{
		width: 200px;
		font-size: xx-large;
		text-align: right;
		font-style: italic;
		border: none;
	}
	#rst{
		width: 200px;
		font-size: xx-large;
		text-align: right;
		font-style: italic;
		border: none;
		
	}
</style>
</head>
<body>
<table id="fm" border="10">
	<tr>
	<%
		if(list.size() == 4){
	%>
			<td style="font-size: 40px; background-color: rgb(072, 209, 204); font-style: italic;">&nbsp;&nbsp;전체수입&nbsp;&nbsp;</td>
			<td><input style="font-size: 40px;"  type="text" name="add" id="add" value="<%= list.get(1) %>" readonly>원&nbsp;</td>
			<td style="font-size: 40px; background-color: rgb(255, 105, 180); font-style: italic;">&nbsp;&nbsp;전체지출&nbsp;&nbsp;</td>
			<td><input style="font-size: 40px;"  type="text" name="sub" id="sub" value="<%= list.get(3) %>" readonly>원&nbsp;</td>
	<%		
		}else if(list.size() == 2){
			if(list.get(0).equals("+")){
	%>
				<td style="font-size: 40px; background-color: rgb(072, 209, 204); font-style: italic;">&nbsp;&nbsp;전체수입&nbsp;&nbsp;</td>
				<td><input style="font-size: 40px;"  type="text" name="add" id="add" value="<%= list.get(1) %>" readonly>원&nbsp;</td>
				<td style="font-size: 40px; background-color: rgb(255, 105, 180); font-style: italic;">&nbsp;&nbsp;전체지출&nbsp;&nbsp;</td>
				<td><input style="font-size: 40px;"  type="text" name="sub" id="sub" value="0" readonly>원&nbsp;</td>
	<%
			}else{
	%>
				<td style="font-size: 40px; background-color: rgb(072, 209, 204); font-style: italic;">&nbsp;&nbsp;전체수입&nbsp;&nbsp;</td>
				<td><input style="font-size: 40px;"  type="text" name="add" id="add" value="0" readonly>원&nbsp;</td>
				<td style="font-size: 40px; background-color: rgb(255, 105, 180); font-style: italic;">&nbsp;&nbsp;전체지출&nbsp;&nbsp;</td>
				<td><input style="font-size: 40px;"  type="text" name="sub" id="sub" value="<%= list.get(1) %>" readonly>원&nbsp;</td>
	<%			
			}
	%>
	<%
		}else {
	%>
			<td style="font-size: 40px; background-color: rgb(072, 209, 204); font-style: italic;">&nbsp;&nbsp;전체수입&nbsp;&nbsp;</td>
			<td><input style="font-size: 40px;"  type="text" name="add" id="add" value="0" readonly>원&nbsp;</td>
			<td style="font-size: 40px; background-color: rgb(255, 105, 180); font-style: italic;">&nbsp;&nbsp;전체지출&nbsp;&nbsp;</td>
			<td><input style="font-size: 40px;"  type="text" name="sub" id="sub" value="0" readonly>원&nbsp;</td>
	<%
		}
	%>
		<td style="font-size: 40px; background-color: rgb(135, 206, 250); font-style: italic;">&nbsp;&nbsp;잔액&nbsp;&nbsp;&nbsp;</td>
		<td><input style="font-size: 40px;"  type="text" name="rst" id="rst" value="0" readonly>원&nbsp;</td>
	</tr>
</table><br><br><br>
<script>
	var addmoney = document.querySelector("#add");
	var submoney = document.querySelector("#sub");
	var rst = document.querySelector("#rst");
	
	rst.value = parseInt(addmoney.value) - parseInt(submoney.value);
	
</script>
</body>
</html>