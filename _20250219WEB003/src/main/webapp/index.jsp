<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%
	Class.forName("com.mysql.cj.jdbc.Driver");
	String url = "jdbc:mysql://localhost:3306/spring5fs";
	String select = "select * from dept order by deptno asc";
	Connection conn = null; Statement stmt = null;
	ResultSet rset = null;
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style>
		table {border-collapse: collapse; width: 50%; margin-top: 20px;}
		th, td { border: 1px solid black; padding: 10px; text-align: center; }
        th { background-color: lightgray; }
	</style>
</head>
<body>
	<%
		try {
			conn = DriverManager.getConnection(url, "root", "1234");
			stmt = conn.createStatement();
			rset = stmt.executeQuery(select);
	%>
	<table>
		<tr>
			<th>DEPTNO</th>
			<th>DNAME</th>
			<th>LOC</th>
			<th>DELETE</th>
		</tr>
			<% while(rset.next()) { %>
				<tr>
					<td><a href="updateForm.jsp?no=<%= rset.getInt("deptno") %>"><%= rset.getInt("deptno") %></a></td>	
					<td><%= rset.getString("dname") %></td>	
					<td><%= rset.getString("loc") %></td>
					<td><form action="delete.jsp" method="post" onsubmit="return confirm('정말 삭제하시겠습니까?');">
    					<input type="hidden" name="deptno" value="<%= rset.getInt("deptno") %>">
    					<button type="submit">삭제</button>
					</form></td>
				</tr>
			<%} %>
	</table>
	<%
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			if(conn != null) { try{conn.close();} catch(Exception e) {e.printStackTrace();}}
			if(rset != null) { try{rset.close();} catch(Exception e) {e.printStackTrace();}}
			if(stmt != null) { try{stmt.close();} catch(Exception e) {e.printStackTrace();}}
		}
	%>
	<form action="inputDept.jsp"><button type="submit">추가</button></form>
</body>
</html>