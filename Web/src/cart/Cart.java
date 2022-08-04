package cart;

import java.util.ArrayList;
import java.util.List;

import dao.ProductDao;
import entity.Product;

public class Cart {
	private List<CartDetail> list=new ArrayList<CartDetail>();

	public Cart() {
		
	}
	

	public List<CartDetail> getList() {
		return list;
	}

	public void setList(List<CartDetail> list) {
		this.list = list;
	}
	
	public void addPro(Product p) {
		for(CartDetail c:list) {
			if(c.getProductId()==p.getId()) {
				c.increaseQuantity();
				return;
			}
		}
				CartDetail ca=new CartDetail();
				ca.setPrice(p.getPrice());
				ca.setProductId(p.getId());
				ca.setQuantity(1);
				ca.setTotalPrice(p.getPrice());
				ca.setImage(p.getImage());
				ca.setName(p.getName());
				ca.setPublishedPrice(p.getPublishedPrice());
				System.out.println(ca.getName());
				list.add(ca);
	}
	
	public void removePro(int id) {
		for(CartDetail c:list) {
			if(c.getProductId()==id) {
				list.remove(c);
				return;
			}
		}
	}
	
	public void plus(int id) {
		ProductDao dao=new ProductDao();
		Product pro=dao.getProductById(id);
		for(CartDetail c:list) {
			if(c.getProductId()==id) { 
				if(c.getQuantity()>pro.getAmount()||c.getQuantity()==pro.getAmount()) {
					c.setQuantity(pro.getAmount());
				}
				else {
					c.increaseQuantity();
				}
			}
		}
	}
	
	public void minus(int id) {
		for(CartDetail c:list) {
			if(c.getProductId()==id) {
				c.minusQuantity();
				return;
			}
		}
	}
	
	public int amount(int id) {
		int a=0;
		for(CartDetail c:list) {
			if(c.getProductId()==id) {
				a=c.getQuantity();
			}
		}
		return a;
	}
	public static void main(String[] args) {
//		ProductDao dao =new ProductDao();
//		Product p=dao.getProductById(1);
//		System.out.println(p.getName());
//		Cart cart=new Cart();
//		cart.addPro(p);
//		System.out.println(cart.getList().size());
	}
	
}
