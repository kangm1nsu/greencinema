<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>

<style>
.top_side {
	background-color: #333333;
	color: white;
	text-align: center;
}

.wrap {
	margin-top: 10px;
	border: 3px solid #dddddd;
}

.cards {
	display: flex;
	flex-wrap: wrap;
}

.card {
	border: 3px solid #dddddd;
	border-radius: 10px;
	height: 350px;
	width: 200px;
	margin: 15px;
	text-align: center;
}

.cards_list {
	width: 100%;
	display: flex;
	justify-content: center;
}

.card_hr {
	margin: 4px 2px;
	border: 1px solid #333333;
}

.movie_name {
	text-align: center;
}

p {
	font-size: 12px;
	margin: 0px;
}

.grade {
	text-align: right;
	padding-right: 10px;
	padding-top: 5px;
}
</style>

<div class="wrap">
	<div class="top_side">예약한 영화 목록</div>

	<!-- 리스트시작 -->
	<div class="cards_list">
		<div class="cards">
			<div class="card">
				<p class="grade">15세</p>
				<hr class="card_hr">
				<div class="movie_name">베놈</div>
				<hr class="card_hr">
				<div>Green1관/2장</div>
				<div>C4,C6</div>
				<div>2020.2.9(일) 15:34</div>
				<br />
				<p>결제일</p>
				<div>2020.2.7(일) 12:20</div>
				<br />
				<p>결제비용</p>
				<div>22000원</div>
			</div>
			<!-- 리스트끝 -->

			<div class="card">
				<p class="grade">15세</p>
				<hr class="card_hr">
				<div class="movie_name">베놈</div>
				<hr class="card_hr">
				<div>Green1관/2장</div>
				<div>C4,C6</div>
				<div>2020.2.9(일) 15:34</div>
				<br />
				<p>결제일</p>
				<div>2020.2.7(일) 12:20</div>
				<br />
				<p>결제비용</p>
				<div>22000원</div>
			</div>
			<!-- 리스트끝 -->
			<div class="card">
				<p class="grade">15세</p>
				<hr class="card_hr">
				<div class="movie_name">베놈</div>
				<hr class="card_hr">
				<div>Green1관/2장</div>
				<div>C4,C6</div>
				<div>2020.2.9(일) 15:34</div>
				<br />
				<p>결제일</p>
				<div>2020.2.7(일) 12:20</div>
				<br />
				<p>결제비용</p>
				<div>22000원</div>
			</div>
			<!-- 리스트끝 -->
			<div class="card">
				<p class="grade">15세</p>
				<hr class="card_hr">
				<div class="movie_name">베놈</div>
				<hr class="card_hr">
				<div>Green1관/2장</div>
				<div>C4,C6</div>
				<div>2020.2.9(일) 15:34</div>
				<br />
				<p>결제일</p>
				<div>2020.2.7(일) 12:20</div>
				<br />
				<p>결제비용</p>
				<div>22000원</div>
			</div>
			<!-- 리스트끝 -->
			<div class="card">
				<p class="grade">15세</p>
				<hr class="card_hr">
				<div class="movie_name">베놈</div>
				<hr class="card_hr">
				<div>Green1관/2장</div>
				<div>C4,C6</div>
				<div>2020.2.9(일) 15:34</div>
				<br />
				<p>결제일</p>
				<div>2020.2.7(일) 12:20</div>
				<br />
				<p>결제비용</p>
				<div>22000원</div>
			</div>
			<!-- 리스트끝 -->
		</div>
	</div>
</div>
</body>
</html>