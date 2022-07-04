<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	body{
		background-image: url("money.jpg");
		background-size: cover;
	}
	#formTable{
		width: 200px;
		height: 300px;
		font-size: x-large;
		text-align: center;
		background-color: white;
		margin: auto;
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
<form action="loginPro.jsp" method="post">
	<table id="formTable" class="table table-dark table-striped">
		<thead>
			<tr>
				<td style="font-style: italic;" align="center" colspan="2"><h1>Save!!</h1></td>
			</tr>
		<thead>
		<tbody>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="id" id="id"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="pw" id="pw"></td>
			</tr>
			<tr>
				<td><input type="submit" value="LOGIN"></td>
				<td><input type="button" value="JOIN" onclick="location.href='joinpage.jsp'"></td>
			</tr>
		</tbody>
	</table>
</form>
<script type="text/javascript">
	window.history.forward();
	function noBack(){
		window.history.forward();
	}
</script>
</body>
</html>