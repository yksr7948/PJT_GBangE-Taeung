<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>

<style>
/*기본 설정*/
* {
	margin: 0;
	padding: 0;
}

html {
	font-size: 10px;
}

a {
	text-decoration: none;
	color: inherit;
}

.board_wrap {
	width: 1000px;
	margin: 100px auto;
}

/*제목, 부제목 설정*/
.board_title {
	margin-bottom: 30px;
}

.board_title h1 {
	font-size: 3rem;
}

.board_title p {
	margin-top: 5px;
	font-size: 1.4rem;
}

/*버튼 설정*/
.bt_wrap {
	margin-top: 30px;
	text-align: center;
	font-size: 0;
}

.bt_wrap a {
	display: inline-block;
	min-width: 80px;
	margin-left: 10px;
	padding: 10px;
	border: 1px solid #000;
	border-radius: 2px;
	font-size: 1.4rem;
}

.bt_wrap a.on {
	background-color: #000;
	color: #fff;
}

.bt_wrap a:nth-child(1) {
	margin-left: 0;
}

/*리스트 블록 설정*/
.board_list {
	width: 100%;
	border-top: 2px solid #000;
}

.board_list>div {
	border-bottom: 1px solid #ddd;
	text-align: center;
}

.board_list>div.top {
	border-bottom: 1px solid #999;
}

.board_list>div:last-child {
	border-bottom: 2px solid #000;
}

.board_list>div>div {
	display: inline-block;
	vertical-align: middle;
	padding: 15px 0;
	font-size: 1.4rem;
}

.board_list>div.top>div {
	font-weight: 600;
}

/*공백 영역 설정*/
.board_list .num {
	width: 10%;
}

.board_list .title {
	width: 60%;
	text-align: left;
}

.board_list .top .title {
	text-align: center;
}

.board_list .writer {
	width: 10%;
}

.board_list .date {
	width: 10%;
}

.board_list .count {
	width: 8%;
}

/*페이지 설정*/
.board_page {
	margin-top: 30px;
	text-align: center;
	font-size: 0;
}

.board_page a {
	display: inline-block;
	width: 30px;
	height: 30px;
	box-sizing: border-box;
	vertical-align: middle;
	border: 1px solid #ddd;
	border-left: 0;
	line-height: 100%;
}

.board_page a.btn {
	padding-top: 7px;
	font-size: 1.2rem;
	letter-spacing: -3px;
}

.board_page a.num {
	padding-top: 6px;
	font-size: 1.4rem;
}

.board_page a.num.selected {
	background-color: #000;
	border-color: #000;
	color: #fff;
}

.board_page a.frist {
	border-left: 1px solid #ddd;
}
</style>
</head>

<body>
<body>
<%@include file="/views/common/menubar.jsp"%>

	<div class="board_wrap">
		<div class="board_title">
			<h1>대회참여인증</h1>
			<p>대회참여인증 페이지입니다.</p>
		</div>
		<div class="board_list_wrap">
			<div class="board_list">
				<div class="top">
					<div class="num">글 번호</div>
					<div class="title">제목</div>
					<div class="writer">작성자</div>
					<div class="date">작성일</div>
					<div class="count">조회수</div>
				</div>
		
			</div>
			<div class="board_page">
				<a href="#" class="btn frist"> &lt;&lt; </a> <a href="#"
					class="btn prew"> &lt; </a> <a href="#" class="num selected">1</a>
				<a href="#" class="num">2</a> <a href="#" class="btn next">&gt;</a>
				<a href="#" class="btn last">&gt;&gt;</a>
			</div>
			<div class="bt_wrap">
				<a href="list.html" class="on">글쓰기</a> <a href="">수정</a>
			</div>
		</div>
	</div>
</body>

</body>
</html>