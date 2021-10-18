<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"></script>
<style>
img {
  display: block;
  margin-left: auto;
  margin-right: auto;
  width: auto;
  
}
	<!-- iframe 비율 조정 -->
.video {
	position: relative;
	width: 100%;
	padding-bottom: 56.25%;
	
}

body {
 
	background-image: url("https://t1.daumcdn.net/cfile/blog/160336384EADE80D2E");
  background-repeat: no-repeat;
  background-size: cover;
  
  
  
}
</style>
<button type="button" class="btn btn-outline-info" onclick="location.href = '/test/user/joinForm' ">회원가입</button>
<button type="button" class="btn btn-outline-info" onclick="location.href = '/test/user/updateForm' ">내 정보</button>
<!-- Carousel -->
<div id="demo" class="carousel slide" data-bs-ride="carousel">

  <!-- Indicators/dots -->
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#demo" data-bs-slide-to="0" class="active"></button>
    <button type="button" data-bs-target="#demo" data-bs-slide-to="1"></button>
    <button type="button" data-bs-target="#demo" data-bs-slide-to="2"></button>
    <button type="button" data-bs-target="#demo" data-bs-slide-to="3"></button>
  </div>
  
  <!-- The slideshow/carousel -->
  <div class="carousel-inner">
   
    <div class="carousel-item active">
      <img src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000084/84690/84690_320.jpg" alt="베놈2 렛데이비 카니비" class="d-block"  
      >
    </div>
    
    <div class="carousel-item">
      <img src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000083/83003/83003_320.jpg" alt="007 노타임 투 다이" class="d-block">
    </div>
   
    <div class="carousel-item">
      <img src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000084/84872/84872_320.jpg" alt="보이스" class="d-block">
    
    </div>
    <div class="carousel-item">
      <img src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000085/85001/85001_320.jpg" alt="보이스" class="d-block">
    </div>
  </div>
  
  <!-- Left and right controls/icons -->
  <button class="carousel-control-prev" type="button" data-bs-target="#demo" data-bs-slide="prev">
    <span class="carousel-control-prev-icon"></span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#demo" data-bs-slide="next">
    <span class="carousel-control-next-icon" ></span>
  </button>
</br>
</div>
<div>
</div>



<!-- <div class="video">
<p align="middle">
<iframe width="600"  height="400"  src="https://www.youtube.com/embed/kCzbDJ2G_B8" ></iframe>
</p>
</div> -->


<%@ include file="../layout/footer.jsp" %>


    