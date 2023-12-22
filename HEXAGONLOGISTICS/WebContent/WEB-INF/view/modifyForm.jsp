<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <%@ taglib prefix="u" tagdir="/WEB-INF/tags" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>投稿修正</title>
 <link rel="stylesheet" type="text/css" href="css/main.css">
</head>

<body>
  <%@ include file="/WEB-INF/view/in/header.jsp" %>
<div align="center">
<form action="modify.do" method="post">
<div class="contentTable" align="center">
<table border="1">
<tr>
<td>

	<input type="hidden" name="no" value="${modReq.articleNumber}">
	</td>
<font color = “#000000” size = “7”>
	<th>番号<br/>${modReq.articleNumber}</th>
</font>

</tr>
<tr>
	<th>タイトル<br/>
	</th>
	<!-- 제목 공백 아닐것
	 タイトルは空白ではないこと -->
	<td><input type="text" name="title" value="${modReq.title}"></td>
	</tr>
	<c:if test="${errors.title}">タイトルを入力してください。</c:if>

<tr>
	<th>内容<br/></th>
	<td><textarea name="content" rows="30" cols="50">${modReq.content}</textarea></td>
</tr>
</table>
</div>
<button class= submit-button>投稿修正</button>
</form>
</div>

</body>
</html>