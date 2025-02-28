<%@page import="dao.BookDAO"%>
<%@page import="dto.Book"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
    String title = request.getParameter("title");
    String author = request.getParameter("author");
    String publisher = request.getParameter("publisher");
    int year = Integer.parseInt(request.getParameter("year"));

    Book book = new Book(title, author, publisher, year);
    BookDAO dao = new BookDAO();
    dao.addBook(book);

    response.sendRedirect("bookList.jsp");
%>