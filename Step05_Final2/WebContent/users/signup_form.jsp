<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="containeer">
	<h1>회원가입 폼 입니다.</h1>
 	<form action="signup.jsp" method="post">
 		<div>
 			<label for="id">아이디</label>
 			<input type="text" name="id" id="id"/>
 		</div>
 		<div>
 			<label for="pwd">비밀번호</label>
 			<input type="password" name="pwd" id="pwd"/>
 		</div>
 		<div>
 			<label for="email">이메일</label>
 			<input type="text" name="email" id="email"/>
 		</div>
 		<button type="submit">가입</button>
 	</form>
</div>
</body>
</html>