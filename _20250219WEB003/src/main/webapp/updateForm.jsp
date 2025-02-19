<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="update.jsp" method="post">
		<input type="hidden" name="no" value= "<%= request.getParameter("no") %>"/><br>
		변경 직책: <input type="text" name="name" /><br>
		변경 도시: <input type="text" name="loc" /><br>
		<input type="submit" /><br>
	</form>
</body>
</html>