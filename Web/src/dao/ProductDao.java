package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.List;
import java.sql.ResultSet;
import context.Connect;
import entity.Product;

public class ProductDao {
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	// lay ra danh sach tat ca san pham
	public List<Product> getListProducts() {
		List<Product> list = new ArrayList<Product>();
		try {
			conn = new Connect().getConnection();
			ps = conn.prepareStatement("select * from book.product;");
			rs = ps.executeQuery();
			while (rs.next()) {
				Product product = new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),
						rs.getString(5), rs.getDouble(6), rs.getDouble(7), rs.getString(8), rs.getString(9),
						rs.getInt(10), rs.getInt(11), rs.getInt(12));
				list.add(product);
			}

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return list;
	}

	// lay ra danh sach san pham moi nhat
	public List<Product> getListNewProducts() {
		List<Product> list = new ArrayList<Product>();
		try {
			conn = new Connect().getConnection();
			ps = conn.prepareStatement("select * from book.product order by id DESC limit 4;");
			rs = ps.executeQuery();
			while (rs.next()) {
				Product product = new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),
						rs.getString(5), rs.getDouble(6), rs.getDouble(7), rs.getString(8), rs.getString(9),
						rs.getInt(10), rs.getInt(11), rs.getInt(12));
				list.add(product);
			}

		} catch (Exception e) {

		}
		return list;
	}
	
//	lay tat ca san pham theo category
	public List<Product> getAllProductsByCate(int idCate) {
		List<Product> list = new ArrayList<Product>();
		try {
			conn = new Connect().getConnection();
			ps = conn.prepareStatement("select * from book.product where idcate=? order by id ASC;");
			ps.setInt(1, idCate);
			rs = ps.executeQuery();

			while (rs.next()) {
				Product product = new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),
						rs.getString(5), rs.getDouble(6), rs.getDouble(7), rs.getString(8), rs.getString(9),
						rs.getInt(10), rs.getInt(11), rs.getInt(12));
				list.add(product);
			}

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return list;
	}

//	lay 12 san pham theo danh muc
	public List<Product> getListProductsByCate(int idCate) {
		List<Product> list = new ArrayList<Product>();
		try {
			conn = new Connect().getConnection();
			ps = conn.prepareStatement("select * from book.product where idcate=? order by id ASC limit 4;");
			ps.setInt(1, idCate);
			rs = ps.executeQuery();

			while (rs.next()) {
				Product product = new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),
						rs.getString(5), rs.getDouble(6), rs.getDouble(7), rs.getString(8), rs.getString(9),
						rs.getInt(10), rs.getInt(11), rs.getInt(12));
				list.add(product);
			}

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return list;
	}
	
//	phan trang theo category
	public List<Product> getListProductsByPage(int idCate,int page) {
		List<Product> list = new ArrayList<Product>();
		try {
			conn = new Connect().getConnection();
			ps = conn.prepareStatement("select * from book.product where idcate=? order by id ASC limit ?,4;");
			ps.setInt(1, idCate);
			ps.setInt(2, 4*(page-1));
			rs = ps.executeQuery();

			while (rs.next()) {
				Product product = new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),
						rs.getString(5), rs.getDouble(6), rs.getDouble(7), rs.getString(8), rs.getString(9),
						rs.getInt(10), rs.getInt(11), rs.getInt(12));
				list.add(product);
			}

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return list;
	}
	
	/*
	 * sort
	 */
	
//	sắp xếp giá từ cao tới thấp
	public List<Product> sortByPriceHighToLow(int idCate,int page){
		List<Product> list = new ArrayList<Product>();
		try {
			conn = new Connect().getConnection();
			ps = conn.prepareStatement("select * from book.product where idcate=? order by price DESC limit ?,4;");
			ps.setInt(1, idCate);
			ps.setInt(2,4*(page-1));
			rs = ps.executeQuery();

			while (rs.next()) {
				Product product = new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),
						rs.getString(5), rs.getDouble(6), rs.getDouble(7), rs.getString(8), rs.getString(9),
						rs.getInt(10), rs.getInt(11), rs.getInt(12));
				list.add(product);
			}

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return list;
	}
	
//	phân trang theo gia cao-thấp
	public List<Product> pageByPriceHighToLow(int idCate,int page){
		List<Product> list = new ArrayList<Product>();
		try {
			conn = new Connect().getConnection();
			ps = conn.prepareStatement("select * from book.product where idcate=? order by price DESC limit ?,4;");
			ps.setInt(1, idCate);
			ps.setInt(2, 4*(page-1));
			rs = ps.executeQuery();

			while (rs.next()) {
				Product product = new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),
						rs.getString(5), rs.getDouble(6), rs.getDouble(7), rs.getString(8), rs.getString(9),
						rs.getInt(10), rs.getInt(11), rs.getInt(12));
				list.add(product);
			}

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return list;
	}
	
//	sắp xếp theo giá từ thấp đến cao
	public List<Product> sortByPriceLowToHigh(int idCate,int page){
		List<Product> list = new ArrayList<Product>();
		try {
			conn = new Connect().getConnection();
			ps = conn.prepareStatement("select * from book.product where idcate=? order by price ASC limit ?,4;");
			ps.setInt(1, idCate);
			ps.setInt(2, 4*(page-1));
			rs = ps.executeQuery();

			while (rs.next()) {
				Product product = new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),
						rs.getString(5), rs.getDouble(6), rs.getDouble(7), rs.getString(8), rs.getString(9),
						rs.getInt(10), rs.getInt(11), rs.getInt(12));
				list.add(product);
			}

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return list;
	}
	
//	phân trang theo giá từ thấp đến cao
	public List<Product> pageByPriceLowToHigh(int idCate,int page){
		List<Product> list = new ArrayList<Product>();
		try {
			conn = new Connect().getConnection();
			ps = conn.prepareStatement("select * from book.product where idcate=? order by price ASC limit ?,4;");
			ps.setInt(1, idCate);
			ps.setInt(2, 4*(page-1));
			rs = ps.executeQuery();

			while (rs.next()) {
				Product product = new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),
						rs.getString(5), rs.getDouble(6), rs.getDouble(7), rs.getString(8), rs.getString(9),
						rs.getInt(10), rs.getInt(11), rs.getInt(12));
				list.add(product);
			}

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return list;
	}


	// lay ra danh sach san pham theo id phan loai san pham
	public List<Product> getListClassifyProducts(int idClassify) {
		List<Product> list = new ArrayList<Product>();
		try {
			conn = new Connect().getConnection();
			ps = conn.prepareStatement("select * from book.product where idclassify=? limit 4;");
			ps.setInt(1, idClassify);
			rs = ps.executeQuery();
			while (rs.next()) {
				Product product = new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),
						rs.getString(5), rs.getDouble(6), rs.getDouble(7), rs.getString(8), rs.getString(9),
						rs.getInt(10), rs.getInt(11), rs.getInt(12));
				list.add(product);
			}

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return list;
	}
	
//	lay ra san pham theo id
	public Product getProductById(int id) {
		Product product=null;
		try {
			conn = new Connect().getConnection();
			ps = conn.prepareStatement("select * from book.product where id=?;");
			ps.setInt(1, id);
			rs = ps.executeQuery();

			while (rs.next()) {
				product = new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),
						rs.getString(5), rs.getDouble(6), rs.getDouble(7), rs.getString(8), rs.getString(9),
						rs.getInt(10), rs.getInt(11), rs.getInt(12));
			}

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return product;
	}
	
	public void saveProdouct(String name,String title,String description,String image,double price,double publishedPrice
							,int amount,String author,String published,int idCate,int idClassify) {
		try {
			conn = new Connect().getConnection();
			ps = conn.prepareStatement("insert into book.product (name,title,image,description,publishedprice"
					+ ",price,author,published,amount,idcate,idclassify) values(?,?,?,?,?,?,?,?,?,?,?);");
			ps.setString(1,name);
			ps.setString(2,title);
			ps.setString(3,image);
			ps.setString(4,description);
			ps.setDouble(5,publishedPrice);
			ps.setDouble(6,price);
			ps.setString(7,author);
			ps.setString(8,published);
			ps.setInt(9,amount);
			ps.setInt(10,idCate);
			ps.setInt(11,idClassify);
			ps.executeUpdate();
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return;
	}
	
	public void deleteProduct(int id) {
		try {
			conn = new Connect().getConnection();
			ps = conn.prepareStatement("Delete from book.product where id=?");
			ps.setInt(1, id);
			ps.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	
	public List<Product> search(String name){
		List<Product> list=new ArrayList<Product>();
		try {
			conn = new Connect().getConnection();
			ps = conn.prepareStatement("select* from book.product where name like ?");
			String a="%"+name+"%";
			ps.setString(1, a);
			rs=ps.executeQuery();
			while (rs.next()) {
				Product product = new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),
						rs.getString(5), rs.getDouble(6), rs.getDouble(7), rs.getString(8), rs.getString(9),
						rs.getInt(10), rs.getInt(11), rs.getInt(12));
				list.add(product);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return list;
	}

	public void update(int id,String name,String title,String description,String image,double price,double publishedPrice
			,int amount,String author,String published,int idCate,int idClassify) {
		try {
			conn = new Connect().getConnection();
			ps = conn.prepareStatement("update book.product set name=?,title=?,image=?,description=?,publishedprice=?"
					+ ",price=?,author=?,published=?,amount=?,idcate=?,idclassify=? where id=?;");
			ps.setString(1,name);
			ps.setString(2,title);
			ps.setString(3,image);
			ps.setString(4,description);
			ps.setDouble(5,publishedPrice);
			ps.setDouble(6,price);
			ps.setString(7,author);
			ps.setString(8,published);
			ps.setInt(9,amount);
			ps.setInt(10,idCate);
			ps.setInt(11,idClassify);
			ps.setInt(12,id);
			ps.executeUpdate();
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return;
	}
	public static void main(String[] args) {
		ProductDao dao = new ProductDao();
		List<Product> list=dao.search("Sách giải tích");
		for(Product p:list) {
			System.out.println(p.getName());
		}
	}

}
