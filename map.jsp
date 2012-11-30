<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"  import="java.sql.*" 
		import="org.apache.commons.lang3.StringUtils" import="java.lang.*"
		import="java.io.*" import="javax.servlet.http.*"%>
<!DOCTYPE html>
<html>
  <head>
    <title>Google Maps JavaScript API v3 Example: Map Geolocation</title>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <meta charset="utf-8">
    <link href="./css/default.css" rel="stylesheet">
    <script src="js/jquery-1.8.2.min.js"></script>
    <script src="http://maps.googleapis.com/maps/api/js?v=3.exp&sensor=true&language=ko"></script>

    <script>
      var map;

      function initialize() {
        var mapOptions = {
          zoom: 6,
          mapTypeId: google.maps.MapTypeId.ROADMAP
        };
        map = new google.maps.Map(document.getElementById('map_canvas'),
            mapOptions);
       
                            
        	// Try HTML5 geolocation
        if(navigator.geolocation) {
          navigator.geolocation.getCurrentPosition(function(position) {
        	  var pos = new google.maps.LatLng(position.coords.latitude,
                      position.coords.longitude);
						$.get("index",{lat:pos.lat(), lng:pos.lng()},function(data){

									var array = new Array();

									var number=data.split(",").length;

											for (var i=0; i<number-1; i++)
											{
											 array[i] = [data.split(",")[i]];
											}
												
											for (var i=0; i<(number-1)/7; i++)
											{
														var poss = new google.maps.LatLng(array[(i*7)+5],array[(i*7)+6]);
														
														var marker = new google.maps.Marker({
																				position: poss,
																				map: map,
																				title: '상대방위치' 
																});
														var infowindow = new google.maps.InfoWindow({
														content: "이름:" + array[(i*7)] + "</br>" + "나이:" + array[(i*7)+1] + "</br>" + "성별:" 
														+ array[(i*7)+2] + "</br>" + "상태:" + array[(i*7)+3] + "</br>" + 
														"<form action='message.jsp' method='post'>" + 
														"<input type='hidden' name='to' value=" + array[(i*7)+4] + ">" + 
														"<input type='submit' value='쪽지보내기'>"
																});
														
														google.maps.event.addListener(marker, 'click', function() {
														infowindow.open(map,marker);});
											}
											
								});
											var marker = new google.maps.Marker({
											position: pos,
											map: map,
											title: '현재위치' 
											});
											
											var infowindow = new google.maps.InfoWindow({
											content: "현재 자기 위치입니다."
											});
											
											google.maps.event.addListener(marker, 'click', function() {
											infowindow.open(map,marker);
											});
											
											map.setCenter(pos);
          }, function() {
            handleNoGeolocation(true);
          });
        } else {
          // Browser doesn't support Geolocation
          handleNoGeolocation(false);
        }
      }

      function handleNoGeolocation(errorFlag) {
        if (errorFlag) {
          var content = 'Error: The Geolocation service failed.';
        } else {
          var content = 'Error: Your browser doesn\'t support geolocation.';
        }

        var options = {
          map: map,
          position: new google.maps.LatLng(60, 105),
          content: content
        };

        var infowindow = new google.maps.InfoWindow(options);
        map.setCenter(options.position);
      }

      google.maps.event.addDomListener(window, 'load', initialize);
    </script>
  </head>
  <body>
  <%= session.getAttribute("name") %>님 환영합니다.
  <a href="updata.jsp">회원정보수정</a>
  <a href="logout.jsp">로그아웃</a>
  
    <div id="map_canvas"></div>
  </body>
</html>