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

			.wrap2 {
				background-color: black;
			}
		</style>


		<div class="wrap2">
			<div class="wrap">


				<div class=" main">


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


							<button type="submit" class="btn btn-success" style="margin-left: 10px">로그인</button>

							<button type="button" class="btn btn-warning"
								onclick="location.href = '/test/user/joinForm' ">회원가입</button>


							<div class="card-body">
								<button type="button" class="btn btn-danger" onclick="location.href = '/loginForm' ">관리자
									로그인</button>
								<button type="button" class="btn btn-info"
									onclick="location.href = '/test/layout/main' ">메인페이지</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>





		<%@ include file="../layout/footer.jsp" %>