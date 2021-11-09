<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp"%>
<link rel="stylesheet" href="/css/user/loginForm.css" />


<div class="login-dark">
	<form action="login" method="post">
		<h2 class="sr-only">로그인</h2>
		<div class="illustration">
			<i class="icon ion-ios-locked-outline"></i>
		</div>
		<div class="form-group">
			<input class="form-control" type="text" name="username"
				placeholder="ID" required="required">
		</div>
		<div class="form-group">
			<input class="form-control" type="password" name="password"
				placeholder="Password" required="required">
		</div>
		<div class="form-group">
			<button class="btn btn-primary btn-block" type="submit">Log
				In</button>
		</div>
		<br>
		<a href="/joinForm" class="forgot">아직 회원이 아니신가요?</a>
	</form>
</div>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/js/bootstrap.bundle.min.js"></script>

<%@ include file="../layout/footer.jsp"%>