<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#formTable{
		font-size: x-large;
		text-align: center;
		background-color: white;
		margin: auto;
		margin-top: 100px;
	}
	.content{
		width: 20%;
		height: 80px;
		font-size: 40px;
		border-radius: 15px;
	}
	#loginTitle{
		text-align: center;
		margin-top: 15%;
		font-style: italic;
		font-size: 60px;
	}
	#loginFm{
		text-align: center;
	}
	#btn{
		width: 10%;
		width: 10%;
		height: 80px;
		font-size: 40px;
		font-style: italic;
		border-radius: 15px;
	}
</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script type="text/javascript">
	window.history.forward();
	function noBack(){
		window.history.forward();
	}
</script>
</head>
<body>

	<h1 id="loginTitle">Acnt Book</h1><br>
	<form id="loginFm" action="loginPro.jsp" method="post">
		<input type="text" class="content" placeholder="ID" name="id" id="id"><br><br>
		<input type="password" class="content" placeholder="PW" name="pw" id="pw"><br><br>
		<input type="submit" id="btn" value="LOGIN">
		<input type="button" id="btn" value="JOIN" onclick="location.href='joinpage.jsp'">
</form>

</body>
</html>