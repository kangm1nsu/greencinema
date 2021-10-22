<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GREENCINEMA ADMIN</title>
</head>
<style>
a {
	text-decoration: none;
	color: black;
}

* {
	margin: 0;
	padding: 0;
}

* {
	box-sizing: border-box;
}

.manage {
	display: flex;
	width: 400px;
	justify-content: space-between;
}

.header {
	display: flex;
	width: 960px;
}

.header a{
	margin: 5px;
}

.header_hr {
	border: 2px solid #666;

}
</style>
<body>
	<header>
		<div class="manage">
			<a href="#">영화 관리</a> <a href="#">예매 관리</a> <a href="#">로그아웃</a>
		</div>
	</header>
	<hr class="header_hr" />