package dto;

public class CartDTO {
	private int orderId;
	private String userId;
	private int bookId;
	private int quantity;
	
	public CartDTO(int orderId, String userId, int bookId, int quantity) {
		super();
		this.orderId = orderId;
		this.userId = userId;
		this.bookId = bookId;
		this.quantity = quantity;
	}
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getBookId() {
		return bookId;
	}
	public void setBookId(int bookId) {
		this.bookId = bookId;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	
	
}
