package entity;

import java.util.Date;

public class User {
	private String userName;
	private String fullName;
	private String email;
	private String password;
	private Date createdTime;
	private boolean isAdmin;
	
	public User() {
		
	}
	
	public User(String userName, String fullName, String email, String password, Date createdTime, boolean isAdmin) {
		super();
		this.userName = userName;
		this.fullName = fullName;
		this.email = email;
		this.password = password;
		this.createdTime = createdTime;
		this.isAdmin = isAdmin;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Date getCreatedTime() {
		return createdTime;
	}

	public void setCreatedTime(Date createdTime) {
		this.createdTime = createdTime;
	}

	public boolean isAdmin() {
		return isAdmin;
	}

	public void setAdmin(boolean isAdmin) {
		this.isAdmin = isAdmin;
	}
	
}
