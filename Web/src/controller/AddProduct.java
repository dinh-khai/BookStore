package controller;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import dao.CategoryDao;
import dao.ProductDao;

/**
 * Servlet implementation class AddProduct
 */
@MultipartConfig
@WebServlet("/addProduct")
public class AddProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddProduct() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("test.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		try {
			String name=request.getParameter("name");
			String title=request.getParameter("title");
			String description=request.getParameter("description");
			double price=Double.parseDouble(request.getParameter("price")); 
			double publishedPrice=Double.parseDouble(request.getParameter("publishedPrice"));
			int amount=Integer.parseInt(request.getParameter("amount"));
			String author=request.getParameter("author");
			String published=request.getParameter("published");
			String nameCate=request.getParameter("nameCate");
			String nameClassify=request.getParameter("nameClassify");
			String realPart =request.getServletContext().getRealPath("/image");
			Part part=request.getPart("photo");
			String imageURL="./image/"+part.getSubmittedFileName().toString();
			part.write(realPart+"/"+part.getSubmittedFileName().toString());
			CategoryDao cateDao=new CategoryDao();
			ProductDao dao=new ProductDao();
			int idCate=(cateDao.findByNameCate(nameCate)).getId();
			int idClassify=0;
			if(nameClassify.trim().equalsIgnoreCase("Không thuộc phân loại nào")) {
				idClassify=0;
			}
			else {
			idClassify=(cateDao.findByNameClassify(nameClassify)).getId();
			}
			dao.saveProdouct(name, title, description, imageURL, price, publishedPrice, amount, author, published, idCate, idClassify);
//			request.getRequestDispatcher("admin.jsp").forward(request, response);
			response.sendRedirect("admin.jsp");
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}

}
