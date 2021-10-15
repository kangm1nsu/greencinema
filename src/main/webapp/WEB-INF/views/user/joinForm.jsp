<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../layout/header.jsp" %>
	<!-- 상진 -->
<style>
.container{
	margin: auto;
	border-radius:auto;
	background: black;
	padding: auto;
	width: auto;
	height: auto;
	position: center;
	
	
}
.form-group{
	
}
</style>
	<div class="container">
	<form action="/join"  method="post">
	  <div class="form-group">
	    <input type="text" name="username" class="form-control" placeholder="Enter Username"  maxlength="20">
	  </div>
	  <div class="form-group">
	    <input type="password" name="password" class="form-control" placeholder="Enter Password"  maxlength="20">
	  </div>
	  <div class="form-group">
	    <input type="email" name="email" class="form-control" placeholder="Enter Email"  >
	  </div>
	  <div class="form-group">
	    <input type="text" name="tel" class="form-control" placeholder="Enter Tel"  maxlength="13">
	  </div>
	  <div class="form-group">
	    <input type="date" name="date" class="form-control"  >
	  </div>
  <button type="submit" class="btn btn-outline-secondary">회원가입</button>

	<button type="button" class="btn btn-outline-danger" onclick="location.href = '/loginForm' ">관리자 로그인</button>
	<button type="button" class="btn btn-outline-info" onclick="location.href = 'test/user/joinForm' ">메인페이지</button>
	<button type="button" class="btn btn-outline-info" onclick="location.href = '/loginForm' ">로그인</button>
	</form>
</div>

	
<%@ include file="../layout/footer.jsp" %>