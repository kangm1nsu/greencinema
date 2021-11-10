<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp"%>
<link rel="stylesheet" href="/css/user/joinForm.css" />
<div class="resi_form">
   <div class="registration-form">
      <form onsubmit="update(event,${sessionScope.principal.id })">
         <b>회원정보수정</b>
         <div class="form-group">
            <input type="text" class="form-control item" id="username"
               placeholder="아이디" value="${sessionScope.principal.username }" readonly>
         </div>
         <div class="form-group">
            <input type="password" class="form-control item" id="password"
               placeholder="비밀번호" value="${sessionScope.principal.password }" readonly>
         </div>
         
         <div class="form-group">
            <input type="text" class="form-control item" id="email"
               placeholder="이메일" value="${sessionScope.principal.email }">
         </div>
         <div class="form-group">
            <input type="text" class="form-control item" id="phone-number"
               placeholder="연락처" value="${sessionScope.principal.tel }">
         </div>
         <div class="form-group">
            <input type="text" class="form-control item" id="birth-date"
               placeholder="생년월일" value="${sessionScope.principal.birthDate }" readonly>
         </div>
         <div class="form-group" id="submit-btn">
            <button type="submit" class="btn btn-block create-account">수정하기</button>
         </div>
      </form>

   </div>
</div>
<script type="text/javascript"
   src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript"
   src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.15/jquery.mask.min.js"></script>
<script src="assets/js/script.js"></script>

<!--  상진 - 회원수정  -->
<script>
   async function update(event, id) {
      event.preventDefault();
      
      let userUpdateDto = {
            email: document.querySelector("#email").value,
            tel: document.querySelector("#phone-number").value
      };
      
         let response = await fetch("http://localhost:8080/user/"+ id, {
               method: "put",
               body: JSON.stringify(userUpdateDto),
               headers: {
                     "Content-Type": "application/json; charset=UTF-8"
               }
         });
         
         let parseResponse = await response.json();
         
         if(parseResponse.code == 1){
            alert("수정 성공");
            location.href = "/";
         }else {
            alert("수정 실패 :" + parseResponse.msg);
         }
   }
</script>
<%@ include file="../layout/footer.jsp"%>