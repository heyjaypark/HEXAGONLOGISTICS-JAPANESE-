<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
      <%@ taglib prefix="u" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>書き込み</title>
  <link rel="stylesheet" type="text/css" href="css/main.css">

</head>
<body>
  <%@ include file="/WEB-INF/view/in/header.jsp" %>
<div class="contentTable" align="center">
<form action="write.do" method="post">
<table border="1">
<tr>
<th>
<font color = “#000000” size = “7”>
タイトル</font>
</th>
<td>
<input type="text" name="title" value="${param.title}"/>

</td>
<!-- 제목은 공백이 아닐 것
タイトルは空白でないこと -->
<c:if test="${errors.title}">タイトルを入力してください。</c:if>
</tr>
<br/>
<tr>
<th><font color = “#000000” size = “7”>
内容</font></th>
<td><textarea name="content" rows="30" cols="50">${param.content}</textarea></td>
</tr>

</table>
<button class= submit-button>登録</button>
</form>
</div>
</body>
</html>