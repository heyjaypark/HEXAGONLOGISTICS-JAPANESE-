<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib prefix="u" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>加入完了</title>
 <link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>
 <%@ include file="/WEB-INF/view/in/header.jsp" %>
<section>
${param.name}様、会員登録に成功しました。
<a href="login.do"><button class = submit-button>ログインする</button></a>
<br/>
</section>
</body>
</html>