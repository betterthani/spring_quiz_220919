<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
		<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
		<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"	crossorigin="anonymous"></script>
		<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
		<!-- 아이콘 모양 부트스트랩 -->
		<link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">
		<link rel="stylesheet" type="text/css" href="/css/lesson07/style.css">
	
</head>
<body>
	<div id="wrap" class="container">
		<header class="boxColor d-flex align-items-center">
			<h2 class="font-weight-bold ml-3">메모 게시판</h2>
		</header>
		<section class="content">
			<div class="d-flex flex-column align-items-center">
				<div class="box pl-3">
					<!-- 로그인 텍스트 -->
					<legend class="font-weight-bold">로그인</legend>
					
					<div class="loginBox">
						
						<!-- id 박스 -->
						<div class="input-group d-flex justify-content-center pt-5">
							<div class="input-group-append">
								<span class="input-group-text"><i class="fa fa-user"></i></span>
							</div>
							<input type="text" class="form-control col-6" id="loginId"  placeholder="Username">
						</div>
						
						<!-- password박스 -->
						<div class="input-group d-flex justify-content-center pt-3">
							<div class="input-group-append">
								<span class="input-group-text"><i class="fa fa-lock"></i></span>
							</div>
							<input type="text" class="form-control col-6" id="loginId"  placeholder="비밀번호를 입력하세요.">
						</div>
						
						<!-- 버튼 박스 -->
						<div class="d-flex justify-content-center pt-3">
							<!-- 회원가입 버튼 -->
							<div class="pr-3">
							<button type="button" class="btn btn-secondary" id="joinBtn">회원가입</button>
							</div>
							
							<!-- 로그인 버튼 -->
							<div class="">
							<button type="button" class="btn btn-primary" id="loginBtn">로그인</button>
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