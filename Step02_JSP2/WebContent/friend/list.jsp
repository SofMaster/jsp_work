<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/friend/list.jsp</title>
</head>
<body>
<%
	List<String> list=new ArrayList<String>();
	list.add("김구라");
	list.add("해골");
	list.add("원숭이");
	list.add("주뎅이");
	list.add("덩어리");
%>
	<h1>친구 이름 목록 입니다.</h1>
	<ul>
	<%for(int i=0; i<list.size(); i++){ %>
		<li><%=list.get(i)%></li>
	<%} %>	
	</ul>
</body>
</html>