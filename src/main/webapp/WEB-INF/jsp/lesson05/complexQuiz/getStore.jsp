<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가게리스트</title>
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
			<h1 class="mt-2">우리동네 가게</h1>
			
			<c:forEach items="${StoreList}" var="store">
				<div class="box">
					<h5 class="ml-2 mt-1 font-weight-bold"><a href="/lesson05/reviewView?storeId=${store.id}&name=${store.name}">${store.name}</a></h5>
					<div class="ml-2">전화 번호: ${store.phoneNumber}</div>
					<div class="ml-2">주소 : ${store.address}</div>
				</div><br>
			</c:forEach>
		</section>
		<footer>
			<jsp:include page="storeFooter.jsp" />
		</footer>
	</div>
</body>
</html>