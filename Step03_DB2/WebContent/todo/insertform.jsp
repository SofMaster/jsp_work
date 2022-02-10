<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/todo/insertform.jsp</title>
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
			<h1 class="fw-bold pt-5 text-dark " style="font-size:80px; ">Add-List 
				<svg xmlns="http://www.w3.org/2000/svg" width="3rem" height="3rem" fill="currentColor" class="bi bi-calendar-plus" viewBox="0 0 16 16" color="#017BFF">
  					<path d="M8 7a.5.5 0 0 1 .5.5V9H10a.5.5 0 0 1 0 1H8.5v1.5a.5.5 0 0 1-1 0V10H6a.5.5 0 0 1 0-1h1.5V7.5A.5.5 0 0 1 8 7z"/>
  					<path d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5zM1 4v10a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V4H1z"/>
				</svg>
			</h1>
		</div>
		
		<form class="form fw-bold" action="insert.jsp" method="post">
			<div class="mt-2" style="display:block;">
				<label class="form-label " for="content">Todo-List</label>
				<input class="form-control" type="text" name="content" id="content" style="text-align:center;margin:0 auto; width:600px; height:40px;" />
			</div>
			<div class="mt-4" style="display:block;">
				<label class="form-label" for="start_date">Start date</label>
				<input class="form-control" type="text" name="start_date" id="start_date" style="text-align:center;margin:0 auto; width:600px; height:40px;" />
			</div>
			<div class="mt-4" style="display:block;">
				<label class="form-label" for="final-date">Deadline</label>
				<input class="form-control" type="text" name="final_date" id="final-date" style="text-align:center;margin:0 auto; width:600px; height:40px;"/>
			</div>
			<button class="btn btn-primary btn-lg mt-4 fw-bold rounded-pill" type="submit" style="font-size:17px;">ADD
				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-calendar-plus" viewBox="0 0 16 16">
  					<path d="M8 7a.5.5 0 0 1 .5.5V9H10a.5.5 0 0 1 0 1H8.5v1.5a.5.5 0 0 1-1 0V10H6a.5.5 0 0 1 0-1h1.5V7.5A.5.5 0 0 1 8 7z"/>
  					<path d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5zM1 4v10a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V4H1z"/>
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