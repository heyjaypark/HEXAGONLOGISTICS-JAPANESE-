<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>投稿リスト</title>
<style>
header h1 {
	text-align: center;
}

footer {
	text-align: center;
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
	width: 100%;
	margin-bottom: 10px;
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
	<link rel="stylesheet" type="text/css" href="css/main.css">
	<header>
		<a href=index.jsp><h1>Hexagon Logistics ver 1.0</h1></a>
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
	<table border="1">
		<tr>
			<td colspan="4"><h1>
					<a href="write.do">[書き込み]</a>
				</h1></td>
		</tr>
		<tr>
			<th>NO</th>
			<th>題名</th>
			<th>書き手</th>
			<th>照会数</th>
		</tr>
		<c:if test="${articlePage.hasNoArticles()}">
			<tr>
				<td colspan="4">投稿がありません。</td>
			</tr>
		</c:if>
		<!-- 게시글 리스트
投稿リスト -->
		<c:forEach var="article" items="${articlePage.content}">
			<tr>
				<td>${article.number}</td>
				<td><a
					href="read.do?no=${article.number}&pageNo=${articlePage.currentPage}">
						<c:out value="${article.title}" />
				</a></td>
				<td>${article.writer.name}</td>
				<td>${article.readCount}</td>
			</tr>
		</c:forEach>
		<c:if test="${articlePage.hasArticles()}">
			<tr>
				<td colspan="4"><c:if test="${articlePage.startPage > 5}">
						<a href="list.do?pageNo=${articlePage.startPage - 5}">[以前]</a>
					</c:if> <!-- 페이징 코드. 단위는 5개
						ページングコード。 単位は五つ --> <c:forEach var="pNo"
						begin="${articlePage.startPage}" end="${articlePage.endPage}">
						<a href="list.do?pageNo=${pNo}">[${pNo}]</a>
					</c:forEach> <c:if test="${articlePage.endPage < articlePage.totalPages}">
						<a href="list.do?pageNo=${articlePage.startPage + 5}">[次ページへ]</a>
					</c:if></td>
			</tr>
		</c:if>
	</table>
	<footer>
		<p>&copy; 2023 Hexagon Logistics. All rights reserved.</p>
	</footer>
</body>
</html>