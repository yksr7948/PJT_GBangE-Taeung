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
	
	body {
		font-size: 14px;
	}
	
	.login-wrapper {
		width: 600px;
		height: 600px;
		padding: 60px;
		box-sizing: border-box;
		border: 1px solid black;
		position: absolute;
		left: 50%;
		margin-left: -200px;
		margin-top: 10%;
        box-shadow: 5px 5px 5px 5px gray;
        border-radius: 100px;
	}
	
	.login-wrapper>h2 {
		font-size: 36px;
		color: black;
		margin-bottom: 15%;
	}
	
	#login-form>input {
		width: 100%;
		height: 60px;
		padding: 0 10px;
		box-sizing: border-box;
		margin-bottom: 32px;
		border-radius: 6px;
		background-color: light;
        border: 1px solid gray;
	}
	
	#login-form>input::placeholder {
		color: dimgrey;
	}
	
	#login-form>input[type="checkbox"] {
		display: none;
	}
	
	#login-form>label {
		color: #999999;
	}
	
	#login-form input[type="checkbox"]+label {
		cursor: pointer;
		padding-left: 26px;
		background-repeat: no-repeat;
		background-size: contain;
	}

    #login-btn{
        background-color: gray;
        color: white;
    }
	
	a {
		text-decoration-line: none;
		color: black;
		cursor: pointer;
	}
</style>
</head>
<body>
	<div class="login-wrapper">
		<h2 align="center">로그인</h2>
		<form action="" method="post" id="login-form">
			<input type="text" name="userId" placeholder="아이디"> <input
				type="password" name="userPwd" placeholder="비밀번호"> <label
				for="remember-check"> <input type="checkbox"
				id="remember-check">아이디 저장
			</label> <br>
			<br>
			<br> <input type="submit" id="login-btn" value="Login">
			<div align="center">
				<a href="">아이디 찾기</a> / <a href="">비밀번호 찾기</a> / <a href="enrollCheck.me">회원가입</a>
			</div>

		</form>
	</div>
</body>
</html>