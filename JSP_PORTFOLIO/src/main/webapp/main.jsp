<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import = "java.sql.*" %>
<%
    Class.forName("com.mysql.cj.jdbc.Driver");
    String url = "jdbc:mysql://localhost:3306/spring5fs";
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rset = null;

    int pages = 1;
    int limit = 10; // 1페이지당 10개
    if (request.getParameter("pages") != null) {
        pages = Integer.parseInt(request.getParameter("pages"));
    }
    int start = (pages - 1) * limit;

    String sql = "SELECT * FROM books LIMIT ?, ?";
%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Kyobo Bookstore</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding-top: 60px;
            display: flex;
            flex-direction: column;
            align-items: center;
            min-height: 100vh;
        }
        .header, .footer {
            width: 100%;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px 20px;
            background-color: #333;
            color: white;
            position: fixed;
            left: 0;
            z-index: 1000;
        }
        .header { top: 0; }
        .footer { bottom: 0; text-align: center; }
        .content {
            width: 90%;
            max-width: 1200px; /* ⭐ 가로 5개 배치 */
            margin-top: 80px;
            margin-bottom: 80px;
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        
        .grid {
            display: grid;
            grid-template-columns: repeat(5, 1fr); /* ✅ 가로 5개 정렬 */
            gap: 20px;
            width: 100%;
        }
        .card {
            border: 1px solid #ddd;
            border-radius: 8px;
            padding: 10px;
            text-align: center;
            box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.1);
            background-color: white;
        }
        .card img {
            width: 100%;
            height: 180px;
            object-fit: cover; /* ✅ 이미지 크기 유지 */
            border-radius: 4px;
        }
        .pagination {
            display: flex;
            justify-content: center;
            margin-top: 20px;
            gap: 10px;
        }
        .pagination a {
            padding: 10px 15px;
            background-color: #007bff;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            font-weight: bold;
        }
        .pagination a.disabled {
            background-color: #ccc;
            pointer-events: none;
        }
        .btn {
            background-color: #2ecc71;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            font-size: 18px;
            cursor: pointer;
            text-decoration: none;
        }
        .btn:hover {
            background-color: #27ae60;
        }
    </style>
</head>
<body>
    <div class="content">
    <div class="header">
        <h1>Kyobo Bookstore</h1>
        <% String userid = (String) session.getAttribute("userid"); %>
        <div class="buttons">
            <% if (userid == null) { %>
                <button onclick="location.href='loginForm.jsp'" class="btn">로그인</button>
                <button onclick="location.href='submitForm.jsp'" class="btn">회원가입</button>
            <% } else { %>
            	<button onclick="location.href='cart.jsp'" class="btn">장바구니</button>
                <button onclick="location.href='changePersonalForm.jsp?id=<%=userid %>'" class="btn">개인정보 변경</button>
                <button onclick="location.href='logout.jsp'" class="btn">로그아웃</button>
            <% } %>
            
        </div>
    </div>
        <div class="grid">
            <%
                try {
                    conn = DriverManager.getConnection(url, "root", "1234");
                    pstmt = conn.prepareStatement(sql);
                    pstmt.setInt(1, start);
                    pstmt.setInt(2, limit);
                    rset = pstmt.executeQuery();
                    while (rset.next()) {
            %>
				<a href="bookDetail.jsp?id=<%= rset.getInt("id") %>">
   					<div class="card">
        				<img src="images/<%= rset.getString("titleimg") %>" alt="Book">
        				<h2><%= rset.getString("title") %></h2>
        				<p><%= rset.getString("author") %></p>
    				</div>
				</a>
            <%
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    if (rset != null) try { rset.close(); } catch (Exception e) { e.printStackTrace(); }
                    if (pstmt != null) try { pstmt.close(); } catch (Exception e) { e.printStackTrace(); }
                    if (conn != null) try { conn.close(); } catch (Exception e) { e.printStackTrace(); }
                }
            %>
        </div>

        <!-- 페이지네이션 -->
        <div class="pagination">
            <a href="?pages=<%= (pages > 1 ? (pages - 1) : 1) %>" class="<%= (pages == 1 ? "disabled" : "") %>">이전</a>
            <span>Page <%= pages %></span>
            <a href="?pages=<%= (pages + 1) %>">다음</a>
        </div>
    </div>

    <div class="footer">
        <p>&copy; 2025 Kyobo Bookstore. All rights reserved.</p>
    </div>
</body>
</html>
