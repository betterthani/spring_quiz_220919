<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>즐겨찾기 추가하기</title>
		<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
		<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"	crossorigin="anonymous"></script>
		<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</head>
<body>
	<div id="wrap" class="container">
		<h1>즐겨 찾기 추가하기</h1>
		<div>
			<label for="name">제목</label>
			<input type="text" id="name" class="form-control">
		</div>
		
		<div class="mt-2 mb-3">
			<label for="url">주소</label>
			<div class="form-inline">
				<input type="text" id="url" class="form-control col-10 mr-3">
				<button type="button" class="btn btn-info" id="urlCheckBtn">중복확인</button>
			</div>
			<small id="duplicationText" class="text-danger d-none">중복된 url입니다.</small>
			<small id="avaliableText" class="text-success d-none">저장 가능한 url입니다.</small>
		</div>
		
		<input type="button" class="btn btn-success w-100" value="추가" id="join">
	</div>
	
	<script type="text/javascript">
		$(document).ready(function(){
			$('#join').on('click', function(){
				
				// validation
				let name = $('#name').val().trim();
				if (name == ''){
					alert("이름을 입력하세요");
					return;
				}
				
				let url = $('#url').val().trim();
				if(url == ''){
					alert("url입력하세요.");
					return;
				}
				
				// http로 시작하지도 않고, https로도 시작하지 않으면 alert
				if(url.startsWith("http") == false && url.startsWith("https") == false){
					alert("http 또는 https 프로토콜까지 모두 입력하세요");
					return;
				}
				
				alert("서버에 전송");
				
				// AJAX 통신
				$.ajax({
					
					// request
					type:"POST"
					, url :"/lesson06/quiz01/favorite" // postmapping과 동일 responsebody가 붙은 데이터 담긴 링크(form태그 action)
					, data :{"name":name, "url":url} // 필드명이 리퀘스트명과 일치할 때 객체 속에 담긴다.
				
					// response (call back함수)
					, success:function(data){ // 여기서 data는 변수명으로 바로 위의 data와는 상관없다. / String json => object
						alert(data);
						// 화면 이동
						if(data.result == "성공"){ // data.key값
							location.href ="/lesson06/quiz01/after_favorite_view";
						}
					}
					, error:function(e){
						alert("에러" + e);
					}
					
				}); //->ajax끝
				
			}); //->join click끝
			
			// 중복확인
			$('#urlCheckBtn').on('click', function(){
				// alert("1111");
				 $('#urlStatusArea').empty();
				
				// validation
				let url = $('#url').val().trim();
				if(url == ''){
				alert("url입력하세요.");
				return;
				}
				
				// http로 시작하지도 않고, https로도 시작하지 않으면 alert
				if(url.startsWith("http") == false && url.startsWith("https") == false){
					alert("http 또는 https 프로토콜까지 모두 입력하세요");
					return;
				}
				
				// url 중복 확인 -> ajax통신 (db확인)
				$.ajax({
					// request
					type : "POST" // get방식은 길이가 긴경우 안 될 수 있음.
					, url : "/lesson06/quiz02/is_duplication_url"
					, data : {"url":url}
				
					// response
					, success:function(data){
						// 중복 확인
						if(data.is_duplication){
							// 중복
							$('#avaliableText').addClass("d-none");
							$('#duplicationText').removeClass("d-none");
						} else {
							// 사용 가능한 url
							$('#duplicationText').addClass("d-none");
							$('#avaliableText').removeClass("d-none");
						}
					}
					, error:function(e){ // 에이젝스 자체가 실패했을때
						alert("에러" + e);
					}
					
				}); //->ajax 통신  끝
				
				
			}); // -> url 중복확인 버튼끝 
		}); //-> document 끝
	</script>
</body>
</html>