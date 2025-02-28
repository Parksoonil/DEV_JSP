<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%
	request.setCharacterEncoding("utf-8");
    Class.forName("com.mysql.cj.jdbc.Driver");
    String url = "jdbc:mysql://localhost:3306/spring5fs";
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rset = null;
    int total = Integer.parseInt(request.getParameter("total"));
    int balance = 0;
    String userid = (String)session.getAttribute("userid");
    if(userid == null) {
    	out.println("history.back();");
    }
    String sql = "SELECT * FROM account where userid = ?";
    String sql2 = "SELECT * FROM balance where id = ?";
    try {
		conn = DriverManager.getConnection(url, "root", "1234");
		pstmt = conn.prepareStatement(sql2);
		pstmt.setString(1, userid);
		rset = pstmt.executeQuery();
		if (rset.next()) {
			balance = rset.getInt("balance");
		}
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>결제 정보</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 100%;
            max-width: 600px;
            margin: 50px auto;
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }
        h1 {
            text-align: center;
            color: #333;
        }
        .info {
            margin-bottom: 20px;
        }
        .info div {
            margin-bottom: 10px;
        }
        .label {
            font-weight: bold;
            color: #555;
        }
        .value {
            color: #333;
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
        <h1>결제 정보</h1>
		<%try {
			conn = DriverManager.getConnection(url, "root", "1234");
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			rset = pstmt.executeQuery();
			if(rset.next()) {%>
        <!-- 주소 정보 -->
        <div class="info">
            <div>
                <span class="label">배송 주소:</span>
                <span class="value"><%=rset.getString("address") %></span>
            </div>
        </div>
        
        <!-- 잔액 정보 -->
        <div class="info">
            <div>
                <span class="label">잔액:</span>
                <span class="value">₩<%= balance %></span>
            </div>
        </div>
		<%}
		} catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rset != null) try { rset.close(); } catch (Exception e) { e.printStackTrace(); } 
            if (pstmt != null) try { pstmt.close(); } catch (Exception e) { e.printStackTrace(); }
            if (conn != null) try { conn.close(); } catch (Exception e) { e.printStackTrace(); }
        }%>
        <!-- 결제 금액 정보 -->
        <div class="info">
            <div>
                <span class="label">결제 금액:</span>
                <span class="value">₩<%=total %></span>
            </div>
        </div>
		<form action="processPayment.jsp" method="post" id="paymentForm">
            <input type="hidden" name="userid" value="<%= userid %>">
            <input type="hidden" name="total" value="<%= total %>">
            <button type="submit" class="buy-btn">결제하기</button>
        </form>
    </div>>
   
</body>
</html>
