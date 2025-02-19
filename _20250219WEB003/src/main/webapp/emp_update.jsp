<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%
	request.setCharacterEncoding("UTF-8"); 
	Class.forName("com.mysql.cj.jdbc.Driver");
	String url = "jdbc:mysql://localhost:3306/spring5fs";
	String sql = "update emp set ename=?, job=?, mgr=?, sal=?, comm=?, deptno=? where empno=?;";
	int empno = Integer.parseInt(request.getParameter("empno"));
	int mgr = Integer.parseInt(request.getParameter("mgr"));
	int sal = Integer.parseInt(request.getParameter("sal"));
	int comm = Integer.parseInt(request.getParameter("comm"));
	int deptno = Integer.parseInt(request.getParameter("deptno"));
	String ename = request.getParameter("ename");
	String job = request.getParameter("job");
	Connection conn = null; PreparedStatement pstmt = null;
	try {
		conn = DriverManager.getConnection(url, "root", "1234");
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, ename); pstmt.setString(2, job); pstmt.setInt(3, mgr);
		pstmt.setInt(4, sal); pstmt.setInt(5, comm); pstmt.setInt(6, deptno);
		pstmt.setInt(7, empno); 
		pstmt.executeUpdate();
	} catch(Exception e) {
		e.printStackTrace();
	} finally {
		if(conn != null) { try{conn.close();} catch(Exception e) {e.printStackTrace();}}
		if(pstmt != null) { try{pstmt.close();} catch(Exception e) {e.printStackTrace();}}
	}
	response.sendRedirect("emp_index.jsp");
%>