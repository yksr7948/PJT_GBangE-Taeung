<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#container {
    display: flex;
    flex-direction: column;
    align-items: center;
    width: 800px;
    margin: auto;
    margin-top: 60px;
    margin-bottom: 60px;
    border: 1px solid #aacdff;
    box-shadow: 7px 7px 39px rgba(0, 104, 255, 0.25);
    border-radius: 20px;
}
#my-info{
	width: 700px;
    height: 800px;
	margin-top: 42px;
	margin-bottom: 70px;
    border: 2px solid lightgray;
    border-radius: 20px;
}
#my-info-title{
    border-bottom: 2px solid lightgray;
    height: 60px;
    margin: auto;
    margin-top: 10px;
}
#header{
    margin: auto;
    margin-top: 50px;
}
#user-profile{
    width: 100px;
    height: 100px;
}
#profile-id{
    margin: auto;
    margin-bottom: 20px;
    font-size: 24px;
    color:#0068ff
}
.profile-btn{
	width: 80px;
	height: 35px;
	font-size: 13px;
	font-weight: 900;
	line-height: 27px;
	color: #000;
	background: #fff;
	border: 1px solid black;
	cursor : pointer;
}
#title{
    margin-left: 30px;
    font-size: 32px;
    font-weight: 900;
}
#my-into-body{
	margin-left: 30px;
}
#my-into-body th{
    font-size: 24px;
    margin-left: 30px;
    width: 120px;
    height: 70px;
}
#my-into-body td>input{
	border:none;
	border-bottom: 1px solid lightgray;
	outline: none;
	font-size: 24px;
    font-weight: 900;
    width: 457px;
    height: 50px;
    cursor: auto;
}
#my-into-body td>select{
	border:none;
	border-bottom: 1px solid lightgray;
	outline: none;
	font-size: 24px;
    font-weight: 900;
    width: 457px;
    height: 50px;
}
.info-btn{
	position: relative;
    margin-top: 60px;
    margin-left: 90px;
}
#update-info-btn {
	position: absolute;
	width: 230px;
	height: 75px;
	font-weight: 900;
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
#update-pwd-btn{
	position: absolute;
	width: 230px;
	height: 75px;
	font-weight: 900;
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
    <div id="header" align="center">
        <img id="user-profile" src="views/member/img/user_profile.png"> <br><br>
        <p id="profile-id"><%=loginUser.getMemberId() %></p>
        <button class="profile-btn">프로필 변경</button>
        <button class="profile-btn" onclick="logout();">로그아웃</button>
    </div>
    
    <div id="my-info">
        <div id="my-info-title">
            <font id="title">내 정보</font>
        </div>
        <div id="my-into-body">
            <form action="${contextPath}/update.me" method="post">
            
            <table>
                <tr>
                    <th>아이디</th>
                    <td><input type="text" name="userId" value="<%=loginUser.getMemberId() %>" readonly></td>
                </tr>
                <tr>
                    <th>이름</th>
		            <td><input type="text" id="userName" name="userName" value="<%=loginUser.getMemberName() %>"></td>
                </tr>
                <tr>
                	<td></td>
                	<td id="hidden-nameArea" style="display:none;"></td>
                </tr>
                <tr>
                    <th>성별</th>
                    <td>
                    <select name="gender" id="gender">
                    	<option value="1">남자</option>
                    	<option value="2">여자</option>
                    </select>
                    </td>
                </tr>
                <tr>
                    <th>주소</th>
                    <td><input type="text" name="address" value="<%=loginUser.getAddress() %>"></td>
                </tr>
                <tr>
                    <th>러닝화</th>
                    <td>
                    
                    <select name="shoes" id="shose">
						<option value="0">맨발</option>
						<option value="1">운동화</option>
						<option value="2">스니커즈</option>
						<option value="3">기타</option>
					</td>
                </tr>
                <tr>
                	<td></td>
                	<td id="hidden-shoseArea" style="display:none;">
                		<input type="text" name="shose">
                	</td>
                </tr>
                <tr>
                    <th>몸무게</th>
                    <td><input type="number" step="0.01" name="weight" id="weight" value="<%=loginUser.getWeight() %>"></td>
                </tr>
                <tr>
                    <th>가입날짜</th>
                    <td><input type="text" name="enrollDate" value="<%=loginUser.getEnrollDate() %>" readonly></td>
                </tr>
                    
            </table>
            <div class="info-btn">
                <button id="update-info-btn" type="submit" onclick="return update();">정보수정</button>
                <button id="update-pwd-btn" type="button">비밀번호 변경</button>
            </div>
            </form>
        </div>
    </div>
</div>
<script>
	
	document.getElementById('shose').options[<%=loginUser.getShoes()%>].selected = true
	document.getElementById('gender').options[<%=loginUser.getGender()%>].selected = true
	
	function logout(){
		location.href = "${contextPath}/logout.me";
	}
	
	function update(){
		var name = $("#userName");
		var address = $("#address");
		var weight = $("#weight");
		
		var regName = /^[가-힣a-zA-Z]{2,15}$/;
		
		//이름 null값 비교
		if (name.val() == "") {
			$("#hidden-nameArea").html("*이름을 입력하세요.").show();
			$("#hidden-nameArea").css({
				"color" : "red"
			});
			name.focus();
			return false;
			//이름 형식 비교
		} else if (!regName.test(name.val())) {
			$("#hidden-nameArea").html("*최소 2글자 이상, 한글과 영어만 입력하세요.").show();
			$("#hidden-nameArea").css({
				"color" : "red"
			});
			name.focus();
			return false;
		} else {
			$("#hidden-nameArea").hide();
		}
		
		//weight가 null값일때
		if ($("#weight").val() == "") {
			$("#weight").val(0);
		}
	}
	


</script>
</body>
</html>