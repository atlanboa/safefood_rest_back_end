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
	<style type="text/css">
	section:after {
  		content: "";
  		display: table;
  		clear: both;
  		
	}
	div.foodInfo{
		border: 10px solid #FFFFFF;
		height: 200px;
	}
	div.foodInfo:HOVER{
		border: 5px inset #8B0000;
		height: auto;
		padding: 10px;
		height: 200px;
	}
	div.foodMaterial{
		display: inline-block;
		white-space: nowrap;
		overflow: hidden;
		text-overflow: ellipsis;
		/* 여러 줄 자르기 추가 스타일 */
		white-space: normal; 
		line-height: 1.2; 
		height: 3.6em;
	}
	div.info :HOVER{ 
		
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
			<form class="form-inline d-flex justify-content-center">
				<label for="cate" class="mb-2 mr-sm-2">검색조건:</label>
      			<select class="form-control mb-2 mr-sm-2" id="cate">
        			<option value="name">상품명</option>
	        		<option value="maker">제조사</option>
	        		<option value="material">원재료</option>
      			</select>
				<label for="keyword" class="mb-2 mr-sm-2">검색단어:</label>
				<input type="text" class="form-control mb-2 mr-sm-2" id="keyword" placeholder="검색단어">
				<input type="button" class="btn btn-primary mb-2" value="검색" id="foodSearch">
			</form>
		</div>
		<div class="container" style="margin-top: 30px">
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
		var path =${pageContext.request.contextPath}"/infoPages/foodinfo.jsp?code="+code;
		location.href=path;
	}
	$("#foodSearch").click(function(){
		var category = $("#cate").val();
		var keyword = $("#keyword").val();
		
		$.ajax({
			url : ${pageContext.request.contextPath}"/search/"+category+"/"+keyword,
			type : "get",
			success : function(resData) {
				var str = "";
				if(resData!=null){
					$("#foodList").empty();
					$.each(resData,function(idx,food){
						if(idx%2==0){
							str+='<div class="col-sm-6 left foodInfo">';
						}else if(idx%2==1){
							str+='<div class="col-sm-6 right foodInfo">';
						}
						var path = ${pageContext.request.contextPath}"/";
						str+='<div class="info" onclick="forViewPage('+food.code+')">';
						str+='<img class="foodImg" src="'+path+food.img+'" style="float:left; width:30%; height: 30%">';
						str+='<div class="content" style="float: left; width: 70%;">';
						str+='<div>'+food.name+'</div><div>'+food.maker+'</div><div class="foodMaterial">'+food.material+'</div>';
						str+='</div></div></div>';
					});//each
					$("#foodList").append(str);
				}
			},
			error : function() {
				alert("조회 실패(시스템 오류)")
			}
		});
	});
	
</script>
</html>