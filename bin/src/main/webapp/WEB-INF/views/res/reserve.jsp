<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ include file="../layout/header.jsp" %>	

<link rel="stylesheet" href="/css/res/reserve.css" />
<link rel="stylesheet" href="/css/res/seat.css" />
<<<<<<< HEAD
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
=======
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
>>>>>>> master
</head>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<body>
	<br>
	<div class="allWrapper">
		<div class="selectWrapper">
			<div class="selectTitle">인원/좌석</div>
			<div class="selectSeatContainer">
				<div class="selectSeatNumberContainer">

					<div class="selectSeatInformation">
						<div class="selectedMovie">
							<div class="movieContainer">
								<div class="selectedMovie" id="movie">${sessionStorage.movie}</div>
							</div>
						</div>
						<div class="selectSeatInformationWrapper">
							<div class="selectTheaterPlaceSelectedTheaterPlaceInfo">GC서면</div>
							<div class="selectTheaterPlaceSelectedTheaterPlaceInfo">1관
								4층</div>
							<div class="selectTheaterPlace">
								<span>남은좌석</span><span class="remainSeats" id="remainSeats">100</span>/<span
									class="allSeats">100</span>
							</div>

						</div>
						<div class="selectTheaterDate">
							<div class="theaterDate">2021.10.18(월)</div>
							<div class="theaterTime">16:50</div>
						</div>

						<div class="selectTheaterDate">
							<div class="theaterDate"></div>
							<div class="theaterTime"></div>
						</div>
						<div class="selectedSeats-Wrapper">
							<span class="selectedSeatsTitle">좌석번호&nbsp;&nbsp;&nbsp;</span>
							<span class="seatName">선택한 좌석이 없습니다.</span>
						</div>
						<div class="ticketPriceWrapper">
							<div class="ticketPriceTitle">가격</div>
							<div class="ticketPrice">
								<span id="total">0</span>&nbsp;원
							</div>
						</div>

						<form action="/pay" class="seatForm" method="post">
							<button type="submit" class="reserveBtn">
								결제&nbsp;&nbsp;<img src="/img/kakaoPay.png" class=logo><img
									src="/img/naverPay.png" class=logo><img
									src="/img/toss.png" class=logo>
							</button>
						</form>

					</div>
				</div>
				<div class="reserveNumberWrapper">
					<div class="reserveNumberTitle">선택된 좌석 수</div>
					<div class="reserveNumber">
						<span id="count"></span>
					</div>
				</div>

			</div>
		</div>
		<div class="seatback2">
			<div class="seatback">
				<ul class="showcase">
					<li>
						<div class="seat"></div> <small>예매가능</small>
					</li>
					<li>
						<div class="seat selected"></div> <small>선택</small>
					</li>
					<li>
						<div class="seat sold"></div> <small>예매불가</small>
					</li>
				</ul>

				<div class="container">
					<div class="screen"></div>

					<div class="row">
						<div class="seat">A1</div>
						<div class="seat">A2</div>
						<div class="seat">A3</div>
						<div class="seat">A4</div>
						<div class="seat">A5</div>
						<div class="seat">A6</div>
						<div class="seat">A7</div>
						<div class="seat">A8</div>
						<div class="seat">A9</div>
						<div class="seat">A10</div>
					</div>

					<div class="row">
						<div class="seat">B1</div>
						<div class="seat">B2</div>
						<div class="seat">B3</div>
						<div class="seat">B4</div>
						<div class="seat">B5</div>
						<div class="seat">B6</div>
						<div class="seat">B7</div>
						<div class="seat">B8</div>
						<div class="seat">B9</div>
						<div class="seat">B10</div>

					</div>
					<div class="row">
						<div class="seat">C1</div>
						<div class="seat">C2</div>
						<div class="seat">C3</div>
						<div class="seat">C4</div>
						<div class="seat">C5</div>
						<div class="seat">C6</div>
						<div class="seat">C7</div>
						<div class="seat">C8</div>
						<div class="seat">C9</div>
						<div class="seat">C10</div>

					</div>
					<div class="row">
						<div class="seat">D1</div>
						<div class="seat">D2</div>
						<div class="seat">D3</div>
						<div class="seat">D4</div>
						<div class="seat">D5</div>
						<div class="seat">D6</div>
						<div class="seat">D7</div>
						<div class="seat">D8</div>
						<div class="seat">D9</div>
						<div class="seat">D10</div>
					</div>
					<br> <br>
					<div class="row">
						<div class="seat">E1</div>
						<div class="seat">E2</div>
						<div class="seat">E3</div>
						<div class="seat">E4</div>
						<div class="seat">E5</div>
						<div class="seat">E6</div>
						<div class="seat">E7</div>
						<div class="seat">E8</div>
						<div class="seat">E9</div>
						<div class="seat">E10</div>
					</div>
					<div class="row">
						<div class="seat">F1</div>
						<div class="seat">F2</div>
						<div class="seat">F3</div>
						<div class="seat">F4</div>
						<div class="seat">F5</div>
						<div class="seat">F6</div>
						<div class="seat">F7</div>
						<div class="seat">F8</div>
						<div class="seat">F9</div>
						<div class="seat">F10</div>
					</div>
					<div class="row">
						<div class="seat">G1</div>
						<div class="seat">G2</div>
						<div class="seat">G3</div>
						<div class="seat">G4</div>
						<div class="seat">G5</div>
						<div class="seat">G6</div>
						<div class="seat">G7</div>
						<div class="seat">G8</div>
						<div class="seat">G9</div>
						<div class="seat">G10</div>
					</div>
					<div class="row">
						<div class="seat">H1</div>
						<div class="seat">H2</div>
						<div class="seat">H3</div>
						<div class="seat">H4</div>
						<div class="seat">H5</div>
						<div class="seat">H6</div>
						<div class="seat">H7</div>
						<div class="seat">H8</div>
						<div class="seat">H9</div>
						<div class="seat">H10</div>
					</div>
					<div class="row">
						<div class="seat">I1</div>
						<div class="seat">I2</div>
						<div class="seat">I3</div>
						<div class="seat">I4</div>
						<div class="seat">I5</div>
						<div class="seat">I6</div>
						<div class="seat">I7</div>
						<div class="seat">I8</div>
						<div class="seat">I9</div>
						<div class="seat">I10</div>
					</div>
					<div class="row">
						<div class="seat">J1</div>
						<div class="seat">J2</div>
						<div class="seat">J3</div>
						<div class="seat">J4</div>
						<div class="seat">J5</div>
						<div class="seat">J6</div>
						<div class="seat">J7</div>
						<div class="seat">J8</div>
						<div class="seat">J9</div>
						<div class="seat">J10</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script>
let movie = sessionStorage.getItem('movie');
console.log(movie);
$('#movie').append(movie)

let container = $('.container')[0];
let seats = document.querySelectorAll(".row .seat:not(.sold)");
let count = $('#count')[0];
let total = $('#total')[0];
let movieSelect = $('#movie')[0];

populateUI();

// let ticketPrice = +movieSelect.value;

// Save selected movie index and price
function setMovieData(movieIndex, moviePrice) {
  localStorage.setItem("selectedMovieIndex", movieIndex);
  localStorage.setItem("selectedMoviePrice", moviePrice);
}

// Update total and count
function updateSelectedCount() {
  let selectedSeats = document.querySelectorAll(".row .seat.selected");
  
  let seatsIndex = [...selectedSeats].map((seat) => [...seats].indexOf(seat));

  localStorage.setItem("selectedSeats", JSON.stringify(seatsIndex));

  let selectedSeatsCount = selectedSeats.length;

  count.innerText = selectedSeatsCount;
  total.innerText = selectedSeatsCount * 10000;
  
  let price = total.innerText;
  console.log(price);
  // $('input[name=total]').attr('value', price);
  sessionStorage.setItem("price",price);
  // setMovieData(movieSelect.selectedIndex, movieSelect.value);
  setMovieData(movieSelect.selectedIndex);
}


// Get data from localstorage and populate UI
function populateUI() {
  let selectedSeats = JSON.parse(sessionStorage.getItem("selectedSeats"));

  if (selectedSeats !== null && selectedSeats.length > 0) {
    seats.forEach((seat, index) => {
      if (selectedSeats.indexOf(index) > -1) {
        seat.classList.add("selected");
      }
    });
  }

  let selectedMovieIndex = sessionStorage.getItem("selectedMovieIndex");

  if (selectedMovieIndex !== null) {
    movieSelect.selectedIndex = selectedMovieIndex;
    console.log(selectedMovieIndex)
  }
}

// Movie select event
movieSelect.addEventListener("change", (e) => {
  // ticketPrice = +e.target.value;
  // setMovieData(e.target.selectedIndex, e.target.value);
  setMovieData(e.target.selectedIndex);
  updateSelectedCount();
});

// Seat click event
container.addEventListener("click", (e) => {
  if (
    e.target.classList.contains("seat") &&
    !e.target.classList.contains("sold")
  ) {
    e.target.classList.toggle("selected");
    updateSelectedCount();
  }
  let selectedSeats = $(".row .seat.selected");
   let array = Array.from(selectedSeats);
  	let arr2 = [];
  	let string = "";
  	for ( var i =0; i < array.length; i++) {
  	arr2[i] = array[i].innerText
  }
  	string = arr2.join(", ");
  	//let seatName = document.querySelector(".seatName");
  	let seatName = $(".seatName")[0];
  	seatName.innerText = string;
	console.log(string);
});

// Initial count and total set
updateSelectedCount();

</script>
</html>