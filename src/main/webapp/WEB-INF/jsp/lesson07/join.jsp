<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
		<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
		<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"	crossorigin="anonymous"></script>
		<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
		<link rel="stylesheet" type="text/css" href="/css/lesson07/style.css">
</head>
<body>
	<div id="wrap" class="container">
		<header class="boxColor d-flex align-items-center">
			<h2 class="font-weight-bold ml-3">메모 게시판</h2>
		</header>
		<section class="content2">
			<div class="d-flex flex-column align-items-center">
				<div class="box pl-3">
					<!-- 회원가입 텍스트 -->
					<legend class="font-weight-bold">회원가입</legend>
					
					<div class="joinBox">
						<div class="p-3">
							<!-- id 박스 -->
							<div>ID</div>
							<div class="d-flex">
								<input type="text" id="loginId" class="form-control col-9 mr-3" placeholder="ID를 입력해주세요">
								<button type="button" id="isDuplicatedBtn" class="btn btn-sm btn-primary">중복확인</button>
							</div>
							
							<!-- password 박스 -->
							<div>password</div>
							<input type="password" id="password" class="form-control col-7 mr-3" placeholder="비밀번호를 입력해주세요">
							
							<!-- 재확인용 password 박스 -->
							<div>confirm password</div>
							<input type="password" id="recheckPassword" class="form-control col-7 mr-3" placeholder="비밀번호를 재입력해주세요">
							
							<!-- 이름 박스 -->
							<div>이름</div>
							<input type="text" id="name" class="form-control col-9 mr-3" placeholder="이름을 입력해주세요">
							
							
							<!-- 이름 박스 -->
							<div>이름</div>
							<input type="text" id="email" class="form-control col-9 mr-3" placeholder="이메일을 입력해주세요">
							
							<!-- 회원가입 버튼 -->
							<div class="d-flex justify-content-center pt-3">
								<button type="button" class="btn btn-primary" id="joinBtn">가입하기</button>
							</div>
								
						</div>
					</div>
				
				</div>
			</div>
		</section>
		
		<footer class="boxColor d-flex align-items-center justify-content-center">
			<small class="text-secondary">copyright haeunkang</small>
		</footer>
	</div>
</body>
</html>