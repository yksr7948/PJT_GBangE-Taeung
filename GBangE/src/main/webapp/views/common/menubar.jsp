<%@page import="com.kh.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
Member loginUser = (Member)session.getAttribute("loginUser");
String alertMsg = (String)session.getAttribute("alertMsg");
String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
      <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<style>
*{
    padding: 0;
    margin: 0;
}
ul,ol{
    list-style:none
}
a{
    text-decoration:none;color:black;font-size:20px
}
nav{
    width:100%; height: 70px; overflow:hidden;background-color:lightblue;
}
#nav2>a {
  display: block;
  float: left;
  font-size: 100px;
  font-weight: 900px;
  line-height: 80px;
  padding: 0 30px;
}
#nav2>ul {
  float: right;
}
#nav2>ul li {
  float: left;
  padding: 0 30px;
  line-height: 80px;
  margin: auto;
  margin-top: -18px;
}
#top-nav ul li {
    display: inline-block;
    padding: 10px 20px;
}
#top-nav ul {
    background-color: lightcyan;
    text-align: right;
}
#nav2 > a > img.logo {
    height: 200px;
    max-width: 200px;
    vertical-align: middle;
    margin: auto;
  margin-top: -70px;
}
</style>
<body>
<script>
var msg = "<%=alertMsg%>";
if(msg!="null"){
alert(msg);
<%session.removeAttribute("alertMsg");%>
}
</script>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
  <nav id="top-nav">
    <ul>
        <li><input type="button" onclick="loginView();" value="로그인" ></li>
        <li><a href="#">로고</a></li>
        <li><a href="#">로고</a></li>
    </ul>
</nav>
<nav id="nav2">
      <a href="#"> <img src="/gbange/views/common/resources/img/Logo-Black.png" alt="지방이" class="logo"></a>
        <ul>
          <li><a href="/gbange/list.no">공지사항</a></li>
          <li><a href="${contextPath}/list.tr?currentPage=1">러닝일지 게시판</a></li>
          <li><a href="/gbange/list.fe">대회참여인증 게시판</a></li>
          <li><a href="#">Q/A</a></li>
        </ul>
      </nav>
      
      <script>
      	function loginView(){
      		location.href="views/member/loginForm.jsp";
      	}
      </script>
</body>
</html>