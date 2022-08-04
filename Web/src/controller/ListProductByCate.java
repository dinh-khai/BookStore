package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProductDao;
import entity.Product;

/**
 * Servlet implementation class ListProductByCate
 */
@WebServlet("/listProductByCate")
public class ListProductByCate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListProductByCate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ProductDao dao=new ProductDao();
		int idCate=Integer.parseInt(request.getParameter("idCate"));
		String nameCate=request.getParameter("nameCate");
		List<Product> listAll=dao.getAllProductsByCate(idCate);
		List<Product> list =dao.getListProductsByCate(idCate);
		int page=0;
		if(listAll.size() % 4==0) {
			page=listAll.size()/4;
		}
		else {
			page=listAll.size()/4+1;
		}
		request.setAttribute("list", list);
//		request.setAttribute("listAll", listAll);
//		request.setAttribute("listAll", listAll);
//		request.setAttribute("page",list.size());
		request.setAttribute("page", page);
		request.setAttribute("nameCate", nameCate);
		request.setAttribute("idCate",idCate);
		request.getRequestDispatcher("category.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
