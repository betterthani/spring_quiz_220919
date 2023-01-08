<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 목록 리스트</title>
		<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
		<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"	crossorigin="anonymous"></script>
		<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
		<link rel="stylesheet" type="text/css" href="/css/lesson06/booking.css">
</head>
<body>
	<div id="wrap" class="container">
		<jsp:include page="bookingHeader.jsp" />
		<section class="content pt-3">
		
			<h2 class="text-center font-weight-bold m-4">예약 목록 보기</h2>
			<table class="table text-center">
				<thead>
					<tr>
						<th>이름</th>
						<th>예약날짜</th>
						<th>숙박일수</th>
						<th>숙박인원</th>
						<th>전화번호</th>
						<th>예약상태</th>
						<th></th>
					</tr>
				</thead>
				
				<tbody>
				<c:forEach var="booking" items="${bookingList}">
					<tr>
						<td>${booking.name}</td>
						<td>
						<fmt:formatDate value="${booking.date}" pattern="yyyy년 M월 d일"/>
						
						</td>
						<td>${booking.day}</td>
						<td>${booking.headcount}</td>
						<td>${booking.phoneNumber}</td>
						<td>${booking.state}</td>
						<td>
							<button type="button" class="del-btn btn btn-danger" data-booking-id = "${booking.id}">삭제</button>
						</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</section>
		<footer>
			<jsp:include page="bookingFooter.jsp" />
		</footer>
	</div>
	
	<script>
		<%--delete문 --%>
		$(document).ready(function(){
			$('.del-btn').on("click", function(){
				// alert("1111");
				
				//validation
				let id = $(this).data("booking-id");
				// alert(id);
				
				//ajax 통신
				$.ajax({
				// request
				type:"delete"
				, url:"/booking/delete_booking"
				, data :{"id":id}
				
				//response
				,success:function(data){
					if(data.code == 1){
						document.location.reload();
					} else if (data.code == 500){
						alert(data.error_message);
					}
				}
				,error:function(e){
					alert("에러" + e);
				}
					
				});//-> 삭제버튼 에이젝스통신 끝
				
			}); //-> 삭제버튼 클릭시 끝
		}); //-> document 끝
	</script>
</body>
</html>