<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰페이지</title>
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"
		integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
		crossorigin="anonymous"></script>
		<link rel="stylesheet"
			href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
			integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
			crossorigin="anonymous">
		<script
			src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
			integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
			crossorigin="anonymous"></script>
		<script
			src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
			integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
			crossorigin="anonymous"></script>
		<link rel="stylesheet" type="text/css" href="/css/lesson05/baedal.css">
</head>
<body>
	<div id="wrap" class="container">
		<header class="bg-info d-flex align-items-center">
			<jsp:include page="storeHeader.jsp" />
		</header>
		
		<section class="content ml-1">
			<h1 class="mt-2">${name}-리뷰</h1>
			
			<c:if test="${empty newReviewList}">
				<h1 class="font-weight-bold text-center pt-5">작성된 리뷰가 없습니다.</h1>
			</c:if>
			
			<c:if test="${not empty newReviewList}">
				<c:forEach var="review" items="${newReviewList}">
					<div class="box">
					
						<div class="ml-2 mt-1 d-flex align-items-center">
							<small class="pt-2 font-weight-bold">${review.userName}</small>
							
							<div class="pl-2">
							<c:set var="point" value="${review.point}" />
								<c:forEach begin="1" end="5">
									<c:choose>
										<c:when test="${point > 0.5}">
											<img src="/img/lesson05/star_fill.png" width="20" alt="star">
											<c:set var="point" value="${point - 1}" />
										</c:when>
										<c:when test="${point == 0.5}">
											<img src="/img/lesson05/star_half.png" width="20" alt="halfstar">
											<c:set var="point" value="${point - 0.5}" />
										</c:when>
										<c:when test="${point == 0}">
											<img src="/img/lesson05/star_empty.png" width="20" alt="emptystar">
										</c:when>
									</c:choose>
								</c:forEach>
							
							
							</div>
						</div>
						
						<small class="text-secondary d-block my-2 ml-2">
						<fmt:formatDate value="${review.createdAt}" pattern="yyyy년 M월 d일"/> 
						</small>
						<small class="menu-box rounded p-1 ml-2">${review.menu}</small>
					</div><br>
				 </c:forEach>
			 </c:if>
		</section>
		<footer>
			<jsp:include page="storeFooter.jsp" />
		</footer>
	</div>

</body>
</html>