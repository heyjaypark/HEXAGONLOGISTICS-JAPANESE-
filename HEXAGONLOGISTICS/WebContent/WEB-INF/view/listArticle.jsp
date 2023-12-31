<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>投稿リスト</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>
 <%@ include file="/WEB-INF/view/in/header.jsp" %>
	
	
	
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