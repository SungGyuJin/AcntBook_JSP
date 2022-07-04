package Dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBcon {
	public static Connection getConnection() throws Exception {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con = DriverManager.getConnection(
				"jdbc:oracle:thin:@localhost:1521:XE"
				, "system"
				, "1234");
		if(con != null) {
			System.out.println("oracle success");
		}
		return con;
	}
}
