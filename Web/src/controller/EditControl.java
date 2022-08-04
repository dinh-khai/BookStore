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
 * Servlet implementation class EditControl
 */
@MultipartConfig
@WebServlet("/editControl")
public class EditControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditControl() {
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
		request.setCharacterEncoding("UTF-8");
		try {
			int id=Integer.parseInt(request.getParameter("id"));
			String name=request.getParameter("name");
			String title=request.getParameter("title");
			String image=request.getParameter("image");
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
			String imageURL=null;
			if(part.getSubmittedFileName().toString()=="") {
				imageURL=image;
			}
			else {
			imageURL="./image/"+part.getSubmittedFileName().toString();
			part.write(realPart+"/"+part.getSubmittedFileName().toString());
			}
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
			dao.update(id,name, title, description, imageURL, price, publishedPrice, amount, author, published, idCate, idClassify);
			response.sendRedirect("admin.jsp");
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}

}
