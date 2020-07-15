<%--
  Created by IntelliJ IDEA.
  User: bit
  Date: 2020-05-29
  Time: 오전 9:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>홈페이지</title>
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <link rel="stylesheet" href="/css/home.css">
</head>
<body>

<div class="menubar">
    <%@include file="navbar.jsp" %>
</div>

<div class="container">
    <div class="graphbox">
        <div class="box_top_name">
            <span>현황</span>
            <hr>
        </div>
        <div class="graph_insert">
            <img src="/image/homeImages/testgraph1.png"/>&nbsp;
        </div>
    </div>
    <div class="mapbox">
        <div class="box_top_name">
            <span>가맹점 위치</span>
            <hr>
        </div>
        <div class="box_insert">
            <img src="/image/homeImages/map1.jpg"/>
        </div>
        <div class="map_button">
            <button id="button_effect">가맹점 찾기</button>
        </div>
    </div>
    <div class="bannerbox">
        <div class="box_top_name">
            <span>토탈 지역화폐</span>
            <hr>
        </div>
        <div class="box_insert">
            <%@include file="banner.jsp" %>
        </div>
    </div>
    <div class="newsbox">
        <div class="box_top_name">
            <span>뉴스 및 이슈</span>
            <hr>
        </div>
        <div class="box_insert">
            <span>뉴스api크롤링</span>
        </div>
    </div>
    <div class="videobox">
        <div class="box_top_name">
            <span>팝업존</span>
            <hr>
        </div>
        <div class="box_insert">
            <%--                <span>YouTube 팝업 삽입</span>--%>
            <jsp:include page="popup.jsp"/>
        </div>
    </div>
</div>
<footer>
    <div class="foo_div1">
        <span>모둠전</span> <span>|</span>
        <span>대표 : 영웅다영</span> <span>|</span>
        <p>주소 : 비트교육센터</p>
    </div>
</footer>

</body>
</html>
