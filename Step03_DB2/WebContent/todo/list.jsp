<%@page import="test.todo.dto.TodoDto"%>
<%@page import="java.util.List"%>
<%@page import="test.todo.dao.TodoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	final int PAGE_ROW_COUNT=10;
	final int PAGE_DISPLAY_COUNT=5;
	
	int pageNum=1;
	String strPageNum=request.getParameter("pageNum");
	if(strPageNum!= null){
		pageNum=Integer.parseInt(strPageNum);
	}
	
	int startRowNum=1+(pageNum-1)*PAGE_ROW_COUNT;
	int endRowNum=pageNum*PAGE_ROW_COUNT;
	
	TodoDto dto=new TodoDto();
	dto.setStartRowNum(startRowNum);
	dto.setEndRowNum(endRowNum);
	   
	int startPageNum = 1 + ((pageNum-1)/PAGE_DISPLAY_COUNT)*PAGE_DISPLAY_COUNT;
	int endPageNum = startPageNum+PAGE_DISPLAY_COUNT-1;
	
	int totalRow = TodoDao.getInstance().getCount();
	int totalPageCount=(int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
	if(endPageNum>totalPageCount){
		endPageNum=totalPageCount;
	}
	TodoDao dao = TodoDao.getInstance();
	List<TodoDto> list = dao.getList(dto);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>todo/list.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<style>
.thead{
	font-size:20px;
	text-align:center;
	color:#2A93FF;
}
.tbody{
	text-align:center;
	font-weight:bold;
}
</style>
</head>
<body>
<jsp:include page="/include/navbar.jsp">
<jsp:param value="todo" name="thisPage"/>
</jsp:include>
	
	<div class="container">	
		
		<div class="bg-secondary bg-opacity-10 mt-5" style="width:1295px;height:220px;text-align:center;">
			<h1 class="fw-bold pt-2 text-dark " style="font-size:80px; ">Todo-List 
				<svg xmlns="http://www.w3.org/2000/svg" width="3rem" height="3rem" fill="currentColor" class="bi bi-calendar2-check" viewBox="0 0 16 16" color="#017BFF">
  					<path d="M10.854 8.146a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 0 1 .708-.708L7.5 10.793l2.646-2.647a.5.5 0 0 1 .708 0z"/>
  					<path d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5zM2 2a1 1 0 0 0-1 1v11a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V3a1 1 0 0 0-1-1H2z"/>
 					<path d="M2.5 4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5H3a.5.5 0 0 1-.5-.5V4z"/>
				</svg>
			</h1>
			<a class="btn btn-primary btn-lg mt-4 fw-bold rounded-pill" href="insertform.jsp" role="button" style="font-size:17px;" >ADD-List  
				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-calendar-plus ml-3" viewBox="0 0 16 16">
  					<path d="M8 7a.5.5 0 0 1 .5.5V9H10a.5.5 0 0 1 0 1H8.5v1.5a.5.5 0 0 1-1 0V10H6a.5.5 0 0 1 0-1h1.5V7.5A.5.5 0 0 1 8 7z"/>
  					<path d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5zM1 4v10a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V4H1z"/>
				</svg>
			</a>
		</div>
		<table class="table table-hover table-bordered mt-4 align-middle">
			<thead class="thead table-light ">
				<tr>
					<th>No.</th>
					<th>Todo-List</th>
					<th>Start date</th>
					<th>Deadline</th>
					<th>Registration Date</th>
					<th>Correction</th>
					<th>Delete</th>
				</tr>
			</thead>
			<tbody class="tbody p-5">
				<%for(TodoDto tmp:list){ %>
				<tr>
					<td><%=tmp.getNum() %></td>
					<td><%=tmp.getContent() %></td>
					<td><%=tmp.getStart_date() %></td>
					<td><%=tmp.getFinal_date() %></td>
					<td><%=tmp.getRegdate() %></td>
					<td>
						<a href="updateform.jsp?num=<%=tmp.getNum() %>">
							<button type="button" class="btn btn-warning rounded-circle">
                				<svg xmlns="http://www.w3.org/2000/svg" width="17" height="17" fill="currentColor" class="bi bi-wrench" viewBox="0 0 16 16">
  									<path d="M.102 2.223A3.004 3.004 0 0 0 3.78 5.897l6.341 6.252A3.003 3.003 0 0 0 13 16a3 3 0 1 0-.851-5.878L5.897 3.781A3.004 3.004 0 0 0 2.223.1l2.141 2.142L4 4l-1.757.364L.102 2.223zm13.37 9.019.528.026.287.445.445.287.026.529L15 13l-.242.471-.026.529-.445.287-.287.445-.529.026L13 15l-.471-.242-.529-.026-.287-.445-.445-.287-.026-.529L11 13l.242-.471.026-.529.445-.287.287-.445.529-.026L13 11l.471.242z"/>
								</svg>
             				 </button>
						</a>
					</td>
					<td>
						<a href="delete.jsp?num=<%=tmp.getNum() %>">
							 <button type="button" class="btn btn-dark rounded-circle">
                				<svg xmlns="http://www.w3.org/2000/svg" width="17" height="17" fill="currentColor" class="bi bi-trash" viewBox="0 0 16 16">
  									<path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
  									<path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
								</svg>
              				 </button>
						</a>
					</td>
				</tr>
				<%} %>
			</tbody>
		</table>
		<ul class="pagination">
			<%if(startPageNum !=1){ %>
			<li class="page-item"><a class="page-link" href="list.jsp?pageNum=<%=startPageNum-1%>">Prev</a></li>
			<%}else{ %>
			<li class="page-item disabled"><a class="page-link" href="list.jsp?pageNum=<%=startPageNum-1%>">Prev</a></li>
			<%} %>
			
			<%for(int i=startPageNum;i<=endPageNum;i++){ %>
				<li class="page-item <%=i==pageNum ? "active":"" %>">
					<a class="page-link"href="list.jsp?pageNum=<%=i %>"><%=i %></a>
				</li>
			<%} %>
			<%if(endPageNum < totalPageCount){ %>
			<li class="page-item"><a class="page-link" href="list.jsp?pageNum=<%=endPageNum+1%>">Next</a></li>
			<%}else{ %>
			<li class="page-item disabled"><a class="page-link" href="list.jsp?pageNum=<%=endPageNum+1%>">Next</a></li>
			<%} %>
			
		</ul>
	</div>
	 <jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>