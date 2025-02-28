<%@page import="dto.Book"%>
<%@page import="java.util.List"%>
<%@page import="dao.BookDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <title>도서 목록</title>
</head>
<body>
    <h2>도서 목록</h2>
    <a href="addBook.jsp">도서 추가</a>
    <table border="1">
        <thead>
            <tr>
                <th>제목</th>
                <th>저자</th>
                <th>출판사</th>
                <th>출판년도</th>
                <th>수정</th>
                <th>삭제</th>
            </tr>
        </thead>
        <tbody>
            <%
                BookDAO dao = new BookDAO();
                List<Book> books = dao.getAllBooks();
                for (Book book : books) {
            %>
                <tr>
                    <td><%= book.getTitle() %></td>
                    <td><%= book.getAuthor() %></td>
                    <td><%= book.getPublisher() %></td>
                    <td><%= book.getYear() %></td>
                    <td><a href="editBook.jsp?id=<%= book.getId() %>">수정</a></td>
                    <td><a href="deleteBook.jsp?id=<%= book.getId() %>">삭제</a></td>
                </tr>
            <% } %>
        </tbody>
    </table>
</body>
</html>