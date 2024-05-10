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
<title>공지사항</title>
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

 /* 공유 아이콘 스타일 */
        .social-share {
            position: absolute;
            top: 20px;
            right: 20px;
        }

        .social-share img {
            width: 30px;
            height: 30px;
            margin-left: 10px;
        }
</style>
</head>
<body>
<%@include file="/views/common/menubar.jsp"%>
	  <div class="board_wrap">
        <div class="board_title">
            <h1>공지사항</h1>
            <p>공지사항 페이지입니다.</p>
        </div>
        
        <div class="board_view_wrap">
            <div class="board_view">
                <div class="title">${notice.noticeTitle}</div>
                <div class="info">
                    <dl>
                        <dt>번호</dt>
                        <dd>${notice.noticeId}</dd>
                    </dl>
                    <dl>
                        <dt>글쓴이</dt>
                        <dd>${notice.memberName}</dd>
                    </dl>
                    <dl>
                        <dt>작성일</dt>
                        <dd>${notice.createDate}</dd>
                    </dl>
                    <dl>
                        <dt>조회</dt>
                        <dd>${notice.count}</dd>
                    </dl>
                </div>
                <div class="cont">
                    ${notice.noticeContent}
					<img alt="업로드이미지" src="${contextPath}${at.filePath}${at.changeName}" id="uploadFile">
				</div>
                </div>
            </div>
            <br>
            <div class="bt_wrap">
            <% if(loginUser != null && loginUser.getMemberId().equals("admin")) { %>
			    <a href="${contextPath}/list.no?currentPage=1" class="btn btn-outline-secondary">목록</a>
			    <a href="${contextPath}/update.no?nno=${notice.noticeId}" class="btn btn-success">수정</a>
			    <a href="${contextPath}/delete.no?nno=${notice.noticeId}" class="btn btn-danger" onclick="return confirmDelete()">삭제</a>
			<% } %>
            </div>
        </div>
   
   <script>
    function confirmDelete() {
        var confirmDelete = confirm("정말 삭제하시겠습니까?");
        if (confirmDelete) {
            // 삭제 처리하는 코드
            window.location.href = "${contextPath}/delete.no?nno=${notice.noticeId}";
        } else {
            // 삭제 취소할 때 처리할 코드
            return false;
        }
    }
</script>
   
</body>
</html>