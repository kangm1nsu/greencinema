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
<link rel="stylesheet" href="/css/pay/pay.css" />
<body>
</body>
<script>
 	$(function() {
		//가맹점 식별코드
		IMP.init('imp67606279');
		IMP.request_pay({
			pg : 'kcp',
			pay_method : 'card',
			merchant_uid : 'test' + new Date().getTime(),
			name : '영화예매티켓', //결제창에서 보여질 이름
			amount : '100',//sessionStorage.getItem('price'), //실제 결제되는 가격
			buyer_email : "${sessionScope.principal.email}",
			buyer_name : "${sessionScope.principal.username}",
			buyer_tel : "${sessionScope.principal.tel}",
		}, function(rsp) {
			console.log(rsp);
			if (rsp.success) {
				var msg = '결제가 완료되었습니다.';
				msg += '\r\n' + '고유ID : ' //+ rsp.imp_uid;
				msg += '\r\n' + '상점 거래ID : ' //+ rsp.merchant_uid;
				msg += '\r\n' + '결제 금액 : ' + "100000"//sessionStorage.getItem('price') 
				msg += '\r\n' + '카드 승인번호 : 1234-5678-9101-1213' //+ rsp.apply_num;
				result=0;
			} else {
				var msg = '결제에 실패하였습니다.';
				msg += '\r\n' + '에러내용 : ' + rsp.error_msg;
				alert(msg);
				location.href="http://localhost:8080/mlist";
			}
			if( result ==0 ) { 

                let dataDto = {
                    movieName : sessionStorage.getItem('movie'),
                    regionName : sessionStorage.getItem('location'),
                    locationName : sessionStorage.getItem('place'),
                    cinemaName : sessionStorage.getItem('cinemaName'),
                    startingYear : sessionStorage.getItem('year'),
                    startingMonth : sessionStorage.getItem('month'),
                    startingDate : sessionStorage.getItem('date'),
                    startingTime : sessionStorage.getItem('startingTime'),
                    seat : sessionStorage.getItem('seat')
                };
				jQuery.ajax({
                    url: "/reservation", //cross-domain error가 발생하지 않도록 주의해주세요
                    type: 'post',
                    contentType: 'application/json',
                    dataType: 'json',
                    data : JSON.stringify(dataDto)
                }).done(function(data) {
                    //[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
                    if ( everythings_fine ) {
                        console.log(data);
        				alert('성공');
                        location.href="http://localhost:8080/saveResForm";
                    } else {
                        //[3] 아직 제대로 결제가 되지 않았습니다.
                        //[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
                    }
                });
				alert('성공');
                location.href="http://localhost:8080/user/myRes";
                //성공시 이동할 페이지
                sessionStorage.clear();
             } else {
                msg = '결제에 실패하였습니다.';
                msg += '에러내용 : ' + rsp.error_msg;
                //실패시 이동할 페이지
                alert(msg);
                location.href="http://localhost:8080/mlist";
            }
			alert(msg);							
		}); 
	});
</script>
</html>