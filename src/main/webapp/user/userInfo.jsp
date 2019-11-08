<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원 정보</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
	<style type="text/css">
	.signUpForm{
		width: 60%;
	}
	</style>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<body>
	<c:set var="allergies" value="대두,땅콩,우유,게,새우,참치,연어,쑥,소고기,닭고기,돼지고기,복숭아,민들레,계란흰자"></c:set>
	<!-- header -->
	<c:import url="${pageContext.request.contextPath}/header.jsp"></c:import>
	<!-- header -->
	<section>
		<div class="container">
			<div>
			<h1>회원 정보 수정</h1>
			<form action="${pageContext.request.contextPath}/UserServlet" method="post">
			<input type="hidden" name="command" value="modification">
			<table class="signUpTable">
				<tr>
					<th>아이디</th>
					<td><input type="text" class="form-control" name="id" id="id" readonly="readonly" value="${user.id}"></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" class="form-control" name="pass" id="pass" value="${user.pass}"></td>
				</tr>
				<tr>
					<th>이름</th>
					<td><input type="text" class="form-control" name="name" id="name" value="${user.name}"></td>
				</tr>
				<tr>
					<th>주소</th>
					<td><input type="text" class="form-control" name="address" id="address" value="${user.address}"></td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td><input type="tel" class="form-control" name="phone" id="phone" value="${user.phone}"></td>
				</tr>
				<tr>
					<th>알레르기</th>
					<td>
					<fieldset id="userAllergie"><legend>Check</legend>
					<c:forEach var="allergy" items="${allergies}" varStatus="status">
						<c:set var="comp" value="0"/>
						<c:forEach var="userAl" items="${fn:split(user.allergy,' ')}">
							<c:if test="${allergy eq userAl}">
								<c:set var="comp" value="1"/>		
							</c:if>
						</c:forEach>
						<c:choose>
							<c:when test="${comp==1}">
								<div class="form-check-inline">
									<label class="form-check-label">
										<input type="checkbox" class="form-check-input allergy" name="allergy" value="${allergy}" checked="checked">${allergy}
									</label>
								</div>
							</c:when>
							<c:otherwise>
								<div class="form-check-inline">
									<label class="form-check-label">
										<input type="checkbox" class="form-check-input allergy" name="allergy" value="${allergy}">${allergy}
									</label>
								</div>
							</c:otherwise>
						</c:choose>
						<c:if test="${status.count%4==0}">
							<br>
						</c:if>
					</c:forEach>
					</fieldset>
					</td>
				</tr>
			</table>
			<input type="button" class="btn btn-outline-primary" value="수정"  id="modification"/>
			<input type="button" class="btn btn-outline-primary" value="삭제" id="delete"/>
			</form>
			</div>
		</div>
	</section>
	<!-- Footer -->
	<c:import url="${pageContext.request.contextPath}/footer.jsp"></c:import>
	<!-- Footer -->
</body>
<script type="text/javascript">
	$("#modification").click(function(){
		var allergy = ""
			$(".allergy:checked").each(function(){
				allergy += $(this).val()+" ";
			});
		var userInfo = {
				id:$("#id").val(),
				pass:$("#pass").val(),
				name:$("#name").val(),
				address:$("#address").val(),
				phone:$("#phone").val(),
				allergy:allergy
		};
		$.ajax({
			url : ${pageContext.request.contextPath}"/updateUser",
			type : "post",
			data : JSON.stringify(userInfo),
			contentType:"application/json",
			success : function(){
				location.href=${pageContext.request.contextPath}"/index.jsp";
			},
			error : function(){
				
			}
		});
	});
	$("#delete").click(function(){
		var allergy = ""
			$(".allergy:checked").each(function(){
				allergy += $(this).val()+" ";
			});
		var userInfo = {
				id:$("#id").val(),
				pass:$("#pass").val(),
				name:$("#name").val(),
				address:$("#address").val(),
				phone:$("#phone").val(),
				allergy:allergy
		};
		$.ajax({
			url : ${pageContext.request.contextPath}"/deleteUser",
			type : "post",
			data : JSON.stringify(userInfo),
			contentType:"application/json",
			success : function(){
				location.href=${pageContext.request.contextPath}"/index.jsp";
			},
			error : function(){
				
			}
		});
	});
</script>
</html>