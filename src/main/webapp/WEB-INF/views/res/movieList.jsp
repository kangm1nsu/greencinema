<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<%@ include file="../layout/header.jsp"%>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="/css/res/movieList.css" />
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
					<c:forEach var="movie"  items="${movieEntity}">
					<form onsubmit="update1(event, ${movie.id})">
						<button type="submit" class="movie">${movie.movieTitle}</button>
					</form>
					</c:forEach>
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
					<c:choose>
						<c:when test="${empty regionEntity}">
						<button class="theaterLocation">예매할 영화를 선택하세요</button>
						</c:when>
						<c:otherwise>
							<c:forEach var="regionEntity"  items="${regionEntity}" >
							<form onsubmit="update2(event, ${regionEntity.id})">
								<button type="submit" class="theaterLocation">${regionEntity.id}</button>
							</form>
							</c:forEach>				
						</c:otherwise>
					</c:choose>
					</div>
					<div class="theaterPlaceWrapper">
					<c:choose>
						<c:when test="${empty rNameEntity}">
						</c:when>
						<c:otherwise>
						<c:forEach var="location"  items="${locationEntity}">
						<button class="theaterPlace">${location}</button>
						</c:forEach>				
						</c:otherwise>
					</c:choose>
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
				<div class="reserveDay">
				</div>
			</div>
		</div>
		<!--  상영날짜 끝 -->
		<!--  상영시간 시작 -->
		<div class="timePart">
			<div class="timeTitle">시간</div>
			<div class="reserveTime">
				<div class="reserveWhere">4관(Green) 4층(총 100석)</div>
				<div class="reserveTimeWrapper">
				<c:forEach var="schedule"  items="${scheduleEntity}">
					<button class="reserveTimeBtn">
						<span class="reserveTimeWant">${schedule.startingTime}</span>
					</button>
					<span class="reserveTimeRemain">100석</span>
				</c:forEach>
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
	let time = $(".reserveTimeWant")
	
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
			//let movieName = $(".movie selected")[0];
			let movieName = document.querySelector('.movie.selected').innerHTML;
			sessionStorage.setItem("movie", movieName);
		}
	}
		
	// 영화제목 클릭 시 onclick 함수 실행 ( 클래스명 바꿈 )
	function init() {
		for (var i = 0; i < movie.length; i++) {
			movie[i].addEventListener("click", onclick);
		}
	}
	
	// 영화 제목 클릭 - 비동기 요청
	async function update1(event, id) {
		// console.log(event)
		event.preventDefault();
		// 주소: Put board/3
		// Update board SET title = ?, content = ?, WHERE id = ?
		let regionUpdateDto = {
			movieTitle: document.querySelector('.movie.selected').innerHTML
		};
		
		console.log(regionUpdateDto);
		console.log(JSON.stringify(regionUpdateDto));
		// JSON.stringify(자바스크립트 오브젝트) => 리턴 json
		// JSON.parse(제이슨 문자열) => 리턴 자바스크립트 오브젝트
		
		let response = await fetch("http://localhost:8080/mlist/region/"+id, { // 응답을 기다리기 위해 await 사용
			method: 'POST',
			body: JSON.stringify(regionUpdateDto),
			headers: {
				"Content-Type": "application/json; charset=utf-8"
			}
		});
		
		let parseResponse = await response.json(); // 나중에 스프링함수에서 리턴될 때 뭐가 리턴되는지 확인해보자!!
		
		// response.text()로 변경해보자
		console.log(parseResponse)
		
		if(parseResponse.code == 1){
			//alert("업데이트 성공");
			location.href="/mlist/region/"+id
		} else {
			alert(parseResponse.msg);
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
			let lName = document.querySelector('.theaterLocation.selectedLocation').innerHTML;
			let locationName = lName.split('(')[0];
			console.log(locationName)
			sessionStorage.setItem("location", locationName);
			
			
		}
	}

	// 극장 지역 클릭 시 onclick 함수 실행 ( 클래스명 바꿈 )
	function init2() {
		for (var i = 0; i < loc.length; i++) {
			loc[i].addEventListener("click", onclick2);
		}
	}
	
	// 극장 지역 클릭 - 비동기 요청 
	async function update2(event, rName) {
		// console.log(event)
		event.preventDefault();
		// 주소: Put board/3
		// Update board SET title = ?, content = ?, WHERE id = ?
		let locationUpdateDto = {
			rName: document.querySelector('.theaterLocation.selectedLocation').innerHTML
		};
		
		console.log(locationUpdateDto);
		console.log(JSON.stringify(locationUpdateDto));
		// JSON.stringify(자바스크립트 오브젝트) => 리턴 json
		// JSON.parse(제이슨 문자열) => 리턴 자바스크립트 오브젝트
		
		let response = await fetch("http://localhost:8080/mlist/location/"+id, { // 응답을 기다리기 위해 await 사용
			method: 'POST',
			body: JSON.stringify(locationUpdateDto),
			headers: {
				"Content-Type": "application/json; charset=utf-8"
			}
		});
		
		let parseResponse = await response.json(); // 나중에 스프링함수에서 리턴될 때 뭐가 리턴되는지 확인해보자!!
		
		// response.text()로 변경해보자
		console.log(parseResponse)
		
		if(parseResponse.code == 1){
			alert("업데이트 성공");
			location.href="/mlist/location/"+id
		} else {
			alert(parseResponse.msg);
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
			let placeName = document.querySelector('.theaterPlace.selectedPlace').innerHTML;
			console.log(placeName)
			sessionStorage.setItem("place", placeName);
		}
	}

	// 극장 장소 클릭 시 onclick 함수 실행 ( 클래스명 바꿈 )
	function init3() {
		for (var i = 0; i < place.length; i++) {
			place[i].addEventListener("click", onclick3);
		}
	}
	
	//
		// 시간(reserveTimeBtn) 선택 시 함수
		function onclick5(e) {
		console.log(e.target);
		if (e.target.classList[1] === "selectedTime") {
			e.target.classList.remove("selectedTime");
		} else {
			for (var i = 0; i < time.length; i++) {
				time[i].classList.remove("selectedTime");
			}
			event.target.classList.add("selectedTime");
			let startingTime = document.querySelector('.reserveTimeWant.selectedTime').innerHTML;
			console.log(startingTime)
			sessionStorage.setItem("startingTime", startingTime);
		}
	}

	// 극장 장소 클릭 시 onclick 함수 실행 ( 클래스명 바꿈 )
	function init5() {
		for (var i = 0; i < time.length; i++) {
			time[i].addEventListener("click", onclick5);
		}
	}
	
	init();
	init2();
	init3();
	init5();
</script>

<!--  날짜 -->
<script>
	let date = new Date();
	let lastDay = new Date(date.getFullYear(), date.getMonth()+1, 0);
	let reserveDate = $(".reserveDate");
	let reserveYear = $(".reserveYear");
	let reserveMonth = $(".reserveMonth");
	let reserveDay = $(".reserveDay");
	
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
	        spanWeekOfDay.classList = 'movie-week-of-day';
	        spanDay.classList = 'movie-day';

	        const dayOfWeek = weekOfDay[new Date(year + '-' + month + '-' + i).getDay()];
			
	        //요일 넣기
	        if (dayOfWeek === '토') {
	            button.classList.add('saturday');
	            //spanDay.classList.add('saturday');
	        } else if (dayOfWeek === '일') {
	            button.classList.add('sunday');
	            //spanDay.classList.add('sunday');
	        }
	        
	        spanWeekOfDay.innerHTML = dayOfWeek;
	        //button.append(spanWeekOfDay);
	        //날짜 넣기
	        spanDay.innerHTML = i;
	        //console.log(i)
	        let moviedDate = dayOfWeek + " " + i
	        
	        button.append(moviedDate)
	        //button.append(spanDay);
	        //button.append(i);

	        reserveDay.append(button);
			
	        
	    	
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
	    			let rYear = document.querySelector('.reserveYear').innerHTML + "년";
	    			let rMonth = document.querySelector('.reserveMonth').innerHTML + "월";
	    			let rDay = document.querySelector('.movieDateWrapper.selectedBtn').innerHTML;
	    			let rDate = rDay.slice(-1) +"일";
	    			sessionStorage.setItem("year", rYear);
	    			sessionStorage.setItem("month", rMonth);
	    			sessionStorage.setItem("date", rDate);
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