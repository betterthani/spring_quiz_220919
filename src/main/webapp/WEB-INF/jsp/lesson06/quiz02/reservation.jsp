<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약하기</title>
		<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
		<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"	crossorigin="anonymous"></script>
		<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
		<link rel="stylesheet" type="text/css" href="/css/lesson06/booking.css">
		
		<%-- datepicker --%>
		<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	    <link rel="stylesheet" type="text/css" href="/css/lesson06/booking.css">
</head>
<body>
	<div id="wrap" class="container">
		<jsp:include page="bookingHeader.jsp" />
		<section class="content pt-3">
			<h2 class="text-center font-weight-bold m-4">예약 하기</h2>
			
			<div class="d-flex justify-content-center">
				<div class="reservation-box">
					<div class="my-2 font-weight-bold">이름</div>
					<input type="text" id="name" name="name" class="form-control">
					
					<div class="my-2 font-weight-bold">예약날짜</div>
					<input type="text" id="date" class="form-control datepicker">
					
					<div class="my-2 font-weight-bold">숙박일수</div>
					<input type="text" id="day" class="form-control">
					
					<div class="my-2 font-weight-bold">숙박인원</div>
					<input type="text" id="headcount" class="form-control">
					
					<div class="my-2 font-weight-bold">전화번호</div>
					<input type="text" id="phoneNumber" class="form-control">
					
					<input type="button" id="reservationBtn" value="예약하기" class="mt-3 mb-3 btn btn-warning w-100">
				</div>
			</div>
		</section>
		<footer>
			<jsp:include page="bookingFooter.jsp" />
		</footer>
	</div>
	<script>
		$(document).ready(function(){
			$('#date').datepicker({
				dateFormat:"yy-mm-dd"
				, minDate:0 // 오늘부터 그 뒤 선택
			}); // datepicker 끝
			
			$('#reservationBtn').on("click",function(){
				
				// validation
				let name = $('input[name=name]').val().trim();
				if(name == ''){
					alert("이름을 입력하세요.");
					return;
				}
				
				let date = $('#date').val().trim();
				if(date == ''){
					alert("예약날짜를 입력하세요.");
					return;
				}
				
				let day = $('#day').val().trim();
				if(day == ''){
					alert("숙박일수를 입력하세요");
					return;
				}
				if(isNaN(day)){
					alert("숫자로 입력하세요.");
					return;
				}
				
				let headcount = $('#headcount').val().trim();
				if(headcount == ''){
					alert("숙박인원을 입력하세요");
					return;
				}
				if(isNaN(headcount)){
					alert("숫자로 입력하세요.");
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
				
				// ajax 통신
				$.ajax({
					// request
					type:"POST"
					,url:"/booking/reservation"
					,data:{"name":name, "date":date, "day":day, "headcount":headcount, "phoneNumber":phoneNumber}
					// response
					, success:function(data){
						if(data.result == "예약 성공"){
							alert(data.result)
							location.href = "/booking/reservationList_view";
						}
					}
					, error:function(e){
						alert("예약하는데 실패했습니다." + e);
					}
				}); //->예약하기 ajax통신끝
			}); //-> 예약하기 버튼누를때 끝
		}); //->document 끝
	</script>
</body>
</html>