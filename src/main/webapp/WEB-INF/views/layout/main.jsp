<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp" %>

<style>
img {
  display: block;
  margin-left: auto;
  margin-right: auto;
  width: auto;
  
}
iframe {
display: block;
  height: 100vh;
  width: 100%;
  margin-left: auto;
  margin-right: auto;
  
}
body {
 

  background-repeat: no-repeat;
  background-position: right top;
  
  background-attachment: scroll;
}
</style>

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
<iframe src="https://www.youtube.com/embed/kCzbDJ2G_B8" ></iframe>

<%@ include file="../layout/footer.jsp" %>


    