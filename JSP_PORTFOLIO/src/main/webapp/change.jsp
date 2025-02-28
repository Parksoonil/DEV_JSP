<%@page import="dao.AccountDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String userid = (String) session.getAttribute("userid");
    String address = request.getParameter("address");
    String phone = request.getParameter("phone");
    String username = request.getParameter("username");
    String email = request.getParameter("email");
    AccountDAO accountDAO = new AccountDAO();
    accountDAO.updateAccount(username, email, phone, address, userid);
    out.println("<script>alert('변경이 완료되었습니다.'); window.location.href = 'main.jsp';</script>");
%>