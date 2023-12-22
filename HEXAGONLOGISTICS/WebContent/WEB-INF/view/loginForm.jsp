<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
      <%@ taglib prefix="u" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ログイン</title>
 <link rel="stylesheet" type="text/css" href="css/main.css">
</head>

<body>
 <%@ include file="/WEB-INF/view/in/header.jsp" %>

<br/><br/><br/><br/>

<!-- 로그인 폼과 오류메세지
ログインフォームとエラーメッセージ -->
<form action="login.do" method="post">
<div align="center">
<c:if test="${errors.idOrPwNotMatch}">
社員番号とパスワードが一致しません。
</c:if>
<p>
社員番号:<br/><input type="text" name="id" value="${param.id}">
<c:if test="${errors.id}"><br/>社員番号を入力してください。</c:if>
</p>
<p>
パスワード:<br/><input type="password"  name="password">
<c:if test="${errors.password}"><br/>パスワードを入力してください。</c:if>
</p>
<section>
<button class="submit-button">ログイン</button>
</form>
<form action="join.do" method =post>
<button type="submit" class="submit-button">会員登録ページへ</button>
</form>

</section>



</div>
</body>
</html>