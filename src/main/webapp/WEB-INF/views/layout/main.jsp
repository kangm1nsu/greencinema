<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

  <%@ include file="../layout/header.jsp" %>
    <!-- 상진 -->

    <style>
      .main {
        margin: 0 auto;
        width: 960px;



        align-items: center;
        justify-content: center;
        display: flex;


      }




      .card {

        border-radius: 20px;
        border-style: none;
        width: 500px;
        height: 500px;
        justify-content: center;
        align-items: center;
        margin: 100px auto;

      }



      .video {

        margin: 0 auto;
        width: 960px;
        height: 388px;

      }

      .wrap2 {
        background-color: black;
      }
    </style>


    <div class="wrap2">
      <div class="wrap">


        <div class="main">




          <!-- Carousel -->
          <div id="demo" class="carousel slide" data-bs-ride="carousel" ">
              
              <!-- Indicators/dots -->
              <div class=" carousel-indicators">
            <button type="button" data-bs-target="#demo" data-bs-slide-to="0" class="active"></button>
            <button type="button" data-bs-target="#demo" data-bs-slide-to="1"></button>
            <button type="button" data-bs-target="#demo" data-bs-slide-to="2"></button>
            <button type="button" data-bs-target="#demo" data-bs-slide-to="3"></button>
            <button type="button" data-bs-target="#demo" data-bs-slide-to="4"></button>
          </div>

          <div class="carousel-inner">
            <!-- The slideshow/carousel -->

            <div class="carousel-item active">
              <img src="/img/화이트데이.jpg" alt="화이트데이" class="d-block">
            </div>

            <div class="carousel-item">
              <img src="/img/듄.jpg" alt="0듄" class="d-block">
            </div>

            <div class="carousel-item">
              <img src="/img/라스트듀얼.jpg" alt="라스트듀얼" class="d-block">

            </div>

            <div class="carousel-item">
              <img src="/img/킬링카인드.jpg" alt="킬링카인드" class="d-block">
            </div>

            <div class="carousel-item">
              <img src="/img/이터널스.jpg" alt="이터널스" class="d-block">
            </div>
          </div>

          <!-- Left and right controls/icons -->
          <button class="carousel-control-prev" type="button" data-bs-target="#demo" data-bs-slide="prev">
            <span class="carousel-control-prev-icon"></span>
          </button>
          <button class="carousel-control-next" type="button" data-bs-target="#demo" data-bs-slide="next">
            <span class="carousel-control-next-icon"></span>
          </button>


        </div>
      </div>




    </div>
    </div>
    </div>





    <%@ include file="../layout/footer.jsp" %>