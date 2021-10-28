<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제페이지</title>
<script src="https://nsp.pay.naver.com/sdk/js/naverpay.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"></script>
</head>
<link rel="stylesheet" href="/css/pay.css" />

<body>
	<div class="container m_box">
		<!-- 카카오페이 시작 -->
		<div class="card kakao">
			<div class="card-body">
				<h4 class="card-title">
					<img
						src="http://res.heraldm.com/phpwas/restmb_idxmake.php?idx=142&simg=%2Fcontent%2Fimage%2F2018%2F10%2F01%2F20181001000643_0.jpg">
				</h4>
				<p style="color: #ac2925; margin-top: 30px">
					카카오페이로 결제 <br />본인인증이 필요합니다.
				</p>
				<br>
				<div class="paymoney">
<!-- 					<label>충전할 금액&nbsp;</label> <select id="kakao">
						<option>---------</option>
						<option value="10000">10000원</option>
						<option value="20000">20000원</option>
						<option value="30000">30000원</option>
						<option value="40000">40000원</option>
						<option value="50000">50000원</option>
					</select>
					<button type="button" id="kakaoPayBtn">충전하기</button> -->
					<button type="button" id="kakaoPayBtn">결제하기</button>
				</div>
			</div>
		</div>
		<!-- 카카오페이 끝 -->
		<!-- 네이버페이 시작 -->
		<div class="card naver">
			<div class="card-body">
				<h4 class="card-title">
					<img
						src="https://thumb.mt.co.kr/06/2020/08/2020081818324924794_1.jpg/dims/optimize/">
				</h4>
				<p style="color: #ac2925; margin-top: 30px">
					네이버페이로 결제<br />본인인증이 필요합니다.
				</p>
				<br>
				<div class="paymoney">
<!-- 					<label>충전할 금액&nbsp;</label> <select id="naver">
						<option>---------</option>
						<option value="10000">10000원</option>
						<option value="20000">20000원</option>
						<option value="30000">30000원</option>
						<option value="40000">40000원</option>
						<option value="50000">50000원</option>
					</select>
					<button type="button" id="naverPayBtn">충전하기</button> -->
					<button type="button" id="naverPayBtn">결제하기</button>
				</div>
			</div>
		</div>
		<!-- 네이버페이 끝 -->
		<!-- 토스 시작 -->
		<div class="card toss">
			<div class="card-body">
				<h4 class="card-title">
					<img
						src="https://upload.wikimedia.org/wikipedia/commons/thumb/6/63/Toss-logo.png/1200px-Toss-logo.png">
				</h4>
				<p style="color: #ac2925; margin-top: 30px">
					토스로 결제 <br />본인인증이 필요합니다.
				</p>
				<br>
				<div class="paymoney">
<!-- 					<label>충전할 금액&nbsp;</label> <select id="toss">
						<option>---------</option>
						<option value="10000">10000원</option>
						<option value="20000">20000원</option>
						<option value="30000">30000원</option>
						<option value="40000">40000원</option>
						<option value="50000">50000원</option>
					</select>
					<button type="button" id="tossPayBtn">충전하기</button> -->
					<button type="button" id="tossPayBtn">결제하기</button>
				</div>
			</div>
		</div>
		<!--토스 끝 -->
	</div>
</body>
<script>
	// 카카오페이 js 시작
	$('#kakaoPayBtn').click(function() {
		//가맹점 식별코드
		IMP.init('imp67606279');
		IMP.request_pay({
			pg : 'kakaopay',
			pay_method : 'card',
			merchant_uid : 'TC0ONETIME' + new Date().getTime(),
			name : '상품1', //결제창에서 보여질 이름
			amount : sessionStorage.getItem('price'), //실제 결제되는 가격
			buyer_email : 'iamport@siot.do',
			buyer_name : '구매자이름',
			buyer_tel : '010-1234-5678',
			buyer_addr : '서울 강남구 도곡동',
			buyer_postcode : '123-456'
		}, function(rsp) {
			console.log(rsp);
			if (rsp.success) {
				var msg = '결제가 완료되었습니다.';
				msg += '고유ID : ' //+ rsp.imp_uid;
				msg += '상점 거래ID : ' //+ rsp.merchant_uid;
				msg += '결제 금액 :' + sessionStorage.getItem('price')  //+ rsp.paid_amount;
				msg += '카드 승인번호 : 1234-5678-9101-1213' //+ rsp.apply_num;

			} else {
				var msg = '결제에 실패하였습니다.';
				msg += '에러내용 : ' + rsp.error_msg;
			}
			alert(msg);
		});
	});
	// 카카오페이 js 끝

	// 네이버페이 js 시작
	var oPay = Naver.Pay.create({
          "mode" : "production", // development or production
          "clientId": "u86j4ripEt8LRfPGzQ8" // clientId
    });

    //직접 만드신 네이버페이 결제버튼에 click Event를 할당하세요
    var elNaverPayBtn = document.getElementById("naverPayBtn");

    elNaverPayBtn.addEventListener("click", function() {
        oPay.open({
          "merchantUserKey": "u86j4ripEt8LRfPGzQ8",
          "merchantPayKey": "1",
          "productName": "상품1",
          "totalPayAmount": sessionStorage.getItem('price'),
          "taxScopeAmount": sessionStorage.getItem('price'),
          "taxExScopeAmount": "0",
          "returnUrl": "http://localhost:8080/res"
        });
    });
	// 네이버페이 js 끝

	// 토스 js 시작
	$('#tossPayBtn').click(function() {
		//가맹점 식별코드
		IMP.init('imp67606279');
		IMP.request_pay({
			pg : 'toss',
			pay_method : 'card',
			merchant_uid : 'tosstest' + new Date().getTime(),
			name : '상품1', //결제창에서 보여질 이름
			amount : sessionStorage.getItem('price'), //실제 결제되는 가격
			buyer_email : 'iamport@siot.do',
			buyer_name : '구매자이름',
			buyer_tel : '010-1234-5678',
			buyer_addr : '서울 강남구 도곡동',
			buyer_postcode : '123-456'
		}, function(rsp) {
			console.log(rsp);
			if (rsp.success) {
				var msg = '결제가 완료되었습니다.';
				msg += '고유ID : ' //+ rsp.imp_uid;
				msg += '상점 거래ID : ' //+ rsp.merchant_uid;
				msg += '결제 금액 : ' + sessionStorage.getItem('price') //+ rsp.paid_amount;
				msg += '카드 승인번호 : 1234-5678-9101-1213' //+ rsp.apply_num;

			} else {
				var msg = '결제에 실패하였습니다.';
				msg += '에러내용 : ' + rsp.error_msg;
			}
			alert(msg);
		});
	});
	// toss js 끝
</script>
</html>