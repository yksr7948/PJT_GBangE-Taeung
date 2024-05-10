<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>회원가입</title>

<style>
* {
	box-sizing: border-box;
	font-family: "Noto Sans CJK KR";
	font-style: normal;
}

#container {
	display: flex;
	flex-direction: column;
	align-items: center;
	width: 670px;
	height: 1800px;
	margin: auto;
	margin-top: 60px;
	margin-bottom: 60px;
	border: 1px solid #aacdff;
	box-shadow: 7px 7px 39px rgba(0, 104, 255, 0.25);
	border-radius: 20px;
}

.member-container {
	display: flex;
	flex-direction: column;
	align-items: center;
	width: 470px;
	height: 1018px;
	margin-top: 72px;
	margin-bottom: 70px;
}

#header {
	width: 466px;
	height: 94px;
	font-weight: 700;
	font-size: 32px;
	line-height: 47px;
	margin-bottom: 50px;
	color: #0068ff;
}

.user-info {
	margin-top: 39px;
}

.user-info div {
	margin-top: 40px;
}

.user-info input {
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

.user-info select{
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

.user-info-id {
	position: relative;
}

.user-info-id>button {
	position: absolute;
	width: 90px;
	height: 40px;
	top: 0;
	bottom: 0;
	right: 5px;
	margin: auto;
	margin-bottom: 0px;
	margin-right: -5px;
	color: #0068ff;
	border: 1px solid #0068ff;;
	border-radius: 3px;
}

.user-info-address{
	position: relative;
}
.user-info-address>button{
	position: absolute;
	width: 90px;
	height: 40px;
	top: 0;
	bottom: 0;
	right: 5px;
	margin: auto;
	margin-bottom: 0px;
	margin-right: -5px;
	color: #0068ff;
	border: 1px solid #0068ff;;
	border-radius: 3px;
}
#sample6_detailAddress, #sample6_extraAddress{
	font-weight: 400;
	font-size: 16px;
	line-height: 24px;
	color: #797979;
	border: none;
	border-bottom: 1px solid #0068ff;
	width: 232px;
	height: 40px;
	margin-top: 21px;
}

.gender {
	display: flex;
	align-items: center;
	justify-content: space-between;
	width: 140px;
	height: 23.94px;
	margin-top: 30px;
	margin-bottom: 30px;
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

#enroll-btn {
	width: 470px;
	height: 75px;
	font-weight: 400;
	font-size: 18px;
	line-height: 27px;
	color: #ffffff;
	background: #8990a0;
	margin: auto;
	margin-top: 30px;
	display: block;
	border: 1px solid gray;
	border-radius: 10px;
}
#hidden-shoseArea{
	display:none;
	margin-top: -20px;
}
</style>
</head>
<body>
	<%@include file="/views/common/menubar.jsp"%>

	<form action="/gbange/insert.me" method="post">
		<div id="container">
			<div class="member-container">
				<div id="header" align="center">
					<h1 style="font-size:60px; font-weight:700">회원가입</h1>
				</div>
				<div class="user-info">

					<div class="user-info-id">
						<div style="font-weight:700">* 아이디</div>
						<input type="text" name="userId" id="userId" />
						<button type="button" onclick="idCheck();" style="font-size:12px;">중복확인</button>
					</div>
					<div id="hidden-idArea" style="display: none; margin-top:10px;"></div>

					<div class="user-info-name">
						<div style="font-weight:700">* 이름</div>
						<input type="text" name="userName" id="userName" />
					</div>
					<div id="hidden-nameArea" style="display: none; margin-top:10px;"></div>

					<div class="user-info-pw">
						<div style="font-weight:700">* 비밀번호</div>
						<input type="password" name="userPwd" id="userPwd" />
					</div>
					<div id="hidden-pwdArea" style="display: none; margin-top:10px;"></div>

					<div class="user-info-pw-check">
						<div style="font-weight:700">* 비밀번호 확인</div>
						<input type="password" id="checkPwd" />
					</div>
					<div id="hidden-checkPwdArea" style="display: none; margin-top:10px;"></div>

					<div class="user-info-pno">
						<div style="font-weight:700">* 주민등록번호</div>
						<input type="text" name="userPno1" id="userPno1" /> 
						<font style="font-size: 30px">-</font> 
						<input type="password"name="userPno2" id="userPno2" />
					</div>
					<div id="hidden-pnoArea" style="display: none; margin-top:10px;"></div>
					
					<div class="user-info-address">
						<div style="font-weight:700">*주소</div>
						<input type="text" id="sample6_postcode" placeholder="우편번호">
						<button type="button" onclick="sample6_execDaumPostcode()" style="font-size:12px;">우편번호 찾기</button><br> 
					</div>
						<input type="text" id="sample6_address" name="address" placeholder="주소"><br> 
						<input type="text" id="sample6_detailAddress" name="address_dt" placeholder="상세주소">
						<input type="text" id="sample6_extraAddress" placeholder="참고항목">

					<div class="user-info-weight">
						<div style="font-weight:700">몸무게 (소수점 2자리)</div>
						<input type="number" step="0.01" name="weight" id="weight" value=0.0>
					</div>

					<div class="user-info-shoes" style="font-weight:700">
						러닝화 
						<select name="shoes" id="shose">
							<option value="0">맨발</option>
							<option value="1">운동화</option>
							<option value="2">스니커즈</option>
							<option value="3">기타</option>
						</select>
					</div>
				</div>
					
					<br><br>
					
				<div class="gender">			
					<input type="radio" name="gender" id="men"value="0" />
					<label for="men" style="font-weight:700">남성</label>
					
					<input type="radio" name="gender" id="women" value="1" />
					<label for="women" style="font-weight:700">여성</label> 
					
				</div>
				<div class="btn">
					<button type="submit" id="enroll-btn" onclick="return enroll();"
						disabled>회원가입</button>
				</div>
			</div>
		</div>
	</form>

	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
		function sample6_execDaumPostcode() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
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
							if (data.userSelectedType === 'R') {
								// 법정동명이 있을 경우 추가한다. (법정리는 제외)
								// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
								if (data.bname !== ''
										&& /[동|로|가]$/g.test(data.bname)) {
									extraAddr += data.bname;
								}
								// 건물명이 있고, 공동주택일 경우 추가한다.
								if (data.buildingName !== ''
										&& data.apartment === 'Y') {
									extraAddr += (extraAddr !== '' ? ', '
											+ data.buildingName
											: data.buildingName);
								}
								// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
								if (extraAddr !== '') {
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
							document.getElementById("sample6_detailAddress")
									.focus();
						}
					}).open();
		}
	</script>

	<script>
		
		//회원가입 정규표현식
		function enroll() {
			var id = $("#userId");
			var name = $("#userName");
			var pwd = $("#userPwd");
			var checkPwd = $("#checkPwd");
			var pno1 = $("#userPno1");
			var pno2 = $("#userPno2");
			var address = $("#address");
			var weight = $("#weight");

			var regName = /^[가-힣a-zA-Z]{2,15}$/;
			var regPwd = /^[a-zA-Z0-9!@#$%^&*]{4,15}$/;
			var regBirth = /^([0-9]{2}(0[1-9]|1[0-2])(0[1-9]|[1,2][0-9]|3[0,1]))$/;
			var regPno = /^[1-4]\d{6}$/;

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
			} else if (pwd.val() == id.val()) {
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

			//주민번호 null값 체크
			if (pno1.val() == "" && pno2.val() == "") {
				$("#hidden-pnoArea").html("*주민번호를 입력하세요.").show();
				$("#hidden-pnoArea").css({
					"color" : "red"
				});
				pno1.focus();
				return false;
			} else if (!regBirth.test(pno1.val())) {
				$("#hidden-pnoArea").html("*생년월일을 잘못입력했습니다.").show();
				$("#hidden-pnoArea").css({
					"color" : "red"
				});
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

			//weight가 null값일때
			if ($("#weight").val() == "") {
				$("#weight").val(0);
			}

		}

		//아이디 중복체크
		function idCheck() {
			var inputId = $("#userId");
			var regIdPw = /^[a-zA-Z0-9]{4,15}$/;

			$.ajax({
				url : "/gbange/idCheck.me",
				data : {
					inputId : inputId.val()
				},
				success : function(result) {
					//아이디 null값 비교
					if (inputId.val() == "") {
						$("#hidden-idArea").html("*아이디를 입력하세요.").show();
						$("#hidden-idArea").css({
							"color" : "red"
						});
						inputId.focus();
						$("#enroll-btn").css({
							"backgroundColor" : "#8990a0",
							"cursor" : "auto",
							"color" : "#ffffff"
						}).prop("disabled", true);
						return false;
						//아이디 형식 비교
					} else if (!regIdPw.test(inputId.val())) {
						$("#hidden-idArea").html("*4~12자 영문 대소문자, 숫자만 입력하세요.")
								.show();
						$("#hidden-idArea").css({
							"color" : "red"
						});
						inputId.focus();
						$("#enroll-btn").css({
							"backgroundColor" : "#8990a0",
							"cursor" : "auto",
							"color" : "#ffffff"
						}).prop("disabled", true);
						return false;
						//중복아이디 비교
					} else if (result == "NNNNN") {
						$("#hidden-idArea").html("*사용불가능한 아이디입니다.").show();
						$("#hidden-idArea").css({
							"color" : "red"
						});
						inputId.focus();
						$("#enroll-btn").css({
							"backgroundColor" : "#8990a0",
							"cursor" : "auto",
							"color" : "#ffffff"
						}).prop("disabled", true);

					} else {
						$("#hidden-idArea").html("*사용가능한 아이디입니다.").show();
						$("#hidden-idArea").css({
							"color" : "green"
						});
						$("#enroll-btn").css({"backgroundColor":
											  "#fff","cursor":"pointer",
											  "color":"#000", 
											  "border":"1px solid #aacdff"}).prop("disabled",false);
					}
				},
				error : function() {
					console.log("오류");
				}
			});
		}
	</script>
</body>
</html>