package Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.DBcon;

@WebServlet("/Addmoney")
public class Addmoney extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		String regNum = request.getParameter("regNum");
		String item = request.getParameter("item");
		String kind = request.getParameter("kind");
		if(kind.equals("수입")){
			kind = "+";
		}else {
			kind = "-";
		}
		String price = request.getParameter("price");
		String regDate = request.getParameter("regDate");
		String year = request.getParameter("year");
		String month = request.getParameter("month");
		String dat = request.getParameter("dat");
		
		String sql = "Insert Into acntAdd Values(?, ?, ?, ?, ?, ?, ?, ?)";
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = DBcon.getConnection();
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, regNum);
			pstmt.setString(2, item);
			pstmt.setString(3, kind);
			pstmt.setString(4, price);
			pstmt.setString(5, regDate);
			pstmt.setString(6, year);
			pstmt.setString(7, month);
			pstmt.setString(8, dat);

			pstmt.executeUpdate();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		response.setContentType("text/html; charset=UTF-8");
		String url = "mainAddAcnt.jsp?year="+year+"&month="+(Integer.parseInt(month)-1)+"&param="+dat;
		PrintWriter wt = response.getWriter();
		wt.print("<script>"
				+ "location.href = '" + url + "';"
			   + "</script>");
		wt.close();
	}
}
