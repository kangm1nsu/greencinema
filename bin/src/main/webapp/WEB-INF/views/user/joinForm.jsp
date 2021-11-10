<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp"%>
<link rel="stylesheet" href="/css/user/joinForm.css" />
<div class="resi_form">
	<div class="registration-form">
		<form action="/join"  method="post">
			<b>GreenCinema 회원가입</b>
			<div class="form-group">
				<input type="text" class="form-control item" id="username" name="username"
					placeholder="아이디">
			</div>
			<div class="form-group">
				<input type="password" class="form-control item" id="password" name="password"
					placeholder="비밀번호">
			</div>
			<div class="form-group">
				<input type="text" class="form-control item" id="email" name="email"
					placeholder="이메일">
			</div>
			<div class="form-group">
				<input type="text" class="form-control item" id="tel" name="tel"
					placeholder="연락처">
			</div>
			<div class="form-group">
				<input type="date" class="form-control item" id="birthDate" name="birthDate"
					placeholder="생년월일">
			</div>
			<div class="form-group">
				<button type="submit" class="btn btn-block create-account">가입하기</button>
			</div>
		</form>

	</div>
</div>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.15/jquery.mask.min.js"></script>
<script src="assets/js/script.js"></script>

<%@ include file="../layout/footer.jsp"%>