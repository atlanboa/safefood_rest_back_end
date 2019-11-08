<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
	<title>Insert title here</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<script type="text/javascript">


	$(function() {
		$("#insert").click(function(){
			
			
			var today = new Date();
			var dd = today.getDate();
			var mm = today.getMonth()+1; //January is 0!
			var yyyy = today.getFullYear();
			
			today = yyyy+'-'+mm+'-'+dd;
			
			var write = {
					title: $("#title").val(),
					content: $("#content").val(),
					writer : $("#userId").html(),
					hit : 1,
					time : today
					
			};
			
			$.ajax({
				url : ${pageContext.request.contextPath}"/noticeInsert",
				type : "post",
				data : JSON.stringify(write),
				contentType :"application/JSON",
				success : function(resData){
					
					
					location.href=${pageContext.request.contextPath}"/boards/noticeBoard.jsp";
				},//success
				error : function(error){
					
				}
			});//ajax
		});
	})


	
	
</script>
<body>
<c:import url="${pageContext.request.contextPath}/header.jsp"></c:import>
<section>
	<article class="container">
	<br>
		<table class="table">
			<tbody id="notice">
				<tr>
				<th> 제목 </th>
				<td> <input type="text" id="title"/> </td>
				</tr>
				<tr>
				<th> 작성자 </th> <td id="userId">${user.id}</td>
				</tr>
				<tr>	
				<th> 내용 </th>
				<td> <textarea rows="15" cols="100" id="content">
				
				</textarea> </td>
				</tr>
				
			</tbody>
		</table>
		<input type="button" class="btn btn-outline-primary" value="글쓰기" id="insert"/>
	</article>
</section>
<c:import url="${pageContext.request.contextPath}/footer.jsp"></c:import>
</body>
</html>