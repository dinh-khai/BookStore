package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDao;
import entity.User;

/**
 * Servlet implementation class LoginControl
 */
@WebServlet("/loginControl")
public class LoginControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginControl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Cookie arr[]=request.getCookies();
		if(arr!=null) {
		for (Cookie cookie : arr) {
			if(cookie.getName().equals("userName")) {
			request.setAttribute("user", cookie.getValue());
			}
			if(cookie.getName().equals("password")) {
				request.setAttribute("pass", cookie.getValue());
				}
		}
		}
		request.getRequestDispatcher("loginRegis.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userName=request.getParameter("userName");
		String password=request.getParameter("pass");
		String remember=request.getParameter("remember");
		
		UserDao dao=new UserDao();
		User user=dao.getUser(userName, password);
		HttpSession sess=request.getSession();
		sess.setAttribute("user", user);
		Cookie cookieUser=new Cookie("userName", userName);
		Cookie cookiePass=new Cookie("password", password);
		cookieUser.setMaxAge(600);
	//	cookiePass.setMaxAge(60);
		if(remember!=null) {
			cookiePass.setMaxAge(600);
		}
		else {
			cookiePass.setMaxAge(0);
		}
		//dua cookie lên chrome
		response.addCookie(cookieUser);
		response.addCookie(cookiePass);
		response.sendRedirect("index.jsp");
	}

}
