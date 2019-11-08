<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri=" http://java.sun.com/jsp/jstl/fmt"%>
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
	var notice = {};
	var str = '';
	function getUrlParams() {
	    var params = {};
	    window.location.search.replace(/[?&]+([^=&]+)=([^&]*)/gi, function(str, key, value) { params[key] = value; });
	    return params;
	}
	params = getUrlParams();
	$.ajax({
		url : ${pageContext.request.contextPath}"notice/"+params.no,
		type : "get",
		contentType :"json",
		success : function(resData){
			
			if(resData!=null){
				notice.title=resData.title;
				notice.writer=resData.writer;
				notice.content=resData.content;
				notice.hit=resData.hit;
				notice.time=resData.time;
				
				
			}
		}//success
	})
	$(){
		str = '';
		str+='<tr>';
		str+='<th>'+제목+'</th>';
		str+='<td>'+notice.title+'</td>';
		str+='<th>'+작성자+'</th>';
		str+='<td>'+notice.writer+'</td>';
		str+='<th>'+내용+'</th>';
		str+='<td>'+notice.content+'</td>';
		str+='<th>'+조회수+'</th>';
		str+='<td>'+notice.hit+'</td>';
		str+='<th>'+작성시간+'</th>';
		str+='<td><fmt:formatDate value="'+notice.time+'" pattern="yyyy-MM-dd"/></td>';
		str+='</tr>';
		$("#notice").append(str);
	}
	function listPage(){
		
	}
	$("#delete").click(function(){
		
	});
</script>
<body>
<c:import url="${pageContext.request.contextPath}/header.jsp"></c:import>
<section>
	<article class="container">
		<table class="table">
			<tbody id="notice">
			
			</tbody>
		</table>
		<input type="button" class="btn" value="삭제" id="delete"/>
	</article>
</section>
<c:import url="${pageContext.request.contextPath}/footer.jsp"></c:import>
</body>
</html>