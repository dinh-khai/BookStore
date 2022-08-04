package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import context.Connect;
import entity.Category;
import entity.ClassifyBook;

public class CategoryDao {
	Connection conn=null;
	PreparedStatement ps=null;
	ResultSet rs=null;
	
	//lay ra danh sach tat ca san pham
	public List<Category> getListCategories(){
		List<Category> list=new ArrayList<Category>();
		try {
			conn=new Connect().getConnection();
			ps=conn.prepareStatement("select * from book.category;");
			rs=ps.executeQuery();
			while(rs.next()) {
				Category cate=new Category(rs.getInt(1),rs.getString(2));
				list.add(cate);
			}
			
		} catch (Exception e) {
			
		}
		return list;
	}
	
	public List<ClassifyBook> getListClassify(){
		List<ClassifyBook> list=new ArrayList<ClassifyBook>();
		try {
			conn=new Connect().getConnection();
			ps=conn.prepareStatement("select * from book.classify;");
			rs=ps.executeQuery();
			while(rs.next()) {
				ClassifyBook cate=new ClassifyBook(rs.getInt(1),rs.getString(2));
				list.add(cate);
			}
			
		} catch (Exception e) {
			
		}
		return list;
	}
	
	
	public Category findByNameCate(String name) {
		Category cate =null;
		try {
			conn=new Connect().getConnection();
			ps=conn.prepareStatement("select * from book.category where name=?;");
			ps.setString(1, name);
			rs=ps.executeQuery();
			while(rs.next()) {
				 cate=new Category(rs.getInt(1),rs.getString(2));
			}
			
		} catch (Exception e) {
			
		}
		return cate;
	}
	
	public ClassifyBook findByNameClassify(String name) {
		ClassifyBook classify =null;
		try {
			conn=new Connect().getConnection();
			ps=conn.prepareStatement("select * from book.classify where name=?;");
			ps.setString(1, name);
			rs=ps.executeQuery();
			while(rs.next()) {
				 classify=new ClassifyBook(rs.getInt(1),rs.getString(2));
			}
			
		} catch (Exception e) {
			
		}
		return classify;
	}
	
	public static void main(String[] args) {
		CategoryDao c=new CategoryDao();
		List<Category> li=c.getListCategories();
		for(Category ca: li) {
			System.out.println(ca.getName());
		}
	}
	
}
