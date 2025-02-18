<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%
	String URL = "jdbc:mysql://localhost:3306/spring5fs";
	String sql_insert = "insert into dept(deptno, dname, loc) values (?, ?, ?)";
	String sql_select = "SELECT * FROM dept";
	Connection conn = null; PreparedStatement pstmt = null; Statement stmt = null;
	ResultSet rset = null;
	Class.forName("com.mysql.cj.jdbc.Driver");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>부서 등록</title>
    <style>
        table { border-collapse: collapse; width: 50%; margin-top: 20px; }
        th, td { border: 1px solid black; padding: 10px; text-align: center; }
        th { background-color: lightgray; }
    </style>
</head>
<body>
<h2>부서 등록</h2>
	<%
		try {
			conn = DriverManager.getConnection(URL, "root", "1234");
			pstmt = conn.prepareStatement(sql_insert);
			int no = Integer.parseInt(request.getParameter("no"));
			String dname = request.getParameter("dname");
			String loc = request.getParameter("loc");
			pstmt.setInt(1, no); pstmt.setString(2, dname); 
			pstmt.setString(3, loc);
			pstmt.executeUpdate();
			stmt = conn.createStatement();
			rset = stmt.executeQuery(sql_select);
	%>
	<table>
        <tr>
            <th>DEPTNO</th>
            <th>DNAME</th>
            <th>LOC</th>
        </tr> 
        <%
            while (rset.next()) {
        %>
        <tr>
            <td><%= rset.getInt("deptno") %></td>
            <td><%= rset.getString("dname") %></td>
            <td><%= rset.getString("loc") %></td>
        </tr>
        <% } %>
	</table>
	<%
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(conn != null) { try{conn.close();} catch(Exception e) {e.printStackTrace();}}
			if(pstmt != null) { try{pstmt.close();} catch(Exception e) {e.printStackTrace();}}
			if(rset != null) { try{rset.close();} catch(Exception e) {e.printStackTrace();}}
			if(stmt != null) { try{stmt.close();} catch(Exception e) {e.printStackTrace();}}
		}
	%>
</body>
</html>