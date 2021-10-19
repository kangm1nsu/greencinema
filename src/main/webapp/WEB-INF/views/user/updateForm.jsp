<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

	<%@ include file="../layout/header.jsp" %>
		<!-- 상진 -->

		<style>
			.update {
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

				<div class="update">


					<div class="card" style="background-color: rgba(255, 255, 255, 0.4);">

						<form action="/join" method="post">
							<div class="card-body">
								<input type="text" name="username" class="form-control" placeholder="아이디" maxlength="20"
									value=${"김상진"}>
							</div>

							<div class="card-body">
								<input type="password" name="password" class="form-control" placeholder="비밀번호"
									maxlength="20" value=${"1234"}>
							</div>

							<div class="card-body">
								<input type="email" name="email" class="form-control" placeholder="이메일"
									value=${"상진@.com"}>
							</div>

							<div class="card-body">
								<input type="text" name="tel" class="form-control" placeholder="전화번호" maxlength="13"
									value=${"010-1234-5678"}>
							</div>

							<div class="card-body">
								<input type="date" name="date" class="form-control" value=${"2099-12-31"}>
							</div>
							<div class="card-body">
								<button type="submit" class="btn btn-primary" style="margin:auto">수정</button>
								<button type="button" class="btn btn-info"
									onclick="location.href = '/test/layout/main' ">메인페이지</button>
							</div>




						</form>
					</div>
				</div>
			</div>
		</div>





		<%@ include file="../layout/footer.jsp" %>