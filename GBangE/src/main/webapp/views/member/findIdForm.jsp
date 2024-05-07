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
  	height: 800px;
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
	height: 818px;
	margin-top: 72px;
	margin-bottom: 70px;
}
#header{
  	width: 466px;
 	height: 94px;
  	font-weight: 700;
  	font-size: 32px;
  	line-height: 47px;
  	color: #0068ff;
  	margin-bottom: 50px;
}
#user-info-name input{
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
.user-info-birth{
	margin-top: 50px;
	margin-left: 10px;
	margin-bottom: 50px;

}
.user-info-birth select{
	margin-left: 5px;
}
</style>
</head>
<body>
<%@include file="/views/common/menubar.jsp"%>

<div id="container">
	<div id="container2">
		<div id="header">
			<h1 align="center">아이디 찾기</h1>
		</div>
		<form action="" method="post">
			<div id="user-info-name">
	        	<div>이름</div>
	            <input type="text" name="userName" id="userName"/>
	        </div>
	        <div class="user-info-birth">
	            <div>생년월일
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
		</form>
	</div>
</div>
</body>
</html>