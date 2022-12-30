<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quiz01</title>
</head>
<body>
	<h1>1. JSTL core 변수</h1>
	<c:set var="num1">36</c:set>
	첫번째 숫자 : ${num1}<br>
	<c:set var="num2" value="3"></c:set>
	두번째 숫자 : ${num2}<br>
	
	<h1>2. JSTL core 연산</h1>
	더하기 : ${num1 + num2}<br>
	빼기 : ${num1 - num2}<br>
	곱하기 : ${num1 * num2}<br>
	나누기 : ${num1 / num2}<br>
	
	<h1>3. JSTL core out</h1>
	<c:out value="<title>core out</title>" escapeXml="true"></c:out>
	
	<h1>4. JSTL core if</h1>
	<c:if test="${(num1+num2)/2 >= 10}">
		<h1>${(num1+num2)/2}</h1>
	</c:if>
	
	<c:if test="${(num1+num2)/2 < 10}">
		<h3>${(num1+num2)/2}</h3>
	</c:if>
	
	<c:if test="${num1 * num2 > 100}">
		<c:out value="<script>alert('너무 큰 수입니다.');</script>" escapeXml="false"/>
	</c:if>
	
</body>
</html>