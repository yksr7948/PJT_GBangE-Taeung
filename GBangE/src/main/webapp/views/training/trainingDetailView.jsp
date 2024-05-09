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
<title>${training.trainingTitle}</title>
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

.cont {
	word-break: break-all;
	height: 500px;
}

#uploadImg {
	float: right;
}
/* 댓글 기능 */
.comment-area {
	border: 1px solid lightslategray;
	border-radius: 10px;
	width: 100%;
}

.comment-write {
	margin: 10px;
}

.comment-write>textarea {
	border: none;
	width: 100%;
	margin-top: 10px;
}

.comment-btn {
	display: flex;
	margin: 10px;
}

.right {
	justify-content: right;
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
				<div class="title">${training.trainingTitle}</div>
				<div class="info">
				<input type="hidden" value="${loginUser.memberName }" id="memberName">
					<dl>
						<dt>번호</dt>
						<dd>${training.trainingNo}</dd>
					</dl>
					<dl>
						<dt>글쓴이</dt>
						<dd>${training.trainingWriter}</dd>
					</dl>
					<dl>
						<dt>작성일</dt>
						<dd>${training.recordDate}</dd>
					</dl>
					<dl>
						<dt>조회</dt>
						<dd>${training.count}</dd>
					</dl>
				</div>
				<table class="table">
					<tr>
						<th>훈련종류</th>
						<td>${training.trainingKey}</td>
						<th>착용신발</th>
						<td>
							<!-- shoes 조회 기능 구현되면 가져올 것 -->
						</td>
					</tr>
					<tr>
						<th>훈련장소</th>
						<td>${training.trainingPlace}</td>
						<th>운동거리</th>
						<td>${training.trainingDistance}km</td>
					</tr>
					<tr>
						<th>운동시간</th>
						<td>${training.trainingTime }분</td>
						<th>평균페이스</th>
						<td>${training.trainingTime div training.trainingDistance}
							분/km</td>
					</tr>
					<tr>
						<th>목표</th>
						<td>${training.trainingGoal}</td>
						<th>현재 체중</th>
						<td>${training.weight }kg</td>
					</tr>
				</table>
				<hr>
				<div class="cont">
					${training.trainingContent} <img alt="업로드이미지"
						src="${contextPath}${attachment.filePath}${attachment.changeName}"
						id="uploadImg">

				</div>
			</div>
			<br>
			<div class="bt_wrap">
				<a href="${contextPath}/list.tr?currentPage=1"
					class="btn btn-outline-secondary">목록</a> <a
					href="${contextPath}/update.tr?tno=${training.trainingNo}"
					class="btn btn-info">수정</a>
				<button class="btn btn-secondary" id="deleteTr">삭제</button>
			</div>
			<script>
				$("#deleteTr")
						.click(
								function() {
									if (confirm("정말 삭제하시겠습니까?")) {
										location.href = "${contextPath}/delete.tr?tno=${training.trainingNo}";
									}
								});
			</script>
			<br>
			<div class="comment">
				<h4>댓글</h4>
				<div class="comment-list">
					<!-- 댓글 하나 -->
					<hr>
					<dl>
						<dt>서유르맘</dt>
						<dd>감사합니다 덕분에 사고 싶던 르네상스 샀어요~^^</dd>
						<dd>2024.04.17</dd>
					</dl>
					<!-- 댓글 하나 -->
					<hr>
					<dl>
						<dt>태양네</dt>
						<dd>덕분에 질렀습니다. 감사합니다.</dd>
						<dd>2024.04.17</dd>
					</dl>
				</div>
			</div>
			<div class="comment-area">
				<c:if test="${not empty loginUser}">

					<div class="comment-write">
						<b id="memberName">${loginUser.memberName }</b>
						<textarea name="comment" id="comment" cols="200" rows="1"
							style="resize: none;" placeholder="댓글을 남겨보세요 :&#41;"></textarea>
					</div>
					<div class="comment-btn right">
						<button class="btn btn-outline-info" id="comment-btn">등록</button>
					</div>
				</c:if>
				<div class="comment-write">
					<textarea name="" id="" cols="200" rows="1" style="resize: none;"
						placeholder="로그인 후 댓글입력이 가능합니다 :&#41;"></textarea>
				</div>
			</div>

		</div>
	</div>
	<script>
		$(function() {
			$("#comment-btn").click(function() {
				var memberName = $("#memberName").val();
				let comment = $("#comment").val();
				$("#comment").val("");
 				$.ajax({
 					type: "post",
					url : "comment.tr",
					data : {
						comment : comment
					},
					success : function(comment) {
						let print = "<hr><dl>";
						print+="<dt>"+memberName+"<dt>";
						print+="<dd>"+comment+"<dd>";
						print+="</dl>"
						$(".comment-list").html(print);
					},
					error : function() {
						console.log("댓글작성 실패ㅠㅠ");
					}
				});
			});
		});
	</script>
</body>
</html>