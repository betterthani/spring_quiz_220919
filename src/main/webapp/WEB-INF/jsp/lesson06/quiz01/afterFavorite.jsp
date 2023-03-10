<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결과 페이지</title>
		<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
		<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"	crossorigin="anonymous"></script>
		<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</head>
<body>
	<div id="wrap" class="container">
		<h1>즐겨 찾기 목록</h1>
		<table class="table text-center">
			<thead>
				<tr>
					<th>No.</th>
					<th>이름</th>
					<th>주소</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
			<c:forEach var="favorite" items="${favoriteList}">
				<tr>
					<td>${favorite.id}</td>
					<td>${favorite.name}</td>
					<td>${favorite.url}</td>
					<td>
						<%-- 1) name속성 + value속성 삭제 --%>
						<%-- <button type="button" class="btn btn-danger" name="delBtn" value="${favorite.id}">삭제</button> --%>
						
						<%-- 2) data를 이용해서 태그에 임시 저장하기 
								태그 생성 : data-내가 이름 작성하기(대문자 안되고, 소문자와 -만 사용한다)
						--%>
						<button type="button" class="del-btn btn btn-danger" data-favorite-id="${favorite.id}">삭제</button>
						
					</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>
	
	<script type="text/javascript">
		<!-- 삭제 버튼 눌렀을 때(1) -->
		$(document).ready(function(){
				// 1) name속성 + value속성 삭제
			/* $('button[name=delBtn]').on('click', function(e){
				 // alert("111");
				// 방법 1)
				// let id = $(this).val(); // 셀렉터('button[name=delBtn]')에는 여러개가 있는데 this를 하면 클릭한 값을 가져오게됨.
				
				// 방법 2)
				// let id = $(this).attr('value');
				// 방법 3)
				//let id = e.target.value;
				alert(id); 
			
			});*/
			
				// 2) data를 이용해서 태그에 임시 저장하기
				// 태그 : data-favorite-id  dat-뒤에 우리가 이름을 정한다(대문자 절대 안 됨)
				// 스크립트 : $(this).data('favorite-id');
				$('.del-btn').on("click",function(){
					// alert("111");
					let id = $(this).data('favorite-id');
					// alert(id);
					
					$.ajax({
						//request
						type:"delete"
						,url:"/lesson06/quiz02/delete_favorite"
						,data:{"id":id}
						
						//response
						, success:function(data){
							if(data.code == 1){
								// 성공(클라이언트 화면)_새로고침
								//location.href = "localhost:8080/lesson06/quiz01/after_favorite_view" // 일경우 새로고침할때 스크롤위로 올라감(비추)
								document.location.reload(true); // document 또는 window 붙여준다
							} else if(data.code == 500) {
								// 에러
								alert(data.error_message);
							}
						}
						, error:function(e){
							alert("에러" + e);
						}
					});
				});
		});
		
	</script>
</body>
</html>