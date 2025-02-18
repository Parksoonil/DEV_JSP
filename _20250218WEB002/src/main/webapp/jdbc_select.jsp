<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%
    String URL = "jdbc:mysql://localhost:3306/spring5fs";
    String sql = "SELECT * FROM dept WHERE deptno = ?";
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rset = null;

    Class.forName("com.mysql.cj.jdbc.Driver");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>부서 정보</title>
    <style>
        table { border-collapse: collapse; width: 50%; margin-top: 20px; }
        th, td { border: 1px solid black; padding: 10px; text-align: center; }
        th { background-color: lightgray; }
    </style>
</head>
<body>    
<h2>부서 조회 결과</h2>
    <%
        try {
            conn = DriverManager.getConnection(URL, "root", "1234");
            pstmt = conn.prepareStatement(sql);
            int no = Integer.parseInt(request.getParameter("no"));
            pstmt.setInt(1, no);
            rset = pstmt.executeQuery();
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
        <%
            }
        %>
    </table>
    <%
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rset != null) try { rset.close(); } catch (Exception e) { e.printStackTrace(); }
            if (pstmt != null) try { pstmt.close(); } catch (Exception e) { e.printStackTrace(); }
            if (conn != null) try { conn.close(); } catch (Exception e) { e.printStackTrace(); }
        }
    %>
</body>
</html>