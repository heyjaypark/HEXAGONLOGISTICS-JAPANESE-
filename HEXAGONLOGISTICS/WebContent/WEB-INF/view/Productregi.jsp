<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="u" tagdir="/WEB-INF/tags" %>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>재고 관리</title>

<style>


header h1 {
  text-align: center;
}

footer{
text-align:center;
}

  body {
    display: flex;
    flex-direction: column;
	font-family: Arial, sans-serif;
  }


nav {
  display: flex;
  justify-content: center; /* 좌우 여백을 최대로 확보하고 버튼을 오른쪽으로 정렬 */
  align-items: center; /* 수직 정렬을 위해 추가 */
  margin-top: 20px;
  margin-bottom: 25px;
}

    nav ul {
      list-style: none;
      padding: 0;
      display: flex;
      margin: 0;
    }

    nav li {
      margin: 0 50px; /* 메뉴 간 간격 조절 */
    }

     nav a {
      text-decoration: none;
      padding: 15px 40px; /* 위아래 여백, 좌우 여백 */
      border-radius: 10px; /* 모서리 둥글게 만들기 */
      background-color: #3498db; /* 배경 색상 */
      color: #fff; /* 글자색 */
      transition: background-color 0.3s ease; /* 배경 색상 변경 효과 */
    } 

    nav a:hover {
      background-color: #2980b9; /* 호버 시 배경 색상 변경 */
    }
    .content, section {
        margin-bottom: 20px;
    }
    .content {
        display: flex;
        justify-content: space-between;
    }
    table {
        border-collapse: collapse;
        width: 85%;
        margin-bottom:10px;
    }
    th, td {
        border: 1px solid black;
        text-align: center;
        padding: 8px;
    }
    th {
        background-color: #f2f2f2;
    }
    button {
        background-color: #add8e6; /* 연한 푸른색 */
        color: black;
        padding: 10px 15px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
    }
    button:hover {
        background-color: #9acfe4;
    }
    
        .delete-button {
        background-color: #add8e6; /* 연한 푸른색 */
        color: black;
        padding: 10px 15px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
    }
    
    .submit-button {
    background-color: #4CAF50; /* 짙은 녹색 */
    color: white;
    margin-right: 2px;
    padding: 10px 15px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    float: right;
    }
      section {
    position: relative;
	padding: 20px; /* 적절한 여백 추가 */
  }
  
  #loginButton {
float: right;
}

#loginButton a {
  display: inline-block;
  padding: 10px;
  border-radius: 5px;
  background-color: #3498db;
  color: #fff;
  text-decoration: none;
  text-align: center;
}

#loginButton a:hover {
  background-color: #2980b9;
}
    
</style>
</head>

<body>

<!-- <link rel="stylesheet" type="text/css" href="css/main.css"> -->
	
    <header>
<h1><a href="index.jsp">Hexagon Logistics ver 1.0</a></h1>
    <div id="loginButton">
    <u:notLogin>
    <a href="login.do">ログイン</a>
    </u:notLogin>
    <u:isLogin>
    ${authUser.name} 様こんにちは。

<a href="logout.do">[ログアウト]</a>
<!-- <a href="changePwd.do">[암호변경하기]</a> -->
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
<div align="center">
<form action="productregi.do" method="post">	
	<table border="1">

<tr>
<td>品目コード</td>
<td>品目名</td>
<td>ソウル店</td>
<td>水原店</td>
<td>仁川店</td>
<td>短歌</td>
</tr>
<tr>
<td>
<input type="text" name="p_no" size="27%" value="${param.p_no }"/>

</td>
<td>
<input type="text" name="p_name" size="27%"/>
</td>
<td>
<input type="text" name="p_seoul" size="27%"/>
</td>
<td>
<input type="text" name="p_suwon" size="27%"/>
</td>
<td>
<input type="text" name="p_incheon" size="27%"/>
</td>
<td>
<input type="text" name="price" size="27%"/>
</td>
</tr>
</table>

<c:if test="${errors.numberInsert}">品目コードを入力してください。</c:if>
<c:if test="${errors.duplicateno}">すでに登録されている品目コードです。</c:if>
<c:if test="${errors.NoMinus}">正数を入力してください。</c:if>
<button type="submit" class="submit-button">登録</button>

<c:if test="${errors.successRegi}">
<script type="text/javascript">
alert("登録されました");
</script>
</c:if>




</form>
<a href="/HEXAGONLOGISTICS/productupdate.do">

<button type="submit" class="submit-button">修正ページへ</button>	</a>

</div>
<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
<footer>

<p>&copy; 2023 Hexagon Logistics. All rights reserved.</p>
</footer>




</body>
</html>