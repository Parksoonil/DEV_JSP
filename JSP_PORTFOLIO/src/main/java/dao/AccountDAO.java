package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AccountDAO {
	 private Connection conn;
	    private PreparedStatement pstmt;
	    private ResultSet rs;

	    private static final String DRIVER = "com.mysql.cj.jdbc.Driver";
	    private static final String URL = "jdbc:mysql://localhost:3306/spring5fs?useUnicode=true&characterEncoding=UTF-8&serverTimezone=Asia/Seoul";
	    private static final String USER = "root";  // MySQL 사용자 이름
	    private static final String PASS = "1234";  // MySQL 비밀번호
	    
	    public void connect() {
	        try {
	            Class.forName(DRIVER);
	            conn = DriverManager.getConnection(URL, USER, PASS);
	            if(conn != null) {
	                System.out.println("DB 연결 성공!");
	            }
	        } catch (ClassNotFoundException e) {
	            System.out.println("JDBC 드라이버 로드 실패: " + e.getMessage());
	            e.printStackTrace();
	        } catch (SQLException e) {
	            System.out.println("DB 연결 실패: " + e.getMessage());
	            e.printStackTrace();
	        }
	    }
	    // DB 연결 해제 메소드
	    public void disconnect() {
	        try {
	            if(rs != null) rs.close();
	            if(pstmt != null) pstmt.close();
	            if(conn != null) conn.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
	    public boolean updateAccount(String username, String email, String phone, String address, String userid) {
	    	connect();
	    	boolean success = false;
	    	String sql = "UPDATE account SET username = ?, email=?, phone=?, address=? where userid = ?";
	    	try {
	            pstmt = conn.prepareStatement(sql);
	            pstmt.setString(1, username);
	            pstmt.setString(2, email);
	            pstmt.setString(3, phone);
	            pstmt.setString(4, address);
	            pstmt.setString(5, userid);
	            int result = pstmt.executeUpdate();
	    		if(result > 0) {
	    			success = true;
	    			System.out.println("변겅 성공");
	    		}   
	        } catch (SQLException e) {
	            System.out.println("변경 실패");
	            e.printStackTrace();
	        } finally {
	            disconnect();
	        }
	        return success;
	    }
}
