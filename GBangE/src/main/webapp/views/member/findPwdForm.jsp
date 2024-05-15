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
  	height: 900px;
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
#userPno1, #userPno2 {
	font-weight: 400;
	font-size: 16px;
	line-height: 24px;
	color: #797979;
	border: none;
	border-bottom: 1px solid #0068ff;
	width: 220px;
	height: 40px;
	margin-top: 21px;
}
.btn{
	position: relative;
}
#user-info-noneId{
	position: relative;
	margin: auto;
	top: 50px;
	left: 120px;
	color: red;
	font-weight: 1000;
	display: none;
}
#check-btn {
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
		<div>
			<div class="user-info">
				<div id="user-info-id">
					<div style="font-weight:700">아이디</div>
		            <input type="text" name="userId" id="userId"/>
				</div>
				<div id="hidden-idArea" style="display: none; margin-top:10px;"></div>
				<div id="user-info-name">
		        	<div style="font-weight:700">이름</div>
		            <input type="text" name="userName" id="userName"/>
		        </div>
				<div id="hidden-nameArea" style="display: none; margin-top:10px;"></div>
		        
		        <div class="user-info-pno">
					<div style="font-weight:700">주민등록번호</div>
					<input type="text" name="userPno1" id="userPno1" /> 
					<font style="font-size: 30px">-</font> 
					<input type="password"name="userPno2" id="userPno2" />
				</div>
				<div id="hidden-pnoArea" style="display: none; margin-top:10px;"></div>
				
				<div id="user-info-noneId">일치하는 정보가 없습니다.</div>
			</div>	
			
			<br><br><br><br>
			
			<div class="btn">
					<button type="button" id="check-btn" onclick="check();">비밀번호 변경하기</button>
					<button type="button" id="login-btn" onclick="login();">로그인페이지</button>
			</div>
		</div>
	</div>
</div>

<script>
	function check(){
		var id = $("#userId");
		var name = $("#userName");
		var pno1 = $("#userPno1");
		var pno2 = $("#userPno2");
		
		var regName = /^[가-힣a-zA-Z]{2,15}$/;
		var regBirth = /^([0-9]{2}(0[1-9]|1[0-2])(0[1-9]|[1,2][0-9]|3[0,1]))$/;
		var regPno = /^[1-4]\d{6}$/;
		var regIdPw = /^[a-zA-Z0-9]{4,15}$/;
		
		$.ajax({
			url:"${contextPath}/findPwd.me",
			type: "post",
			data: {
				userId : id.val(),
				userName : name.val(),
				userPno1 : pno1.val(),
				userPno2 : pno2.val()
			},
				success : function(result){			
				//아이디 null값 비교
				if (id.val() == "") {
					$("#hidden-idArea").html("*아이디를 입력하세요.").show();
					$("#hidden-idArea").css({"color" : "red"});
					id.focus();
					return false;
				} else if (!regIdPw.test(id.val())) {
					$("#hidden-idArea").html("*4~12자 영문 대소문자, 숫자만 입력하세요.").show();
					$("#hidden-idArea").css({"color" : "red"});
					id.focus();
					return false;
				} else{
					$("#hidden-idArea").hide();
				}
				
				//이름 null값 비교
				if (name.val() == "") {
					$("#hidden-nameArea").html("*이름을 입력하세요.").show();
					$("#hidden-nameArea").css({"color" : "red"});
					name.focus();
					return false;
				//이름 형식 비교
				} else if (!regName.test(name.val())) {
					$("#hidden-nameArea").html("*최소 2글자 이상, 한글과 영어만 입력하세요.").show();
					$("#hidden-nameArea").css({"color" : "red"});
					name.focus();
					return false;
				} else {
					$("#hidden-nameArea").hide();
				}
				
				//주민번호 null값 체크
				if (pno1.val() == "" && pno2.val() == "") {
					$("#hidden-pnoArea").html("*주민번호를 입력하세요.").show();
					$("#hidden-pnoArea").css({"color" : "red"});
					pno1.focus();
					return false;
				} else if (!regBirth.test(pno1.val())) {
					$("#hidden-pnoArea").html("*생년월일을 잘못입력했습니다.").show();
					$("#hidden-pnoArea").css({"color" : "red"});
					pno1.focus();
					return false;
				} else if (!regPno.test(pno2.val())) {
					$("#hidden-pnoArea").html("*주민등록번호를 잘못입력했습니다.").show();
					$("#hidden-pnoArea").css({
						"color" : "red"
					});
					pno2.focus();
					return false;
				} else {
					$("#hidden-pnoArea").hide();
				}
				
				if(result == "false"){
					$("#user-info-noneId").show();
					return false;
				}else{
					location.href="${contextPath}/changePwd.me?userId="+$("#userId").val();
							
				}
				
			},
			error : function(){
				
			}
			
		});
	}
	
	function login(){
		location.href= "${contextPath}/login.me";
	}
</script>
</body>
</html>