<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>

<link rel="stylesheet" href="/css/movie/list.css" />
<link rel="stylesheet"
	href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
	integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
	crossorigin="anonymous" />

<style>
.m_set_red {
	color: red;
}

.m_set_white {
	color: white;
}

.m_set_pointer {
	cursor: pointer;
}
</style>

<div class="wrap">


	<h2>전체 영화</h2>
	<!-- 검색기능 시작 -->
	<form class="form-inline d-flex justify-content-end" method="GET">

		<div class="col-auto">

			<input type="text" class="form-control" id="searchText"
				name="searchText">
		</div>
		<div class="col-auto">
			<button type="submit" class="btn btn-light">검색</button>
		</div>
	</form>
	<!-- 검색기능 끝 -->


	<div class="container">
	
		<c:forEach var="movie" items="${movieEntity}">
			<!-- 영화카드 시작 -->
			<div class="card" style="width: 230px;">
				<img class="card-img-top"
					src= "${movie.img}"
					alt="영화 이미지" style="width: 100%">
				<div class="card-body">
					<div class="tit_area">
						<p class="${movie.movieAge}"></p>
						<!-- 등급별로 바껴야함 -->
						<h4 class="card-title">${movie.movieTitle}</h4>
					</div>
					<p class="card-text">개봉일 ${movie.movieOpenDate}</p>
					<div class="card_bottom">
						<div class="like_box">
							<i id="heart1" class="far fa-heart m_set_pointer"
								onclick="like1()"></i> ${movie.movieLike}
						</div>
						<a href="/movie/detail/${movie.id}" class="btn btn-primary">상세보기</a>
					</div>
				</div>
			</div>
			<br>
			<!-- 영화 카드 끝 -->
		</c:forEach>

	</div>
</div>

<script>
	async
	function like1() {
		// jquery 문법 ajax 사용해도 된다.
		// fetch 문법

		let response = await
		fetch("http://localhost:8080/test/movie/list", {
			method : "post"
		});

		let parseResponse = await
		response.json(); // json(), text() 받음

		// alert(parseResponse)
		console.log(parseResponse);

		if (parseResponse.code == 1) {
			$("#heart1").addClass("m_set_red");
			$("#heart1").toggleClass("fas");
		}
	}
	async
	function like2() {
		// jquery 문법 ajax 사용해도 된다.
		// fetch 문법

		let response = await
		fetch("http://localhost:8080/test/movie/list", {
			method : "post"
		});

		let parseResponse = await
		response.json(); // json(), text() 받음

		// alert(parseResponse)
		console.log(parseResponse);

		if (parseResponse.code == 1) {
			$("#heart2").addClass("m_set_red");
			$("#heart2").toggleClass("fas");
		}
	}
	async
	function like3() {
		// jquery 문법 ajax 사용해도 된다.
		// fetch 문법

		let response = await
		fetch("http://localhost:8080/test/movie/list", {
			method : "post"
		});

		let parseResponse = await
		response.json(); // json(), text() 받음

		// alert(parseResponse)
		console.log(parseResponse);

		if (parseResponse.code == 1) {
			$("#heart3").addClass("m_set_red");
			$("#heart3").toggleClass("fas");
		}
	}
	async
	function like4() {
		// jquery 문법 ajax 사용해도 된다.
		// fetch 문법

		let response = await
		fetch("http://localhost:8080/test/movie/list", {
			method : "post"
		});

		let parseResponse = await
		response.json(); // json(), text() 받음

		// alert(parseResponse)
		console.log(parseResponse);

		if (parseResponse.code == 1) {
			$("#heart4").addClass("m_set_red");
			$("#heart4").toggleClass("fas");
		}
	}
	async
	function like5() {
		// jquery 문법 ajax 사용해도 된다.
		// fetch 문법

		let response = await
		fetch("http://localhost:8080/test/movie/list", {
			method : "post"
		});

		let parseResponse = await
		response.json(); // json(), text() 받음

		// alert(parseResponse)
		console.log(parseResponse);

		if (parseResponse.code == 1) {
			$("#heart5").addClass("m_set_red");
			$("#heart5").toggleClass("fas");
		}
	}
</script>
<%@ include file="../layout/footer.jsp"%>