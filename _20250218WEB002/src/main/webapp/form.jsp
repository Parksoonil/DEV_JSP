<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>INSERT</h3>
<form action="jdbc_insert.jsp">
	번호: <input type="text" name="no"/>
	부서명: <input type="text" name="dname"/>
	도시: <input type="text" name="loc"/>
	<input type="submit"/>
</form>
<h3>SELECT</h3>
<form action="jdbc_select.jsp">
	번호: <input type="text" name="no"/>
	<input type="submit"/>
</form>
</body>
</html>