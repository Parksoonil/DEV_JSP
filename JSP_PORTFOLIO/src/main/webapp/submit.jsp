<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%
	request.setCharacterEncoding("UTF-8"); 
	Class.forName("com.mysql.cj.jdbc.Driver");
	String url = "jdbc:mysql://localhost:3306/spring5fs";
	String sql = "insert into account values (?, ?, ?, ?, ?, ?)";

	String id = request.getParameter("userid");
	String pw = request.getParameter("password");
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String phone = request.getParameter("phone");
	String address = request.getParameter("address");
	Connection conn = null; PreparedStatement pstmt = null;	
	try {
		conn = DriverManager.getConnection(url, "root", "1234");
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id); pstmt.setString(2, pw);
		pstmt.setString(3, name); pstmt.setString(4, email);
		pstmt.setString(5, phone); pstmt.setString(6, address);
		pstmt.executeUpdate();	
	} catch(Exception e) {
		e.printStackTrace();
	} finally {
		if(conn != null) { try{conn.close();} catch(Exception e) {e.printStackTrace();}}
		if(pstmt != null) { try{pstmt.close();} catch(Exception e) {e.printStackTrace();}}
	}
	response.sendRedirect("loginForm.jsp");
%>