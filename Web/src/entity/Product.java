package entity;

public class Product {
	private int id;
	private String name;
	private String title;
	String image;
	private String description;
	private double publishedPrice;// gia bia
	private double price;// gia ban
	private String author;
	private String published;// nha xuat ban
	private int amount;
	private int idCate;
	private int idClassify;

	public Product(int id, String name, String title, String image, String description, double publishedPrice,
			double price, String author, String published, int amount, int idCate, int idClassify) {
		super();
		this.id = id;
		this.name = name;
		this.title = title;
		this.image = image;
		this.description = description;
		this.publishedPrice = publishedPrice;
		this.price = price;
		this.author = author;
		this.published = published;
		this.amount = amount;
		this.idCate = idCate;
		this.idClassify = idClassify;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public double getPublishedPrice() {
		return publishedPrice;
	}

	public void setPublishedPrice(double publishedPrice) {
		this.publishedPrice = publishedPrice;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getPublished() {
		return published;
	}

	public void setPublished(String published) {
		this.published = published;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public int getIdCate() {
		return idCate;
	}

	public void setIdCate(int idCate) {
		this.idCate = idCate;
	}

	public int getIdClassify() {
		return idClassify;
	}

	public void setIdClassify(int idClassify) {
		this.idClassify = idClassify;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

}
