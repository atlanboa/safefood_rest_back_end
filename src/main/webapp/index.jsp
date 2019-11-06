<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Main</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
	<style type="text/css">
	#indexPic{
		text-align: center;
		width: 100%;
		height: 400px;
	}
	.carousel-item>img{
		width:100%;
	}
	.carousel-control-next,
	.carousel-control-prev {
	    filter: invert(100%);
	}
	.carousel-caption {
    top: 0;
    bottom: auto;
	}
	</style>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<body>
<c:import url="./header.jsp"></c:import>
<section>
	<div style="background: #959595;">
		<article class="container" style="background: white;">
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
	        <ol class="carousel-indicators">
	          <li data-target="#myCarousel" data-slide-to="0" class=""></li>
	          <li data-target="#myCarousel" data-slide-to="1" class="active"></li>
	          <li data-target="#myCarousel" data-slide-to="2" class=""></li>
	        </ol>
	        <div class="carousel-inner" id="indexPic">
	          <div class="carousel-item">
	            <img class="first-slide" src="./img/introduction/fruit.jpg" alt="First slide">
	            <div class="container">
	              <div class="carousel-caption">
	                <h1>Safe Food</h1>
	              </div>
	            </div>
	          </div>
	          <div class="carousel-item active">
	            <img class="second-slide" src="./img/introduction/fruit2.jpg" alt="Second slide">
	            <div class="container">
	              <div class="carousel-caption">
	                <h1>Safe Food</h1>
	              </div>
	            </div>
	          </div>
	          <div class="carousel-item">
	            <img class="third-slide" src="./img/introduction/fruit3.jpg" alt="Third slide">
	            <div class="container">
	              <div class="carousel-caption">
	                <h1>Safe Food</h1>
	              </div>
	            </div>
	          </div>
	        </div>
	        <a class="carousel-control-prev" href="#myCarousel" role="button" data-slide="prev">
	          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
	          <span class="sr-only">Previous</span>
	        </a>
	        <a class="carousel-control-next" href="#myCarousel" role="button" data-slide="next">
	          <span class="carousel-control-next-icon" aria-hidden="true"></span>
	          <span class="sr-only">Next</span>
	        </a>
	      </div>
		</article>
	</div>
	<br>
	<article>
		<div class="container">
			<form class="form-inline d-flex justify-content-center" id="foodSearch">
				<label for="cate" class="mb-2 mr-sm-2">검색조건:</label>
      			<select class="form-control mb-2 mr-sm-2" id="cate">
        			<option value="name">상품명</option>
	        		<option value="maker">제조사</option>
	        		<option value="material">원재료</option>
      			</select>
				<label for="keyword" class="mb-2 mr-sm-2">검색단어:</label>
				<input type="text" class="form-control mb-2 mr-sm-2" id="keyword" placeholder="검색단어">
				<input type="submit" class="btn btn-primary mb-2" value="검색">
			</form>
		</div>
		<div class="container" style="margin-top: 30px">
			<div class="row" id="foodList">
				
			</div>
		</div>
	</article>
</section>
<c:import url="${pageContext.request.contextPath}/footer.jsp"></c:import>
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
	/* $(document).on("click",".class",function(){
		let code =
		$.ajax({
			url : "foodinfo"+"/"+keyword,
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
	}) */
</script>
</html>