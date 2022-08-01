<%@page import="java.text.DecimalFormat"%>
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
	
	DecimalFormat df = new DecimalFormat("###,###");
	
	String kind = "";
	String price = "";
	
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
		width: 50%;
		font-size: xx-large;
		text-align: right;
		font-style: normal;
		border: none;
		font-style: italic;
	}
	#sub{
		width: 50%;
		font-size: xx-large;
		text-align: right;
		font-style: italic;
		border: none;
	}
	#total_result{
		width: 50%;
		font-size: xx-large;
		text-align: right;
		font-style: italic;
		border: none;
	}
	#td{
		font-size: 40px;
		font-style: italic;
		text-align: right;
	}
	#input{
		font-size: 40px;
		font-style: italic;
		text-align: left;
	}
</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
<table class="table table-dark" id="fm">
	<tr>
		<td colspan="6"><span style="font-size: 50px;"><%= Integer.parseInt(month) + 1%>월 전체내역</span></td>
	</tr>
	<tr>
	<%
		int total_income = 0;
		int total_expense = 0;
		int total_result = 0;
		
		if(list.size() == 4){
	%>
			<td id="td">&nbsp;&nbsp;전체수입&nbsp;&nbsp;</td>
			<td id="input"><input style="font-size: 40px;" type="text" name="add" id="add" value="<%= df.format(Integer.parseInt(list.get(1))) %>" readonly>원&nbsp;</td>
			<td id="td">&nbsp;&nbsp;전체지출&nbsp;&nbsp;</td>
			<td id="input"><input style="font-size: 40px;"  type="text" name="sub" id="sub" value="<%= df.format(Integer.parseInt(list.get(3))) %>" readonly>원&nbsp;</td>
	<%	
			total_income = Integer.parseInt(list.get(1));
			total_expense = Integer.parseInt(list.get(3));
			total_result = total_income - total_expense;
		}else if(list.size() == 2){
			out.print("<h1>리스트 사이즈 : " + list.size() + "</h1>");
			if(list.get(0).equals("+")){ // 수입만 등록되어 있을때
	%>
				<td id="id">&nbsp;&nbsp;전체수입&nbsp;&nbsp;</td>
				<td id="input"><input style="font-size: 40px;"  type="text" name="add" id="add" value="<%= df.format(Integer.parseInt(list.get(1))) %> " readonly>원&nbsp;</td>
				<td id="id">&nbsp;&nbsp;전체지출&nbsp;&nbsp;</td>
				<td id="input"><input style="font-size: 40px;"  type="text" name="sub" id="sub" value="0" readonly>원&nbsp;</td>
	<%
				total_income = Integer.parseInt(list.get(1));
				total_expense = 0;
				total_result = total_income - total_expense;
			}else{ // 지출만 들록되어 있을때
	%>		
				<td id="td">&nbsp;&nbsp;전체수입&nbsp;&nbsp;</td>
				<td id="input"><input style="font-size: 40px;"  type="text" name="add" id="add" value="0" readonly>원&nbsp;</td>
				<td id="td">&nbsp;&nbsp;전체지출&nbsp;&nbsp;</td>
				<td id="input"><input style="font-size: 40px;"  type="text" name="sub" id="sub" value="<%= df.format(Integer.parseInt(list.get(1))) %>" readonly>원&nbsp;</td>
	<%	
				total_income = 0;
				total_expense = Integer.parseInt(list.get(1));
				total_result = total_income - total_expense;
			}
		}else { // 수입, 지출 어느 것도 등록이 안되어 있을때
	%>
			<td id="td">&nbsp;&nbsp;전체수입&nbsp;&nbsp;</td>
			<td id="input"><input style="font-size: 40px;"  type="text" name="add" id="add" value="0" readonly>원&nbsp;</td>
			<td id="td">&nbsp;&nbsp;전체지출&nbsp;&nbsp;</td>
			<td id="input"><input style="font-size: 40px;"  type="text" name="sub" id="sub" value="0" readonly>원&nbsp;</td>
	<%
		}
	%>
		<td id="td">&nbsp;&nbsp;잔액&nbsp;&nbsp;&nbsp;</td>
		<td id="input"><input style="font-size: 40px;"  type="text" name="total_result" id="total_result" value="<%= df.format(total_result) %>" readonly>원&nbsp;</td>
	</tr>
</table>
<hr>
</body>
</html>