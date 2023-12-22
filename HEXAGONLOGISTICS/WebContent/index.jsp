<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags" %>
           
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hexagon Logistics ver 1.0</title>
  <link rel="stylesheet" type="text/css" href="css/main.css">


</head>

<body>

 <%@ include file="/WEB-INF/view/in/header.jsp" %>
<div id="mainSection">
<section>

<h2>ようこそ!ヘキサゴン物流在庫管理プログラムのメイン画面です。<br/>
次の画像を通じて、当プログラムの様子を事前にご確認ください！</h2>

<!-- 버튼별 이미지 표시
ボタン別画像表示 -->
<button class= "image-button" id="introBtn" onclick="displayImage('imageServlet?imageName=intro.png')"></button>
<button class= "image-button" id="stockManageBtn" onclick="displayImage('imageServlet?imageName=stockmanage.png')"></button>
<button class= "image-button" id="salesBtn" onclick="displayImage('imageServlet?imageName=sales.png')"></button>
<button class= "image-button" id="stockListBtn" onclick="displayImage('imageServlet?imageName=stocklist.png')"></button>

<div id="imageDisplay">
        <img src="imageServlet?imageName=intro.png" alt="이미지">
    </div>

<script>
    function displayImage(imageUrl) {
        document.getElementById('imageDisplay').innerHTML = '<img src="' + imageUrl + '" alt="이미지">';
    }

</script>
    
</section>
</div>
<footer>
<p>&copy; 2023 Hexagon Logistics. All rights reserved.</p>
</footer>
</body>
</html>