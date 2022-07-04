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

@WebServlet("/Edit")
public class Edit extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String item = request.getParameter("item");
		String kind = request.getParameter("kind");
		String price = request.getParameter("price");
		String date = request.getParameter("date");
		
		String sql = "UPDATE acnt SET item= ?, kind= ?, price= ?, regDate= ? Where item= ?";
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = DBcon.getConnection();
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, kind);
			pstmt.setString(2, price);
			pstmt.setString(3, date);
			pstmt.setString(4, item);
			
			pstmt.executeUpdate();
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("Edit 서블릿 실행완료");
		response.sendRedirect("mainAddAcnt.jsp");
	}
}
