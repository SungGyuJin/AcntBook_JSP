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

@WebServlet("/tradeModify")
public class tradeModify extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		String year = request.getParameter("year");
		String month = request.getParameter("month");
		String dat = request.getParameter("dat");
		String item = request.getParameter("item");
		String price = request.getParameter("price");
		String regNum = request.getParameter("regNum");
		String regDate = request.getParameter("regDate");
		
		System.out.println(year);
		System.out.println(month);
		System.out.println(dat);
		System.out.println(item);
		System.out.println(price);
		System.out.println(regDate);
		System.out.println(regNum);
		
		String sql = "Update acntAdd set item = ?, price = ? Where regNum = ?";
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = DBcon.getConnection();
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, item);
			pstmt.setString(2, price);
			pstmt.setString(3, regNum);
			
			pstmt.executeUpdate();
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		response.sendRedirect("mainAddAcnt.jsp?year="+year+"&month="+(Integer.parseInt(month))+"&param="+dat+"&regDate="+regDate+"");
	}
}
