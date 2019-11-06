<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
	<title>notice</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
		integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
	<link rel="stylesheet" href="../css/main.css">
	<style type="text/css">
	section:after {
	
  		content: "";
  		display: table;
  		clear: both;
  		
	}
	
	div.info :HOVER{ 
		background: pink;
	}
	</style>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

	
</head>
<body>
	<!-- header -->
	<c:import url="${pageContext.request.contextPath}/header.jsp"></c:import>
	<!-- header -->
	
	<section>
		<article>
			<div class="container">
					<div class="jumbotron jumbotron-fluid" style="text-align: center;">
  	<h1>What We Provide</h1>
  	<hr>
  	<p>건강한 삶을 위한 먹거리 프로젝트</p>
	</div>
	
	<div class="container">
		<!-- <form class="form-inline" action="/action_page.php"> -->
		<form class="form-inline d-flex justify-content-center" id="foodSearch">
			<input type="hidden" name="command" value="search">
			<input type="hidden" name="location" value="index.jsp">
			<label for="cate" class="mb-2 mr-sm-2">검색조건:</label>
      		<select class="form-control mb-2 mr-sm-2" id="cate" name="cate">
        		<option value="name">상품명</option>
        		<option value="maker">제조사</option>
        		<option value="material">원재료</option>
      		</select>
			<label for="keyword" class="mb-2 mr-sm-2">검색단어:</label>
			<input type="text" class="form-control mb-2 mr-sm-2" id="keyword" placeholder="검색단어" name="keyword">
			<input type="submit" class="btn btn-primary mb-2" value="검색">
		</form>
	</div>
	
		<!-- <button type="button" class="btn">Basic</button> -->
	<div class="container-fuild" style="margin-top: 30px">
		<div class="row" id="foodList">
		
		</div>
	</div>
			</div>
		</article>
	</section>
	
	<!-- Footer -->
	<c:import url="${pageContext.request.contextPath}/footer.jsp"></c:import>
	<!-- Footer -->
</body>
<script type="text/javascript">
	function forViewPage(code) {
		//alert(code);
		var path ="selectByCode/"+code;
		//alert(path);
		location.href=path;
	}
	$("#foodSearch").submit(function(){
		let category = $("#cate").val();
		let keyword = $("#keyword").val();
		alert(category +"/"+ keyword);
		$.ajax({
			url : category+"/"+keyword,
			type : "get",
			success : function(resData) {
				var str = "";
				$("#foodList").empty();
				if(resData!=null){
					$.each(resData,function(idx,food){
						if(idx%3==0){
							str+='<div class="col-sm-4 left">';
						}else if(idx%3==1){
							str+='<div class="col-sm-4 mid">';
						}else if(idx%3==2){
							str+='<div class="col-sm-4 right">';
						}
						str+='<div class="info" onclick="forViewPage('+food.code+')">';
						str+='<img src="'+food.img+'" style="width: 50%; height: 50%;">';
						str+='<p class="text">'+food.name+'<br>'+food.maker+'</p>';
						str+='</div></div>';
					});//each
				}
			},
			error : function() {
				alert("조회 실패(시스템 오류)")
			}
		});
	});
</script>
</html>