<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<%
	Class.forName("com.mysql.cj.jdbc.Driver");
	String userid = request.getParameter("userid");
	String password = request.getParameter("password");
	String url = "jdbc:mysql://localhost:3306/spring5fs";
	String sql = "select * from emp where empno=?";
	Connection conn = null; PreparedStatement pstmt = null; ResultSet rset = null;
	
	try {
		conn = DriverManager.getConnection(url, "root", "1234");
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, userid);
		rset = pstmt.executeQuery();
		if(rset.next()) {
			if(rset.getString("ename").equals(password)) {
				session.setAttribute("userid", userid);
				response.sendRedirect("main.jsp");
			} else {
				response.sendRedirect("loginForm.jsp");
			}
		} else {
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