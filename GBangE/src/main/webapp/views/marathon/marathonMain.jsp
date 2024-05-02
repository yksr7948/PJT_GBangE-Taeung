<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
	
    <head>
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Jost:wght@500;600&family=Roboto&display=swap" rel="stylesheet"> 

        <!-- Icon Font Stylesheet -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">


        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="css/style.css" rel="stylesheet">
    </head>
<body>
<%@include file="/views/common/menubar.jsp"%>
<div class="container-fluid packages py-5">
    <div class="container py-5">
        <div class="mx-auto text-center mb-5" style="max-width: 900px;">
        </div>
        <div class="packages-carousel owl-carousel" data-packages-carousel-autoplay-status="Y">
            <div class="packages-item">
                <div class="packages-img">
                    <img src="img/500x400-4.jpg" class="img-fluid w-100 rounded-top" alt="Image">
                    <div class="packages-info d-flex border border-start-0 border-end-0 position-absolute" style="width: 100%; bottom: 0; left: 0; z-index: 5;">
                        <small class="flex-fill text-center border-end py-2"><i class="fa fa-map-marker-alt me-2"></i>지역명 4</small>
                        <small class="flex-fill text-center border-end py-2"><i class="fa fa-calendar-alt me-2"></i>2024/04/04</small>                        
                        <small class="flex-fill text-center py-2"><i class="fa fa-user me-2"></i>444 Person</small>
                    </div>
                </div>
                <div class="packages-content bg-light">
                    <div class="p-4 pb-0">
                        <h5 class="mb-0">마라톤 이름 4</h5>
                        <small class="text-uppercase">Marathon Details</small>
                        <p class="mb-4">임시텍스트4</p>
                    </div>
                    <div class="row bg-primary rounded-bottom mx-0">
                        <div class="col-6 text-start px-0">
                            <a href="#" class="btn-hover btn text-white py-2 px-4">참가신청</a>
                        </div>
                        <div class="col-6 text-end px-0">
                            <a href="#" class="btn-hover btn text-white py-2 px-4">더보기</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="packages-item">
                <div class="packages-img">
                    <img src="img/500x400-3.jpg" class="img-fluid w-100 rounded-top" alt="Image">
                    <div class="packages-info d-flex border border-start-0 border-end-0 position-absolute" style="width: 100%; bottom: 0; left: 0; z-index: 5;">
                        <small class="flex-fill text-center border-end py-2"><i class="fa fa-map-marker-alt me-2"></i>지역명 3</small>
                        <small class="flex-fill text-center border-end py-2"><i class="fa fa-calendar-alt me-2"></i>2024/03/03</small>
                        <small class="flex-fill text-center py-2"><i class="fa fa-user me-2"></i>333 Person</small>
                    </div>
                </div>
                <div class="packages-content bg-light">
                    <div class="p-4 pb-0">
                        <h5 class="mb-0">마라톤 이름 3</h5>
                        <small class="text-uppercase">Marathon Details</small>
                        <p class="mb-4">임시텍스트3</p>
                    </div>
                    <div class="row bg-primary rounded-bottom mx-0">
                        <div class="col-6 text-start px-0">
                            <a href="#" class="btn-hover btn text-white py-2 px-4">참가신청</a>
                        </div>
                        <div class="col-6 text-end px-0">
                            <a href="#" class="btn-hover btn text-white py-2 px-4">더보기</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="packages-item">
                <div class="packages-img">
                    <img src="img/500x400-2.jpg" class="img-fluid w-100 rounded-top" alt="Image">
                    <div class="packages-info d-flex border border-start-0 border-end-0 position-absolute" style="width: 100%; bottom: 0; left: 0; z-index: 5;">
                        <small class="flex-fill text-center border-end py-2"><i class="fa fa-map-marker-alt me-2"></i>지역명 2</small>
                        <small class="flex-fill text-center border-end py-2"><i class="fa fa-calendar-alt me-2"></i>2024/02/02</small>
                        <small class="flex-fill text-center py-2"><i class="fa fa-user me-2"></i>222 Person</small>
                    </div>
                </div>
                <div class="packages-content bg-light">
                    <div class="p-4 pb-0">
                        <h5 class="mb-0">마라톤 이름 2</h5>
                        <small class="text-uppercase">Marathon Details</small>
                        <p class="mb-4">임시텍스트2</p>
                    </div>
                    <div class="row bg-primary rounded-bottom mx-0">
                        <div class="col-6 text-start px-0">
                            <a href="#" class="btn-hover btn text-white py-2 px-4">참가신청</a>
                        </div>
                        <div class="col-6 text-end px-0">
                            <a href="#" class="btn-hover btn text-white py-2 px-4">더보기</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="packages-item">
                <div class="packages-img">
                    <img src="img/500x400.jpg" class="img-fluid w-100 rounded-top" alt="Image">
                    <div class="packages-info d-flex border border-start-0 border-end-0 position-absolute" style="width: 100%; bottom: 0; left: 0; z-index: 5;">
                        <small class="flex-fill text-center border-end py-2"><i class="fa fa-map-marker-alt me-2"></i>지역명 1</small>
                        <small class="flex-fill text-center border-end py-2"><i class="fa fa-calendar-alt me-2"></i>2024/01/01</small>
                        <small class="flex-fill text-center py-2"><i class="fa fa-user me-2"></i>111 Person</small>
                    </div>
                </div>
                <div class="packages-content bg-light">
                    <div class="p-4 pb-0">
                        <h5 class="mb-0">마라톤 이름 1</h5>
                        <small class="text-uppercase">Marathon Details</small>
                        <p class="mb-4">임시텍스트1</p>
                    </div>
                    <div class="row bg-primary rounded-bottom mx-0">
                        <div class="col-6 text-start px-0">
                            <a href="#" class="btn-hover btn text-white py-2 px-4">참가신청</a>
                        </div>
                        <div class="col-6 text-end px-0">
                            <a href="#" class="btn-hover btn text-white py-2 px-4">더보기</a>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 테스트영역 -->
            <div class="packages-item">
                <div class="packages-img">
                    <img src="img/500x400-5.jpg" class="img-fluid w-100 rounded-top" alt="Image">
                    <div class="packages-info d-flex border border-start-0 border-end-0 position-absolute" style="width: 100%; bottom: 0; left: 0; z-index: 5;">
                        <small class="flex-fill text-center border-end py-2"><i class="fa fa-map-marker-alt me-2"></i>지역명 5</small>
                        <small class="flex-fill text-center border-end py-2"><i class="fa fa-calendar-alt me-2"></i>2024/05/05</small>
                        <small class="flex-fill text-center py-2"><i class="fa fa-user me-2"></i>555 Person</small>
                    </div>
                </div>
                <div class="packages-content bg-light">
                    <div class="p-4 pb-0">
                        <h5 class="mb-0">마라톤 이름 5</h5>
                        <small class="text-uppercase">Marathon Details</small>
                        <p class="mb-4">임시텍스트5</p>
                    </div>
                    <div class="row bg-primary rounded-bottom mx-0">
                        <div class="col-6 text-start px-0">
                            <a href="#" class="btn-hover btn text-white py-2 px-4">참가신청</a>
                        </div>
                        <div class="col-6 text-end px-0">
                            <a href="#" class="btn-hover btn text-white py-2 px-4">더보기</a>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 여기까지 내부영역-->
        </div>
        <br>
        <!-- 버튼 아이디 carouselplaybtn/carouselstopbtn 중복되지않게 체크 -->
        <button type="button" id="carouselplaybtn" class="btn btn-outline-primary" style="float: right; display: none;">시작</button>
        <button type="button" id="carouselstopbtn" class="btn btn-outline-primary" style="float: right;">중지</button>
        <div>           
            <!-- 버튼 열면 modal 창출력되게끔 -->
            <button type="button" id="btn-infor" class="btn btn-outline-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop">전체 대회정보</button>
            <!-- modal영역 -->
            <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
                  <div class="modal-content">
                    <div class="modal-header">                    
                      <h5 class="modal-title" id="staticBackdropLabel">전체 대회정보</h5>
                      <a href="//insert.ma">대회정보 초기화</a>
                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                      테이블형태로 (게시판형태)로 대회목록을 조회할수있게 구성
                      <table>
                    
                      </table>
                    </div>
                    <div class="modal-footer">
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="lib/easing/easing.min.js"></script>
<script src="lib/waypoints/waypoints.min.js"></script>
<script src="lib/owlcarousel/owl.carousel.min.js"></script>

<script src="js/main.js"></script>
</html>