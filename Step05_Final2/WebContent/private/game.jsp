<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/*
		[ 리다이렉트 응답]
		- 클라이언트에게 요청을 다시 하라고 강요하는 응답
		- 클라이언트의 위치를 강제로 바꾸는 효과가 된다.
		- 리다이렉트 응답도 응답이다.
	*/
	String id=(String)session.getAttribute("id");
%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/private/game.jsp</title>
</head>
<body>
	<h1>게임 페이지 입니다.</h1>
	<p><%=id %>님 신나게 놀아 보아요!</p>
</body>
</html>