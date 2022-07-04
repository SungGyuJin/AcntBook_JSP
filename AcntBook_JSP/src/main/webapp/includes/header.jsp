<%@page import="Dao.DBcon"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	*{
		margin: auto;
	}
	h1{
		background-color: pink;
		font-size: x-large;
		margin-top: 0;
	}
	#input_out{
		width: 300px;
		font-size: 30px;
		border: none;
		font-style: italic;
		background-color: rgb(230, 190, 100);
	}
</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
	<h1 style="font-size: 20px; font-style: italic;" align="center">💸Save!!💰</h1><br><br>
<%
String id = null;
	if(session.getAttribute("id") != null){
		id = (String) session.getAttribute("id");
		
		String sql = "Select name from joinPage where id= ?";
		Connection conn = DBcon.getConnection();
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		ResultSet rs = pstmt.executeQuery();
		
		if(rs.next()){
	String information = rs.getString("name");
%>
	<h2 style="font-size: 20px;"align="center"><%= information %>님 반갑습니다 ^ o ^ ~</h2>
<%
		}
%>
	<form action="logOut.jsp" method="post" align="center">
		<input id="input_out" type="submit" value="Logout">
	</form><br><br>
<%
	}else{
		out.println("<script>");
		out.println("location.href='loginForm.jsp'");
		out.println("</script>");
	}
%>
</body>
</html>