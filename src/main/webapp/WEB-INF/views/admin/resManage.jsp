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
	padding :5px;
	word-spacing: 20px;
	
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
			<h1>예메관리</h1>
			<div class="wrap-tab">
				<a>번호</a> <a>예매코드</a> <a>예매자</a> <a>예매영화</a> <a>예매시간</a> <a>예매좌석</a> <a>결재가격</a> <a>결재일</a>
			</div>
			<div class ="wrap-delete">
			<a>삭제</a>
		
			</div>
		</div>
	</div>
</body>
</html>