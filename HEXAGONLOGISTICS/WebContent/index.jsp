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

<header>

<h1>Hexagon Logistics ver 1.0</h1>

    <div id="loginButton">
    <u:notLogin>
    <a href="login.do">ログイン</a>
    </u:notLogin>
    <u:isLogin>
    ${authUser.name} 様こんにちは。
<a href="logout.do">[ログアウト]</a>
</u:isLogin>


  </div>
</header>

<nav>
  <ul>
    <li><a href="productlist.do">在庫状況</a></li>
    <li><a href="productregi.do">在庫管理</a></li>
    <li><a href="registSales.do">販売/履歴</a></li>
    <li><a href="list.do">お知らせ</a></li>
  </ul>

</nav>

<section>

<h2>ようこそ!ヘキサゴン物流在庫管理プログラムのメイン画面です。<br/>
次の画像を通じて、当プログラムの様子を事前にご確認ください！</h2>

<!-- 버튼별 이미지 표시
ボタン別画像表示 -->
<button id="introBtn" onclick="displayImage('imageServlet?imageName=intro.png')"></button>
<button id="stockManageBtn" onclick="displayImage('imageServlet?imageName=stockmanage.png')"></button>
<button id="salesBtn" onclick="displayImage('imageServlet?imageName=sales.png')"></button>
<button id="stockListBtn" onclick="displayImage('imageServlet?imageName=stocklist.png')"></button>


<div id="imageDisplay">
        <img src="imageServlet?imageName=intro.png" alt="이미지">
    </div>

<script>
    function displayImage(imageUrl) {
        document.getElementById('imageDisplay').innerHTML = '<img src="' + imageUrl + '" alt="이미지">';
    }

</script>
    
</section>

<footer>
<p>&copy; 2023 Hexagon Logistics. All rights reserved.</p>
</footer>
</body>
</html>