<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  <%@ taglib prefix="u" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>販売履歴</title>
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
		<a href=index.jsp><h1>Hexagon Logistics ver 1.0</h1></a>
		<div id="loginButton">
			<u:notLogin>
				<a href="login.do">ログイン</a>
			</u:notLogin>
			<u:isLogin>
    ${authUser.name}様こんにちは。
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
	<div>
		<a href="registSales.do"><button>販売登録ページへ</button></a>
		<form action="salesSearch.do" name="p_no" method="post">
			<div>
				<select name="select_num">
    				<option value="1">取引番号</option>
    				<option value="2">品目コード</option>    
				</select>
				<input type="text" name="code" value = "${param.code}" required>
			</div>
			<div>
				<input type="submit" value="検索">
			</div>
		</form>
	</div>
	<div align="center">
		<table border="1">
			<tr>
				<th>取引番号</th>
				<th>品目コード</th>
				<th>品目名</th>
				<th>ソウル店販売量</th>
				<th>水原店販売量</th>
				<th>仁川店販売量</th>
				<th>日付</th>
				<th>短歌</th>
			</tr>
			
			<c:if test="${salesPage.hasNoArticles()}">
				<tr>
					<td colspan="7">販売履歴がありません。</td>
				</tr>
			</c:if>
			
			<c:forEach var="sales" items="${salesPage.content}">
				<tr>
					<!-- 거래 번호  -->
					<td>${sales.s_Num}</td>
					<!-- 품목번호 -->
					<td>${sales.p_No}</td>
					<!-- 품목명 -->
					<td>${sales.p_Name}</td>
					<!-- 서울점 -->
					<td>${sales.s_Seoul}</td>
					<!-- 수원점 -->
					<td>${sales.s_Suwon}</td>
					<!-- 인천점 -->
					<td>${sales.s_Incheon}</td>
					<!-- 날짜 -->
					<td>${sales.s_Date}</td>
					<!-- 가격 -->
					<td>${sales.price}</td>
				</tr>
			</c:forEach>
			<c:if test="${salesPage.hasArticles()}">		
			<tr>
				<td colspan="7"></td>
			</tr>	
			<tr>
			<td colspan="4">
				<c:if test="${salesPage.startPage > 5}">
					<a href="salesList.do?pageNo=${salesPage.startPage - 5}">[以前]</a>
				</c:if>
				<c:forEach var="pNo"
					begin="${salesPage.startPage}"
					end="${salesPage.endPage}">
					<a href="salesList.do?pageNo=${pNo}">[${pNo}]</a>
				</c:forEach>
				<c:if test="${salesPage.endPage < salesPage.totalPages}">
				<a href="salesList.do?pageNo=${salesPage.startPage + 5}">[次のページへ]</a>
				</c:if>
			</td>
		</tr>
		</c:if>
		</table>
	</div>
</body>
</html>