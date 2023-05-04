<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
  #map01 > #map{
    width:400px;
    height:400px;
    border:2px solid red;
  }
</style>
<script>
    let map01= {
      map:null,
      init:()=>{
        let mapContainer = document.querySelector('#map');
        let mapOption = {
          center: new kakao.maps.LatLng(37.450701, 126.8), // 지도의 중심좌표
          level: 3 // 지도의 확대 레벨
        };
        map = new kakao.maps.Map(mapContainer, mapOption);
        var mapTypeControl = new kakao.maps.MapTypeControl();
        map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
        var zoomControl = new kakao.maps.ZoomControl();
        map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
        var markerPosition  = new kakao.maps.LatLng(37.450701, 126.8);
        var marker = new kakao.maps.Marker({
          position: markerPosition
        });
        marker.setMap(map);
        var iwContent = '<img src="/img/a.jpeg" style="width:80px"><div style="padding:5px;">Hello World!</div>'; // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
        var infowindow = new kakao.maps.InfoWindow({
          content : iwContent
        });
        kakao.maps.event.addListener(marker, 'click', function() {
          location.href='http://www.economist.com';
        });
        kakao.maps.event.addListener(marker, 'mouseover', function() {
          // 마커에 마우스오버 이벤트가 발생하면 인포윈도우를 마커위에 표시합니다
          infowindow.open(map, marker);
        });
        kakao.maps.event.addListener(marker, 'mouseout', function() {
          // 마커에 마우스아웃 이벤트가 발생하면 인포윈도우를 제거합니다
          infowindow.close();
        });
      } //end of map01 - init
    }; // end of map01

    $(()=>{
      map01.init();
    });// end of onload

</script>

<div class="col-sm-8 text-left">
  <div class="container" id="map01">
    <h1>MAP 01</h1>
    <div id="map"></div>
  </div>
</div>

