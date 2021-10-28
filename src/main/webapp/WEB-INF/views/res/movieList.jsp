<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<%@ include file="../layout/header.jsp"%>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="/css/movieList.css" />
<body>
	<div class="reserveContainer">
		<!-- 영화목록 시작 -->
		<div class="moviePart">
			<div class="movieTitle">영화</div>
			<div class="sortWrapper">
				<div class="sortByRating">예매율순</div>
				<div class="sortByKorean">가나다순</div>
			</div>
			<div class="movieListWrapper">
				<div class="movieList">
					<div class="movie">듄</div>
					<div class="movie">모르겠다 에효</div>
					<div class="movie">베놈</div>
				</div>
			</div>
		</div>
		<!-- 영화목록 끝 -->
		<!--  극장목록 시작 -->
		<div class="theaterPart">
			<div class="theaterTitle">극장</div>
			<div class="theaterContainer">
				<div class="theaterWrapper">
					<div class="theaterLocationWrapper">
						<button class="theaterLocation">부산(1)</button>
					</div>
					<div class="theaterPlaceWrapper">
						<button class="theaterPlace">서면</button>
					</div>
				</div>
			</div>
		</div>
		<!-- 극장목록 끝 -->
		<!--  상영날짜 시작-->
		<div class="dayPart">
			<div class="dateTitle">날짜</div>
			<div class="reserveDate">
				<div class="reserveYear"></div>
				<div class="reserveMonth"></div>
			</div>
		</div>
		<!--  상영날짜 끝 -->
		<!--  상영시간 시작 -->
		<div class="timePart">
			<div class="timeTitle">시간</div>
			<div class="reserveTime">
				<div class="reserveWhere">4관(Green) 4층(총 100석)</div>
				<div class="reserveTimeWrapper">
					<button class="reserveTimeBtn">
						<span class="reserveTimeWant">12:20</span>
					</button>
					<span class="reserveTimeRemain">100석</span>
					<button class="reserveTimeBtn">
						<span class="reserveTimeWant">14:40</span>
					</button>
					<span class="reserveTimeRemain">100석</span>
					<button class="reserveTimeBtn">
						<span class="reserveTimeWant">17:00</span>
					</button>
					<span class="reserveTimeRemain">100석</span>
					<!--  상영시간 끝 -->
				</div>
			</div>
			<div class="reserveOk">
				<form action="/res" method="post">
					<button class="reserveBtn" type="submit">
						<span class="right"> → </span> <br> <span class="letter">
							좌석선택 </span>
					</button>
				</form>
			</div>
		</div>

	</div>
</body>
<script>
	let movie = $(".movie");
	let loc = $(".theaterLocation");
	let place = $(".theaterPlace");

	// 영화 제목 클릭 시 작동 함수
	function onclick(e) {
		console.log(e.target);
		if (e.target.classList[1] === "selected") {
			e.target.classList.remove("selected");
		} else {
			for (var i = 0; i < movie.length; i++) {
				movie[i].classList.remove("selected");
			}
			event.target.classList.add("selected");
		}
	}

	// 영화제목 클릭 시 onclick 함수 실행 ( 클래스명 바꿈 )
	function init() {
		for (var i = 0; i < movie.length; i++) {
			movie[i].addEventListener("click", onclick);
		}
	}

	// 극장 지역 선택(loc) 시 함수
	function onclick2(e) {
		console.log(e.target);
		if (e.target.classList[1] === "selectedLocation") {
			e.target.classList.remove("selectedLocation");
		} else {
			for (var i = 0; i < loc.length; i++) {
				loc[i].classList.remove("selectedLocation");
			}
			event.target.classList.add("selectedLocation");
		}
	}

	// 극장 지역 클릭 시 onclick 함수 실행 ( 클래스명 바꿈 )
	function init2() {
		for (var i = 0; i < loc.length; i++) {
			loc[i].addEventListener("click", onclick2);
		}
	}

	// 극장 장소 선택(place) 시 함수
	function onclick3(e) {
		console.log(e.target);
		if (e.target.classList[1] === "selectedPlace") {
			e.target.classList.remove("selectedPlace");
		} else {
			for (var i = 0; i < place.length; i++) {
				place[i].classList.remove("selectedPlace");
			}
			event.target.classList.add("selectedPlace");
		}
	}

	// 극장 장소 클릭 시 onclick 함수 실행 ( 클래스명 바꿈 )
	function init3() {
		for (var i = 0; i < place.length; i++) {
			place[i].addEventListener("click", onclick3);
		}
	}

	init();
	init2();
	init3();
	
</script>

<!--  날짜 -->
<script>
	let date = new Date();
	let lastDay = new Date(date.getFullYear(), date.getMonth() + 0, 31);
	let reserveDate = $(".reserveDate");
	let reserveYear = $(".reserveYear");
	let reserveMonth = $(".reserveMonth");
	
	function insertDate() {
		let weekOfDay = ['일', '월', '화', '수', '목', '금', '토'];
		year = date.getFullYear();
	    month = date.getMonth() + 1; // 이번 달
	    reserveYear.append(year);
	    reserveMonth.append(month);
	    
	    for (i = date.getDate(); i <= lastDay.getDate(); i++) {
	        let button = document.createElement('button');
	        let spanWeekOfDay = document.createElement('span');
	        let spanDay = document.createElement('span');
	        
	        //class넣기
	        button.classList = 'movieDateWrapper';
	        spanWeekOfDay.classList = 'movieWeekOfDay';
	        spanDay.classList = 'movieDay';

	        const dayOfWeek = weekOfDay[new Date(year + '-' + month + '-' + i).getDay()];
			
	        //요일 넣기
	        if (dayOfWeek === '토') {
	            spanWeekOfDay.classList.add('saturday');
	            spanDay.classList.add('saturday');
	        } else if (dayOfWeek === '일') {
	            spanWeekOfDay.classList.add('sunday');
	            spanDay.classList.add('sunday');
	        }
	        spanWeekOfDay.innerHTML = dayOfWeek;
	        button.append(spanWeekOfDay);
	        //날짜 넣기
	        spanDay.innerHTML = i;
	        button.append(spanDay);
	        //button.append(i);

	        reserveDate.append(button);
			
	        
	    	
	        //dayClickEvent(button);
	    }
	    	let dateBtn = $(".movieDateWrapper")
	    	// 극장 장소 선택(place) 시 함수
	    	function onclick4(e) {
	    		console.log(e.target);
	    		if (e.target.classList[1] === "selectedBtn") {
	    			e.target.classList.remove("selectedBtn");
	    		} else {
	    			for (var i = 0; i < dateBtn.length; i++) {
	    				dateBtn[i].classList.remove("selectedBtn");
	    			}
	    			event.target.classList.add("selectedBtn");
	    		}
	    	}
	    	
	    	// 극장 장소 클릭 시 onclick 함수 실행 ( 클래스명 바꿈 )
	    	function init4() {
	    		for (var i = 0; i < dateBtn.length; i++) {
	    			dateBtn[i].addEventListener("click", onclick4);
	    		}
	    	}
	    	
	    	init4();
	}
	
	insertDate();
</script>
<!--  날짜 끝 -->
</html>