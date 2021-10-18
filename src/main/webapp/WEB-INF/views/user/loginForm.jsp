<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../layout/header.jsp" %>
	<!-- 상진 -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"></script>
<style>

.rap{
   margin: 0 auto;
   width:960px;
}

div.container_SJ {
<!-- 회원정보 입력 중앙 위치 -->
	margin-top: auto ;
	align-items: center;
	justify-content:center;
	display:flex;
	min-height: 100vh;
	

	 }

	 
	 
	 body {
 	
	background-image: url("https://t1.daumcdn.net/cfile/blog/160336384EADE80D2E");
  background-repeat: no-repeat;
  background-size: cover;
  
  
  
}
.card{
   
   border-radius: 20px;
   border-style:none;'
}

</style>
  <div class="rap">
		<div class="container_SJ">
	     	<div class="card">
		     	<div class="card">
					<form action="/join"  method="post">
	   <div class="card-body">
	     	<input type="text" name="username" class="form-control" placeholder="아이디"  maxlength="20">
	   </div>
	  
	   <div class="card-body">
	    	<input type="password" name="password" class="form-control" placeholder="비밀번호"  maxlength="20">
	   </div>
	   
	   
  		<button type="submit" class="btn btn-outline-info" style="margin-left: 10px">로그인</button>
  		
		<button type="button" class="btn btn-outline-secondary" onclick="location.href = 'test/user/joinForm' ">회원가입</button>
  

	<div class="card-body">
		<button type="button" class="btn btn-outline-danger" onclick="location.href = '/loginForm' ">관리자 로그인</button>
		<button type="button" class="btn btn-outline-info" onclick="location.href = '/test/layout/main' ">메인페이지</button>
	</div>
	</form>
			  </div>
		  </div>
	  </div>
  </div>

	
<%@ include file="../layout/footer.jsp" %>