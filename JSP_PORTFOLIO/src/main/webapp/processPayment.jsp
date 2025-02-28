<%@page import="dao.CartDAO"%>
<%@page import="dao.BalanceDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
    String userid = request.getParameter("userid");
    int total = Integer.parseInt(request.getParameter("total"));
    
    // BalanceDAO 객체 생성 및 잔액 조회
    BalanceDAO balanceDAO = new BalanceDAO();
    CartDAO cartDAO = new CartDAO(); 
    int balance = balanceDAO.getBalance(userid); // 현재 잔액 조회

    if (balance >= total) {
        int newBalance = balance - total; // 결제 후 잔액 차감
        boolean success = balanceDAO.updateBalance(userid, newBalance); // 잔액 업데이트

        if (success) {
        	cartDAO.deleteCart(userid);
        	out.println("<script>alert('결제가 완료되었습니다.'); window.location.href = 'main.jsp';</script>");	
        } else {
            out.println("<script>alert('잔액 업데이트 실패.'); window.location.href = 'main.jsp';</script>");
        }
    } else {
        out.println("<script>alert('잔액이 부족합니다. 결제가 실패하였습니다.'); window.location.href = 'main.jsp';</script>");
    }
%>
