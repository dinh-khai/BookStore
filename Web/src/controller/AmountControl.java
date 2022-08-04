package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cart.Cart;

/**
 * Servlet implementation class AmountControl
 */
@WebServlet("/amountControl")
public class AmountControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AmountControl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action=request.getParameter("action");
		int id=Integer.parseInt(request.getParameter("id"));
		HttpSession ses=request.getSession();
		Cart cart=(Cart) ses.getAttribute("cart");
		PrintWriter out=response.getWriter();
		switch (action) {
		case "Tang":
			cart.plus(id);
			break;
		case "Giam":
			cart.minus(id);
			break;
		default:
			break;
		}
		out.println(cart.amount(id));
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
