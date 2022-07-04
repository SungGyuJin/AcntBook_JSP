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

@WebServlet("/joinChk")
public class joinChk extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String name = request.getParameter("name");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String pwChk = request.getParameter("pwChk");

		String joinReg = "Insert Into joinPage Values(?, ?, ?, ?)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DBcon.getConnection();
			pstmt = conn.prepareStatement(joinReg);
			
			pstmt.setString(1, name);
			pstmt.setString(2, id);
			pstmt.setString(3, pw);
			pstmt.setString(4, pwChk);

			pstmt.executeUpdate();
			
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		response.setContentType("text/html; charset=UTF-8");
		System.out.println("회원가입 서블릿 동작완료");
		String url = "loginForm.jsp";
		PrintWriter wt = response.getWriter();
		wt.print("<script>"
				+ 	"alert('가입완료!! 로그인해주세요!!');"
				+ 	"location.href = '" + url + "';"
			   + "</script>");
		wt.close();
	}

}
