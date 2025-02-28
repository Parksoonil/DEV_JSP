package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class CartDAO {
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
	    public boolean insertCart(String userid, String bookid) {
	    	boolean success = false;
	    	String sql = "";
	    	connect();
	    	if(!isExisting(userid, bookid)) {
	    		sql = "INSERT INTO cart(userid, book_id, quantity) values (?, ?, 1)";
	    	} else {
	    		sql = "UPDATE cart set quantity = quantity + 1 where userid = ? and book_id = ?";
	    	}
	    	try {
	            pstmt = conn.prepareStatement(sql);
	            pstmt.setString(1, userid);
	            pstmt.setString(2, bookid);
	            int result = pstmt.executeUpdate();
	    		if(result > 0) {
	    			success = true;
	    			System.out.println("장바구니 추가 성공");
	    		}   
	        } catch (SQLException e) {
	            System.out.println("장바구니 추가 실패");
	            e.printStackTrace();
	        } finally {
	            disconnect();
	        }
	        return success;
	    }
	    private boolean isExisting(String userid, String bookid) {
	    	boolean exists = false;
	        Connection checkConn = null;
	        PreparedStatement checkPstmt = null;
	        ResultSet checkRs = null;
	    	String sql = "SELECT * FROM cart WHERE userid = ? and book_id = ?";
	    	try {
	            Class.forName(DRIVER);
	            checkConn = DriverManager.getConnection(URL, USER, PASS);
	            checkPstmt = checkConn.prepareStatement(sql);
	            checkPstmt.setString(1, userid);
	            checkPstmt.setString(2, bookid);
	            checkRs = checkPstmt.executeQuery();
	            if(checkRs.next()) {
	            	System.out.println("중복 있음");
	                exists = true;
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        } finally {
	            try {
	                if(checkRs != null) checkRs.close();
	                if(checkPstmt != null) checkPstmt.close();
	                if(checkConn != null) checkConn.close();
	            } catch (SQLException e) {
	                e.printStackTrace();
	            }
	        }
	        return exists;
	    }
	    public boolean deleteCart(String userid) {
	    	boolean success = false;
	    	connect();
	    	String sql = "DELETE FROM cart where userid = ?";
	    	try {
	            pstmt = conn.prepareStatement(sql);
	            pstmt.setString(1, userid);
	            int result = pstmt.executeUpdate();
	    		if(result > 0) {
	    			success = true;
	    			System.out.println("장바구니 삭제 성공");
	    		} 
	            
	        } catch (SQLException e) {
	            System.out.println("장바구니 삭제 실패");
	            e.printStackTrace();
	        } finally {
	            disconnect();
	        }
	        return success;
	    }
}
