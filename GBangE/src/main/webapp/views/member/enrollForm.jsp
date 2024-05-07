<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <title>회원가입</title>
  
    
<style>

*{
  box-sizing: border-box;
  font-family: "Noto Sans CJK KR";
  font-style: normal;
}

#container {
  display: flex;
  flex-direction: column;
  align-items: center;
  width: 670px;
  height: 1300px;
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
  height: 818px;
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
  margin-top: 21px;
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
}
input:focus {
  outline: none;
}
.user-info-id{
  position: relative;
}

.user-info-id>button{
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

.user-info-weight{
	margin-bottom: 50px;
}

.user-info-birth{
	margin-left: 10px;
	margin-bottom: 50px;

}
.user-info-birth select{
	margin-left: 5px;
}

.user-info-shoes{
	margin-right: 125px;
}
.user-info-shoes>select{
	margin-left: 15px;
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


    </style>
  </head>
  <body>
     <%@include file="/views/common/menubar.jsp"%>
    	
	  <form action="/gbange/insert.me" method="post">
	    <div id="container">
	      <div class="member-container">
	        <div id="header" align="center">
	          <h1>회원가입</h1>
	        </div>
	        <div class="user-info">
	        
	          <div class="user-info-id">
	            <div>* 아이디 </div>
	            <input type="text" name="userId" id="userId"/>
	            <button type="button" onclick="idCheck();">중복확인</button>
	          </div>
	            <div id="hidden-idArea" style="display:none;"></div>
	          
	          <div class="user-info-name">
	            <div>* 이름</div>
	            <input type="text" name="userName" id="userName"/>
	          </div>
	          	<div id="hidden-nameArea" style="display:none;"></div>
	          
	          <div class="user-info-pw">
	            <div>* 비밀번호</div>
	            <input type="password" name="userPwd" id="userPwd"/>
	          </div>
	          	<div id="hidden-pwdArea" style="display:none;"></div>
	          
	          <div class="user-info-pw-check">
	            <div>* 비밀번호 확인</div>
	            <input type="password" id="checkPwd"/>
	          </div>
	          	<div id="hidden-checkPwdArea" style="display:none;"></div>
	          
	          <div class="user-info-address">
	            <div>  주소</div>
	            <input type="text" name="address" id="address">
	          </div>
	
	          <div class="user-info-weight">
	            <div> 몸무게 (소수점 2자리)</div>
	            <input type="number" step="0.02" name="weight" id="weight">
	          </div>
	
				
			  <div class="user-info-birth" align="center">
	            <div> 생년월일 
	             <select name="year" id="year">
                        <option value = "1994">1994</option>
                        <option value = "1995">1995</option>
                        <option value = "1996">1996</option>
                        <option value = "1997">1997</option>
                        <option value = "1998">1998</option>
                        <option value = "1999">1999</option>
                        <option value = "2000">2000</option>
                        <option value = "2001">2001</option>
                        <option value = "2002">2002</option>
                        <option value = "2003">2003</option>
                        <option value = "2004">2004</option>
                        <option value = "2005">2005</option>
                        <option value = "2006">2006</option>
                        <option value = "2007">2007</option>
                        <option value = "2008">2008</option>
                        <option value = "2009">2009</option>
                        <option value = "2010">2010</option>
                        <option value = "2011">2011</option>
                        <option value = "2012">2012</option>
                        <option value = "2013">2013</option>
                        <option value = "2014">2014</option>
                        <option value = "2015">2015</option>
                        <option value = "2016">2016</option>
                        <option value = "2017">2017</option>
                        <option value = "2018">2018</option>
                        <option value = "2019">2019</option>
                        <option value = "2020">2020</option>
                        <option value = "2021">2021</option>
                        <option value = "2022">2022</option>
                        <option value = "2023">2023</option>
                        <option value = "2024">2024</option>
                </select> 년 
	            <select name="month" id="month">
                        <option value = "01">1</option>
                        <option value = "02">2</option>
                        <option value = "03">3</option>
                        <option value = "04">4</option>
                        <option value = "05">5</option>
                        <option value = "06">6</option>
                        <option value = "07">7</option>
                        <option value = "08">8</option>
                        <option value = "09">9</option>
                        <option value = "10">10</option>
                        <option value = "11">11</option>
                        <option value = "12">12</option>
               </select> 월 
               <select name="day" id="day">
                        <option value = "01">1</option>
                        <option value = "02">2</option>
                        <option value = "03">3</option>
                        <option value = "04">4</option>
                        <option value = "05">5</option>
                        <option value = "06">6</option>
                        <option value = "07">7</option>
                        <option value = "08">8</option>
                        <option value = "09">9</option>
                        <option value = "10">10</option>
                        <option value = "11">11</option>
                        <option value = "12">12</option>
                        <option value = "13">13</option>
                        <option value = "14">14</option>
                        <option value = "15">15</option>
                        <option value = "16">16</option>
                        <option value = "17">17</option>
                        <option value = "18">18</option>
                        <option value = "19">19</option>
                        <option value = "20">20</option>
                        <option value = "21">21</option>
                        <option value = "22">22</option>
                        <option value = "23">23</option>
                        <option value = "24">24</option>
                        <option value = "25">25</option>
                        <option value = "26">26</option>
                        <option value = "27">27</option>
                        <option value = "28">28</option>
                        <option value = "29">29</option>
                        <option value = "30">30</option>
                        <option value = "31">31</option>
                </select> 일
                </div> 
	          </div>
			
	          <div class="user-info-shoes" align="center">
	            러닝화 
	            <select name="shoes">
	                <option value="기타">기타</option>
	                <option value="맨발">맨발</option>
	                <option value="운동화">운동화</option>
	                <option value="스니커즈">스니커즈</option>
	            </select>
	          </div>
	          <div>
	            
	          </div>
	        </div>
	        <div class="gender">
	          <input type="radio" name="gender" id="women" value="W" /><label for="women">여성</label>
	          <input type="radio" name="gender" id="men" value="M" /><label for="men">남성</label>
	        </div>
	        <div class="btn">
	          <button type="submit" id="enroll-btn" onclick="return enroll();" disabled>회원가입</button>
	          <br>
	          <button type="button" onclick="enroll();">확인버튼</button>
	        </div>
	      </div>
	    </div>
    </form>
    
    <script>
    	
    	//회원가입 정규표현식
    	function enroll(){
    	var id = $("#userId");
    	var name = $("#userName");
        var pwd = $("#userPwd");
        var checkPwd = $("#checkPwd");
        var birth = $("#user-birth");
        var address = $("#address");
        var weight = $("#weight");
        
        var regName = /^[가-힣a-zA-Z]{2,15}$/;
        var regPwd = regExp = /^[a-zA-Z0-9!@#$%^&*]{4,15}$/;
        
        //이름 null값 비교
        if(name.val() == ""){
        	$("#hidden-nameArea").html("*이름을 입력하세요.").show();
            $("#hidden-nameArea").css({"color":"red"});
            name.focus();
            return false;
        //이름 형식 비교
        }else if(!regName.test(name.val())){
        	$("#hidden-nameArea").html("*최소 2글자 이상, 한글과 영어만 입력하세요.").show();
            $("#hidden-nameArea").css({"color":"red"});
            name.focus();
            return false;
        }else{
        	$("#hidden-nameArea").hide();
        }
        
        //비밀번호 null값 비교
        if(pwd.val() == ""){
        	$("#hidden-pwdArea").html("*비밀번호를 입력하세요.").show();
            $("#hidden-pwdArea").css({"color":"red"});
            pwd.focus();
            return false;
		//비밀번호 형식 비교
        }else if(!regPwd.test(pwd.val())){
        	$("#hidden-pwdArea").html("*4~15자 영문 대소문자, 숫자, 특수기호만 입력하세요.").show();
        	$("#hidden-pwdArea").css({"color":"red"});
            pwd.focus();
            return false;
		//비밀번호 아이디값 비교
        }else if(pwd.val() == id.val()){
        	$("#hidden-pwdArea").html("*아이디와 동일한 비밀번호를 사용할 수 없습니다.").show();
        	$("#hidden-pwdArea").css({"color":"red"});
            pwd.focus();
            return false;
        }else{
        	$("#hidden-pwdArea").hide();
        }
        
        //비밀번호 동일여부 체크
        if(checkPwd.val() !== pwd.val()){
        	$("#hidden-checkPwdArea").html("*비밀번호와 동일하지 않습니다.").show();
        	$("#hidden-checkPwdArea").css({"color":"red"});
            checkPwd.focus();
            return false;
        }else{
        	$("#hidden-checkPwdArea").hide();
        }

    	}
    
    	//아이디 중복체크
    	function idCheck(){
    		var inputId = $("#userId");
            var regIdPw = /^[a-zA-Z0-9]{4,15}$/;
    		
    		$.ajax({
    			url : "/gbange/idCheck.me",
    			data : {
    				inputId : inputId.val()
    			},
    			success : function(result){
    				//아이디 null값 비교
    		        if(inputId.val() == ""){
    		            $("#hidden-idArea").html("*아이디를 입력하세요.").show();
    		            $("#hidden-idArea").css({"color":"red"});
    		            inputId.focus();
    		            $("#enroll-btn").css({"backgroundColor":"#8990a0","cursor":"auto","color":"#ffffff"}).prop("disabled",true);
    		            return false;
    		        //아이디 형식 비교
    		        }else if(!regIdPw.test(inputId.val())){
    		            $("#hidden-idArea").html("*4~12자 영문 대소문자, 숫자만 입력하세요.").show();
    		            $("#hidden-idArea").css({"color":"red"});
    		        	inputId.focus();
    		        	$("#enroll-btn").css({"backgroundColor":"#8990a0","cursor":"auto","color":"#ffffff"}).prop("disabled",true);
    		        	return false;
    		        	//중복아이디 비교
    		        }else if(result == "NNNNN"){
    					$("#hidden-idArea").html("*사용불가능한 아이디입니다.").show();
    					$("#hidden-idArea").css({"color":"red"});
    					inputId.focus();
    					$("#enroll-btn").css({"backgroundColor":"#8990a0","cursor":"auto","color":"#ffffff"}).prop("disabled",true);
 	
    				}else{
    					$("#hidden-idArea").html("*사용가능한 아이디입니다.").show();
    					$("#hidden-idArea").css({"color":"green"});
    					$("#enroll-btn").css({"backgroundColor":"#aacdff","cursor":"pointer","color":"#000"}).prop("disabled",false);
    				}
    			},
    			error : function(){
    				console.log("오류");
    			}
    		});
    	}
    </script>
  </body>
</html>