<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

	<%@ include file="../layout/header.jsp" %>
		<!-- 상진 -->

		<style>
			.join {
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

			.wrap2 {
				background-color: black;
			}
		</style>
		<div class="wrap2">
			<div class="wrap">
				<div class="join">


					<div class="card" style="background-color: rgba(255, 255, 255, 0.4);">
						<form action="/join" method="post">
							<div class="card-body">
								<input type="text" name="username" class="form-control" placeholder="아이디"
									maxlength="20">
							</div>

							<div class="card-body">
								<input type="password" name="password" class="form-control" placeholder="비밀번호"
									maxlength="20">
							</div>

							<div class="card-body">
								<input type="email" name="email" class="form-control" placeholder="이메일">
							</div>

							<div class="card-body">
								<input type="text" name="tel" class="form-control" placeholder="전화번호" maxlength="13">
							</div>

							<div class="card-body">
								<input type="date" name="date" class="form-control">
							</div>
							<button type="submit" class="btn btn-warning">회원가입</button>


							<div class="card-body">
								<button type="button" class="btn btn-danger" onclick="location.href = '/loginForm' ">관리자
									로그인</button>
								<button type="button" class="btn btn-info"
									onclick="location.href = '/test/layout/main' ">메인페이지</button>
								<button type="button" class="btn btn-success"
									onclick="location.href = '/test/user/loginForm' ">로그인</button>
							</div>
						</form>
					</div>

				</div>

			</div>

		</div>
		<%@ include file="../layout/footer.jsp" %>