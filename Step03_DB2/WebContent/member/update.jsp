<%@page import="test.member.dto.MemberDto"%>
<%@page import="test.member.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	int num = Integer.parseInt(request.getParameter("num"));
	String name = request.getParameter("name");
	String addr = request.getParameter("addr");
	MemberDao dao = MemberDao.getInstance();
	MemberDto dto = new MemberDto();
	dto.setNum(num);
	dto.setName(name);
	dto.setAddr(addr);
	boolean isSuccess = dao.update(dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/member/update.jsp</title>
</head>
<body>
	<%if(isSuccess){%>
		<script>
			alert("업데이트 완료!")
			location.href="list.jsp"
		</script>
	<%}else{ %>
		<script>
			alert("업데이트 실패!")
			location.href="updateform.jsp"
		</script>
	<%} %>
</body>	
</html>