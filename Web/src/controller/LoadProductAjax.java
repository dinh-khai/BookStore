package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProductDao;
import entity.Product;

/**
 * Servlet implementation class LoadProductAjax
 */
@WebServlet("/loadProductAjax")
public class LoadProductAjax extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoadProductAjax() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nameSort=request.getParameter("nameSort");
		ProductDao dao=new ProductDao();
		int page=Integer.parseInt(request.getParameter("page"));
		int idCate=Integer.parseInt(request.getParameter("idCate"));
		List<Product> list=new ArrayList<Product>();
		response.setCharacterEncoding("UTF-8");
		PrintWriter out=response.getWriter();
		
		switch (nameSort) {
		case "Mới nhất":
			list=dao.getListProductsByPage(idCate, page);
			break;
		case "Giá cao-thấp":
			list=dao.pageByPriceHighToLow(idCate, page);
			break;
		case "Giá thấp-cao":
			list=dao.pageByPriceLowToHigh(idCate, page);
			break;
		default:
			break;
		}
		
		for(Product product : list) {
			
			out.println("<div class=\"grid__column-3\">\r\n" + 
					"									<div class=\"book-wrapper\">\r\n" + 
					"										<a href=\"detail?id="+product.getId() +"\" class=\"book-link\">\r\n"+
					"											<div class=\"book\">\r\n" + 
					"												<div class=\"book-img\">\r\n" + 
					"													<img\r\n" + 
					"														src=\""+product.getImage()+"\">\r\n" + 
					"												</div>\r\n" + 
					"												<div class=\"book-info\">\r\n" + 
					"													<h3 class=\"name\">"+product.getName()+"</h3>\r\n" + 
					"													<p class=\"author\">Tác giả :"+product.getAuthor()+"</p>\r\n" + 
					"													<p class=\"price\">Giá : "+product.getPrice() +"</p>\r\n" + 
					"												</div>\r\n" + 
					"											</div>\r\n" + 
					"										</a>\r\n" + 
					"										<div class=\"add-cart-wrapper\">\r\n" + 
					"											<button class=\"${sessiScope.user!=null?'y-user':'n-user' }\">Thêm\r\n" + 
					"												vào giỏ hàng</button>\r\n" + 
					"										</div>\r\n" + 
					"									</div>\r\n" + 
					"								</div>");
		}
	}
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
