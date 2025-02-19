<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="emp_insert.jsp" method="post">
		EMPNO: <input type="text" name="empno" /><br>
		ENAME: <input type="text" name="ename" /><br>
		JOB:   <input type="text" name="job" /><br>
		MGR:   <input type="text" name="mgr" /><br>
		SAL:   <input type="text" name="sal" /><br>
		COMM:  <input type="text" name="comm" /><br>
		DEPTNO:<input type="text" name="deptno" /><br>
		<input type="submit" /><br>
	</form>

</body>
</html>