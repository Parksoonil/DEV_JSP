<%@page import="dto.Book"%>
<%@page import="dao.BookDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    BookDAO dao = new BookDAO();
    Book book = dao.getBookById(id);
%>
<html>
<head>
    <title>도서 수정</title>
</head>
<body>
    <h2>도서 수정</h2>
    <form action="updateBook.jsp" method="post">
        <input type="hidden" name="id" value="<%= book.getId() %>">
        제목: <input type="text" name="title" value="<%= book.getTitle() %>"><br>
        저자: <input type="text" name="author" value="<%= book.getAuthor() %>"><br>
        출판사: <input type="text" name="publisher" value="<%= book.getPublisher() %>"><br>
        출판년도: <input type="text" name="year" value="<%= book.getYear() %>"><br>
        <input type="submit" value="수정">
    </form>
</body>
</html>