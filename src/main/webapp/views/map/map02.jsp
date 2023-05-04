<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
  #map02 > #map{
    width:400px;
    height:400px;
    border:4px solid red;
  }

</style>
<script>
    let map02= {
      map:null,
      init:()=>{
        map02.display();
        $('#seoul').click(()=>{
          map02.go(37.579617, 126.977041);
        });//seoul button
        $('#busan').click(()=>{
          map02.go(35.1709359, 129.1337096);
        });//busan button
        $('#jeju').click(()=>{
          map02.go(33.3127333, 126.7439885);
        });// jeju button
        },// end of init
      display:()=>{
        let mapContainer = document.querySelector('#map');
        let mapOption = {
          center: new kakao.maps.LatLng(  37.579617,   126.977041), // 지도의 중심좌표
          level: 5 // 지도의 확대 레벨
        };
        map = new kakao.maps.Map(mapContainer, mapOption);

        var markerPosition  = new kakao.maps.LatLng(  37.579617,  126.977041);
        let marker = new kakao.maps.Marker({
          position: markerPosition
        });
        marker.setMap(map);
        //지도 생성
      },// end of display
      go:(x, y)=>{
        let moveLatLon = new kakao.maps.LatLng(x, y);
        let markerPosition  = new kakao.maps.LatLng(x,y);
        let marker = new kakao.maps.Marker({
          position: markerPosition
        });
        function panTo() {
          marker.setMap(map);
        }; // end of PanTo function
        map.panTo(moveLatLon);
      }// end of map01 - gofunction
   }; // end of map01

    $(()=>{
      map02.init();
    });// end of onload
</script>

<div class="col-sm-8 text-left">
  <div class="container" id="map02">
    <h1>Map 02</h1>


    <button id="seoul" type="button" class="btn"> Seoul </button>
    <button id="busan" type="button" class="btn"> Busan </button>
    <button id="jeju" type="button" class="btn"> Jeju </button>
    <div id="map"></div>
  </div>
</div>

