<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head profile="http://www.w3.org/2005/10/profile">
    <link rel="icon" type="image/png" href="http://example.com/myicon.png">
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
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


#header{
    margin: auto;
    margin-top: 50px;
}
#user-profile{
    width: 100px;
    height: 100px;
    border: 3px solid #ccc;
    border-radius: 50%;
    cursor: pointer;
}
#profile-id{
    margin: auto;
    margin-bottom: 20px;
    font-size: 24px;
    font-weight: 900;
    color:#0068ff
}
#deleteImage{
	margin-left: 90px;
	cursor: pointer;
}

#my-mileage{
	width: 700px;
    height: 400px;
	margin-top: 42px;
	margin-bottom: 40px;
    border: 2px solid lightgray;
    border-radius: 20px;
}
.my-title{
    border-bottom: 2px solid lightgray;
    height: 60px;
    margin: auto;
    margin-top: 10px;
}
.title{
    margin-left: 30px;
    font-size: 32px;
    font-weight: 900;
}
#my-mileage-body{
	position: relative;
}
#gbange-run{
	width: 150px;
	height: 150px;
	position: absolute;
	right: 30px;
	top: 0px;
}
#maile-body-info{
	margin-top: 100px;
}
#maile-bar{
	margin-top: 10px;
	width: 630px;
	height:90px;
}


#my-info{
	width: 700px;
    height: 800px;
	margin-bottom: 70px;
    border: 2px solid lightgray;
    border-radius: 20px;
}
#my-info-body{
	margin-left: 30px;
}
#my-info-body th{
    font-size: 24px;
    margin-left: 30px;
    width: 120px;
    height: 70px;
}
#my-info-body td>input{
	border:none;
	border-bottom: 1px solid lightgray;
	outline: none;
	font-size: 24px;
    font-weight: 900;
    width: 457px;
    height: 50px;
    cursor: auto;
}
#my-info-body td>select{
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

.modal-body input{
	margin-left: 10px;
	margin-bottom: 10px;
	border: none;
	border-bottom: 1px solid;
	outline: none;
}

</style>
</head>
<body>
	<%@include file="/views/common/menubar.jsp"%>
<div id="container">
    	<form action="${contextPath }/profile.me" method="post" name="myPageFrm" id="profileFrm" enctype="multipart/form-data">
		    <div id="header" align="center">
		    
		    	<input type="hidden" name="userId" value="<%=loginUser.getMemberId()%>">
		    	<input type="hidden" name="userPwd" value="<%=loginUser.getMemberPwd()%>">
		    	<span id="deleteImage" onclick="deleteProfile();">x</span>
		    	
		    	<c:if test="${empty loginUser.profileImage }">
		    		<div>
			        	<img id="user-profile" src="views/member/img/user_profile.png"> <br><br>
				        <input type="file" name="profile-input" id="profile-input" style="display:none" onchange="loadImg(this,1);"><br>
		    		</div>
		    	</c:if>
			    		
		    	<c:if test="${!empty loginUser.profileImage }">
		    		<div>
			    		<img id="user-profile" src="views/member/img/<%=loginUser.getChangeName()%>">
			    		<input type="file" name="profile-input" id="profile-input" style="display:none" onchange="loadImg(this,1);"><br>
		    		</div>
		    	</c:if>
		    	
		        <p id="profile-id"><%=loginUser.getMemberId() %></p>
		        <input class="btn btn-primary" type="submit" id="change-btn" value="프로필 변경"/>
		        <button class="btn btn-danger" type="button" onclick="logout();">로그아웃</button>
		    </div>
    	</form>
    
    <div id="my-mileage">
    	<div class="my-title">
	    	<font class="title">마일리지</font>
    	</div>
    	<div id="my-mileage-body"><br>
    		<div id="maile-body-title">
	    		<font class="title">내가 총 달린 거리는?</font>
    		</div>
    		<img id="gbange-run" src="views/member/img/gbangrun.gif">
    		
    		<div id="maile-body-info" align="center">
	    		<font style="font-size: 21px; font-weight:900">
	    		<%=loginUser.getMemberId() %>님은 <%=loginUser.getMileage() %>KM만큼 달렸어요!!
	    		</font><br>
	    		<progress id="maile-bar" value="<%=loginUser.getMileage() %>" min="0" max="100"></progress>
    		</div>
    	</div>
    </div>
    
    <div id="my-info">
        <div class="my-title">
            <font class="title">내 정보</font>
        </div>
        <div id="my-info-body">
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
                    	<option value="0">남자</option>
                    	<option value="1">여자</option>
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
						<option value="0">알파플라이3</option>
						<option value="1">알파플라이2</option>
						<option value="2">베이퍼플라이3</option>
						<option value="3">베이퍼플라이2</option>
						<option value="4">서코니트라이엄프21</option>
						<option value="5">호카클리프톤9</option>
						<option value="6">아디오스프로3</option>
						<option value="7">기</option>
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
                <button id="update-pwd-btn" type="button" data-toggle="modal" data-target="#updatePwdForm">비밀번호 변경</button>
            </div>
            </form>
        </div>
    </div>
</div>
<script>
	
	document.getElementById('shose').options[<%=loginUser.getShoes()%>].selected = true
	document.getElementById('gender').options[<%=loginUser.getGender()%>].selected = true
	
	//input 파일 열기
	$(function(){
		$("#user-profile").click(function(){
			$("#profile-input").click();
		});
	});
	
	//이미지 파일을 변경안하고 버튼을 눌렀을때 처리
	$(function(){
		$("#change-btn").click(function(){
			if($("#profile-input").val() == ""){
				$("#profile-input").click();
				return false;
			}	
		});
	});
	    
	
	function loadImg(inputFile,num){
		
		if(inputFile.files.length == 1){
			
			var reader = new FileReader();
			reader.readAsDataURL(inputFile.files[0]);
			
			reader.onload = function(e){
				$("#user-profile").attr("src",e.target.result);
			}
		}
	}
	
	//로그아웃 
	function logout(){
		location.href = "${contextPath}/logout.me";
	}
	
	//프로필이미지 -> 기본이미지
	function deleteProfile(){
		
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

	<!-- 비밀번호 변경 모달 -->
	<div class="modal" id="updatePwdForm">
	  <div class="modal-dialog">
	    <div class="modal-content">
	
	      <!-- Modal Header -->
	      <div class="modal-header" style="background-color:lightblue">
	        <h4 class="modal-title">비밀번호 변경</h4>
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	      </div>
	      <div class="modal-body" align="center">
	       	<form action="<%=contextPath%>/changePwd.me" method="post">
					<input type="hidden" name="userId" value="<%=loginUser.getMemberId() %>">
					
					<table>
						<tr>
							<td>현재 비밀번호</td>
							<td><input type="password" name="nowPwd" required> </td>
						</tr>
						<tr></tr>
						<tr>
							<td>변경할 비밀번호</td>
							<td><input type="password" name="userPwd" required> </td>
						</tr>
						<tr></tr>
						<tr>
							<td>비밀번호 확인</td>
							<td><input type="password" id="chkPwd" required> </td>
						</tr>
						<tr></tr>
					</table>		
					<br>
					<button type="submit" class="btn btn-danger" onclick="return checkPwd();">비밀번호 변경</button>
	       		</form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	 <script>
	 	function checkPwd(){
	 		var nowPwd = $("input[name=nowPwd]").val();
	      	var updatePwd = $("input[name=userPwd]").val();
	      	var checkPwd = $("#chkPwd").val();
	      	
	      	var regPwd = /^[a-zA-Z0-9!@#$%^&*]{4,15}$/;
	      	
	      	if(nowPwd != "<%=loginUser.getMemberPwd() %>"){
	      		alert("현재 비밀번호가 일치하지 않습니다.")
	      		return false;
	      	}else if(!regPwd.test(updatePwd)){
	      		alert("4~15자 영문 대소문자, 숫자, 특수기호만 입력하세요.")
	      		return false;
	      	}else if(updatePwd == "<%=loginUser.getMemberId() %>"){
	      		alert("아이디와 동일한 비밀번호를 사용할 수 없습니다.")
	      		return false;
	      	}
	      	else if(updatePwd != checkPwd){
	      		alert("변경할 비밀번호와 확인이 일치하지 않습니다.");
	      		return false;
	      	}
	      }
	      </script>
</body>
</html>
