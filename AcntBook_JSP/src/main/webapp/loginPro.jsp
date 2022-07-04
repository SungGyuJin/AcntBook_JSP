<%@page import="Dao.DBcon"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
Calendar ca = Calendar.getInstance();
	
	int year = ca.get(Calendar.YEAR);
	int month = ca.get(Calendar.MONTH);
	int today = ca.get(Calendar.DATE);

	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	String sql = "Select * from joinPage where id = ?";
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try{
		conn = DBcon.getConnection();
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		rs = pstmt.executeQuery();
		
		if(rs.next()){
	if(pw.equals(rs.getString("pw"))){
		session.setAttribute("id", id);
		out.println("<script>");
		out.println("alert('로그인성공!!');");
		out.println("location.href='mainAddAcnt.jsp?year="+year+"&month="+month+"&param="+today+"'");
		out.println("</script>");
	}
		}
		out.println("<script>");
		out.println("alert('로그인실패')");
		out.println("location.href='loginForm.jsp'");
		out.println("</script>");
	}catch(Exception e){
		e.printStackTrace();
	}
%>
</body>
</html>