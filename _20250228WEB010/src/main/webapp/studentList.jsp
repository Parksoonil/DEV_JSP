<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <!-- JSTL 디렉티브 추가 -->

<html>
<head>
    <title>JSTL 리스트 반복문 예제</title>
</head>
<body>
    <h1>학생 목록</h1>

    <%-- Java 코드로 학생 이름 리스트 생성 --%>
    <%
        List<String> students = new ArrayList<>();
        students.add("Alice");
        students.add("Bob");
        students.add("Charlie");
        students.add("David");
        students.add("Eve");
        request.setAttribute("students", students);  // 학생 리스트를 request 속성으로 설정
    %>

<c:forEach var="s1" items="${students}">
<p>${s1}</p>
</c:forEach>

    <h2>학생 목록:</h2>
    <ul>
        <c:forEach var="student" items="${students}">
            <li>${student}</li>  <!-- 학생 이름을 반복하여 출력 -->
        </c:forEach>
    </ul>
</body>
</html>