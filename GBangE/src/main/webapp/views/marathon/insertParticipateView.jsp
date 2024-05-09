<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
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
	height: 1000px;
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
  	height: 800px;
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
.participateAddress input{
	color: black;
	font-size:17px;
}
#sample6_detailAddress {
	width:350px;
}
</style>
</head>
<body>
	<%@include file="/views/common/menubar.jsp"%>
	<div class="outer form-floating mb-3">
	<form action="insert.pa" method="post">
		<input type="hidden" name="memberNo" value="${memberNo }">
		<input type="hidden" name="marathonNo" value="${marathonNo }">
		선택한 대회 번호 : ${marathonNo}
		<div>
			<label for="participateName">* 이름</label>
		</div>
		<input type="text" class="form-control" id="participateName" name="participateName" placeholder="이름을 입력하세요" required>
		<div>
			<label for="participatePwd">* 비밀번호</label>
		</div>
		<input type="text" class="form-control" id="participatePwd" name="participatePwd" placeholder="비밀번호를 입력하세요" required>
		<div>
			<label for="registerationNo">* 주민번호</label>
		</div>
		<input type="text" class="form-control" id="registerationNo" name="registerationNo" placeholder="주민번호을 입력하세요" required>
		<div class="genderDiv">
		* 성별
		</div>
		<div class="form-check">		
		<input type="radio" class="form-check-input" id="genderM" name="gender" value="M" checked >
		<label for="genderM" style="color:black;">남자</label>
		<br>
		<input type="radio" class="form-check-input" id="genderF" name="gender" value="F">
		<label for="genderF" style="color:black;">여자</label>		
		</div>
		<br>
		<div>
			<label for="participatePhone">* 전화번호</label>
		</div>
		<input type="text" class="form-control" id="participatePhone" name="participatePhone" placeholder="000-0000-0000 형태로 입력하세요"
			required>
		<div>
			<label for="participateAddress">* 주소</label>
		</div>
		<div class="participateAddress">					
			<input type="text" name="sample6_postcode" id="sample6_postcode" placeholder="우편번호">
			<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
			<input type="text" name="sample6_address" id="sample6_address" placeholder="주소"><br>
			<input type="text" name="sample6_detailAddress" id="sample6_detailAddress" placeholder="상세주소">
			<input type="text" name="sample6_extraAddress" id="sample6_extraAddress" placeholder="참고항목">
		</div>
		<br><br><br><br>
		<div class="submitDiv">
		<button type="submit" class="btn btn-success" style="width:570px; height:80px; font-size:27px" >제출하기</button>
		</div>
	</form>
	</div>	
</body>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>
</html>