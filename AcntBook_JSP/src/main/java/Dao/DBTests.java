package Dao;

import java.sql.Connection;

public class DBTests {

	public static void main(String[] args) throws Exception {
		Connection con = DBcon.getConnection();
	}

}
