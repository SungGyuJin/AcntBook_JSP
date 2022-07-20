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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
<table class="table table-dark" id="fm">
	<tr>
	<%
		if(list.size() == 4){
	%>
			<td id="td">&nbsp;&nbsp;전체수입&nbsp;&nbsp;</td>
			<td id="input"><input style="font-size: 40px;" type="text" name="add" id="add" value="<%= list.get(1) %>" readonly>원&nbsp;</td>
			<td id="td">&nbsp;&nbsp;전체지출&nbsp;&nbsp;</td>
			<td id="input"><input style="font-size: 40px;"  type="text" name="sub" id="sub" value="<%= list.get(3) %>" readonly>원&nbsp;</td>
	<%		
		}else if(list.size() == 2){
			
			if(list.get(0).equals("+")){
	%>
				<td id="id">&nbsp;&nbsp;전체수입&nbsp;&nbsp;</td>
				<td id="input"><input style="font-size: 40px;"  type="text" name="add" id="add" value="<%= list.get(1) %> " readonly>원&nbsp;</td>
				<td id="id">&nbsp;&nbsp;전체지출&nbsp;&nbsp;</td>
				<td id="input"><input style="font-size: 40px;"  type="text" name="sub" id="sub" value="0" readonly>원&nbsp;</td>
	<%
			}else{
	%>
				<td id="td">&nbsp;&nbsp;전체수입&nbsp;&nbsp;</td>
				<td id="input"><input style="font-size: 40px;"  type="text" name="add" id="add" value="0" readonly>원&nbsp;</td>
				<td id="td">&nbsp;&nbsp;전체지출&nbsp;&nbsp;</td>
				<td id="input"><input style="font-size: 40px;"  type="text" name="sub" id="sub" value="<%= list.get(1) %>" readonly>원&nbsp;</td>
	<%			
			}
		}else {
	%>
			<td id="td">&nbsp;&nbsp;전체수입&nbsp;&nbsp;</td>
			<td id="input"><input style="font-size: 40px;"  type="text" name="add" id="add" value="0" readonly>원&nbsp;</td>
			<td id="td">&nbsp;&nbsp;전체지출&nbsp;&nbsp;</td>
			<td id="input"><input style="font-size: 40px;"  type="text" name="sub" id="sub" value="0" readonly>원&nbsp;</td>
	<%
		}
	%>
		<td id="td">&nbsp;&nbsp;잔액&nbsp;&nbsp;&nbsp;</td>
		<td id="input"><input style="font-size: 40px;"  type="text" name="rst" id="rst" value="0" readonly>원&nbsp;</td>
	</tr>
</table>
<input type="text" value="0" onKeyup="numberWithCommas(num);" />

<h1> * input </h1>
<input type="text" value="<%= Integer.parseInt(list.get(1)) %>" maxlength="10" load="inputNumberFormat(this);" placeholder="input 숫자만" readonly="readonly"/>
<!-- https://chobopark.tistory.com/175 -->
<h1> * div </h1>
<span id="money">60000</span><span>원</span>


	<% int num = 1312312; %>
<br>
<br>
<br>
<input type="text" inputmode="numeric">

<script>

	var addmoney = document.querySelector("#add");
	var submoney = document.querySelector("#sub");
	var rst = document.querySelector("#rst");
	
	rst.value = parseInt(addmoney.value) - parseInt(submoney.value);
	
	
	function numberWithCommas(num) {
		
		var regexp = /\B(?=(\d{3})+(?!\d))/g;
		
	    return num.toString().replace(regexp, ",");
	}
	
	function comma(str) {
        str = String(str);
        return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
    }

    function uncomma(str) {
        str = String(str);
        return str.replace(/[^\d]+/g, '');
    } 
    
    function inputNumberFormat(obj) {
        obj.value = comma(uncomma(obj.value));
    }
    
    function inputOnlyNumberFormat(obj) {
        obj.value = onlynumber(uncomma(obj.value));
    }
    
    function onlynumber(str) {
	    str = String(str);
	    return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g,'$1');
	}
    
    $(document).on('keyup','input[inputmode=numeric]',function(event){
    	this.value = this.value.replace(/[^0-9]/g,'');   // 입력값이 숫자가 아니면 공백
    	this.value = this.value.replace(/,/g,'');          // ,값 공백처리
    	this.value = this.value.replace(/\B(?=(\d{3})+(?!\d))/g, ","); // 정규식을 이용해서 3자리 마다 , 추가 	
    }); 

	
</script>
</body>
</html>