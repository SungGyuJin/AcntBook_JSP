<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="Dao.DBcon"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<style>
	body{
		background-image: url("money.jpg");
		background-size: cover;
	}
	#joinTable{
		margin: auto;
		width: 200px;
		height: 300px;
		font-size: x-large;
		text-align: center;
		background-color: white;
		margin-top: 100px;
	}
	input{
		width: 200px;
		height: 50px;
		font-size: x-large;
		border: none;
	}
</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
	
	<form action="joinChk" method="post">
		<table id="joinTable" class="table table-dark table-striped" align="center">
		<thead>
			<tr>
				<td colspan="2"><h1 align="center">JOIN</h1></td>
			</tr>
		</thead>
			<tr>
				<td>이름</td>
				<td><input type="text" id="name" name="name" placeholder="이름"></td>
			</tr>
			<tr>
				<td>아이디</td>
				<td><input type="text" id="id" name="id" placeholder="ID"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" id="pw" name="pw" placeholder="PW"></td>
			</tr>
			<tr>
				<td>비밀번호 확인</td>
				<td><input type="password" id="pwChk" name="pwChk" placeholder="PW확인"></td>
			</tr>
			<tr>
				<td><input type="submit" value="Go" onclick="return chk()"></td>
				<td><input type="button" value="Back" onclick="location.href='loginForm.jsp'"></td>
			</tr>
		</table>
	</form>
<script src="sc.js"></script>
</body>
</html>