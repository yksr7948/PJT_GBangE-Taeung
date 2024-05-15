<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
	
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

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
        #reply-area {
    margin-top: 30px;
}

#reply-area textarea {
    width: 100%;
    padding: 10px;
    border-radius: 5px;
    border: 1px solid #ccc;
    resize: none;
}

#reply-area .btns {
    padding: 10px 20px;
    background-color: #007bff;
    color: #fff;
    border: none;
    border-radius: 5px;
    cursor: pointer;
}

#reply-area .btns:hover {
    background-color: #0056b3;
}

#reply-area #counter {
    margin-left: 10px;
    color: #999;
}

/* 댓글 목록 테이블 스타일 */
#reply-table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
}

#reply-table th, #reply-table td {
    border: 1px solid #ddd;
    padding: 8px;
    text-align: left;
}

#reply-table th {
    background-color: #f2f2f2;
}
#likeButton {
    background-color: transparent;
    border: none;
    cursor: pointer;
    padding: 5px;
}

#likeButton:hover {
    transform: scale(1.1); /* 호버 시 버튼을 약간 확대 */
}

#likeButton:focus {
    outline: none; /* 클릭 시 포커스 표시 제거 */
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
          		  	
                <a href="#" class="btn btn-outline-secondary" onclick="goToFeedListView()">목록</a>
                <a href="${contextPath}/update.fe?fno=${f.feedNo}" class="btn btn-success">수정</a>
                <a href="${contextPath}/delete.fe?fno=${f.feedNo}" onclick="deleteFeed()" class="btn btn-danger">삭제</a>
                 <button id="likeButton" onclick="like()">
				    <b id="heartIcon" class="far fa-heart" style="font-size: 30px; color: #ff5a5f;"></b>
				    <span>좋아요</span>
				</button>
            </div>
            
          

            <script>
            	function deleteFeed(){
            		var flag = confirm("삭제하면 마일리지가 날라가요~");
        
            		if(flag){
            			location.href="${contextPath}/delete.fe?fno=${f.feedNo}";
            		}
            	}
            		
            </script>
     		<br><br>
            <div id="reply-area">
            	<fieldset>
            	<legend class="skipinfo">댓글 입력</legend>
            	<p><textarea id="replyContent" rows="4" cols="240"  style="resize:none;" placeholder="댓글을 입력해 주세요."  oninput="updateCounter(this)"></textarea></p>
            	 <span><button type="button" class="btns" onclick="insertReply();" id="replyButton">등 록</button> 
            	 <i id="counter">0/300자</i></span>
            	 <br><br>
            	<table id="reply-table">
					<tr>            	
            			<td>작성자</td>
            			<td>내용</td>
            			<td>작성일</td>
            			<td>삭제</td>
            		</tr>
            	</tbody>
            	</table>
            </fieldset>
            <br>
            </div>
        </div>
    </div>
    </div>
   	<script>
		// 댓글 작성 카운터 업데이트 함수
		function updateCounter(textarea) {
		    var length = textarea.value.length;
		    var max = 300;
		    var counterElement = document.getElementById("counter");
		    counterElement.innerText = length + "/" + max + "자";
		    
		    // 글자 수가 300자를 초과하는 경우 버튼 비활성화
		    var replyButton = document.getElementById("replyButton");
		    if (length > max) {
		        replyButton.disabled = true;
		    } else {
		        replyButton.disabled = false;
		   		 }
			}				 
    </script>
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
    				if(result>0){
    					alert("댓글 작성 성공");
    					$("#replyContent").val("");
    				 document.getElementById('counter').innerText = '0/300자';
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
    					   +"<td><div class='reply-info'><input type='hidden' id='reply' value='"+list[i].replyContent+"'></div></td>"
    					   +"<td><button onclick='deleteReply()' class='reply-delete-btn'>삭제</button></td>";
    					   +"</tr>";
    				}
    				$("#reply-area tbody").html(tr);
    			},
    			error : function(){
    				console.log("통신오류");
    			}
    		});
    	}
    	
    	    function deleteReply(memberNo) {
    	        var flag = confirm("정말로 삭제하시겠습니까?");
    	        if (flag) {
    	            $.ajax({
    	                url: "deleteReply.fe",
    	                type: "post",
    	                data: {
    	                	content : $("#reply").val(),
    	    				memberNo : "${loginUser.memberNo}"
    	    	                },
    	                success: function (result) {
    	                    if (result > 0) {
    	                        alert("댓글이 삭제되었습니다.");
    	                        // 댓글 목록 다시 불러오기
    	                        replyList();
    	                    } else {
    	                        alert("댓글 삭제에 실패했습니다.");
    	                    }
    	                },
    	                error: function () {
    	                    console.log("통신 실패");
    	                }
    	            });
    	        } 
    	}
    	    function like() {
    	        var heartIcon = document.getElementById("heartIcon");
    	        if (heartIcon.classList.contains("far")) {
    	            heartIcon.classList.remove("far");
    	            heartIcon.classList.add("fas"); // 채워진 하트로 변경
    	        } else {
    	            heartIcon.classList.remove("fas");
    	            heartIcon.classList.add("far"); // 빈 하트로 변경
    	        }
    	    }
    	    
    	    function like() {
    	        var feedNo = "${f.feedNo}";
    	        var memberId = "${loginUser.memberId}";
    	        
    	        $.ajax({
    	        	$.ajax({
    	        	    url: "like.fe",
    	        	    type: "post",
    	        	    data: {
    	        	        memberId: memberId,
    	        	        feedNo: feedNo,
    	        	        action: "add" // 좋아요 추가를 요청함
    	        	    },
    	        	    success: function(result) {
    	        	        // 성공적으로 추가되었을 때의 처리
    	        	    },
    	        	    error: function() {
    	        	        // 오류 발생 시 처리
    	        	    }
    	        	});
    	        	
    	        	$.ajax({
    	        	    url: "like.fe",
    	        	    type: "post",
    	        	    data: {
    	        	        memberId: memberId,
    	        	        feedNo: feedNo,
    	        	        action: "remove" // 좋아요 제거를 요청함
    	        	    },
    	        	    success: function(result) {
    	        	        // 성공적으로 제거되었을 때의 처리
    	        	    },
    	        	    error: function() {
    	        	        // 오류 발생 시 처리
    	        	    }
    	        	});

    	    $(function() {
    	        // 좋아요 버튼 클릭 시 toggleLike 함수 호출
    	        $("#likeButton").click(function() {
    	            like();
    	        });
    	    });
    	
    	$(function(){
    		replyList(); //댓글목록 조회
    	});
    </script>
    
   <script>
    function goToFeedListView() {
        window.location.href = '/gbange/list.fe?currentPage=1';
    }
</script>
</body>
</html>