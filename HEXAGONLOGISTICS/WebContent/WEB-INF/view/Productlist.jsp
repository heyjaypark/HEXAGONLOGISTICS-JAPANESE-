<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="u" tagdir="/WEB-INF/tags" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>在庫状況</title>
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
<header>

<a href="index.jsp"><h1>Hexagon Logistics ver 1.0</h1></a>

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
<form action="productsearch.do" method="post">
<p>
品目コード:<input type="text" name="p_no" value="${param.p_no}"><input type="submit" value="検索">
<br/>
<c:if test="${errors.NumberFormatException}">品目コードを入力してください。</c:if>
</p>
</form>


<table border="1">
<tr>

</tr>
<tr>
<td>品目コード入力</td>
<td>品目名</td>
<td>ソウル店</td>
<td>水原店</td>
<td>仁川店</td>
<td>短歌</td>

</tr>

<c:if test="${productPage.hasNoArticles()}">
<tr>
<td colspan="4">商品がありません</td>
</tr>
</c:if>

<c:if test= "${errors.notnull}">
<tr>
<td>
${product1.p_no}
</td>
<td>
${product1.p_name}
</td>
<td>
${product1.p_seoul}
</td>
<td>
${product1.p_suwon}
</td>
<td>
${product1.p_incheon}
</td>
<td>
${product1.price}
</td>
</tr>
</table>
</c:if>

<c:forEach var="product" items="${productPage.content}">
<tr>
<td>
${product.p_no}
</td>
<td>
${product.p_name}
</td>
<td>
${product.p_seoul}
</td>
<td>
${product.p_suwon}
</td>
<td>
${product.p_incheon}
</td>
<td>
${product.price}
</td>

</tr>
</c:forEach>
<c:if test="${productPage.hasArticles()}">
<tr>
<td colspan="4">
<c:if test="${productPage.startPage > 5}">
<a href="productlist.do?pageNo=${productPage.startPage - 5}">[以前]</a>
</c:if>
<c:forEach var="pNo"
begin="${productPage.startPage}"
end="${productPage.endPage}">
<a href="productlist.do?pageNo=${pNo}">[${pNo}]</a>
</c:forEach>
<c:if test="${productPage.endPage < productPage.totalPages}">
<a href="productlist.do?pageNo=${productPage.startPage + 5}">[次のページ]</a>
</c:if>
</td>
</tr>
</c:if>
</table>
</div>
</body>
</html>