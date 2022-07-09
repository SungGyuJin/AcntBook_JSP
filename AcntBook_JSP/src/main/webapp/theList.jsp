<%@page import="java.util.Calendar"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Dao.DBcon"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Calendar ca = Calendar.getInstance();
	
	int year = ca.get(Calendar.YEAR);
	int month = ca.get(Calendar.MONTH);
	int date = ca.get(Calendar.DATE);

	String yearParam = request.getParameter("year");
	String monthParam= request.getParameter("month");
	String dateParam = request.getParameter("param");
	if(yearParam == null){
		yearParam = Integer.toString(year);
	}
	if(monthParam == null){
		monthParam = Integer.toString(month);
	}
	if(dateParam == null){
		dateParam = Integer.toString(date);
	}
	String sql = "Select * From acntAdd Where year = " + yearParam + " and month = " + (Integer.parseInt(monthParam)+1) + " and dat = "+dateParam+"";
	Connection con = DBcon.getConnection();
	Statement stmt = con.createStatement();
	ResultSet rs = stmt.executeQuery(sql);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.td{
		text-align: center;
	}
	#theListTable{
		width: 30%;
		text-align: center;
	}
	#addKind{
		background-color: #00CCCC;
	}
	#subKind{
		background-color: pink;
	}
	#btn_del{
		width: 100%;
	}
	#input_chk{
		width: 30px;
		height: 30px;
	}
</style>
</head>
<body>
<%
	out.println(yearParam);
	out.println(monthParam);
	out.println(dateParam);
%>
<form action="Del" method="post">
	<input type="text" name="year" value="<%= yearParam%>">
	<input type="text" name="month" value="<%= monthParam%>">
	<input type="text" name="dat" value="<%= dateParam%>">
		<table id="theListTable" class="table table-dark" align="center">
			<tr>
				<td class="td" colspan="4"><%= yearParam %>년&nbsp;<%= Integer.parseInt(monthParam)+1 %>월&nbsp;<%= dateParam %>일</td>
			</tr>
			<tr>
				<th>선택</th>
				<th>구분</th>
				<th>내용</th>
				<th>금액</th>
			</tr>
		<%
				String kind = "";
				String addKind = "";
				String subKind = "";

				ArrayList<String> list = new ArrayList<>();
				
			while(rs.next()){
				
				if(rs.getString("kind").equals("+")){
					kind = "➕";
					addKind = "➕";
				}else{
					kind = "➖";
					subKind = "➖";
				}
				
				list.add(kind); // 거래내역 데이터를 결정할 list에 추가
				
		%>
				<tr>
					<td class="td" ><input type="checkbox" id="input_chk" name="chkItem" value="<%= rs.getString("regNum") %>"></td>
		<% 
					if(kind.equals("➕")){
		%>		
					<td class="td" id="addKind"><%= addKind %></td>
		<%
					}else{
		%>
					<td class="td" id="subKind"><%= subKind %></td>
		<%
					}
		%>
					<td class="td" ><%= rs.getString("item") %></td>
					<td class="td" ><%= rs.getString("price") %>원</td>
				</tr>
		<%
			
			}

				if(list.size() == 0){
		%>
				<tr>
					<td colspan="4">
						<h3>거래내역이 없습니다.</h3>
					</td>
				</tr>
		<%
				}
			if(list.size() != 0){
		%>
			<tr>
				<td colspan="4" align="center"><input type="submit" id="btn_del" value="삭제" onClick="return Del()"></td>
			</tr>
		<%
			}
		%>
		
		</table>
</form>
<script>
	function Del(){
		alert("삭제완료!!");
	}
</script>
</body>
</html>