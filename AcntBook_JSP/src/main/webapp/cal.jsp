<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.calInput{
		width: 100px;
		height: 100px;
		font-size: 50px;
		border: none;
		background-color: black;
		color: white;
	}
	
	#view{
		width: 300px;
		text-align: right;
		font-size: 50px;
	}
	#zero{
		width: 100px;
	}
	#calTable{
		background-color: black;
		text-align: center;
		margin-left: 310px;
	}
	.compute{
		background-color: orange;
		width: 100px;
		height: 100px;
		font-size: 50px;
		border: none;
	}

</style>
</head>
<body>
	<table id="calTable">
		<tr>
			<td colspan="3"><input class="calInput" type="text" name="view" id="view" readonly></td>
			<td><input class="compute" type="button" name="div" id="div" value="÷" onclick="calc('÷')"></td>
		</tr>
		<tr>
			<td><input class="calInput" type="button" name="seven" id="seven" value="7" onclick="btnNum(7)"></td>
			<td><input class="calInput" type="button" name="eight" id="eight" value="8" onclick="btnNum(8)"></td>
			<td><input class="calInput" type="button" name="nine" id="nine" value="9" onclick="btnNum(9)"></td>
			<td><input class="compute" type="button" name="mul" id="mul" value="x" onclick="calc('x')"></td>
		</tr>
		<tr>
			<td><input class="calInput" type="button" name="four" id="four" value="4" onclick="btnNum(4)"></td>
			<td><input class="calInput" type="button" name="five" id="five" value="5" onclick="btnNum(5)"></td>
			<td><input class="calInput" type="button" name="six" id="six" value="6" onclick="btnNum(6)"></td>
			<td><input class="compute" type="button" name="subb" id="subb" value="-" onclick="calc('-')"></td>
		</tr>
		<tr>
			<td><input class="calInput" type="button" name="one" id="one" value="1" onclick="btnNum(1)"></td>
			<td><input class="calInput" type="button" name="two" id="two" value="2" onclick="btnNum(2)"></td>
			<td><input class="calInput" type="button" name="three" id="three" value="3" onclick="btnNum(3)"></td>
			<td><input class="compute" type="button" name="addd" id="addd" value="+" onclick="calc('+')"></td>
		</tr>
		<tr>
			<td><input class="calInput" type="button" name="zero" value="0" onclick="btnNum(0)"></td>
			<td><input class="calInput" type="button" name="clear" value="C" onclick="numClear()"></td>
			<td><input class="calInput" type="button" name="dot" id="dot" value="." onclick="dott()"></td>
			<td><input class="compute" type="button" name="resultt" id="resultt" value="=" onclick="lastView()"></td>
		</tr>
	</table>
<script src="calc.js"></script>
</body>
</html>