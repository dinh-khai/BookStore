package cart;


public class CartDetail {
	private int productId;
	private String name;
	private int quantity;
	private double price;
	public double publishedPrice;
	private double totalPrice;
	private String image;	
	
	public void increaseQuantity() {
        this.quantity++;
        this.totalPrice = this.price * this.quantity;
    }
	
	public void minusQuantity() {
        this.quantity--;
        this.totalPrice = this.price * this.quantity;
    }

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public double getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(double totalPrice) {
		this.totalPrice = totalPrice;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public double getPublishedPrice() {
		return publishedPrice;
	}

	public void setPublishedPrice(double publishedPrice) {
		this.publishedPrice = publishedPrice;
	}
	
	
	
	
	
	
}