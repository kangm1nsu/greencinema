<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<link rel="stylesheet" href="/css/movie/detail.css" />

<style>
.m_set_red {
	color: red;
}

.m_set_white {
	color: white;
}

.m_set_pointer {
	cursor: pointer;
}
</style>


<div class="wrap">
	<div class="detail">
		<div class="title">
			<div class="m_name">${movieEntity.movieTitle}</div>


			<div class="bottom_box">
				<div class="like_box">
					<i class="far fa-heart"></i> ${movieEntity.movieLike}
				</div>
				<div>
					<i class="fas fa-ticket-alt"></i> 예매율 : ${movieEntity.rank}위
				</div>
				<div>
					<i class="fas fa-user-friends"></i> 누적관람객 : 15000명
				</div>
			</div>

			<div class="desc">‘베놈’과 완벽한 파트너가 된 ‘에디 브록’(톰 하디) 앞에 ‘클리터스
				캐서디’(우디 해럴슨)가 ‘카니지’로 등장, 앞으로 닥칠 대혼돈의 세상을 예고한다. 대혼돈의 시대가 시작되고, 악을 악으로
				처단할 것인가</div>
		</div>
		<div class="m_photo">
			<img class="card-img-top" src="${movieEntity.img}" alt="영화 이미지"
				style="width: 100%">
			<button type="button" class="btn_res">예매하기</button>
		</div>

	</div>

	<div class="comments">
		<div class="container mt-5 mb-5">

			<div class="coment-bottom bg-white p-2 px-4">
				<!--  댓글 쓰기     -->
				<form action="/movie/detail/${movieEntity.id }" method="POST">
					<div class="d-flex flex-row add-comment-section mt-4 mb-4">
						<img
							class="img-fluid img-responsive rounded-circle mr-2 m_margin_right"
							src="/img/logo_black.png" width="38"> <input type="text"
							name="content" class="form-control mr-3"
							placeholder="관람평을 작성해주세요">
						<button type="submit" class="btn btn-primary" type="button">comment</button>
					</div>
				</form>
				<!--  댓글 쓰기 종료   -->
				<!-- 댓글목록시작 -->

						<c:forEach var="comment" items="${movieEntity.comments }">
					<div class="comment">
							
								<div class="commented-section mt-2"  id="reply-${comment.id }">
									<div class="d-flex flex-row align-items-center commented-user">
										<h5 class="mr-2">작성자 : ${comment.user.username }</h5>
									</div>
									<div class="comment-text-sm">
										<span>${comment.content }</span>
									</div>
								</div>
							
							

							<div class="delete_btn">
								<button type="button" class="btn btn-block create-account">삭제하기</button>
							</div>

					</div>
					</c:forEach>
					<%-- <c:forEach var="comment" items="${movieEntity.comments }">
									<li id="reply-${comment.id }"
										class="list-group-item d-flex justify-content-between">
										<div>${comment.content }</div>
										</li>
										
						<div class="comment-text-sm">
										
											<div>작성자: ${comment.user.username }</div>
													
					<div class="delete_btn">
						<button type="button" class="btn btn-block create-account">삭제하기</button>
					</div>
						</div>
						
							</c:forEach> --%>
				</div>
			</div>
		</div>
	</div>
		<!-- 댓글목록 끝 -->






<%@ include file="../layout/footer.jsp"%>
