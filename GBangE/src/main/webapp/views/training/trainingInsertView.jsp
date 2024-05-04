<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>게시판 글쓰기 페이지</title>
<style>
.board_wrap {
	margin: 30px;
}

.board_write {
	border-top: 2px solid #000;
}

.board_write .title, .board_write .info {
	padding: 15px;
}

.info table th, td {
	height: 20px;
	word-break: break-all;
	vertical-align: middle;
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
#secret {
	display: none;
}

label {
	display: block;
	float: right;
	width: 50px;
	height: 50px;
}
/* 공개 */
#secret+label {
	background-repeat: no-repeat;
	background-image: url('/gbange/views/training/img/unlock_icon.png');
}
/* 비공개 */
#secret:checked+label {
	background-repeat: no-repeat;
	background-image: url('/gbange/views/training/img/lock_icon.png');
}

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

.board_write .info select, input[type="text"] {
	width: 100%;
}

.board_write .info select, input[type="number"] {
	width: 80%;
}

.board_write .title input[type="text"] {
	width: 80%;
}

.board_write input:focus {
	outline: none;
}

.board_write input {
	padding: 10px;
	box-sizing: border-box;
	border-width: 0;
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
			<h1>러닝일지</h1>
			<p>러닝일지 페이지입니다.</p>
		</div>
		<form action="/gbange/insert.tr" method="post" id="training-area">
			<!-- <input type="hidden" name="memberNo" value=""> 나중에 로그인 기능 구현되면 가져올 것 -->
			<div class="board_write_wrap">
				<div class="board_write">
					<div class="title">
						<dl>
							<dd>
								<input type="text" placeholder="훈련명을 입력해주세요."
									name="trainingTitle"> <input type="checkbox" name="secret"
									id="secret"><label for="secret"></label>
							</dd>
							<dd style="text-align: right;">
								달린 날짜 : <input type="date" name="trainingDate">
							</dd>
						</dl>
					</div>
					<div class="info">
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
								<td><input type="number" step="0.01" min="1" max="100"
									name="trainingDistance">km</td>
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
								<td><input type="number" step="0.01" min="20" max="200"
									name="weight"></td>
							</tr>
						</table>
					</div>
					<div class="cont">
						<textarea name="trainingContent"
							placeholder="달릴 때 심박은 어땠나요?&#13;&#10;함께 달리는 사람이 있었나요?&#13;&#10;그냥 달릴 때의 기분, 생각 등을 자유롭게 작성해보세요 :)"></textarea>
					</div>
				</div>
				<br>
				<div class="bt_wrap">
					<button type="submit" class="btn btn-success">등록</button>
					<button href="" class="btn btn-outline-secondary">취소</button>
				</div>
			</div>
		</form>
	</div>
</body>
</html>