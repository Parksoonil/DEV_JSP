<%@page import="util.DBConnection"%>

<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <title>데이터베이스 접속 테스트</title>
</head>
<body>
    <h2>데이터베이스 접속 테스트</h2>
    
    <%
        // DB 접속 테스트
        Connection conn = null;
        boolean isConnected = false;
        String message = "";
        
        try {
            conn = DBConnection.getConnection();  // DBUtil 클래스의 getConnection 메서드를 통해 DB에 접속
            if (conn != null && !conn.isClosed()) {
                isConnected = true;
                message = "MySQL 데이터베이스에 성공적으로 접속하였습니다.";
            }
        } catch (SQLException e) {
            isConnected = false;
            message = "데이터베이스 접속 실패: " + e.getMessage();
        } finally {
            if (conn != null) {
                try {
                    conn.close();  // 접속이 성공적이라면 연결 종료
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    %>
    
    <h3><%= message %></h3>
    <% if (isConnected) { %>
        <p style="color:green;">접속 성공</p>
    <% } else { %>
        <p style="color:red;">접속 실패</p>
    <% } %>
</body>
</html>