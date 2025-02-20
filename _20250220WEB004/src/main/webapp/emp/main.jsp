<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String userid = (String)session.getAttribute("username");
	if(userid == null) {
		response.sendRedirect("loginForm.jsp");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.container {
		width: 800px;
		margin: 50px auto;
		padding: 20px;
	}
	.header{
		display: flex;
		justify-content: space-between;
		align-items: center;
		margin-bottom: 20px;
	}
</style>
</head>
<body>
	<div class="container">
		<div class="header">
			<h2>환영합니다, <%= userid %>님!</h2>
			<a href="logout.jsp">로그아웃</a>
		</div>
		<div class="content">
			<p>이곳은 로그인된 사용자만 접근할 수 있는 페이지입니다.</p>
		</div>
	</div>
</body>
</html>