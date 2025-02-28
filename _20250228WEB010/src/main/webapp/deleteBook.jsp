<%@page import="dao.BookDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    BookDAO dao = new BookDAO();
    dao.deleteBook(id);

    response.sendRedirect("bookList.jsp");
%>