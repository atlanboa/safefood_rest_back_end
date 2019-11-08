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
	$.ajax({
		url : ${pageContext.request.contextPath}"/notice",
		type : "get",
		contentType : "json",
		success : function(resData){
			var str = '';
			if(resData!=null){
				$("#notice").empty();
				$.each(resData, function(idx,notice){
					str+='<tr class="view" id="'+notice.no+'" style="cursor:pointer">';
					str+='<td>'+notice.no+'</td>';
					str+='<td>'+notice.title+'</td>';
					str+='<td>'+notice.writer+'</td>';
					str+='<td>'+notice.hit+'</td>';
					str+='<td>'+notice.time+'</td>';
					str+='</tr>';
				})//each
				$("#notice").append(str);
			}
		}//success
	});
	$(function(){
		$("#notice").on("click",".view",function(){
			viewClick($(this).attr("id"));
		})
	});
	function viewClick(id){
		var path ="noticeView.jsp?no="+id;
		location.href=path;
	}
	$("#noticeWriter").click(function(){
		var path ="noticeWrite.jsp";
		location.href=path;
	});
</script>
<body>
<c:import url="${pageContext.request.contextPath}/header.jsp"></c:import>
<section>
	<article class="container">
		<table class="table table-hover">
			<thead>
				<tr>
				<th scope="col">글번호</th><th scope="col">제목</th><th scope="col">작성자</th><th scope="col">조회수</th><th scope="col">작성시간</th>
				<tr>
			</thead>
			<tbody id="notice">
			
			</tbody>
		</table>
		<ul class="pagination justify-content-center" style="margin:20px 0">
			<li class="page-item"><a class="page-link" href="#">Previous</a></li>
			<li class="page-item"><a class="page-link" href="#">1</a></li>
			<li class="page-item"><a class="page-link" href="#">2</a></li>
			<li class="page-item"><a class="page-link" href="#">3</a></li>
			<li class="page-item"><a class="page-link" href="#">Next</a></li>
		</ul>
		<input type="button" id="noticeWriter" value="글쓰기"/>
	</article>
</section>
<c:import url="${pageContext.request.contextPath}/footer.jsp"></c:import>
</body>
</html>