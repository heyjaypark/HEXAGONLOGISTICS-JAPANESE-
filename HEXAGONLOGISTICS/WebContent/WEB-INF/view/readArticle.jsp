<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="u" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>お知らせ</title>

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
        width: 80%;
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
    
     section {
   display: flex;
       justify-content: center;
       align-items: center;
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
    float: center;
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
  <header>
<h1><a href="index.jsp">Hexagon Logistics ver 1.0</a></h1>
    <div id="loginButton">
    <u:notLogin>
    <a href="login.do">ログイン</a>
    </u:notLogin>
    <u:isLogin>
    ${authUser.name}様こんにちは。
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

<div align="center">
<table border="1">
<tr>
<td>No</td>
<td>${articleData.article.number}</td>
</tr>
<tr>
<td>書き手</td>
<td>${articleData.article.writer.name}</td>
</tr>
<tr>
<td>題名</td>
<td><c:out value='${articleData.article.title}'/></td>
</tr>
<tr>
<td>内容</td>
<td><u:pre value='${articleData.content}'/></td>
</tr>
<tr>
<td colspan="2">

<c:set var="pageNo" value="${empty param.pageNo ? '1' : param.pageNo}" />
<a href="list.do?pageNo=${pageNo}"><button class=submit-button>投稿リストへ</button></a>
<!-- 로그인한 유저가 작성자라면 상세 기능 버튼을 표시한다
ログインしたユーザーが作成者であれば詳細機能ボタンを表示する -->
<c:if test="${authUser.id == articleData.article.writer.id}">
<a href="modify.do?no=${articleData.article.number}"><button class=submit-button>投稿修正</button></a>
<a href="delete.do?no=${articleData.article.number}"><button class=submit-button>投稿削除</button></a>
</c:if>
</td>
</tr>
</table>
</div>

</body>
</html>