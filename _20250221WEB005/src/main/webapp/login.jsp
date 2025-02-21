<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<%
	String jdbcUrl = "jdbc:mysql://" + System.getenv("MYSQL_HOST") + ":3306/" + System.getenv("MYSQL_DATABASE");
	String DBusername = System.getenv("MYSQL_USER");
	String DBpassword = System.getenv("MYSQL_PASSWORD");
	Class.forName("com.mysql.cj.jdbc.Driver");
	String userid = request.getParameter("userid");
	String password = request.getParameter("password");
	String sql = "select * from emp where empno=?";
	Connection conn = null; PreparedStatement pstmt = null; ResultSet rset = null;
	
	try {
		conn = DriverManager.getConnection(jdbcUrl, DBusername, DBpassword);
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, userid);
		rset = pstmt.executeQuery();
		if(rset.next()) {
			if(rset.getString("ename").equals(password)) {
				session.setAttribute("userid", userid);
				System.out.println("접속성공");
				response.sendRedirect("index.jsp");
			} else {
				System.out.println("접속실패1");
				response.sendRedirect("loginForm.jsp");
			}
		} else {
			System.out.println("접속실패2");
			response.sendRedirect("loginForm.jsp");
		}
	} catch(Exception e) {
		e.printStackTrace();
	} finally {
		if(conn != null) { try{conn.close();} catch(Exception e) {e.printStackTrace();}}
		if(pstmt != null) { try{pstmt.close();} catch(Exception e) {e.printStackTrace();}}
		if(rset != null) { try{rset.close();} catch(Exception e) {e.printStackTrace();}}
	}
%>