<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
      <%@ taglib prefix="u" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>投稿削除</title>
 <link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>
 <%@ include file="/WEB-INF/view/in/header.jsp" %>
<div align="center">
<!-- 회원가입에 필요한 정보 입력란
会員登録に必要な情報入力欄 -->
<form action="join.do" method="post">
<p>
社員番号:<br/><input type="text" name="id" value="${param.id}">
<c:if test="${errors.id}"><br>社員番号を入力してください。</c:if>
<c:if test="${errors.duplicateId}"><br>登録済みの社員番号です。</c:if>
</p>
<p>
名前:<br/><input type="text" name="name" value="${param.name}">
<c:if test="${errors.name}"><br>名前を入力してください。</c:if>
</p>
<p>
パスワード:<br/><input type="password" name="password">
<c:if test="${errors.password}"><br>パスワードを入力してください。</c:if>
</p>
<p>
パスワード確認:<br/><input type="password" name="confirmPassword">
<c:if test="${errors.confirmPassword}"><br>暗号確認を入力してください。</c:if>
<c:if test="${errors.notMatch}"><br>パスワードと確認が一致しません。</c:if>
</p>
<button class = submit-button>会員加入</button>
</form>
</div>

</body>
</html>