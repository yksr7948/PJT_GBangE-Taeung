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
<title>대회참여인증</title>
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

.info #ca{
	margin-left : 270px;
	left : 0px;	

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
	<div class="board">
	  <div class="board_wrap">
        <div class="board_title">
            <h1>대회인증참여 게시판</h1>
            <p>대회인증참여 게시판 페이지입니다.</p>
        </div>
        
        <div class="board_view_wrap">
            <div class="board_view">
                <div class="title">${f.feedTitle}</div>
                <div class="info">
                    <dl>
                        <dt>번호</dt>
                        <dd>${f.feedNo}</dd>
                    </dl>
                    <dl>
                        <dt>글쓴이</dt>
                        <dd>${f.memberNo}</dd>
                    </dl>
                    <dl>
                        <dt>작성일</dt>
                        <dd>${f.createDate}</dd>
                    </dl>
                    <dl>
                        <dt>조회</dt>
                        <dd>${f.count}</dd>
                    </dl>
                    <dl id="ca">
                    	<dt>카테고리</dt>
                    	<dd>${f.category}</dd>
                    </dl>
                     <dl id="com">
                    	<dt>참여한대회</dt>
                    	<dd>${f.competition}</dd>
                    </dl>
                </div>        
                
                  
 				
                <div class="cont">
                    ${f.feedContent}
                    <img alt="업로드이미지" src="${contextPath}${at.filePath}${at.changeName}" id="uploadFile">
               
                </div>
            </div>
            <br><br>
            <div class="bt_wrap">
                <a href="" class="btn btn-outline-secondary" onclick="goToFeedListView()">목록</a>
                <a href="#" class="btn btn-success">수정</a>
            </div>
     		<br><br>
            <div id="reply-area" align="center">
            	<table border="1">
            	<thead>
            		<tr>
            			<th>댓글작성</th>
            			<td>
            				<textarea id="replyContent" rows="3" cols="225" style="resize:none;"></textarea>
            			</td>
            			<td><button class="btn btn-success" onclick="insertReply();">등록</button></td>
            		</tr>
            	</thead>
            	<tbody>
            		<tr>
            			<td>작성자</td>
            			<td>내용</td>
            			<td>작성일</td>
            		</tr>
            	</tbody>
            </table>
            <br>
            </div>
        </div>
    </div>
    </div>
    	
    
    <script>
  
    	function insertReply(){
    	
    		$.ajax({
    			url : "insertReply.fe",
    			type : "post",
    			data : {
    				content : $("#replyContent").val(),
    				fno : ${f.feedNo},
    				memberNo : "${loginUser.memberNo}"
    			},
    			success : function(result){
    			console.log(result);
    			
    				console.log(result);
    				if(result>0){
    					alert("댓글 작성 성공");
    					$("#replyContent").val("");
    					replyList();
    				}else{
    					alert("댓글 작성 실패");
    				}
    			},
    			error : function(){
    				console.log("통신 실패");
    			}
    		});
    	}
    	
    	function replyList(){
    		
    		$.ajax({
    			url : "replyList.fe",
    			data : {
    			fno : ${f.feedNo},
    			},
    			success : function(list){
    				
    				var tr = "";
    				for(var i in list){
    					tr +="<tr>"
    					   +"<td>"+list[i].memberNo+"</td>"
    					   +"<td>"+list[i].replyContent +"</td>"
    					   +"<td>"+list[i].createDate+"</td>"
    					   +"</tr>";
    				}
    				$("#reply-area tbody").html(tr);
    			},
    			error : function(){
    				console.log("통신오류");
    			}
    		});
    	}
    	
    	$(function(){
    		replyList(); //댓글목록 조회
    	});
    </script>
    
   <script>
    function goToFeedListView() {
        window.location.href = 'views/feed/feedListView.jsp';
    }
</script>
</body>
</html>