<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%
	request.setCharacterEncoding("UTF-8"); 

	if(request.getParameter("no") != null && !request.getParameter("no").trim().isEmpty() &&
			request.getParameter("dname") != null && !request.getParameter("dname").trim().isEmpty() &&
			request.getParameter("loc") != null && !request.getParameter("loc").trim().isEmpty()) {
		Class.forName("com.mysql.cj.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/spring5fs";
		String sql = "insert into dept values (?, ?, ?)";
		Connection conn = null; PreparedStatement pstmt = null;
		try {
			conn = DriverManager.getConnection(url, "root", "1234");
			pstmt = conn.prepareStatement(sql);
			int no = Integer.parseInt(request.getParameter("no"));
			String dname = request.getParameter("dname");
			String loc = request.getParameter("loc");
			pstmt.setInt(1, no); pstmt.setString(2, dname); 
			pstmt.setString(3, loc);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(conn != null) { try{conn.close();} catch(Exception e) {e.printStackTrace();}}
			if(pstmt != null) { try{pstmt.close();} catch(Exception e) {e.printStackTrace();}}
		}
	}
	response.sendRedirect("index.jsp");
%>