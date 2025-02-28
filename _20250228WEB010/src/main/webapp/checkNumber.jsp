<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <!-- JSTL 디렉티브 추가 -->

<html>
<head>
    <title>JSTL 예제</title>
</head>
<body>
    <h1>JSTL 사용 예제</h1>

    <%-- Java 코드로 숫자 설정 --%>
    <%
        int number = 15;
        request.setAttribute("number", number);  // number 값을 request 속성으로 설정
    %>

<c:if test="${number < 100 }">
	<p>100보다 작다</p>
</c:if>


    <h2>숫자에 따른 메시지 출력:</h2>
    
    <c:if test="${number >= 10}">
        <p>숫자는 10 이상입니다.</p> <!-- 숫자가 10 이상일 때 출력 -->
    </c:if>

    <c:if test="${number < 10}">
        <p>숫자는 10 미만입니다.</p> <!-- 숫자가 10 미만일 때 출력 -->
    </c:if>

</body>
</html>