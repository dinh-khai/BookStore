package context;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Connect {
	private static String url="jdbc:mysql://localhost:3306/book";
	private static String user="root";
	private static String password="110720";

	public Connection getConnection() throws SQLException {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
			return DriverManager.getConnection(url,user,password);
	}
	public static void main(String[] args) throws SQLException {
		Connect c=new Connect();
		System.out.println(c.getConnection());
	}
	
}

