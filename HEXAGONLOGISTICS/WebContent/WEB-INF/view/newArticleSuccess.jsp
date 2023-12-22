<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
    <%@ taglib prefix="u" tagdir="/WEB-INF/tags" %>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>書き込み</title>
  <link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>
  <%@ include file="/WEB-INF/view/in/header.jsp" %>
<div>
<div>
<br/><br/>投稿を登録しました。<br/><br/>
</div>
${ctxPath = pageContext.request.contextPath ; '' }
<div class="success">
<a href="${ctxPath}/list.do"><button class = submit-button>投稿リストを見る</button></a>
<a href="${ctxPath}/read.do?no=${newArticleNo}"><button class = submit-button>掲示物の内容を見る</button></a>
</div>
</div>
</body>
</html>