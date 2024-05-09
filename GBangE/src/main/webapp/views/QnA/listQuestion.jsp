<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
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
.content-area{
	display: none;
	height:360px;
}
.content {
	text-align: left;
	font-size: 3.0rem;
}
.answerDiv {
	margin-top:40px;
}
</style>
</head>
<body>
<%@include file="/views/common/menubar.jsp"%>
    <div class="board_wrap">
        <div class="board_title">
            <h1>지방이 QnA</h1>
            <br>
            <p>지방이 QnA 페이지입니다.</p>
        </div>
        <div class="board_list_wrap">
            <div class="board_list">
                <div class="top">
                    <div class="num">NO.</div>
                    <div class="title">Q.</div>
                    <div class="writer">작성자</div>
                    <div class="date">작성일</div>
                </div>
                <c:choose>
                <c:when test="${empty questionArr}">
                    <div>
                        <div colspan="5">조회된 공지사항이 없습니다.</div>
                    </div>
                </c:when>
                <c:otherwise>
                <c:forEach var="q" items="${questionArr}">
                <div class="list-area">
                    <div class="num">${q.questionId}</div>
                    <div class="title">${q.questionTitle }</div>
                    <div class="writer">${q.memberName }</div>
					<div class="date">${q.createDate }</div>
				</div>
				<div class="content-area">
					<div class="content">${q.questionContent }</div>
					<br>
					<div class="answerDiv">
						<textarea style="width:800px; height:200px;"></textarea>
						<br>
						<button type="button" class="btn btn-lg btn-dark">답변 작성하기</button>
					</div>
				</div>
				</c:forEach>
				</c:otherwise>
                </c:choose>
                </div>
            </div>
            <c:if test="${!empty loginUser.memberNo }">
            <div class="bt_wrap">			
				<a href="${contextPath}/insert.qu?memberNo=${loginUser.memberNo}" class="on">글쓰기</a>
			</div>
			</c:if>
         </div>
<script>
    $(function(){
        $("div.list-area").click(function(){                
            if($(this).next().css("display")=="none"){
                $(this).next().slideDown();
                // 지금 보여지는 p태그를 제외한 나머지는 다시 올려주기
                $(this).next().siblings("div.content-area").slideUp();
            }else{
                $(this).next().slideUp();
            }
        });
        $(".answerDiv .btn").click(function() {
        	var answerContent = $(this).closest('.answerDiv').find('textarea').val()
            var questionId = $(this).closest('.content-area').prev('.list-area').find('.num').text()
        	$.ajax({
        		url:"insert.an",
        		data:{
        			"questionId":questionId,
        			"answerContent":answerContent
        		},
        		success:function(){
        			
        		},
        		erroe:function(){
        			
        		}
        	});
        });
    });
</script>	
</body>
</html>