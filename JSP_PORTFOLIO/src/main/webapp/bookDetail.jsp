<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%
    Class.forName("com.mysql.cj.jdbc.Driver");
    String url = "jdbc:mysql://localhost:3306/spring5fs";
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rset = null;
    String sql = "SELECT * FROM books where id = ?";
    int id = Integer.parseInt(request.getParameter("id"));
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>도서 상세 페이지</title>
    <link rel="stylesheet" href="style.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            line-height: 1.6;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }
        .container {
            width: 80%;
            margin: auto;
            padding-top: 30px;
        }
        .book-details {
            display: flex;
            justify-content: space-between;
            background-color: #fff;
            padding: 20px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            margin-bottom: 30px;
        }
        .book-image img {
            max-width: 200px;
            border-radius: 8px;
        }
        .book-info {
            flex: 1;
            margin-left: 20px;
        }
        .book-info h1 {
            margin: 0;
            font-size: 32px;
        }
        .book-info p {
            font-size: 18px;
            color: #666;
        }
        .book-info .price {
            font-size: 22px;
            font-weight: bold;
            color: #e74c3c;
        }
        .book-info .rating {
            margin-top: 10px;
            font-size: 18px;
        }
        .book-info .description {
            margin-top: 20px;
        }
        .book-info .description p {
            line-height: 1.8;
        }
        .buy-btn {
            background-color: #2ecc71;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            font-size: 18px;
            cursor: pointer;
            text-decoration: none;
        }
        .buy-btn:hover {
            background-color: #27ae60;
        }
    </style>
</head>
<body>
    <div class="container">
    	<%
        try {
            conn = DriverManager.getConnection(url, "root", "1234");
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, id);
            rset = pstmt.executeQuery();
            if (rset.next()) {
            	String[] chapters = rset.getString("contents").split("\n");
    		%>
        	<!-- Book Details Section -->
        	<div class="book-details">
            	<div class="book-image">
                	<img src="images/<%=rset.getString("titleimg") %>" alt="책 표지 이미지">
            	</div>
            	<div class="book-info">
                	<h1>책 제목: <%= rset.getString("title") %></h1>
                	<p><strong>저자:</strong> <%= rset.getString("author") %></p>
                	<p class="price"><%= rset.getInt("price") %></p>
                	<p class="rating">평점: <%= rset.getBigDecimal("rating") %> / 5.0</p>
                	<p><strong>출간일:</strong><%= rset.getDate("publish_date") %></p>
                
                	<!-- Description Section -->
                	<div class="description">
                    	<h3>책 소개:</h3>
                    	<p><%=rset.getString("synopsis") %></p>
                	</div>
                	<a href="cart.jsp" class="buy-btn">장바구니</a>
               		<a href="calculate.jsp?total=<%=rset.getInt("price")+5000 %>" class="buy-btn">구매하기</a>
            	</div>
        	</div>

        	<!-- Additional Info -->
        	<div class="additional-info">
            	<h3>목차</h3>
            	<% for(String chapter : chapters) {%>
                	<li><%=chapter %></li>
                <%} %>
            	</ul>
        	</div>
        <% }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rset != null) try { rset.close(); } catch (Exception e) { e.printStackTrace(); }
            if (pstmt != null) try { pstmt.close(); } catch (Exception e) { e.printStackTrace(); }
            if (conn != null) try { conn.close(); } catch (Exception e) { e.printStackTrace(); }
        } %>
    </div>
</body>
</html>
