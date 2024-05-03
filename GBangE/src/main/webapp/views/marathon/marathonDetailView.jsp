<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
.Detaildiv{
	box-sizing: border-box;
}
.marathonDetail th{
	width:120px;
	text-align:center;
	
}
.marathonDetail th,td{
	height:50px;
}
.head {
	width:40%;
	height:50px;
	text-align:center;
}
.head h1{
	margin-top:20px;
	margin-bottom:20px;
	font-size:40px;
}
</style>
</head>
<body>
<%@include file="/views/common/menubar.jsp"%>
<div class="head">
	<h1>대회정보</h1>
</div>
<br>
<div class="Detaildiv">
    <table class="marathonDetail table">
    <tr>
    	<th>행사명</th>
    	<td>${m.marathonName }</td>
    </tr>
    <tr>
    	<th>지역</th>
    	<td>${m.region }</td>
    </tr>
    <tr>
    	<th>마라톤 장소</th>
    	<td>${m.location }</td>
    </tr>
    <tr>
    	<th>출발일</th>
    	<td>${m.marathonDate }</td>
    </tr>
    <tr>
    	<th>접수기간</th>
    	<td>${m.applicationDate }</td>
    </tr>
	<tr>
    	<th>주최자</th>
    	<td>${m.organizer }</td>
    </tr>
    <tr>
    	<th>주최단체</th>
    	<td>${m.organizerHost }</td>
    </tr>
    <tr>
    	<th>번호</th>
    	<td>${m.organizerPhone }</td>
    </tr>
    <tr>
    	<th>대회 주소</th>
    	<td><a href="${m.marathonSite }" target="_blank">${m.marathonSite }</a></td>
    </tr>
    <tr>
    	<th style="height:250px">상세 정보</th>
    	<td>${m.otherIntroduction }</td>
    </tr>
    <tr>
    <th style="height:400px"><a href="https://map.kakao.com/link/search/${m.location }" target="_blank">장소 상세</a></th>
    <td>
    <div id="map" style="width:500px;height:350px;"></div>    
    </td>
    </tr>
    </table>
</div>
</body>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a1b4846e472c7771e5d7f51cf184db58&libraries=services"></script>
<script>
var infowindow = new kakao.maps.InfoWindow({zIndex:1});

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 장소 검색 객체를 생성합니다
var ps = new kakao.maps.services.Places(); 

// 키워드로 장소를 검색합니다
ps.keywordSearch('${m.region }${m.location}', placesSearchCB); 

// 키워드 검색 완료 시 호출되는 콜백함수 입니다
function placesSearchCB (data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        var bounds = new kakao.maps.LatLngBounds();

        for (var i=0; i<1; i++) {
            displayMarker(data[i]);    
            bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
        }else{
        	console.log("검색실패");
        }    

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
        map.setBounds(bounds);
    } 
}

// 지도에 마커를 표시하는 함수입니다
function displayMarker(place) {
    
    // 마커를 생성하고 지도에 표시합니다
    var marker = new kakao.maps.Marker({
        map: map,
        position: new kakao.maps.LatLng(place.y, place.x) 
    });

    // 마커에 클릭이벤트를 등록합니다
    kakao.maps.event.addListener(marker, 'click', function() {
        // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
        infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
        infowindow.open(map, marker);
    });
}
	</script>
</html>
