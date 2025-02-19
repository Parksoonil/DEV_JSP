<%@page import="com.mysql.cj.x.protobuf.MysqlxSql.StmtExecute"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String URL = "jdbc:mysql://localhost:3306/spring5fs";
	String sql = "insert into dept(deptno, dname, loc) values (50, '영업', '서울')";
	Connection conn = null; Statement stmt = null;
	Class.forName("com.mysql.cj.jdbc.Driver");
	out.println("드라이버 로딩!<br>");
	try {
		conn = DriverManager.getConnection(URL, "root", "1234");
		stmt = conn.createStatement();
		out.println("Mysql 접속 성공!");
		stmt.executeUpdate(sql);
	} catch(Exception e) {
		e.printStackTrace();
	} finally {
		if(conn != null) { try{conn.close();} catch(Exception e) {e.printStackTrace();}}
		if(stmt != null) { try{stmt.close();} catch(Exception e) {e.printStackTrace();}}
	}
%>
</body>
</html>