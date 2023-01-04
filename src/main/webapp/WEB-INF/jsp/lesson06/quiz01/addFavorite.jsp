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
			<input type="text" id="url" class="form-control">
		</div>
		
		<input type="button" class="btn btn-success w-100" value="추가" id="join">
	</div>
	
	<script type="text/javascript">
		$(document).ready(function(){
			$('#join').on('click', function(){
				
				// validation
				let name = $('#name').val().trim();
				if (name.length == ''){
					alert("이름을 입력하세요");
					return;
				}
				
				let url = $('#url').val().trim();
				if(url.length == ''){
					alert("url입력하세요.");
					return;
				}
				
				if(!url.startsWith("http") || !url.startsWith("https")){
					alert("http 또는 https 프로토콜까지 모두 입력하세요");
					return;
				}
				
				$.ajax({
					
					// request
					type:"POST"
					, url :"/lesson06/quiz01/favorite"
					, data :{"name":name, "url":url} // 필드의 메소드를 불러온다.
				
					// response
					, success:function(data){
						console.log(data);
						// 화면 이동
						location.href ="/lesson06/quiz01/after_favorite_view";
					}
					, error:function(e){
						alert("에러");
					}
					
				}); //->ajax끝
				
			}); //->join click끝
		}); //-> document 끝
	</script>
</body>
</html>