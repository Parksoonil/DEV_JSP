<%@page import="dto.UserDTO"%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<html>
<head>
    <title>EL 예제</title>
</head>
<body>
    <h2>EL 표현식 예제</h2>

    <%
        UserDTO user = new UserDTO("John Doe", 25);
    	request.setAttribute("user", user);
    %>

    <!-- EL 표현식 사용 -->
    <p>안녕하세요, ${user.name}님!(${user.age}세)</p>

</body>
</html>