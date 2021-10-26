<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/adminHeader.jsp"%>
<link rel="stylesheet" href="/css/admin/addSchedule.css" />
	<div class="registration-form">
		<form>
			<b>영화 스케쥴 추가</b>
			<div class="form-group">
				<input type="text" class="form-control item" id="movieName"
					placeholder="영화제목">
			</div>
			<div class="form-group">
				<input type="datetime" class="form-control item" id="movieTime"
					placeholder="상영일 및시간">
			</div>
			<div class="form-group">
				<input type="text" class="form-control item" id="SCinema"
					placeholder="상영관">
			</div>
			<div class="form-group" id="submit-btn">
				<button type="button" class="btn btn-block create-account">추가하기</button>
			</div>
		</form>
	</div>