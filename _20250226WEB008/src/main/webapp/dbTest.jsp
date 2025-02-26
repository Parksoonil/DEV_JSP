<%@page import="dto.EmpDTO"%>
<%@page import="dao.EmpDAO"%>
<%@page import="dto.DeptDTO"%>
<%@page import="dao.DeptDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	DeptDAO deptDAO = new DeptDAO();
	for(DeptDTO dept : deptDAO.selectAll()) {
		System.out.print(dept.getDeptno() + " ");
		System.out.print(dept.getDname() + " ");
		System.out.println(dept.getLoc());
	}
	
	EmpDAO empDAO = new EmpDAO();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border="1">
	<%
	for(EmpDTO emp : empDAO.selectAll()) {
	%>
	<tr>
		<td><%=emp.getEmpno() %></td>
		<td><%=emp.getEname() %></td>
		<td><%=emp.getSal() %></td>
	</tr>
	<%
	}
	%>
</table>
</body>
</html>