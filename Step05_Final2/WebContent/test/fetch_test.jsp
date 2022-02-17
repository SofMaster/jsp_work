<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<button id="myBtn">눌러보셈</button>
<script>
	document.queryelector("#myBtn").addEventListener("click",function(){
		fetch("get_msg.jsp")
		.then(function(response){
			return response.text();
		})
		.then(function(){
			console.log(data);
		}); 
	});
</script>
</body>
</html>