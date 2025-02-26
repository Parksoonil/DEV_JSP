<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    Class.forName("com.mysql.cj.jdbc.Driver");
    String url = "jdbc:mysql://localhost:3306/spring5fs";
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rset = null; ResultSet rset2 = null;
	int carttotal = 0;
    String userid = (String)session.getAttribute("userid");
    String cartSELECT = "SELECT * FROM cart where userid LIKE ?";
    String bookSELECT = "SELECT * FROM books where id LIKE ?";
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>장바구니</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

       header, footer {
            background-color: #333;
            color: white;
            padding: 10px;
            text-align: center;
        }

        header nav {
            margin-top: 10px;
        }

        header nav a {
            color: white;
            margin: 0 15px;
            text-decoration: none;
        }

        #cart-items table {
            width: 100%;
            border-collapse: collapse;
        }

        #cart-items table, th, td {
            border: 1px solid #ddd;
        }

        #cart-items th, td {
            padding: 10px;
            text-align: center;
        }

        #cart-summary {
            padding: 20px;
            background-color: #f9f9f9;
        }

        button {
            background-color: #4CAF50;
            color: white;
            padding: 10px;
            border: none;
            cursor: pointer;
        }

        button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <header>
        <h1>장바구니</h1>
    </header>
    
    <main>
        <section id="cart-items">
            <h2>장바구니</h2>
            <table>
                <thead>
                    <tr>
                        <th>상품</th>
                        <th>가격</th>
                        <th>수량</th>
                        <th>총액</th>
                        <th>삭제</th>
                    </tr>
                </thead>
                <tbody>
                    <!-- 예시 상품 항목 -->
				<%try {
					conn = DriverManager.getConnection(url, "root", "1234");
					pstmt = conn.prepareStatement(cartSELECT);
					pstmt.setString(1, userid);
					rset = pstmt.executeQuery();
					while (rset.next()) {
						pstmt = conn.prepareStatement(bookSELECT);
						pstmt.setString(1, rset.getString("book_id"));
						rset2 = pstmt.executeQuery();
						if(rset2.next()) {
							int total = rset2.getInt("price") * rset.getInt("quantity");
							carttotal += total;%>
                    <tr>
                        <td><img src="images/<%=rset2.getString("titleimg") %>" alt="상품 이름" width="50"><%=rset2.getString("title") %></td>
                        <td><%=rset2.getInt("price") %></td>
                        <td><%=rset.getInt("quantity") %></td>
                        <td><%=total%></td>
                        <td><button class="remove-item">삭제</button></td>
                    </tr>
                    <%	}
					}
				} catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    if (rset != null) try { rset.close(); } catch (Exception e) { e.printStackTrace(); }
                    if (rset2 != null) try { rset2.close(); } catch (Exception e) { e.printStackTrace(); }
                    if (pstmt != null) try { pstmt.close(); } catch (Exception e) { e.printStackTrace(); }
                    if (conn != null) try { conn.close(); } catch (Exception e) { e.printStackTrace(); }
                }%>
                    <!-- 다른 항목은 반복 -->
                </tbody>
            </table>
        </section>

        <section id="cart-summary">
            <h3>장바구니 요약</h3>
            <p>소계: ₩<%=carttotal %></p>
            <p>배송비: ₩5000</p>
            <p><strong>총액: ₩<%=carttotal+5000 %></strong></p>
            <button onclick="location.href='calculate.jsp?total=<%=carttotal+5000 %>'" id="checkout-btn">결제하기</button>
        </section>
    </main>

    <footer>
        <p>&copy; 2025 귀하의 상점 이름. 모든 권리 보유.</p>
    </footer>
</body>
</html>
