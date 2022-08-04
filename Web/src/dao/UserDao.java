package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Date;

import context.Connect;
import entity.User;

public class UserDao {
	Connection conn=null;
	PreparedStatement ps=null;
	ResultSet rs=null;
	
//	lay user
	public User getUser(String userName,String password) {
		User user=null;
		try {
			conn = new Connect().getConnection();
			ps = conn.prepareStatement("select * from book.user where username=?&&password=?;");
			ps.setString(1,userName);
			ps.setString(2, password);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				user=new User(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getDate(5),rs.getBoolean(6));
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return user;
	}
	
//	check userName
	public User getUserByuserName(String userName) {
		User user=null;
		try {
			conn = new Connect().getConnection();
			ps = conn.prepareStatement("select * from book.user where username=?;");
			ps.setString(1,userName);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				user=new User(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getDate(5),rs.getBoolean(6));
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return user;
	}
	
//	them user
	public void saveUser(String userName,String fullName,String email,String password,Date date,boolean isAdmin) {
		try {
			conn = new Connect().getConnection();
			ps = conn.prepareStatement("insert into book.user values(?,?,?,?,?,?);");
			ps.setString(1,userName);
			ps.setString(2, fullName);
			ps.setString(3, email);
			ps.setString(4, password);
			ps.setDate(5,(java.sql.Date) date);
			ps.setBoolean(6, isAdmin);
			ps.executeUpdate();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
	public static void main(String[] args) {
//		UserDao dao=new UserDao();
		long millis=System.currentTimeMillis();   
		java.sql.Date date=new java.sql.Date(millis);   
		System.out.println(date);
	}
}
