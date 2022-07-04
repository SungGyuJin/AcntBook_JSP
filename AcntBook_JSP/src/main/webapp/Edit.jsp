<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="Dao.DBcon"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp" %>
<%
	String item = request.getParameter("item");
	String sql = "SELECT * FROM acnt WHERE item= ?";
	Connection con = DBcon.getConnection();
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setString(1, item);
	ResultSet rs = pstmt.executeQuery();
	rs.next();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
		table{
			margin: auto;
			text-align:center;
		}
	</style>
</head>
<body>
	<h3 align="center">수정</h3>
	<form action="Edit" method="post">
		<table border="10">
			<tr>
				<td colspan="2">
					<input type="radio" class="input_2" name="kind" value="수입">수입&nbsp;&nbsp;&nbsp;
					<input type="radio" class="input_2" name="kind" value="지출">지출
				</td>
			</tr>	
			<tr>
				<td>날짜</td>
				<td><input type="text" name="date" id="date" value="<%= rs.getString("regDate") %>"></td>
			</tr>	
			<tr>
				<td>내용</td>
				<td><input type="text" name="item" id="item" value="<%= rs.getString("item") %>" ></td>
			</tr>
			<tr>
				<td>금액</td>
				<td><input type="text" name="price" id="price" value="<%= rs.getString("price") %>"></td>
			</tr>	
			<tr>
				<td colspan="2">
					<input type="submit" value="수정">
				</td>
			</tr>	
		</table>
	</form>
</body>
</html>