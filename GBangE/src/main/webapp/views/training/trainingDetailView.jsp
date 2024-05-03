<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
<title>Insert title here</title>
<style>
.board_wrap {
	margin: 30px;
}
/*기본 구조*/
.board_view {
	width: 100%;
	border-top: 2px solid #000;
	font-size: 1.4rem;
}

.board_view .title {
	padding: 20px 15px;
	border-bottom: 1px solid #ddd;
	font-size: 2rem;
}

.board_view .info {
	padding: 15px;
	border-bottom: 1px solid #999;
	font-size: 0;
}

.board_view .cont {
	padding: 15px;
	border-bottom: 2px solid #000;
	line-height: 160%;
	font-size: 1.4rem;
}

/*info 설정*/
.board_view .info dl {
	display: inline-block;
	padding: 0 20px;
	position: relative;
}

.board_view .info dl:first-child {
	padding-left: 0;
}

.board_view .info dl::before {
	content: "";
	position: absolute;
	top: 3px;
	left: 0;
	display: block;
	width: 1px;
	height: 13px;
	background-color: #ddd;
}

.board_view .info dl:first-child::before {
	display: none;
}

.board_view .info dl dd, .board_view .info dl dt {
	display: inline-block;
	font-size: 1.4rem;
}

.board_view .info dl dd {
	margin-left: 10px;
	color: #777;
}
</style>
</head>
<body>
<%@include file="/views/common/menubar.jsp"%>
	    <div class="board_wrap">
		<div class="board_title">
			<h1>러닝일지</h1>
			<p>러닝일지 페이지입니다.</p>
		</div>
		<div class="board_view_wrap">
			<div class="board_view">
				<div class="title">글 제목이 들어갑니다.</div>
				<div class="info">
					<dl>
						<dt>번호</dt>
						<dd>3</dd>
					</dl>
					<dl>
						<dt>글쓴이</dt>
						<dd>홍길순</dd>
					</dl>
					<dl>
						<dt>작성일</dt>
						<dd>2023-07-27</dd>
					</dl>
					<dl>
						<dt>조회</dt>
						<dd>32</dd>
					</dl>
				</div>
                <table class="table table-hover">
                    <tr>
                        <th>훈련종류</th>
                        <td><select name="category">
                        <c:forEach items="${tCList}" var="tc">
                                <option value="${tc.trainingKey }">${tc.trainingName }</option>
                        </c:forEach>
                        </select></td>
                        <th>착용신발</th>
                        <td><select name="shoes">
                        <!-- shoes 조회 기능 구현되면 가져올 것 -->
                        </select></td>
                    </tr>
                    <tr>
                        <th>훈련장소</th>
                        <td><input type="text" name="trainingPlace"></td>
                        <th>운동거리(km)</th>
                        <td><input type="number" step="0.01" min="1" max="100" name="trainingDistance">km</td>
                    </tr>
                    <tr>
                        <th>운동시간</th>
                        <td><input type="number" step="0.1" name="trainingTime"></td>
                        <th>평균페이스</th>
                        <td><input type="number" readonly value="">/km</td>
                    </tr>
                    <tr>
                        <th>목표</th>
                        <td><input type="text" name="trainingGoal"></td>
                        <th>현재 체중(kg)</th>
                        <td><input type="number" step="0.01" min="20" max="200" name="weight"></td>
                    </tr>
                </table>
                <hr>
				<div class="cont">

					글 내용이 들어갑니다<br> 글 내용이 들어갑니다<br> 글 내용이 들어갑니다<br> 글
					내용이 들어갑니다<br> 글 내용이 들어갑니다<br> 글 내용이 들어갑니다<br> 글 내용이
					들어갑니다
				</div>
			</div>
			<br>
			<div class="bt_wrap">
				<a href="" class="btn btn-outline-secondary">목록</a> <a href=""
					class="btn btn-success">수정</a>
			</div>
		</div>
	</div>
</body>
</html>