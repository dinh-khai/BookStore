package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDao;

/**
 * Servlet implementation class RegisterControl
 */
@WebServlet("/registerControl")
public class RegisterControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterControl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userName=request.getParameter("userName");
		String password=request.getParameter("password");
		String email=request.getParameter("email");
		String fullName=request.getParameter("fullName");
		String admin=request.getParameter("isAdmin");
		boolean isAdmin=Boolean.parseBoolean(admin);
		UserDao dao=new UserDao();
		response.setCharacterEncoding("UTF-8");
			long millis=System.currentTimeMillis();   
			java.sql.Date date=new java.sql.Date(millis); 
			dao.saveUser(userName, fullName, email, password, date, isAdmin);
	}

}
