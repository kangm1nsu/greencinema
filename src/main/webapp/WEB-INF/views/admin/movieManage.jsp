<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/adminHeader.jsp"%>

<link rel="stylesheet" href="/css/admin/movieManage.css" />


	<div class="wrap">
		<h1>영화 관리</h1>
		<br>
		<div class="desc">
			<p>번호</p>
			<p>영화제목</p>
			<p>감독</p>
			<p class="actor">배우</p>
			<p>장르</p>
			<p>러닝타임</p>
			<p>개봉일</p>
			<p>등급</p>
			<p>수정 및 삭제</p>
		</div>
		<div class="movieBox">
			<p>1</p>
			<p>베놈</p>
			<p>앤디 서키스</p>
			<p class="actor">톰 하디, 미셸 윌리엄스</p>
			<p>액션</p>
			<p>97분</p>
			<p>2021.10.13</p>
			<p>15세</p>
			<button onclick="">수정</button>
			<button onclick="">삭제</button>
		</div>
	</div>
</body>
</html>
