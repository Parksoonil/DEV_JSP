package dto;

public class AccountDTO {
	private String userid;
	private String pasword;
	private String username;
	private String email;
	private String phone;
	private String address;
	
	
	public AccountDTO(String userid, String pasword, String username, String email, String phone, String address) {
		super();
		this.userid = userid;
		this.pasword = pasword;
		this.username = username;
		this.email = email;
		this.phone = phone;
		this.address = address;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getPasword() {
		return pasword;
	}
	public void setPasword(String pasword) {
		this.pasword = pasword;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
}
