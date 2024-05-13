<%@ page import="java.sql.Connection" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@page import="com.kh.notice.model.vo.Notice"%>
<%@page import="com.kh.notice.model.dao.NoticeDao"%>
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
    top: 160px; /* Adjust this value to move the icons slightly up */
    right: 20px;
}

.social-share img {
    width: 30px;
    height: 30px;
    margin-left: 10px;
}

.link-icon { 
    display: inline-block; 
    width: auto; 
    font-size: 14px; 
    font-weight: 500; 
    color: #333; 
    margin-right: 10px; 
}

.link-icon.twitter { 
    background-image: url(./img/icon-twitter.png); 
    background-repeat: no-repeat; 
}

.link-icon.facebook { 
    background-image: url(./img/icon-facebook.png); 
    background-repeat: no-repeat; 
} 

.link-icon.kakao { 
    background-image: url(./img/icon-kakao.png); 
    background-repeat: no-repeat; 
}

.zbange {
    width: 100px; 
    position: relative;
    top: -80px;
    left: 150px;
}
</style>
</head>
<body>
<%@include file="/views/common/menubar.jsp"%>
	  <div class="board_wrap">
        <div class="board_title">
            <h1>공지사항</h1>
            <a href="${contextPath}"> <img src="/gbange/views/notice/img/image_360-removebg-preview.png" alt="지방이" class="zbange"></a>
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
                     <div class="social-share">
        <a id="btnTwitter" class="link-icon twitter" href="javascript:shareTwitter();">트위터</a>
        <a id="btnFacebook" class="link-icon facebook" href="javascript:shareFacebook();">페이스북</a>
        <a id="btnKakao" class="link-icon kakao" href="javascript:shareKakao();">카카오톡</a>
    </div>
    <img alt="${attachment.changeName}" src="${contextPath}${attachment.filePath}${attachment.changeName}" id="uploadFile" style="width: 100%; cursor:pointer;">
					
			
                </div>
    	        </div>
            <br>
            <div class="bt_wrap" style="display: flex; justify-content: space-between;">
    <div>
      	<a href="${contextPath}/list.no?currentPage=1" class="btn btn-outline-secondary">목록</a>

        <% 
            int[] noticeNext = (int[])request.getAttribute("NoticeNext");
            if (noticeNext[0] != 0) { 
        %>
            <a href="${contextPath}/detail.no?nno=<%= noticeNext[0] %>" class="btn btn-outline-secondary">이전글</a>
        <% } %>
    
        <% 
            if (noticeNext[1] != 0) { 
        %>
            <a href="${contextPath}/detail.no?nno=<%= noticeNext[1] %>" class="btn btn-outline-secondary">다음글</a>
        <% } %>
    </div>
    <% if(loginUser != null && loginUser.getMemberId().equals("admin")) { %>
    <div>
        <a href="${contextPath}/update.no?nno=${notice.noticeId}" class="btn btn-success">수정</a>
        <a href="${contextPath}/delete.no?nno=${notice.noticeId}" class="btn btn-danger" onclick="return confirmDelete()">삭제</a>
    </div>
    <% } %>
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
    
    
   /*  function shareKakao() {

    	  // 사용할 앱의 JavaScript 키 설정
    	  Kakao.init('카카오에서_발급받은_API키');

    	  // 카카오링크 버튼 생성
    	  Kakao.Link.createDefaultButton({
    	    container: '#btnKakao', // 카카오공유버튼ID
    	    objectType: 'content',
    	    content: {
    	      title: "공지사항", // 보여질 제목
    	      description: "지방이 공지사항", // 보여질 설명
    	      imageUrl: "gbangE/", // 콘텐츠 URL
    	      link: {
    	         mobileWebUrl: "gbangE/",
    	         webUrl: "gbangE/"
    	      }
    	    }
    	  });
    	}   */
</script>

<script>
    // ...
    // 이미지 클릭 시 이미지 확대 표시
    $("#uploadFile").click(function() {
        window.open(this.src, '_blank');
    });
</script>
   
</body>
</html>