<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GreenCinema</title>
<link href="/img/logo_black.ico" rel="shortcut icon" type="image/x-icon">
</head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"></script>

<link rel="stylesheet" href="/css/layout/header.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<body>
	<div id="header_section" class="header">
		<div class="gnb">
			<div>
				<a href="#">Facebook</a>
			</div>

			<h1 class="logo">
				<a href="/test/layout/main"> <img alt="logo"
					src="/img/logo_black.png"> GREEN CINEMA
				</a>
			</h1>
			<div class="sign">
				<c:choose>
					<c:when test="${empty sessionScope.principal}">
						<a href="/loginForm" class="beforeLogin">로그인</a>
						<a href="/joinForm" class="beforeLogin">회원가입</a>
					</c:when>
					<c:otherwise>
						<a href="#" class="afterLogin">예매 내역</a>
						<a href="#" class="afterLogin">내 정보</a>
						<a href="/logout" class="afterLogin">로그아웃</a>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		<div id="nav" class="nav_bar">

			<div>
				<a href="/test/res/reserve">예매</a>
			</div>
			<div>ㅣ</div>
			<div>
				<a href="/test/movie/list">영화</a>
			</div>
			<div>ㅣ</div>
			<div>
				<a href="/test/store/list">스토어</a>
			</div>
		</div>
	</div>