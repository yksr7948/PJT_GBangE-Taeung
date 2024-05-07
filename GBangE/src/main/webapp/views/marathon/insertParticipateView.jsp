<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">	
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
body {
  box-sizing: border-box;
  font-family: "Noto Sans CJK KR";
  font-style: normal;
}
.outer {
	display: flex;
  	flex-direction: column;
	align-items: center;
	width: 670px;
	height: 850px;
	margin: auto;
	margin-top: 60px;
	margin-bottom: 60px;
	border: 1px solid #aacdff;
	box-shadow: 7px 7px 39px rgba(0, 104, 255, 0.25);
	border-radius: 20px;
}
.outer form{
	display: flex;
  	flex-direction: column;
  	align-items: center;
  	width: 570px;
  	height: 750px;
  	margin-top: 50px;
  	margin-bottom: 50px;
}
.outer div{
	margin-top:20px;
	height:50px;
	font-size: 25px;
	font-family: "Jua", sans-serif;
  	font-weight: 500;
  	font-style: normal;
  	color:rgb(0, 104, 255);
}


</style>
</head>
<body>
	<%@include file="/views/common/menubar.jsp"%>
	<div class="outer form-floating mb-3">
	<form action="insert.pa" method="post">
		<div>
			<label for="participateName">* 이름</label>
		</div>
		<input type="text" class="form-control" id="participateName" name="participateName" placeholder="이름을 입력하세요"
			required>
		<div>
			<label for="participatePwd">* 비밀번호</label>
		</div>
		<input type="text" class="form-control" id="participatePwd" name="participatePwd" placeholder="비밀번호를 입력하세요" required>
		<div>
			<label for="registerationNo">* 주민번호</label>
		</div>
		<input type="text" class="form-control" id="registerationNo" name="registerationNo" placeholder="주민번호을 입력하세요"
			required>
		<div class="genderDiv">
		* 성별
		</div>
		<div class="form-check">		
		<input type="radio" class="form-check-input" id="genderM" name="gender" value="M" checked >
		<label for="genderM">M     </label>		
		<input type="radio" class="form-check-input" id="genderF" name="gender" value="F" style="margin-left:5px">
		<label for="genderF" style="margin-left:20px">  F</label>
		</div>
		<div>
			<label for="participatePhone">* 전화번호</label>
		</div>
		<input type="text" class="form-control" id="participatePhone" name="participatePhone" placeholder="000-0000-0000 형태로 입력하세요"
			required>
		<div>
			<label for="participateAddress">* 주소</label>
		</div>
		<input type="text" class="form-control" id="participateAddress" name="participateAddress"
			required>
			<br>
		<div class="submitDiv">
		<button type="submit" class="btn btn-success" style="width:570px; height:80px; font-size:27px" >제출하기</button>
		</div>
	</form>
	</div>	
</body>
</html>