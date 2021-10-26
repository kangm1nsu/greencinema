<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<link rel="stylesheet" href="/css/movie/detail.css" />


<div class="wrap">
	<div class="detail">
		<div class="title">
			<div class="m_name">
				베놈 2: 렛 데어 비 카니지</div>
				
				<div class="desc">‘베놈’과 완벽한 파트너가 된 ‘에디 브록’(톰 하디) 앞에 ‘클리터스
					캐서디’(우디 해럴슨)가 ‘카니지’로 등장, 앞으로 닥칠 대혼돈의 세상을 예고한다. 대혼돈의 시대가 시작되고, 악을
					악으로 처단할 것인가</div>
			</div>
			<div class="m_photo">
				<img class="card-img-top"
					src="https://img.megabox.co.kr/SharedImg/2021/09/29/fl6qV6UG8faiMppMO4LZp9VZlohic35T_420.jpg"
					alt="영화 이미지" style="width: 100%">
				<button type="button" class="btn_res">예매하기</button>
			</div>
		</div>
		<div class="comments">
			<!-- <form >
		<img class="logo" alt="" src="/img/logo_black.png">
			<input type=text placeholder="관람평을 작성해주세요" required="required">
			<input type="submit" > 
		</form> -->
			<!-- 부트스트랩시작 -->

			<div class="container mt-5 mb-5">

				<div class="coment-bottom bg-white p-2 px-4">
					<div class="d-flex flex-row add-comment-section mt-4 mb-4">
						<img class="img-fluid img-responsive rounded-circle mr-2"
							src="/img/logo_black.png" width="38"><input type="text"
							class="form-control mr-3" placeholder="관람평을 작성해주세요">
						<button class="btn btn-primary" type="button">comment</button>
					</div>
					<div class="comment">
						<div class="commented-section mt-2">
							<div class="d-flex flex-row align-items-center commented-user">
								<h5 class="mr-2">작성자 : 그린이</h5>

							</div>
							<div class="comment-text-sm">
								<span>재밌어요</span>
							</div>
							<div class="reply-section">
								<div class="d-flex flex-row align-items-center voting-icons">
									<i class="fa fa-sort-up fa-2x mt-3 hit-voting"></i><i
										class="fa fa-sort-down fa-2x mb-3 hit-voting"></i>
								</div>
							</div>
						</div>
					</div>


				</div>
			</div>
		</div>
	</div>
	<!-- 부트스트랩끝 -->

</div>
</div>

<%@ include file="../layout/footer.jsp"%>
