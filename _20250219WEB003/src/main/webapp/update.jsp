<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%
	request.setCharacterEncoding("UTF-8"); 
	if(request.getParameter("no") != null && !request.getParameter("no").trim().isEmpty()) {
		Class.forName("com.mysql.cj.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/spring5fs";
		String sql = "update dept set ";
		int no = Integer.parseInt(request.getParameter("no"));
		String name = request.getParameter("name");
		String loc = request.getParameter("loc");
		boolean hasUpdate = false;
		if(name != null && !name.trim().isEmpty()) {
			sql += "dname=?, ";
			hasUpdate = true;
		}
		if(loc != null && !loc.trim().isEmpty()) {
			sql += "loc=?, ";
			hasUpdate = true;
		}
		Connection conn = null; PreparedStatement pstmt = null;
	
		try {
		
			if(hasUpdate) {
				sql = sql.substring(0, sql.length()-2);
				sql += "where deptno=?";
				conn = DriverManager.getConnection(url, "root", "1234");
				pstmt = conn.prepareStatement(sql);
				int index = 1;
				if(name != null && !name.trim().isEmpty()) {
					pstmt.setString(index++, name);
				}
				if(loc != null && !loc.trim().isEmpty()) {
					pstmt.setString(index++, loc);
				}
				pstmt.setInt(index, no);
				pstmt.executeUpdate();
			} else {
	        	System.out.println("변경할 내용이 없습니다.");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(conn != null) { try{conn.close();} catch(Exception e) {e.printStackTrace();}}
			if(pstmt != null) { try{pstmt.close();} catch(Exception e) {e.printStackTrace();}}
		}
	}
	response.sendRedirect("index.jsp");
%>