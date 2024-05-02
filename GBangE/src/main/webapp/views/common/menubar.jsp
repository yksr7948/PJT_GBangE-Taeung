<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<style>
*{
    padding:0;margin:0
}
ul,ol{
    list-style:none
}
a{
    text-decoration:none;color:#fff;font-size:15px
}
nav{
    width:80%;overflow:hidden;height:80px;background-color:#1b2035;margin:50px auto
}
#nav2>a {
  display: block; 
  float: left;
  font-size: 30px;
  font-weight: 900;
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
}
</style>
<body>

    <nav id="nav2">
        <a href="#">logo</a>
        <ul>
          <li><a href="#">menu1</a></li>
          <li><a href="#">menu2</a></li>
          <li><a href="#">menu3</a></li>
          <li><a href="#">menu4</a></li>
          <li><a href="#">menu5</a></li>
        </ul>
      </nav>
</body>
</html>