<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
* {
	padding: 0;
	margin: 0;
	border: none;
	}

#login-container {
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

#container{
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
  	color: #0068ff;
  	margin-bottom: 50px;
	}
	
#login-form>input {	
	
	width: 100%;
	height: 60px;
	padding: 0 10px;
	box-sizing: border-box;
	margin-bottom: 50px;
	border-radius: 6px;
	background-color: light;
    border: 1px solid #aacdff;
	}
input:focus {
  outline: none;
}
	
#login-form>input::placeholder {
	color: black;
	font-weight: bold;
	}
	
#login-form>input[type="checkbox"] {
	display: none;
	}
	
#login-form>label {
	color: #000000;	
	}
	
#remember-check, #remember-label {
	background-repeat: no-repeat;
	background-size: contain;
	cursor: pointer;
	}

#login-btn{
	margin-top: 30px;
	width: 470px;
	height: 75px;
	font-size: 18px;
	line-height: 27px;
	text-align: center;
	border: 1px solid gray;
	border-radius: 10px;
    }
	
#login-form a{
	text-decoration-line: none;
	cursor: pointer;
	font-size: 16px;
	}
</style>
</head>
<body>

	<%@include file="/views/common/menubar.jsp"%>	

	<div id="login-container">
		<div id="container">
			<div class="header">
				<h1 align="center">로그인</h1>
			</div>
		<form action="/gbange/login.me" method="post" id="login-form">
				<input type="text" name="userId" placeholder="아이디"> 
				<input type="password" name="userPwd" placeholder="비밀번호"> 
			<label for="remember-check" id="remember-label"><input type="checkbox" id="remember-check"> 아이디 저장</label> 
			<br>
			<br>
			<br> <input type="submit" id="login-btn" value="Login">
			<div align="center">
				<a href="">아이디 찾기</a> / <a href="">비밀번호 찾기</a> / <a href="/gbange/enrollCheck.me">회원가입</a>
			</div>
		</div>

		</form>
	</div>
</body>
</html>
</html>