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
   opacity:0.8;
}

</style>
  <div class="rap">
		<div class="container_SJ">
	     	<div class="card">
		     	<div class="card">
					<form action="/join"  method="post">
	   <div class="card-body">
	     	<input type="text" name="username" class="form-control" placeholder="아이디"  maxlength="20"
	     	   value=${"김상진"}>
	   </div>
	  
	   <div class="card-body">
	    	<input type="password" name="password" class="form-control" placeholder="비밀번호"  maxlength="20"
	    	value=${"1234"}>
	   </div>
	   
	   <div class="card-body">
	    	<input type="email" name="email" class="form-control" placeholder="이메일"  
	    	value=${"상진@.com"}>
	   </div>
	   
	  <div class="card-body">
	    <input type="text" name="tel" class="form-control" placeholder="전화번호"  maxlength="13"
	    value=${"010-1234-5678"}>
	  </div>
	  
	  	 <div class="card-body">
	    	<input type="date" name="date" class="form-control"  
	    	value=${"2099-12-31"}>
	  	</div>
	<div class="card-body">
  		<button type="submit" class="btn btn-outline-secondary" style="margin:auto">수정</button>
		<button type="button" class="btn btn-outline-info" onclick="location.href = '/test/layout/main' ">메인페이지</button>
	</div>
  

		
		
	</form>
			  </div>
		  </div>
	  </div>
  </div>

	
<%@ include file="../layout/footer.jsp" %>