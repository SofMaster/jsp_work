<%@page import="test.todo.dto.TodoDto"%>
<%@page import="test.todo.dao.TodoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	TodoDto dto = TodoDao.getInstance().select(num);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<style>
.form{
	text-align:center;
	margin-top:20px;
	color:#2A93FF;
	font-size:20px;
}
.form input{
	display:flex-block;
	justify-content:center;
}
</style>
</head>
<body>
	<div class="container">
		<div class="bg-secondary bg-opacity-10 mt-5" style="width:1295px;height:220px;text-align:center;">
			<h1 class="fw-bold pt-5 text-dark " style="font-size:80px; ">Update-Form
				<button type="button" class="btn btn-warning rounded-circle">
                	<svg xmlns="http://www.w3.org/2000/svg" width="3rem" height="3rem" fill="currentColor" class="bi bi-wrench" viewBox="0 0 16 16">
  						<path d="M.102 2.223A3.004 3.004 0 0 0 3.78 5.897l6.341 6.252A3.003 3.003 0 0 0 13 16a3 3 0 1 0-.851-5.878L5.897 3.781A3.004 3.004 0 0 0 2.223.1l2.141 2.142L4 4l-1.757.364L.102 2.223zm13.37 9.019.528.026.287.445.445.287.026.529L15 13l-.242.471-.026.529-.445.287-.287.445-.529.026L13 15l-.471-.242-.529-.026-.287-.445-.445-.287-.026-.529L11 13l.242-.471.026-.529.445-.287.287-.445.529-.026L13 11l.471.242z"/>
					</svg>
             	</button>
			</h1>
		</div>
		
		<form class="form fw-bold" action="update.jsp" method="post">
			<input type="hidden" name="num" value="<%=dto.getNum() %>" />
			<div class="mt-2" style="display:block;">
				<label class="form-label " for="num">No.</label>
				<input class="form-control"type="text" name="num" id="num" value="<%=dto.getNum() %>" disabled style="text-align:center;margin:0 auto; width:600px; height:40px;"/>
			</div>
			<div class="mt-4" style="display:block;" >
				<label class="form-label " for="content">Todo-List</label>
				<input class="form-control" type="text" name="content" id="content" value="<%=dto.getContent() %>" style="text-align:center;margin:0 auto; width:600px; height:40px;"" />
			</div>
			<div class="mt-4" style="display:block;" >
				<label class="form-label " for="start_date">Start date</label>
				<input class="form-control" type="text" name="start_date" id="start_date" value="<%=dto.getStart_date() %>" style="text-align:center;margin:0 auto; width:600px; height:40px;"" />
			</div>
			<div class="mt-4" style="display:block;" >
				<label class="form-label " for="final_date">Deadline</label>
				<input class="form-control" type="text" name="final_date" id="final_date" value="<%=dto.getFinal_date() %>" style="text-align:center;margin:0 auto; width:600px; height:40px;"" />
			</div>
			<button class="btn btn-primary btn-lg mt-4 fw-bold rounded-pill me-3" type="submit" style="font-size:17px;">Update
				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-wrench" viewBox="0 0 16 16">
  					<path d="M.102 2.223A3.004 3.004 0 0 0 3.78 5.897l6.341 6.252A3.003 3.003 0 0 0 13 16a3 3 0 1 0-.851-5.878L5.897 3.781A3.004 3.004 0 0 0 2.223.1l2.141 2.142L4 4l-1.757.364L.102 2.223zm13.37 9.019.528.026.287.445.445.287.026.529L15 13l-.242.471-.026.529-.445.287-.287.445-.529.026L13 15l-.471-.242-.529-.026-.287-.445-.445-.287-.026-.529L11 13l.242-.471.026-.529.445-.287.287-.445.529-.026L13 11l.471.242z"/>
				</svg>
			</button>
			<button class="btn btn-primary btn-lg mt-4 fw-bold rounded-pill" type="reset" style="font-size:17px;">cancel
				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x-circle" viewBox="0 0 16 16">
  					<path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
  					<path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
				</svg>
			</button>
		</form>
		<div style="text-align:center;">
			<a href="list.jsp">
				<button class="btn btn-primary btn-lg mt-4 fw-bold rounded-pill" style="font-size:17px;">Go Back to Todo-list Page
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-left-circle" viewBox="0 0 16 16">
  						<path fill-rule="evenodd" d="M1 8a7 7 0 1 0 14 0A7 7 0 0 0 1 8zm15 0A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-4.5-.5a.5.5 0 0 1 0 1H5.707l2.147 2.146a.5.5 0 0 1-.708.708l-3-3a.5.5 0 0 1 0-.708l3-3a.5.5 0 1 1 .708.708L5.707 7.5H11.5z"/>
					</svg>
				</button>
			</a>
		</div>
	</div>
</body>
</html>