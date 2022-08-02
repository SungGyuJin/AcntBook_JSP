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
	#joinTable{
		margin: auto;
		width: 200px;
		height: 300px;
		font-size: x-large;
		text-align: center;
		background-color: white;
		margin-top: 100px;
	}
	.content{
		width: 20%;
		height: 80px;
		font-size: 40px;
		border-radius: 15px;
	}
	#joinTitle{
		text-align: center;
		margin-top: 12%;
		font-style: italic;
		font-size: 60px;
	}
	#joinFm{
		text-align: center;
	}
	#btn{
		width: 10%;
		height: 80px;
		font-size: 40px;
		font-style: italic;
		border-radius: 15px;
	}
</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
	
	<h1 id="joinTitle">JOIN</h1><br>
	<form id="joinFm" action="joinChk" method="post">
		<input type="text" class="content" id="name" name="name" placeholder="NAME"><br><br>
		<input type="text" class="content" id="id" name="id" placeholder="ID"><br><br>
		<input type="password" class="content" id="pw" name="pw" placeholder="Password"><br><br>
		<input type="password" class="content" id="pwChk" name="pwChk" placeholder="Password Confirmation"><br><br>
		<input type="button" id="btn" value="Go" onclick="return joinChk()">
		<input type="button" id="btn" value="Back" onclick="location.href='loginForm.jsp'">
	</form>
	
<script type="text/javascript">

	var join_name = document.querySelector("#name");
	var join_id = document.querySelector("#id");
	var join_pw = document.querySelector("#pw");
	var join_pwChk = document.querySelector("#pwChk");
	
	function joinChk(){
		
		if(join_name.value == ""){
			alert("이름을 입력해주세요.");
			join_name.focus();
			return false;
		}
		if(join_id.value == ""){
			alert("아이디를 입력해주세요.");
			join_id.focus();
			return false;
		}
		if(join_pw.value == ""){
			alert("패스워드를 입력해주세요.");
			join_pw.focus();
			return false;
		}
		if(join_pwChk.value == ""){
			alert("패스워드 확인란을 입력해주세요.");
			join_pwChk.focus();
			return false;
		}
		if(join_pw.value != join_pwChk.value){
			alert("패스워드가 서로 일치하지않습니다.");
			return false;
		}
		
		alert("가입이 완료되었습니다. 로그인해주세요.");
		
		return true;
	}






</script>	
</body>
</html>