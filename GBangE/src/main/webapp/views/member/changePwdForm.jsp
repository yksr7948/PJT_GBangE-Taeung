<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#container{
  	display: flex;
  	flex-direction: column;
  	align-items: center;
  	width: 670px;
  	height: 800px;
  	margin: auto;
  	margin-top: 60px;
  	margin-bottom: 60px;
  	border: 1px solid #aacdff;
  	box-shadow: 7px 7px 39px rgba(0, 104, 255, 0.25);
  	border-radius: 20px;
}
#container2{
	display: flex;
	flex-direction: column;
	align-items: center;
	width: 470px;
	height: 600px;
	margin-top: 72px;
	margin-bottom: 70px;
}
#header{
 	height: 94px;
  	line-height: 47px;
  	color: #0068ff;
  	margin-bottom: 50px;
}
.user-info div{
	margin-top: 32px;
}
.user-info input{
  	font-weight: 400;
  	font-size: 16px;
	line-height: 24px;
	color: #797979;
	border: none;
	border-bottom: 1px solid #0068ff;
	width: 466px;
	height: 40px;
	margin-top: 21px;
	outline: none;
}
.btn{
	position: relative;
}
#change-btn {
	position: absolute;
	width: 230px;
	height: 75px;
	font-weight: 400;
	font-size: 18px;
	line-height: 27px;
	color: #000;
	background: #fff;
	margin: auto;
	margin-left: -30px; 
	display: block;
	border: 1px solid #aacdff;
	border-radius: 10px;
	cursor : pointer;
}
#login-btn{
	position: absolute;
	width: 230px;
	height: 75px;
	font-weight: 400;
	font-size: 18px;
	line-height: 27px;
	color: #000;
	background: #fff;
	margin: auto;
	margin-left: 220px;
	display: block;
	border: 1px solid #aacdff;
	border-radius: 10px;
	cursor : pointer;
}
</style>
</head>
<body>
<%@include file="/views/common/menubar.jsp"%>

<div id="container">
	<div id="container2">
		<div id="header">
			<h1 align="center" style="font-size:48px; font-weight:700">비밀번호 찾기</h1>
		</div>
		<form action="${contextPath}/changePwd.me" method="post">
			<input type="hidden" name="userId" value="${userId }">
			<div class="user-info">
				<div class="user-info-pw">
					<div style="font-weight:700">* 변경할 비밀번호</div>
					<input type="password" name="userPwd" id="userPwd" />
				</div>
				<div id="hidden-pwdArea" style="display: none; margin-top:10px;"></div>

				<div class="user-info-pw-check">
					<div style="font-weight:700">* 비밀번호 확인</div>
					<input type="password" id="checkPwd" />
				</div>
				<div id="hidden-checkPwdArea" style="display: none; margin-top:10px;"></div>
			</div>
			
			<br><br><br><br>
			
			<div class="btn">
					<button type="submit" id="change-btn" onclick="return change();">비밀번호 변경하기</button>
					<button type="button" id="login-btn" onclick="login();">로그인페이지</button>
			</div>
		</form>
	</div>
</div>
<script>
	function change(){
		var pwd = $("#userPwd");
		var checkPwd = $("#checkPwd");
		
		var regPwd = /^[a-zA-Z0-9!@#$%^&*]{4,15}$/;
	
		
		//비밀번호 null값 비교
		if (pwd.val() == "") {
			$("#hidden-pwdArea").html("*비밀번호를 입력하세요.").show();
			$("#hidden-pwdArea").css({
				"color" : "red"
			});
			pwd.focus();
			return false;
		//비밀번호 형식 비교
		} else if (!regPwd.test(pwd.val())) {
			$("#hidden-pwdArea").html("*4~15자 영문 대소문자, 숫자, 특수기호만 입력하세요.")
					.show();
			$("#hidden-pwdArea").css({
				"color" : "red"
			});
			pwd.focus();
			return false;
			//비밀번호 아이디값 비교
		} else if (pwd.val() == "${userId}") {
			$("#hidden-pwdArea").html("*아이디와 동일한 비밀번호를 사용할 수 없습니다.").show();
			$("#hidden-pwdArea").css({
				"color" : "red"
			});
			pwd.focus();
			return false;
		} else {
			$("#hidden-pwdArea").hide();
		}

		//비밀번호 동일여부 체크
		if (checkPwd.val() !== pwd.val()) {
			$("#hidden-checkPwdArea").html("*비밀번호와 동일하지 않습니다.").show();
			$("#hidden-checkPwdArea").css({
				"color" : "red"
			});
			checkPwd.focus();
			return false;
		} else {
			$("#hidden-checkPwdArea").hide();
		}
	}
	
</script>
</body>
</html>