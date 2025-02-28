<%@page import="dao.CartDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String userid = (String)session.getAttribute("userid");
	String bookid = request.getParameter("bookid");
	
	CartDAO cartDAO = new CartDAO();
	if(cartDAO.insertCart(userid, bookid)) {%>
		<script>
			alert("장바구니 등록 완료");
			history.back();
		</script>
<%	} else { %>
		<script>
			alert("장바구니 등록 실패");
			history.back();
		</script>
<%
	}
%>