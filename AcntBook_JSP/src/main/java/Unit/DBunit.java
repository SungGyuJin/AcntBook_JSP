package Unit;

import java.sql.Connection;

import org.junit.jupiter.api.Test;

class DBunit {

	@Test
	public void test() throws Exception {
		Connection conn = DBcon.getConnection();
	}

}
