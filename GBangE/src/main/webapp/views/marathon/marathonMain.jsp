<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">        
    </head>
<body>
<%@include file="/views/common/menubar.jsp"%>
<div class="container-fluid packages py-5">
    <div class="container py-5">
        <div class="mx-auto text-center mb-5" style="max-width: 900px;">
        </div>
        <div class="packages-carousel owl-carousel" data-packages-carousel-autoplay-status="Y">
            <!-- 테스트영역 -->
            <c:choose>
				<c:when test="${empty marathonArr }">
					조회된 게시글이 없습니다.
					</c:when>
					<c:otherwise>
					<c:forEach var="mar" items="${marathonArr}">
						<div class="packages-item">
                	<div class="packages-img" onclick="window.open('${mar.marathonSite }')">
                    	<img src="views/marathon/img/500x400-5.jpg" class="img-fluid w-100 rounded-top">
                    <div class="packages-info d-flex border border-start-0 border-end-0 position-absolute" style="width: 100%; bottom: 0; left: 0; z-index: 5;">
                        <small class="flex-fill text-center border-end py-2"><i class="fa fa-map-marker-alt me-2"></i>${mar.region }</small>
                        <small class="flex-fill text-center border-end py-2"><i class="fa fa-calendar-alt me-2"></i>${mar.marathonDate }</small>
                        <small class="flex-fill text-center py-2"><i class="fa fa-user me-2"></i>${mar.organizer }</small>
                    </div>
                	</div>
                	<div class="packages-content bg-light">
                    <div class="p-4 pb-0">
                        <h5 class="mb-0" style="height:68px">${mar.marathonName }</h5>
                        <small class="text-uppercase">대회번호 ${mar.marathonNo }</small>
                        <p class="mb-4">상세정보</p>
                        <p class="mb-4" style="height:48px">${mar.otherIntroduction }</p>
                    </div>
                    <div class="row bg-primary rounded-bottom mx-0">
                        <div class="col-6 text-start px-0">
                        	<!-- 데이터 보낼때 memberNo도 보내야함 -->
                            <a onclick="checkParticipate();" class="btn-hover btn text-white py-2 px-4">참가신청</a>
                        </div>
                        <div class="col-6 text-end px-0">
                            <a href="${contextPath }/detail.ma?marathonNo=${mar.marathonNo }" target="_blank" class="btn-hover btn text-white py-2 px-4">더보기</a>
                        </div>
                    </div>
                </div>
            </div>
					</c:forEach>	
				</c:otherwise>
			</c:choose>
        </div>
        <br>
        <button type="button" id="carouselplaybtn" class="btn btn-outline-primary" style="float: right; display: none;">시작</button>
        <button type="button" id="carouselstopbtn" class="btn btn-outline-primary" style="float: right;">중지</button>
        <div>           
            <button type="button" id="btn-infor" class="btn btn-outline-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop">전체 대회정보</button>
            <!-- modal영역 -->
            <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg">
                  <div class="modal-content">
                    <div class="modal-header">                    
                      <h5 class="modal-title" id="staticBackdropLabel">전체 대회정보</h5>                      
                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                    <table class="marathonclass" style="font-size: 12px">
                    <thead align="center">
						<tr>
							<th width="7%">번호</th>
							<th width="33%">마라톤 이름</th>
							<th width="33%">마라톤 장소</th>
							<th width="8%">지역</th>
							<th width="19%">마라톤 날짜</th>
						</tr>
					</thead>
					<tbody align="center">
                      <c:choose>
						<c:when test="${empty marathonArr }">
						<tr>
							<td colspan="5">조회된 게시글이 없습니다.</td>
						</tr>
						</c:when>
						<c:otherwise>
						<c:forEach var="mar" items="${marathonArr}">
							<tr class="marathonInfo" onclick='window.open("${contextPath }/detail.ma?marathonNo=${mar.marathonNo }")'>
								<td>${mar.marathonNo}</td>
								<td>${mar.marathonName}</td>
								<td>${mar.location }</td>
								<td>${mar.region }</td>
								<td>${mar.marathonDate }</td>
							</tr>
						</c:forEach>	
					</c:otherwise>
					</c:choose>
					</tbody>
					</table>					
                    </div>
                    <div class="modal-footer">
                    <!-- 관리자전용 기능 -->
                    	<c:if test="'${memberNo}'==1">
                    		<button onclick='location.href="${contextPath }/insert.ma"' class="btn btn-outline-primary">대회정보 초기화</button>
                    	</c:if>
                      <button type="button" class="btn btn-outline-primary" data-bs-dismiss="modal">종료</button>
                    </div>
                  </div>
                </div>
            </div>
            <!-- 여기까지 modal -->
        </div>
    </div>
</div>
</body>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" >
<link href="https://fonts.googleapis.com/css2?family=Jost:wght@500;600&family=Roboto&display=swap" rel="stylesheet"> 
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"/>
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">
<link href="views/marathon/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
<link href="views/marathon/css/bootstrap.min.css" rel="stylesheet">
<link href="views/marathon/css/style.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="views/marathon/lib/waypoints/waypoints.min.js"></script>
<script src="views/marathon/lib/owlcarousel/owl.carousel.min.js"></script>
<script src="views/marathon/js/main.js"></script>
<script type="text/javascript">
function checkParticipate(){
	if('${memberNo}'==""){
		if(confirm("로그인이 필요한 서비스입니다. 로그인페이지로 이동하시겠습니까?")){
			location.href="${contextPath}/views/member/loginForm.jsp"
		}
	}else{
		location.href="${contextPath}/insert.pa?marathonNo=${mar.marathonNo}&memberNo=${m.memberNo}"	
	}
}
</script>
</html>