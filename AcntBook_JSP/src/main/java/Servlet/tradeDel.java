package Servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.DBcon;

@WebServlet("/tradeDel")
public class tradeDel extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		String year = request.getParameter("year");
		String month = request.getParameter("month");
		String dat = request.getParameter("dat");
		String[] chks = request.getParameterValues("chkItem");
		String regDate = request.getParameter("regDate");
		String sql = "Delete From acntAdd Where regNum= ?";
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = DBcon.getConnection();
			pstmt = con.prepareStatement(sql);
			
			for(int i = 0; i < chks.length; i++) {
				pstmt.setString(1, chks[i]);
				pstmt.executeUpdate();
			}
			System.out.println("삭제개수" + chks.length);
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("삭제 서블릿 실행완료");
		response.sendRedirect("mainAddAcnt.jsp?year="+year+"&month="+month+"&param="+dat+"&regDate="+regDate+"");
	}

}
