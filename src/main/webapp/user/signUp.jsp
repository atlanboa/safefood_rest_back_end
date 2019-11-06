<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원가입</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
	<style type="text/css">
	@media ( min-width : 1000px) {
		.bd-placeholder-img-lg {
			font-size: 3.5rem;
		}
	}
	</style>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>

<body>
	<!-- header -->
	<c:import url="${pageContext.request.contextPath}/header.jsp"></c:import>
	<!-- header -->
	<section>
	<article>
	<div class="container">
		<h1>회원가입</h1>
		<form class="needs-validation" id="signUp">
		<table class="table">
			<tr>
				<th>아이디</th>
				<td>
					<input type="text" class="form-control" name="id" id="id" required>
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" class="form-control" name="pass" id="pass" required></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" class="form-control" name="name" id="name" required></td>
			</tr>
			<tr>
				<th>주소</th>
				<td><input type="text" class="form-control" name="address" id="address" required></td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td><input type="tel" class="form-control" name="phone" id="phone" required></td>
			</tr>
			<tr>
				<th>알레르기</th>
				<td>
				<fieldset id="userAllergie"><legend>Check</legend>
				<div class="form-check-inline">
					<label class="form-check-label">
						<input type="checkbox" class="form-check-input allergy" name="allergy" value="대두">대두
					</label>
				</div>
				<div class="form-check-inline">
					<label class="form-check-label">
						<input type="checkbox" class="form-check-input allergy" name="allergy" value="땅콩">땅콩
					</label>
				</div>
				<div class="form-check-inline">
					<label class="form-check-label">
						<input type="checkbox" class="form-check-input allergy" name="allergy" value="우유">우유
					</label>
				</div>
				<div class="form-check-inline">
					<label class="form-check-label">
						<input type="checkbox" class="form-check-input allergy" name="allergy" value="게">게
					</label>
				</div><br>
				<div class="form-check-inline">
					<label class="form-check-label">
						<input type="checkbox" class="form-check-input allergy" name="allergy" value="새우">새우
					</label>
				</div>
				<div class="form-check-inline">
					<label class="form-check-label">
						<input type="checkbox" class="form-check-input allergy" name="allergy" value="참치">참치
					</label>
				</div>
				<div class="form-check-inline">
					<label class="form-check-label">
						<input type="checkbox" class="form-check-input allergy" name="allergy" value="연어">연어
					</label>
				</div>
				<div class="form-check-inline">
					<label class="form-check-label">
						<input type="checkbox" class="form-check-input allergy" name="allergy" value="쑥">쑥
					</label>
				</div><br>
				<!--  -->
				<div class="form-check-inline">
					<label class="form-check-label">
						<input type="checkbox" class="form-check-input allergy" name="allergy" value="소고기">소고기
					</label>
				</div>
				<div class="form-check-inline">
					<label class="form-check-label">
						<input type="checkbox" class="form-check-input allergy" name="allergy" value="닭고기">닭고기
					</label>
				</div>
				<div class="form-check-inline">
					<label class="form-check-label">
						<input type="checkbox" class="form-check-input allergy" name="allergy" value="돼지고기">돼지고기
					</label>
				</div><br>
				<div class="form-check-inline">
					<label class="form-check-label">
						<input type="checkbox" class="form-check-input allergy" name="allergy" value="복숭아">복숭아
					</label>
				</div>
				<div class="form-check-inline">
					<label class="form-check-label">
						<input type="checkbox" class="form-check-input allergy" name="allergy" value="민들레">민들레
					</label>
				</div>
				<div class="form-check-inline">
					<label class="form-check-label">
						<input type="checkbox" class="form-check-input allergy" name="allergy" value="계란흰자">계란흰자
					</label>
				</div><br>
				</fieldset>
				</td>
			</tr>
		</table>
		<input type="submit" class="btn btn-outline-primary" id="signUp" value="회원가입 ✓">
		</form>
	</div>
	</article>
	</section>
	<!-- Footer -->
	<c:import url="${pageContext.request.contextPath}/footer.jsp"></c:import>
	<!-- Footer -->
</body>
<script type="text/javascript">
	$("#signUp").submit(function(){
		var userInfo = {};
		var id = $("#id").val();
		var pass = $("#pass").val();
		var name = $("#name").val();
		var address = $("#address").val();
		var phone = $("#phone").val();
		var allergy = ""
		$(".allergy:checked").each(function(){
			allergy += $(this).val()+" ";
		});
		userInfo.id=id;
		userInfo.pass=pass;
		userInfo.name=name;
		userInfo.address=address;
		userInfo.phone=phone;
		userInfo.allergy=allergy;
		$.ajax({
			url : "insertUser",
			type : "post",
			data : userInfo,
			dataType : "json",
			success : function(){
				window.location.href = "http://localhost:9999/";
			},
			error : function(){
				alert("아이디 또는 패스워드를 확인하세요");
			}
		});
	});
</script>
</html>