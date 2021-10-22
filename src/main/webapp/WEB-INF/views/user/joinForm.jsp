<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp"%>
<style>
.resi_form{
 background-color: #eceaeb;
}

.registration-form {
	padding: 50px 0;
	
}

.registration-form form {
	background-color: #fff;
	max-width: 600px;
	margin: auto;
	padding: 50px 70px;
	border-top-left-radius: 30px;
	border-top-right-radius: 30px;
	box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.075);
}

.registration-form .form-icon {
	text-align: center;
	background-color: #5891ff;
	border-radius: 50%;
	font-size: 40px;
	color: white;
	width: 100px;
	height: 100px;
	margin: auto;
	margin-bottom: 50px;
	line-height: 100px;
}

.registration-form .item {
	border-radius: 20px;
	margin-bottom: 25px;
	padding: 10px 20px;
}

.registration-form .create-account {
	border-radius: 30px;
	padding: 10px 20px;
	font-size: 18px;
	font-weight: bold;
	background-color: black;
	border: none;
	color: white;
	margin-top: 20px;
	text-align: right;
}

.registration-form .social-media {
	max-width: 600px;
	background-color: #fff;
	margin: auto;
	padding: 35px 0;
	text-align: center;
	border-bottom-left-radius: 30px;
	border-bottom-right-radius: 30px;
	color: #9fadca;
	border-top: 1px solid #dee9ff;
	box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.075);
}

.registration-form .social-icons {
	margin-top: 30px;
	margin-bottom: 16px;
}

.registration-form .social-icons a {
	font-size: 23px;
	margin: 0 3px;
	color: #5691ff;
	border: 1px solid;
	border-radius: 50%;
	width: 45px;
	display: inline-block;
	height: 45px;
	text-align: center;
	background-color: #fff;
	line-height: 45px;
}

.registration-form .social-icons a:hover {
	text-decoration: none;
	opacity: 0.6;
}

@media ( max-width : 576px) {
	.registration-form form {
		padding: 50px 20px;
	}
	.registration-form .form-icon {
		width: 70px;
		height: 70px;
		font-size: 30px;
		line-height: 70px;
	}
}

</style>
<div class="resi_form">
	<div class="registration-form">
		<form>
			
			<div class="form-group">
				<input type="text" class="form-control item" id="username"
					placeholder="아이디">
			</div>
			<div class="form-group">
				<input type="password" class="form-control item" id="password"
					placeholder="비밀번호">
			</div>
			<div class="form-group">
				<input type="text" class="form-control item" id="email"
					placeholder="이메일">
			</div>
			<div class="form-group">
				<input type="text" class="form-control item" id="phone-number"
					placeholder="연락처">
			</div>
			<div class="form-group">
				<input type="text" class="form-control item" id="birth-date"
					placeholder="생년월일">
			</div>
			<div class="form-group">
				<button type="button" class="btn btn-block create-account">회원가입</button>
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