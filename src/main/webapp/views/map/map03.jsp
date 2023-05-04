<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
  #map03 > #map{
    width:400px;
    height:400px;
    border:4px solid red;
  }
</style>
<script>
  let map03= {
    map:null,
    init:()=>{
      map03.display();
      $('#seoul').click(()=>{
        map03.go(37.579617, 126.977041, 's');
      });//seoul button
      $('#busan').click(()=>{
        map03.go(35.1709359, 129.1337096, 'b');
      });//busan button
      $('#jeju').click(()=>{
        map03.go(33.24171736, 126.5521947, 'j');
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
    go:(x, y, z)=>{
      let mapContainer = document.querySelector('#map');
      let mapOption = {
        center: new kakao.maps.LatLng(x, y), // 지도의 중심좌표
        level: 5 // 지도의 확대 레벨
      };
      map = new kakao.maps.Map(mapContainer, mapOption);


    //  let moveLatLon = new kakao.maps.LatLng(x, y);     //지도를 다시 만든다.
      let markerPosition  = new kakao.maps.LatLng(x,y);
      let marker = new kakao.maps.Marker({
        position: markerPosition
      });
      function panTo() {
        marker.setMap(map);
      }; // end of PanTo function
    //  map.panTo(moveLatLon);        //지도를 다시 그린다.
      //지도를 다 뿌렸으니 ajax로 데이터를 달라고 요청함.
      map03.markers(z);
    },// end of map01 - gofunction
    markers:(location)=>{
      $.ajax({
        url:'/markers',
        data:{'location':location},
        success:(data)=>{
          map03.displaymarkers(data);
          console.log(data);
        },//success 한 경우
        fail:()=>{
          console.log("failed to load data");
        } //fail한 경우
      })//end of ajax
    },//end of markers
    displaymarkers:(positions)=>{
// 아래 내용은 슬랙에서 받음.
      var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";
      for (var i = 0; i < positions.length; i ++) {
        var imageSize = new kakao.maps.Size(20, 30);
        var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);
        var markerPosition = new kakao.maps.LatLng(positions[i].latitude, positions[i].longitude);

        var marker = new kakao.maps.Marker({
          map: map,
          position: markerPosition,
          title : positions[i].title,
          image : markerImage
        });
        // infoWindow
        var iwContent = '<h2>'+positions[i].title+'</h2>';
        iwContent += '<img src="/img/'+positions[i].image+'" style="width:50px">';

        var infowindow = new kakao.maps.InfoWindow({
          position : markerPosition,
          content : iwContent
        });

        kakao.maps.event.addListener(marker, 'mouseover', mouseoverListener(marker, infowindow));
        kakao.maps.event.addListener(marker, 'mouseout', mouseoutListener(marker, infowindow));
        kakao.maps.event.addListener(marker, 'click', mouseclickListener(positions[i].target));


        function mouseoverListener(marker, infowindow) {
          return function(){
            infowindow.open(map, marker);
          };
        }
        function mouseoutListener(marker, infowindow) {
          return function(){
            infowindow.close();
          };
        }
        function mouseclickListener(target) {
          return function(){
            location.href = target;
          };
        }
      } // end for
    }// end of displaymarkers
  }; // end of map01

  $(()=>{
    map03.init();
  });// end of onload
</script>

<div class="col-sm-8 text-left">
  <div class="container" id="map03">
    <h1 >Map 03</h1>

    <button id="seoul" type="button" class="btn"> Seoul </button>
    <button id="busan" type="button" class="btn"> Busan </button>
    <button id="jeju" type="button" class="btn"> Jeju </button>
    <div id="map"></div>
  </div>
</div>

