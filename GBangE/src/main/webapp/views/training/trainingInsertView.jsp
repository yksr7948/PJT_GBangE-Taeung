<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>게시판 글쓰기 페이지</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>

<!-- Popper JS -->
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<style>
.board_wrap {
	margin: 30px;
}

.board_write {
	border-top: 2px solid #000;
}

.board_write .title, .board_write .info {
	padding: 15px;
	font-size: 0;
}

.board_write .info {
	border-top: 1px dashed #ddd;
	border-bottom: 1px solid #000;
}

.board_write .cont {
	border-bottom: 2px solid #000;
}

/*textarea*/
.board_write .cont textarea {
	display: block;
	width: 100%;
	height: 300px;
	padding: 15px;
	box-sizing: border-box;
	border: 0;
	resize: vertical;
}

/*title, info 설정*/
.board_write .title dt, .board_write .title dd, .board_write .info dt,
	.board_write .info dd {
	display: inline-block;
	vertical-align: middle;
	font-size: 1.4rem;
}

.board_write .title dt, .board_write .info dt {
	width: 100px;
}

.board_write .title dd {
	width: calc(100% - 100px);
}

.board_write .info dl {
	display: inline-block;
	width: 50%;
	vertical-align: middle;
}

.board_write .title input[type="text"] {
	width: 80%;
}

.board_write input[type="text"], .board_write input[type="password"] {
	padding: 10px;
	box-sizing: border-box;
}

.bt_wrap {
	margin-top: 30px;
	text-align: center;
	font-size: 0;
}

.bt_wrap a {
	display: inline-block;
	min-width: 100px;
	margin-left: 10px;
	padding: 10px;
	border-radius: 2px;
	font-size: 1.4rem;
	text-decoration: none;
}
</style>
</head>

<body>
<%@include file="/views/common/menubar.jsp"%>
	<div class="board_wrap">
		<div class="board_title">
			<h1>훈련일지</h1>
			<p>훈련일지 페이지입니다.</p>
		</div>
		<form action="">
			<div class="board_write_wrap">
				<div class="board_write">
					<div class="title">
						<dl>
							<dt>제목</dt>
							<dd>
								<input type="text" placeholder="제목 입력">
							</dd>
						</dl>
					</div>
					<div class="info">
						<!-- 여기는 원래 작성하신 분이 만든 양식인데요, 여기에 저희가 기획했던 드롭박스나 체크박스 등등을 대신 넣으면 될 것 같습니다! -->
						<dl>
							<dt></dt>
							<dd></dd>
						</dl>
					</div>
					<div class="cont">
						<textarea placeholder="내용 입력"></textarea>
					</div>
				</div>
				<br>
				<div class="bt_wrap">
					<a href="" class="btn btn-success">등록</a> <a href=""
						class="btn btn-outline-secondary">취소</a>
				</div>
			</div>
		</form>
	</div>
</body>
</html>