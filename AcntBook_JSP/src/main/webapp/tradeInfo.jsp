<%@page import="java.text.DecimalFormat"%>
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
	String regDate = request.getParameter("regDate");
	
	if(yearParam == null){
		yearParam = Integer.toString(year);
	}
	if(monthParam == null){
		monthParam = Integer.toString(month);
	}
	if(dateParam == null){
		dateParam = Integer.toString(date);
	}
	String sql = "Select * From acntAdd Where year = " + yearParam + " and month = " + (Integer.parseInt(monthParam)+1) + " and dat = "+dateParam+"Order by kind asc";
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
	#tradeInfo{
		table-layout: fixed;
		width: 100%;
		text-align: center;
	}
	#addKind{
		width: 30%;
		height: 100px;
		background-color: #00CCCC;
		border-radius: 20px;
	}
	#subKind{
		width: 30%;
		height: 100px;
		background-color: #FF6699;
		border-radius: 20px;
	}
	#btn_del{
		width: 100%;
		font-size: 40px;
		background: #DCDCDC;
	}
	#btn_del:hover{
		background: #A9A9A9;
	}
	#btn_modify{
		width: 50%;
		font-size: 40px;
		background: #87CEFA;
		margin-top: 10px;
	}
	#btn_modify:hover{
		background: #00BFFF;
	}
	#input_chk{
		margin-top: 6%;
		width: 100%;
		height: 60px;
	}
	.title_date{
		font-size: 40px;
		font-style: italic;
	}
	.th_font{
		font-size: 35px;
		font-style: italic;
	}
	.contentBox{
		width: 100%;
		height: 100px;
		color: white;
		background: #212529;
		border: none;
		text-align: center;
	}
</style>
</head>
<body>
<%
	/* out.println(yearParam);
	out.println(monthParam);
	out.println(dateParam); */
%>
<form method="post">
	<input type="hidden" id="year" name="year" value="<%= yearParam%>">
	<input type="hidden" id="month" name="month" value="<%= monthParam%>">
	<input type="hidden" id="dat" name="dat" value="<%= dateParam%>">
	<input type="hidden" id="regDate" name="regDate" value="<%= year+Integer.toString(month+1)+dateParam%>">
		<table id="tradeInfo" class="table table-dark">
			<tr>
				<td class="td" colspan="4">
					<span class="title_date"><%= yearParam %>년&nbsp;&nbsp;<%= Integer.parseInt(monthParam)+1 %>월&nbsp;&nbsp;<%= dateParam %>일</span>
				</td>
			</tr>
			<tr>
				<th class="th_font">선택</th>
				<th class="th_font">구분</th>
				<th class="th_font">내용</th>	
				<th class="th_font">금액</th>
			</tr>
		<%
				String kind = "";
				String addKind = "";
				String subKind = "";

				DecimalFormat df = new DecimalFormat("###,###");
				
				String price = "";
				
				ArrayList<String> list = new ArrayList<>();
				
			while(rs.next()){
				
				price = df.format(Integer.parseInt(rs.getString("price")));
				
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
					<td>
						<input type="checkbox" id="input_chk" name="chkItem" value="<%= rs.getString("regNum") %>">
					</td>	
		<% 
					if(kind.equals("➕")){
		%>			
					<td><input id="addKind" type="button" name="kind" value="<%= addKind %>"></td>
		<%
					}else{
		%>
					<td><input id="subKind" type="button" name="kind" value="<%= subKind %>"></td>
		<%
					}
		%>
					<td><input type="text" name="item" class="contentBox" value="<%= rs.getString("item") %>" readonly="readonly"></td>
					<td><input type="text" name="item" class="contentBox" value="<%= price %>원" readonly="readonly"></td>
				</tr>
		<%
			} // end while

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
				<td colspan="4" align="center">
					<input type="submit" id="btn_del" name="submit_kind" value="삭제" formaction="tradeDel" onClick="return delChk()" style="border-radius: 20px;">
				</td>
			</tr>
		<%
			}
		%>
		</table>
</form>
<script>
	
	var itemChk = false;
	var chkItem = document.getElementsByName("chkItem");
	
	function delChk(){
	
		for(var i = 0; i < chkItem.length; i++){
			if(chkItem[i].checked == true){
				itemChk = true;
				break;
			}
			
		}
		
		if(!itemChk){
			return false;
		}
	}
	
	
</script>
</body>
</html>