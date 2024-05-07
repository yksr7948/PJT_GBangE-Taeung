<%@page import="com.kh.feed.model.vo.Feed"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	ArrayList<Feed> list = (ArrayList<Feed>)request.getAttribute("list");
	
%>  

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
            <h1>대회참여인증 게시판</h1>
            <br>
            <p>대회참여인증 페이지입니다.</p>
        </div>
        <div class="board_list_wrap">
            <div class="board_list">
                <div class="top">
                    <div class="num">글 번호</div>
                    <div class="title">제목</div>
                    <div class="writer">작성자</div>
                    <div class="count">조회</div>
                    <div class="date">작성일</div>
                </div>
                <% if(list == null || list.isEmpty()) { %>
                    <div>
                        <div colspan="5">조회된 글이 없습니다.</div>
                    </div>
                <% } else { %>
                    <% for(Feed f : list) { %>
                        <div class="list-area">
                            <div class="num"><%= f.getFeedNo() %></div>
                            <div class="title"><%= f.getMemberNo() %></div>
                            <div class="writer"><%= f.getFeedTitle() %></div>
                            <div class="count"><%= f.getCount() %></div>
                            <div class="date"><%= f.getCreateDate() %></div>
                            
                        </div>
                    <% } %>
                <% } %>
            </div>
            <div class="board_page">
                <!-- 페이지 링크는 여기에 들어갑니다 -->
            </div>
            <div class="bt_wrap">
                <!-- 버튼은 여기에 들어갑니다 -->
            </div>
        </div>
    </div>

		<div align="center" class="paging-area">
			
		
		<c:choose>
			<c:when test="${pi.currentPage eq 1}">
				<button disabled>이전</button>
			</c:when>	 
			<c:otherwise>
				<button onclick="location.href='list.fe?currentPage=${pi.currentPage-1}'">이전</button>
			</c:otherwise>
		</c:choose>
	
		<c:forEach var="i" begin="${pi.startPage }" end="${pi.endPage }">
			<button onclick="location.href='list.fe?currentPage=${i}'">${i}</button>
		</c:forEach>
		
		<c:choose>
			<c:when test="${pi.currentPage eq pi.maxPage}">
				<button disabled>다음</button>
			</c:when>	 
			<c:otherwise>
				<button onclick="location.href='list.fe?currentPage=${pi.currentPage+1}'">다음</button>
			</c:otherwise>
		</c:choose>
		</div>
		<div class="bt_wrap">
				<a href="${contextPath}/insert.fe" class="on">글쓰기</a> <a href="">수정</a>
			</div>
   
	
</body>

</body>
</html>