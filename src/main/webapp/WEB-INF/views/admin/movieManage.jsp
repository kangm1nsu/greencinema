<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/adminHeader.jsp"%>

<link rel="stylesheet" href="/css/admin/movieManage.css" />


<div class="wrap">
	<h1>영화 스케쥴관리</h1>
	<br>
	<div class="desc">
		<p>번호</p>
		<p>영화제목</p>
		<p>상영일 및 시간</p>
		<p>상영관</p>
		<p>수정 및 삭제</p>
	</div>
	<div class="movieBox">
		<p>1</p>
		<p>베놈</p>
		<p>2021.10.25 15:40</p>
		<p>A관</p>
		<a href="/test/admin/updateSchedule" class="sizedown">수정</a>
		<button onclick="">삭제</button>
	</div>
	<div class="addBox">
		<a href="/test/admin/addSchedule" class="btn btn-primary center_a">추가</a>
	</div>
</div>

</body>
</html>
