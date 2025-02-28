<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
    <title>도서 추가</title>
</head>
<body>
    <h2>도서 추가</h2>
    <form action="addBookAction.jsp" method="post">
        제목: <input type="text" name="title"><br>
        저자: <input type="text" name="author"><br>
        출판사: <input type="text" name="publisher"><br>
        출판년도: <input type="text" name="year"><br>
        <input type="submit" value="추가">
    </form>
</body>
</html>