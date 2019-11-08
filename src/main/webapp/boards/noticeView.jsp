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
	
	var str = '';
	var params = {};
	function getUrlParams() {
	    window.location.search.replace(/[?&]+([^=&]+)=([^&]*)/gi, function(str, key, value) { params[key] = value; });
	    return params;
	}
	params = getUrlParams();
	var notice = {};
	$(function(){
		$.ajax({
			url : ${pageContext.request.contextPath}"/notice/"+params.no,
			type : "get",
			contentType :"json",
			success : function(resData){
				if(resData!=null){
					notice.title=resData.title;
					notice.writer=resData.writer;
					notice.content=resData.content;
					notice.hit=resData.hit;
					notice.time=resData.time;
					listPage();
				}
			}//success
		})
		
	});
	function listPage(){
		str = '';
		str+='<tr>';
		str+='<th>제목</th>';
		str+='<td>'+notice.title+'</td>';
		str+='</tr><tr>';
		str+='<th>작성자</th>';
		str+='<td>'+notice.writer+'</td>';
		str+='</tr><tr>';
		str+='<th>내용</th>';
		str+='<td>'+notice.content+'</td>';
		str+='</tr><tr>';
		str+='<th>조회수</th>';
		str+='<td>'+notice.hit+'</td>';
		str+='</tr><tr>';
		str+='<th>작성시간</th>';
		str+='<td>'+notice.time+'</td>';
		str+='</tr>';
		$("#notice").append(str);
	}
	$("#update").click(function(){
		$.ajax({
			url : ${pageContext.request.contextPath}"/noticeUpdate/"+params.no,
			type : "post",
			contentType :"json",
			success : function(resData){
				alert("수정완료");
				location.href=${pageContext.request.contextPath}"/board/noticeBoard.jsp";
			},//success
			error : function(error){
				alert("수정실패");
			}
		})
	});
	$("#delete").click(function(){
		$.ajax({
			url : ${pageContext.request.contextPath}"/noticeDelete/"+params.no,
			type : "post",
			success : function(resData){
				alert("삭제완료");
				location.href=${pageContext.request.contextPath}"/board/noticeBoard.jsp";
			},//success
			error : function(error){
				alert("삭제실패");
			}
		})
	});
</script>
<body>
<c:import url="${pageContext.request.contextPath}/header.jsp"></c:import>
<section>
	<article class="container">
	<br>
		<table class="table">
			<tbody id="notice">
			
			</tbody>
		</table>
		<input type="button" class="btn btn-outline-primary" value="수정" id="update"/>
		<input type="button" class="btn btn-outline-dange" value="삭제" id="delete"/>
	</article>
</section>
<c:import url="${pageContext.request.contextPath}/footer.jsp"></c:import>
</body>
</html>