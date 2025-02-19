<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.time.*" %>
<%
	request.setCharacterEncoding("UTF-8"); 
	Class.forName("com.mysql.cj.jdbc.Driver");
	String url = "jdbc:mysql://localhost:3306/spring5fs";
	String sql = "insert into emp values (?, ?, ?, ?, ?, ?, ?, ?)";
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
		pstmt.setInt(1, empno); pstmt.setString(2, ename);
		pstmt.setString(3, job); pstmt.setInt(4, mgr);
		pstmt.setDate(5, Date.valueOf(LocalDate.now()));
		pstmt.setInt(6, sal); pstmt.setInt(7, comm); pstmt.setInt(8, deptno);
		pstmt.executeUpdate();
	} catch(Exception e) {
		e.printStackTrace();
	} finally {
		if(conn != null) { try{conn.close();} catch(Exception e) {e.printStackTrace();}}
		if(pstmt != null) { try{pstmt.close();} catch(Exception e) {e.printStackTrace();}}
	}
	response.sendRedirect("emp_index.jsp");
%>