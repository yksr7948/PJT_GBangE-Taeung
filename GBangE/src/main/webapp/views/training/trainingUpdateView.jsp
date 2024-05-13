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

.board_write {
	border-top: 2px solid #000;
/* 	border-bottom: 2px solid #000; */
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

/* .board_write .cont {
} */

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

.upload-btn {
	width: 150px;
	height: 30px;
	background: rgb(77, 77, 77);
	color: #fff;
	border-radius: 10px;
	font-weight: 500;
	cursor: pointer;
	display: flex;
	align-items: center;
	justify-content: center;
	float: right;
}

.upload-btn:hover {
	background: cornflowerblue;
	color: #fff;
}

#uploadImg {
	display: none;
}
#imgArea{
float: right;
}
.bt_wrap {
	margin : 10px;
	text-align: left;
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
.cont{
	width: 920px;
	float: left;
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
		<form action="/gbange/update.tr" method="post" id="training-area" enctype="multipart/form-data">
			<!-- <input type="hidden" name="memberNo" value=""> 나중에 로그인 기능 구현되면 가져올 것 -->
			<input type="hidden" name="trainingNo" value="${training.trainingNo}">
			<div class="board_write_wrap">
				<div class="board_write">
					<div class="title">
						<dl>
							<dd>
								<input type="text" value="${training.trainingTitle}" name="trainingTitle" required> 
								<input type="checkbox" name="secret" id="secret"><label for="secret"></label>
							</dd>
							<dd style="text-align: right;">
								달린 날짜 : <input type="date" name="trainingDate" required>
							</dd>
						</dl>
					</div>
					<div class="info">
						<table class="table table-hover">
							<tr>
								<th>훈련종류</th>
								<td><select name="category">
										<c:forEach items="${tCList}" var="tc">
											<option value="${tc.trainingKey}">${tc.trainingName}</option>
										</c:forEach>
								</select></td>
								<th>착용신발</th>
								<td><select name="shoes">
										<!-- shoes 조회 기능 구현되면 가져올 것 -->
								</select></td>
							</tr>
							<tr>
								<th>훈련장소</th>
								<td><input type="text" name="trainingPlace" value="${training.trainingPlace }" required></td>
								<th>운동거리(km)</th>
								<td><input type="number" step="0.01" min="1" max="100"
									name="trainingDistance" value="${training.trainingDistance }">km</td>
							</tr>
							<tr>
								<th>운동시간</th>
								<td><input type="number" step="0.1" name="trainingTime" value="${training.trainingTime }">분</td>
								<th>평균페이스</th>
								<td><input type="number" readonly value="">/km</td>
							</tr>
							<tr>
								<th>목표</th>
								<td><input type="text" name="trainingGoal" value="${training.trainingGoal }"></td>
								<th>현재 체중</th>
								<td><input type="number" step="0.01" min="20" max="200"
									name="weight" value="${training.weight }">kg</td>
							</tr>
							<tr>
								<th>멋진 인증샷</th>
								<td>
								<c:if test="${attachment!=null }">
								<input type="hidden" name="originFileNo" value="${attachment.fileNo }">
								<input type="hidden" name="originFileName" value=${attachment.changeName }>
								</c:if>
								<label for="uploadImg" class="upload-btn">사진
										올리기</label><input type="file" name="reUploadImg" id="uploadImg"></td>
								<th></th>
								<td></td>
							</tr>
							<tr>
								<th></th>
								<td></td>
								<th></th>
								<td></td>
							</tr>
						</table>
					</div>
					<div class="cont">
						<textarea name="trainingContent" cols="100" rows="100" style="resize: none;">${training.trainingContent}
					</textarea>
					</div>
				</div>
					<div class="cont">
					<img alt="업로드이미지" src="${contextPath}${attachment.filePath}${attachment.changeName}" id="imgArea" width="50%">
					</div>
				<br>
				<div class="bt_wrap">
					<button type="submit" class="btn btn-info">등록</button>
					<button href="${contextPath }/list.tr" class="btn btn-secondary">취소</button>
				</div>
			</div>
		</form>
	</div>
</body>
</html>