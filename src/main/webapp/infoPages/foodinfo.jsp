<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
	
	<style>
		.table td {min-width : 100px; word-break: break-all; }
	</style>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	
	<!-- 막대 그래프 사용 -->
	<script src="https://code.highcharts.com/highcharts.js"></script>
	<script src="https://code.highcharts.com/modules/exporting.js"></script>
	<script src="https://code.highcharts.com/modules/export-data.js"></script>
	<c:set var="allergies" value="대두,땅콩,우유,게,새우,참치,연어,쑥,소고기,닭고기,돼지고기,복숭아,민들레,계란흰자"></c:set>
<script>
	var allergies = ['대두','땅콩','우유','게','새우','참치','연어','쑥','소고기','닭고기','돼지고기','복숭아','민들레','계란흰자']; 
	function getUrlParams() {
	    var params = {};
	    window.location.search.replace(/[?&]+([^=&]+)=([^&]*)/gi, function(str, key, value) { params[key] = value; });
	    return params;
	}
	params = getUrlParams();
	var foodInformation;
	var allergy='';
	$.ajax({
		url : ${pageContext.request.contextPath}"/selectByFoodCode/"+params.code,
		type : "get",
		success : function(resData){
			var str = "";
			str+='<div class="row">';
			str+='<div class="col-sm-4"><img src="${pageContext.request.contextPath}/'+resData.img+'" style="float:left; width:200px; height:200px;"></div>';
			str+='<div class="col-sm-8"  style="float: left;">';
			str+='<table class="table table-hover">';
			str+='<tr><td>제품명</td><td>'+resData.name+' </td></tr>';
			str+='<tr><td>제조사</td><td>'+resData.maker+'</td></tr>';
			str+='<tr><td>원재료</td><td>'+resData.material+'</td></tr>';
			var materials = resData.material.split(',');
			
			for (var i = 0; i < allergies.length; i++) {
				for (var j = 0; j < materials.length; j++) {
					if(materials[j].indexOf(allergies[i])>0){
						allergy+=allergies[i]+' ';
					}
				}
			}
			str+='<tr><td>알레르기 성분</td><td>'+allergy+'</td></tr>';
			str+='</table>';
			str+='</div>';
			str+='</div>';
			$("#foodInfo").append(str);
			
			str ='<table class="table nutri-table">';
			str +='<tr><td>일회제공량</td><td>+'+resData.supportpereat+'</td></tr>';
			str +='<tr><td>칼로리</td><td>'+resData.calory+'</td></tr>';
			str +='<tr><td>탄수화물</td><td>'+resData.carbo+'</td></tr>';
			str +='<tr><td>단백질</td><td>'+resData.protein+'</td></tr>';
			str +='<tr><td>지방</td><td>'+resData.fat+'</td></tr>';
			str +='<tr><td>당류</td><td>'+resData.sugar+'</td></tr>';
			str +='<tr><td>나트륨</td><td>'+resData.natrium+'</td></tr>';
			str +='<tr><td>콜레스테롤</td><td>'+resData.chole+'</td></tr>';
			str +='<tr><td>포화 지방산</td><td>'+resData.fattyacid+'</td></tr>';
			str +='<tr><td>트랜스지방</td><td>'+resData.transfat+'</td></tr>';
			str+='</table>';
			$("#foodMaterial").append(str);
			foodInformation = resData;
		},
		error : function() {
			
		}
	});
	$(function() {
		
		var _tempArray=[
				foodInformation.supportpereat,
				foodInformation.calory,
				foodInformation.carbo,
				foodInformation.protein,
				foodInformation.fat,
				foodInformation.sugar,
				foodInformation.natrium,
				foodInformation.chole,
				foodInformation.fattyacid,
				foodInformation.transfat
			];
		
		Highcharts.chart('graph', {
			chart: {
			    plotBackgroundColor: null,
			    plotBorderWidth: null,
			    plotShadow: false,
			    type: 'pie'
			},
			title: {
			    text: 'Nutrition Infomation'
			},
			tooltip: {
			    pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
			},
			plotOptions: {
			    pie: {
			    	allowPointSelect: true,
			      	cursor: 'pointer',
			      	dataLabels: {
			        	enabled: true,
			       	 	format: '<b>{point.name}</b>: {point.percentage:.1f} %'
			   		}
			   	}
			},
			series: [{
			    name: '양',
			    colorByPoint: true,
			    data: [{
			      	name: '칼로리',
			      	y:_tempArray[1]*1
			    }, {
			      	name: '탄수화물',
			      	y:_tempArray[2]*1
			    }, {
			      	name: '단백질',
			      	y:_tempArray[3]*1
			    }, {
			     	name: '지방',
			      	y:_tempArray[4]*1
			    }, {
			      	name: '당류',
			      	y:_tempArray[5]*1
			    }, {
			      	name: '나트륨',
			      	y:_tempArray[6]*1
			    }, {
			      	name: '콜레스테롤',
			      	y:_tempArray[7]*1
			    }, {
			      	name: '포화지방산',
			      	y:_tempArray[8]*1
			    }, {
			      	name: '트렌스지방',
			      	y:_tempArray[9]*1
			    }] //data
			}] //series
		}); //highchart

	}) //function
	
	
	function JJim() {
		localStorage.setItem(foodInformation.code,
				foodInformation.name+','+
				foodInformation.maker+','+
				foodInformation.img+','+
				allergy+','+
				foodInformation.supportpereat+','+
				foodInformation.calory+','+
				foodInformation.carbo+','+
				foodInformation.protein+','+
				foodInformation.fat+','+
				foodInformation.sugar+','+
				foodInformation.natrium+','+
				foodInformation.chole+','+
				foodInformation.fattyacid+','+
				foodInformation.transfat+','+
				$("#quantity").val());
	}
</script>

</head>
<body>
	<!-- header -->
	<c:import url="${pageContext.request.contextPath}/header.jsp"></c:import>
	<!-- header -->
	<section>
		<article>
				<div class="jumbotron jumbotron-fluid" style="text-align: center;">
			  	<h1>Product Information</h1>
			  	<hr>
			  	<p>제품 정보</p>
				</div>
				
				<div class="container" id="foodInfo">
					
				</div>
				<div class="container">
				<fieldset>
					<legend>Quantity</legend>
					<input type="hidden" id="code" value="${food.code }"/>
					<input type="number" id="quantity" value="1"/>
					<button type="button" class="btn btn-primary btn-lg addItem" id="jjim" onclick="JJim()">추가</button>
				</fieldset>
				</div><br><br><br><br>
				
				<div class="container-fluid">
					<div class="row">
						<div class="col-sm-6" id="graph" style="min-width: 410px; height: 500px; max-width: 600px; margin-left: 100px; float:left">
						<!-- 원형 그래프 -->
						</div>
						<div class="col-sm-6" style="float:left" id="foodMaterial">
						</div>
					</div>
				</div>
		</article>
	</section>
	
	<!-- Footer -->
	<c:import url="${pageContext.request.contextPath}/footer.jsp"></c:import>
	<!-- Footer -->
</body>
</html>
