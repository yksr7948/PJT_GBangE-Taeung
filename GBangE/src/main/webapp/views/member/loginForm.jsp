<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	* {
		box-sizing: border-box;
		font-family: "Noto Sans CJK KR";
		font-style: normal;
	}
	
	body {
		display: flex;
  		flex-direction: row;
  		justify-content: center;

	}
	
	.login-container {
		display: flex;
		flex-direction: column;
		align-items: center;
		width: 670px;
		height: 960px;
		margin-top: 60px;
		margin-bottom: 60px;
		background: #ffffff;
		border: 1px solid black;
		box-shadow: 5px 5px 5px gray;
		border-radius: 20px;
	}

	.container{
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
		margin-bottom: 50px;
		color: black;
	}
	
	#login-form>input {
		
		width: 100%;
		height: 60px;
		padding: 0 10px;
		box-sizing: border-box;
		margin-bottom: 50px;
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
	
	a {
		text-decoration-line: none;
		color: black;
		cursor: pointer;
	}
</style>
</head>
<body>
	<div class="login-container">
		<div class="container">
			<div class="header">
				<h1 align="center">로그인</h1>
			</div>
		<form action="/gbange/insert.me" method="post" id="login-form">
				<input type="text" name="userId" placeholder="아이디"> 
				<input type="password" name="userPwd" placeholder="비밀번호"> 
			<label for="remember-check"><input type="checkbox" id="remember-check">아이디 저장</label> 
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