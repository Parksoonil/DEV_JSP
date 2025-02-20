<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%
	request.setCharacterEncoding("UTF-8"); 
	Class.forName("com.mysql.cj.jdbc.Driver");
	String url = "jdbc:mysql://localhost:3306/spring5fs";
	String sql = "select * from account where username=? and phone=?";
	Connection conn = null; PreparedStatement pstmt = null;
	ResultSet rset = null;
	String name = request.getParameter("name");
	String phone = request.getParameter("phone");
	try {
		conn = DriverManager.getConnection(url, "root", "1234");
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, name);
		pstmt.setString(2, phone);
		rset = pstmt.executeQuery();
		if(rset.next()) {%>
			<h1>아이디는 <%= rset.getString("userid") %>입니다.</h1>
		<%} else {%>
			<h1>해당하는 아이디가 없습니다.</h1>
		<%}
	} catch(Exception e) {
		e.printStackTrace();
	} finally {
		if(conn != null) { try{conn.close();} catch(Exception e) {e.printStackTrace();}}
		if(rset != null) { try{rset.close();} catch(Exception e) {e.printStackTrace();}}
		if(pstmt != null) { try{pstmt.close();} catch(Exception e) {e.printStackTrace();}}
	}
%>
<form action="loginForm.jsp">
	<button type="submit">확인</button>
</form>