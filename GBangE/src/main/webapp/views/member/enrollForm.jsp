<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <title>회원가입</title>
    <link rel="stylesheet" href="./02-signup.css" />
    
<style>

#container {
  display: flex;
  flex-direction: column;
  align-items: center;
  width: 670px;
  height: 1200px;
  margin: auto;
  margin-top: 60px;
  margin-bottom: 60px;
  border: 1px solid black;
  box-shadow: 5px 5px 5px gray;
  border-radius: 20px;
}

.member-container {
  display: flex;
  flex-direction: column;
  align-items: center;
  width: 470px;
  height: 818px;
  margin-top: 72px;
  margin-bottom: 70px;
}

.header {
  width: 466px;
  height: 94px;
  font-weight: 700;
  font-size: 32px;
  line-height: 47px;
  color: black;
}

.user-info {
  margin-top: 39px;
}

.user-info div {
  margin-top: 21px;
}

.user-info input {
  font-weight: 400;
  font-size: 16px;
  line-height: 24px;
  color: #797979;
  border: none;
  border-bottom: 1px solid #cfcfcf;
  width: 466px;
  margin-top: 21px;
}

.user-info-id input {
  border-bottom: 1px solid #d2d2d2;
}

.gender {
  display: flex;
  align-items: center;
  justify-content: space-between;
  width: 140px;
  height: 23.94px;
  margin-top: 50px;
}

.gender input {
  width: 20px;
  height: 19.95px;
  background: #ebebeb;
  border: 1px solid #d2d2d2;
}

.gender label {
  font-weight: 400;
  font-size: 16px;
  line-height: 24px;
}

.agree-check {
  width: 454px;
  height: 21.06px;
  margin-top: 52.05px;
  font-weight: 400;
  font-size: 14px;
  line-height: 21px;
  color: #000000;
}

.btn {
  display: flex;
  flex-direction: column;
  margin-top: 60px;
  width: 470px;
  height: 106px;
  border-top: 1px solid #e6e6e6;
}

button {
  margin-top: 30px;
  width: 470px;
  height: 75px;
  font-weight: 400;
  font-size: 18px;
  line-height: 27px;
  text-align: center;
  color: black;
  background: #ffffff;
  border: 1px solid gray;
  border-radius: 10px;
}
    </style>
  </head>
  <body>
    <%@include file="/views/common/menubar.jsp"%>
    	
	  <form action="/gbange/insert.me" method="post">
	    <div id="container">
	      <div class="member-container">
	        <div class="header" align="center">
	          <h1>회원가입</h1>
	        </div>
	        <div class="user-info">
	          <div class="user-info-id">
	            <div>* 아이디</div>
	            <input type="text" name="userId" required/>
	          </div>
	          <div class="user-info-name">
	            <div>* 이름</div>
	            <input type="text" name="userName" required/>
	          </div>
	          <div class="user-info-pw">
	            <div>* 비밀번호</div>
	            <input type="password" name="userPwd" required/>
	          </div>
	          <div class="user-info-pw-check">
	            <div>* 비밀번호 확인</div>
	            <input type="password" required/>
	          </div>
	          <div class="user-info-birth">
	            <div>* 생년월일 (8자리)</div>
	            <input type="text" name="birthDate" required>
	          </div>
	
	          <div class="user-info-address">
	            <div>  주소</div>
	            <input type="text" name="address">
	          </div>
	
	          <div class="user-info-weight">
	            <div> 몸무게 (소수점 2자리)</div>
	            <input type="number" step="0.02" name="weight">
	          </div>
	
	          <div class="user-info-shoes">
	            * 러닝화
	            <select name="shoes">
	                <option value="기타">기타</option>
	                <option value="맨발">맨발</option>
	                <option value="운동화">운동화</option>
	                <option value="스니커즈">스니커즈</option>
	            </select>
	          </div>
	          <div>
	            
	          </div>
	        </div>
	        <div class="gender">
	          <input type="radio" name="gender" id="women" value="W" /><label for="women">여성</label>
	          <input type="radio" name="gender" id="men" value="M" /><label for="men">남성</label>
	        </div>
	        <div class="btn">
	          <button type="submit">가입하기</button>
	        </div>
	      </div>
	    </div>
    </form>
  </body>
</html>