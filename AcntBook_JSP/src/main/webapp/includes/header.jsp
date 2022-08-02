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
	#logout{
		width: 150px;
		font-size: 30px;
		border: none;
		font-style: italic;
		background: #C0C0C0;
		border-radius: 5px;
	}
	#logout:hover{
		background: #808080;
	}
	#infoFm{
		width: 300px;
		background: #FFF8DC;
		border-collapse: collapse;
		border-radius: 8px;
		border-style: hidden;
		box-shadow: 0 0 0 1px #000;
		margin-top: 12px;
	}
	#infoText{
		color: black;
		font-style: italic;
	}
	#nim{
		color: black;
		font-style: italic;
		font-size: 22px;
	}
</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
	<!-- <h1 style="font-size: 20px; font-style: italic;" align="center">💸Save!!💰</h1><br><br> -->
<%
String id = null;
	if(session.getAttribute("id") != null){
		String person = "";
		id = (String) session.getAttribute("id");
		
		String sql = "Select name from joinPage where id= ?";
		Connection conn = DBcon.getConnection();
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		ResultSet rs = pstmt.executeQuery();
		
		if(rs.next()){
			person = rs.getString("name");
		}
%>
	<form action="logOut.jsp" method="post" align="center">
		<table id="infoFm">
			<tr>
				<td>
					<span id="infoText"><%= person %></span><span id="nim">님</span>
				</td>
				<td>
					<input type="submit" id="logout" value="로그아웃">
				</td>
			</tr>
		</table>
	</form>
<%
	}else{
		out.print("<script>");
		out.print("location.href='loginForm.jsp'");
		out.print("</script>");
	}
%>
<script>


</script>
</body>
</html>