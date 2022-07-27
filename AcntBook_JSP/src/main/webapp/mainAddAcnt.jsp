<%@page import="Dao.DBcon"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.Calendar"%>
<%@include file="includes/header.jsp"%>
<jsp:include page="includes/cntHeader.jsp" />

<%
	//달력 객체생성
	Calendar ca = Calendar.getInstance();
	//클릭한 날짜 파라미터 값
	String dat = request.getParameter("param");
	int today = ca.get(Calendar.DATE);

	// 다음달 이전달 파라미터 값받기
	String strYear = request.getParameter("year");
	String strMonth = request.getParameter("month");
	
	int year = ca.get(Calendar.YEAR);	 
	int month = ca.get(Calendar.MONTH);
	
	int thatYear = ca.get(Calendar.YEAR);
	int thatMonth = ca.get(Calendar.MONTH);
	
	if(strYear != null){
		year = Integer.parseInt(strYear);
	}
	
	if(strMonth != null){
		
		month = Integer.parseInt(strMonth);
		if(month > 11){
			month = 0;
			year = year + 1;
		}else if(month < 0){
			month = 11;
			year = year - 1;
		}
		
	}
		
	ca.set(year, month, 1);
	// 웹에서 년도는 2021 년이라고 나오지만 월은 9월이라고 나온다.
	// 하지만 달력을 비교하면 10월 달력과 같다. 그렇다. 자바프로그래밍의 달력의 월은 0 ~ 11로 계산하니
	// 보여주고 싶은 월은 알아서 +- 하여 코드를 작성하자
	int dayOfweek = ca.get(Calendar.DAY_OF_WEEK);
	int lastDate = ca.getActualMaximum(Calendar.DAY_OF_MONTH);
	
	//if(dayOfweek == 1){d = "일";}if(dayOfweek == 2){d = "월";}
	//if(dayOfweek == 3){d = "화";}if(dayOfweek == 4){d = "수";}
	//if(dayOfweek == 5){d = "목";}if(dayOfweek == 6){d = "금";}
	//if(dayOfweek == 7){d = "토";}
	//위코드들을 반복문으로 바꾸면
	String d = "";
	String[] arr = {"일", "월", "화", "수", "목", "금", "토"};
	for(int num = 1; num <= 7; num++){
		if(dayOfweek == num){
	d = arr[num - 1];
		}
	}	
	//out.print(year + "년<br>");
	//out.print(month + 1 + "월<br>");
	//out.print("1일 시작요일 : " + d +"<br>");
	//out.print("말일 : " + lastDate + "일<br>");
	//out.print(strMonth +"<br>");
	//out.print("오늘날짜 : " + today +"<br>");
	//out.print(strMonth);
	
	/*if(dat == null){
		out.print("<script>");
		out.print("alert('널값');");
		out.print("</script>");
	}*/
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Acnt</title>
<style>
	#calMove{
		margin: auto;
		text-align: center;
		font-size: x-large;
		width: 100%;
		background-color: white;
	}
	#calMain{
		width: 100%;
		height: 100%;
		text-align: center;
		font-size: x-large;
		background-color: white;
	}
	.input_1{
		width: 335px;
		height: 50px;
		font-size: x-large;
	}
	.input_2{
		width: 50px;
		height: 25px;
		font-size: x-large;
	}
	.input_3{
		width: 600px;
		height: 50px;
		font-size: x-large;
	}
	#sat{
		color: blue;
		font-size: 20px;
		font-style: italic;
		width: 100px;
	}
	#sun{
		color: red;
		font-size: 20px;
		font-style: italic;
		width: 100px;
	}
	#basic_td{
		color: black;
		font-size: 20px;
		font-style: italic;
		width: 100px;
		height: 140px;
	}
	#nextMonthDate{
		font-size: 20px;
		font-style: italic;
		color: grey;
		width: 100px;
	}
	
	a{text-decoration: none; color: #646464;}
	a:link{text-decoration: none; color: #646464;}
	a:visited{text-decoration: none; color: #646464;}
	a:active{text-decoration: none; color: #646464;}
	a:hover{text-decoration: none; color: #646464;}
	
	.th{
		font-size: 20px;
		font-style: italic;
		background-color: ;
	}
	#addMon{
		color: #00CCCC;
		font-weight: bold;
	}
	#subMon{
		color: #FF6699;
		font-weight: bold;
	}
	
	/* div 화면 등분*/
	div{
		width:50%;
		float: left;
	}
	div.left{
		width:50%;
		float: left;
	}
	div.right{
		width: 50%;
		float: rigth;
		
	}
	.mouse_hover:hover{
		background-color: pink;
	}
</style>
</head>
<body>
<div class="left">
	<%-- <table align="center">
		<tr>
			<td>
				<a href="reg.jsp?year=<%=year%>&month=<%=month + 1%>&param=<%=dat%>&regDate=<%=year+Integer.toString(month+1)+dat%>" onClick="return regChk()">
					<img src="plus.png" style="width: 80px; margin: auto;">
				</a>
			</td>
		</tr>	
	</table> --%>
	
	<table id="calMove" class="table table-striped">
		<thead>
			<tr>
				<td><a href="mainAddAcnt.jsp?&year=<%=year - 1%>&month=<%=month%>">◀</a></td>
				<td><a style="color: black; font-style: italic;" href="mainAddAcnt.jsp?&year=<%=year%>&month=<%=month - 1%>">이전달</a></td>
				<td><a style="color: black; font-style: italic; font-size: 20px;" href="mainAddAcnt.jsp?year=<%= thatYear %>&month=<%= thatMonth %>&param=<%= today%>&regDate=<%=year+Integer.toString(month+1)+today %>"><span><%=year%>&nbsp;/&nbsp;<%=month + 1%></span></a></td>
				<td><a style="color: black; font-style: italic;" href="mainAddAcnt.jsp?&year=<%=year%>&month=<%=month + 1%>">다음달</a></td>
				<td><a href="mainAddAcnt.jsp?&year=<%=year + 1%>&month=<%=month%>">▶</a></td>
		 </tr>
		</thead>
	</table>
	<br>
	<table id="calMain" class="table table-striped" border="1">
		<thead>
			<tr>
				<th style="color: red; font-size: 20px; font-style: italic;">Sun</th>
				<th class="th">Mon</th>
				<th class="th">Tue</th>
				<th class="th">Wed</th>
				<th class="th">Thu</th>
				<th class="th">Fri</th>
				<th style="color: blue; font-size: 20px; font-style: italic;">Sat</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<%
				// 1일 시작 날짜 and 1 2 3 4 ... 31 테이블 하나당 날짜찍기
				// 한 주의 토요일이 끝나면 개행
				
				int count = 0; // 개행을 위한  count 변수선언
							
				/* 1일이 시작되기전까지 빈칸을 찍는 작업 */
				/* dayOfweek는 그 달의 1일이 시작되는 요일을 뜻합니다 */
				for(int blank = 1; blank < dayOfweek; blank++){ 
					out.print("<td></td>");
					count++;
				}
				
				Connection conn = DBcon.getConnection();
				Statement stmt = conn.createStatement();
				
				// 빈칸은 끝났다 이제 말일까지 날짜를 찍자
				for(int day = 1; day <= lastDate; day++){
					ArrayList<String> list = new ArrayList<>();
					String regData = (Integer.toString(year) + Integer.toString(month + 1)) + Integer.toString(day); // 년, 월 합체
					String sql = "Select regDate, kind, sum(price) price From acntAdd Where regDate = '"+regData+"' Group by regDate, kind Order by kind asc";
					String addMon = "";
					String subMon = "";
					count++;
					
					// 토요일
					if(count % 7 == 0){
					ResultSet rs = stmt.executeQuery(sql);
						while(rs.next()){
							if(regData.equals(rs.getString("regDate"))){
								list.add(rs.getString("kind"));
								list.add(rs.getString("price"));
								if(list.size() == 4){
									addMon = list.get(1);
									subMon = list.get(3);
								}else if(list.get(0).equals("-")){
									addMon = "";
									subMon = list.get(1);
								}else{
									addMon = list.get(1);
									subMon = "";
								}
							}
						}	// while end
				%>
					<td class="mouse_hover" valign="top" align="center" id="sat" onClick="location.href='mainAddAcnt.jsp?year=<%= year %>&month=<%= month %>&param=<%= day%>&regDate=<%=year+Integer.toString(month+1)+day %>'">
						<br><%= day %><br>
						<span id="addMon"><%= addMon %></span><br>
						<span id="subMon"><%= subMon %></span>
					</td>
				<%		
					// 일요일
					}else if(count % 7 == 1){
						ResultSet rs = stmt.executeQuery(sql);
						while(rs.next()){
							if(regData.equals(rs.getString("regDate"))){
								list.add(rs.getString("kind"));
								list.add(rs.getString("price"));
								if(list.size() == 4){
									addMon = list.get(1);
									subMon = list.get(3);
								}else if(list.get(0).equals("-")){
									addMon = "";
									subMon = list.get(1);
								}else{
									addMon = list.get(1);
									subMon = "";
								}
							}
						}	// while end
				%>
					<td class="mouse_hover" valign="top" align="center" id="sun" onClick="location.href='mainAddAcnt.jsp?year=<%= year %>&month=<%= month %>&param=<%= day%>&regDate=<%=year+Integer.toString(month+1)+day %>'">
						<br><%= day %><br>
						<span id="addMon"><%= addMon %></span><br>
						<span id="subMon"><%= subMon %></span>
					</td>
				<%
					// 평일
					}else{ 
						ResultSet rs = stmt.executeQuery(sql);
						while(rs.next()){
							
							if(regData.equals(rs.getString("regDate"))){
								list.add(rs.getString("kind"));
								list.add(rs.getString("price"));
								if(list.size() == 4){
									addMon = list.get(1);
									subMon = list.get(3);
								}else if(list.get(0).equals("-")){
									addMon = "";
									subMon = list.get(1);
								}else{
									addMon = list.get(1);
									subMon = "";
								}
							}
						}	// while end
				%>
					<td class="mouse_hover" valign="top" align="center" id="basic_td" onClick="location.href='mainAddAcnt.jsp?year=<%= year %>&month=<%= month %>&param=<%= day%>&regDate=<%=year+Integer.toString(month+1)+day %>'">
						<br><%= day %><br>
						<span id="addMon"><%= addMon %></span><br>
						<span id="subMon"><%= subMon %></span>
					</td>
				<%			
					}
						// 달력의 개행작업
						if(count % 7 == 0){
							out.print("</tr>");
						}
					} // 날짜찍는 for문 끝
					
					/* 그 달의 날짜가 다 입력된 후 남은 공백입력 */
					if(count == 28 || count == 35){
						for(int i = 1; i <= 7; i++){
							out.print("<td id='nextMonthDate'><br>"+i+"</td>");
						}
					}
					if(count > 28 && count < 35){
						int sub = 35 - count;
						for(int i = 1; i <= sub; i++){
							out.print("<td id='nextMonthDate'><br>"+i+"</td>");
						}
					}
					if(count > 35){
						int sub = 42 - count;
						for(int i = 1; i <= sub; i++){
							out.print("<td id='nextMonthDate'><br>"+i+"</td>");
						}
					}
				%>
			</tr>
		</tbody>
	</table>
</div>
<div class="right">
	<jsp:include page="reg.jsp" />
	<br><br>
	<jsp:include page="tradeInfo.jsp" />
</div>
<script>
	$(document).ready(function(){
		$("#btn_test").on("click", function(e){
			alert("ㅎㅇㅎㅇㅇㅇ");
		});
	});
	


</script>
</body>
</html>