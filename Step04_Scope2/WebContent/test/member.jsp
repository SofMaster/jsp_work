<%@page import="test.member.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test/member.jsp</title>
</head>
<body>
	<%
	 MemberDto mem = (MemberDto)request.getAttribute("dto");
	%>

	<h1>회원 한명의 정보 입니다.</h1>
	<p>번호 : <strong><%=mem.getNum()%></strong></p>
	<p>이름 : <strong><%=mem.getName()%></strong></p>
	<p>주소 : <strong><%=mem.getAddr()%></strong></p>
</body>
</html>