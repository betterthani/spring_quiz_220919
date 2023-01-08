<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>통나무 펜션</title>
		<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
		<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"	crossorigin="anonymous"></script>
		<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
		<link rel="stylesheet" type="text/css" href="/css/lesson06/booking.css">
</head>
<body>
	<div id="wrap" class="container">
		<jsp:include page="bookingHeader.jsp" />
		<!-- 사진 영역 -->
		<section class="top bg-danger content">
			<div class="banner">
				<img alt="배너사진" src="/img/lesson06/test06_banner1.jpg" class="bannerPic"  width="100%" height="100%">
			</div>
		</section>
		<!-- 예약란 -->
		<section>
			<div class="bottom bg-warning d-flex">
				<!-- 실시간 예약하기 -->
				<div class="real-time-reserved col-4 d-flex justify-content-center align-items-center">
					<div class="display-4 text-white">
						<div>실시간</div>
						<div>예약하기</div>
					</div>
				</div>
				
				<!-- 예약확인 -->
				<div class="confirm col-4 text-white p-3" id="memberInputBox">
					<h4 class="pb-3">예약 확인</h4>
					<div class="d-flex align-items-center justify-content-end mr-3">
						<span class="pb-3">이름:</span>
						<input type="text" id="name" class="form-control col-9 ml-2 mb-3">
					</div>
					
					<div class="d-flex align-items-center justify-content-end mr-3">
						<div>전화번호:</div>
						<input type="text" id="phoneNumber" class="form-control col-9 ml-2 ">
					</div>
					
					<!-- 조회하기 버튼 -->
					<div class="d-flex justify-content-end pl-3 pt-3">
						<button type="button" class="btn btn-success" id="searchBtn">조회하기</button>
					</div>
				</div>
				
				<!-- 예약문의 -->
				<div class="real-time-reserved col-4 d-flex justify-content-center align-items-center">
					<div class="text-white">
						<h4>예약문의:</h4>
						<h1>010-</h1>
						<h1>0000-1111</h1>
					</div>
				</div>
				
			</div>
		</section>
		<footer>
			<jsp:include page="bookingFooter.jsp" />
		</footer>
	</div>
	
	<script>
		$(document).ready(function(){
			$('#searchBtn').on("click",function(){
				// alert("1111");
				let name = $('#name').val().trim();
				if(name == ''){
					alert("이름을 입력하세요.");
					return;
				}
				let phoneNumber = $('#phoneNumber').val().trim();
				if(phoneNumber == ''){
					alert("전화번호를 입력하세요");
					return;
				}
				
				if(!phoneNumber.startsWith('010')){
					alert("010으로 시작한 전화번호를 입력해주세요.");
					return;
				}
				
				// 에이젝스
					$.ajax({
					// request
					type:"POST"
					,url:"/booking/homepage"
					,data:{"name":name , "phoneNumber":phoneNumber}
				
					//response
					,success:function(data){
						if(data.answer){
							alert(
							"이름 : " + data.answer.name +
							"\n날짜 : " + data.answer.date +
							"\n일수 : " + data.answer.day +
							"\n인원 : " + data.answer.headcount +
							"\n상태 : " + data.answer.state
							);
						} else {
							alert("예약 내역이 없습니다");
						}
					}
					,error:function(e){
						alert("error" + e);
					}
					
				}); //->ajax 통신
			});//->조회버튼
			
			let bannerArray = ["/img/lesson06/test06_banner1.jpg","/img/lesson06/test06_banner2.jpg","/img/lesson06/test06_banner3.jpg","/img/lesson06/test06_banner4.jpg"]
			let currentIndex = 1;
			setInterval(function(){
				//console.log("setInterval");
				$('.bannerPic').attr("src", bannerArray[currentIndex++]);
				
				if(currentIndex >= bannerArray.length){
					currentIndex=0;
				}
			}, 3000);
		}); //->document
	</script>
</body>
</html>