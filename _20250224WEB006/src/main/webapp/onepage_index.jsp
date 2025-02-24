<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%
	request.setCharacterEncoding("UTF-8"); 
	Class.forName("com.mysql.cj.jdbc.Driver");
    String jdbcUrl = "jdbc:mysql://" + System.getenv("MYSQL_HOST") + ":3306/" + System.getenv("MYSQL_DATABASE");
    String username = System.getenv("MYSQL_USER");
    String password = System.getenv("MYSQL_PASSWORD");
	String insert = "insert into dept values(?, ?, ?)";
	String update = "update dept set dname=?, loc=? where deptno=?";
	String delete = "delete from dept where deptno=?";
	Connection conn = null; Statement stmt = null; PreparedStatement pstmt = null;
	ResultSet rset = null;
	String crud = request.getParameter("crud");
	String dname = request.getParameter("dname");
	String loc = request.getParameter("loc");
	String deptno = request.getParameter("deptno");
	try {
		conn = DriverManager.getConnection(jdbcUrl, username, password);
		if(crud != null && crud.equals("insert")) {
			pstmt = conn.prepareStatement(insert);
			pstmt.setString(1, deptno); pstmt.setString(2, dname); pstmt.setString(3, loc);
			pstmt.executeUpdate();
			response.sendRedirect("onepage_index.jsp");
		}
		else if(crud != null && crud.equals("delete")) {
			pstmt = conn.prepareStatement(delete);
			pstmt.setString(1, deptno);
			pstmt.executeUpdate();
			response.sendRedirect("onepage_index.jsp");
		}
		else if(crud != null && crud.equals("update")) {
			pstmt = conn.prepareStatement(update);
			pstmt.setString(1, dname); pstmt.setString(2, loc); pstmt.setString(3, deptno);
			pstmt.executeUpdate();
			response.sendRedirect("onepage_index.jsp");
		}
	} catch(Exception e){
		e.printStackTrace();
	} finally {
		if(conn != null) { try{conn.close();} catch(Exception e) {e.printStackTrace();}}
		if(rset != null) { try{rset.close();} catch(Exception e) {e.printStackTrace();}}
		if(stmt != null) { try{stmt.close();} catch(Exception e) {e.printStackTrace();}}
		if(pstmt != null) { try{pstmt.close();} catch(Exception e) {e.printStackTrace();}}
	}
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style>
		table {border-collapse:collapse; width: 50%; margin-top: 20px;}
		th, td { border: 1px solid black; padding: 10px; text-align: center;}
		th { background-color: lightgray;}
	</style>
</head>
<body>
	<h3>DEPT 추가</h3>
	<form action="onepage_index.jsp">
		<input type="hidden" name="crud" value="insert">
		DEPTNO: <input type="text" name="deptno" />
		DNAME: <input type="text" name="dname" />
		LOC:   <input type="text" name="loc" />
		<input type="submit" /><br>
	</form>
	<div style="margin-bottom: 20px;">
		<form action="onepage_index.jsp">
			<select name="searchType">
				<option value="deptno">부서번호</option>
				<option value="dname">부서이름</option>
			</select>
			<input type="text" name="searchKeyword" placeholder="검색어를 입력하세요">
			<input type="submit" value="검색">
		</form>
	</div>
	
	<%
		try {
			conn = DriverManager.getConnection(jdbcUrl, username, password);
			String select = "select * from dept";
			String searchType = request.getParameter("searchType");
			String searchKeyword = request.getParameter("searchKeyword");
			if(searchKeyword != null && !searchKeyword.trim().isEmpty()) {
				if(searchType.equals("deptno")) {
					select += " WHERE deptno LIKE ?";
				}
				else if(searchType.equals("dname")) {
					select += " WHERE dname LIKE ?";
				}
			}
			pstmt = conn.prepareStatement(select);
            if (searchKeyword != null && !searchKeyword.trim().isEmpty()) {
                pstmt.setString(1, "%" + searchKeyword + "%");
            }
            rset = pstmt.executeQuery();
			
	%>
	<h3>DEPT 목록</h3>
	<table>
		<tr>
			<th>DEPTNO</th>
			<th>DNAME</th>
			<th>LOC</th>
			<th></th>
		</tr>
		<% while(rset.next()) { %>
				<tr>
					<td><%= rset.getInt("deptno") %></td>
					<td><%= rset.getString("dname") %></td>	
					<td><%= rset.getString("loc") %></td>
					<td>	
    					<button onclick="showUpdateForm('<%= rset.getString("deptno") %>', '<%= rset.getString("dname") %>', '<%= rset.getString("loc") %>')">수정</button>
    					<form>
    						<input type="hidden" name="crud" value="delete">
							<input type="hidden" name="deptno" value="<%= rset.getInt("deptno") %>">
    						<button type="submit">삭제</button>
    					</form>
    				</td>
				</tr>
			<%} %>
	</table>
	<div id="updateForm" style="display: none;">
        <h3>부서 정보 수정</h3>
        <form method="post">
            <input type="hidden" name="crud" value="update">
            <input type="hidden" name="deptno" id="update_deptno">
            부서이름: <input type="text" name="dname" id="update_dname" required>
            지역: <input type="text" name="loc" id="update_loc" required>
            <input type="submit" value="수정">
        </form>
    </div>
        <script>
        function showUpdateForm(deptno, dname, loc) {
            document.getElementById('updateForm').style.display = 'block';
            document.getElementById('update_deptno').value = deptno;
            document.getElementById('update_dname').value = dname;
            document.getElementById('update_loc').value = loc;
        }
    </script>
	<%
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			if(conn != null) { try{conn.close();} catch(Exception e) {e.printStackTrace();}}
			if(rset != null) { try{rset.close();} catch(Exception e) {e.printStackTrace();}}
			if(stmt != null) { try{stmt.close();} catch(Exception e) {e.printStackTrace();}}
			if(pstmt != null) { try{pstmt.close();} catch(Exception e) {e.printStackTrace();}}
		}
	%>
</body>
</html>