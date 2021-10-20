<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>영화관리</title>
<!-- 영화괸리파트 -->
<style>

body{
	display:"flex";

}

.wrap-title{
	margin:0 auto;
	padding:30px;
	width:960px;
	text-align:center;
	word-spacing:50px;
}
.wrap-header{
	float:center;
	padding:30px;

}

.wrap-tab{
	margin: 20px;
	padding: 50px;
	word-spacing:20px;
}

.wrap-delete{	
	line-height: 10px;
	float:right;
	padding :30px;
	word-spacing: 10px;
	
}

</style>
<meta charset="UTF-8">
<title>영화관리페이지</title>
</head>
<body>
	<div class="wrap"></div>
	<div class="wrap-title">
		<a href ="#">영화관리</a> <a href ="#">예매관리</a> <a href ="#">로그아웃</a>
		<hr class="one">
		<div class="wrap-header">
			<h1>영화관리</h1>
			<div class="wrap-tab">
				<a>번호</a> <a>영화제목</a> <a>감독</a> <a>배우</a> <a>장르</a> <a>러닝타임</a> <a>개봉일</a> <a>등급</a>
			</div>
			<div class ="wrap-delete">
			<a>수정</a>
			<a>삭제</a>
		
			</div>
		</div>
	</div>
</body>
</html>