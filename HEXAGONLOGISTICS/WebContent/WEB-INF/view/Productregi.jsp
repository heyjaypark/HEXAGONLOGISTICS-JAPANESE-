<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="u" tagdir="/WEB-INF/tags" %>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>在庫管理</title>
  <link rel="stylesheet" type="text/css" href="css/main.css">
</head>

<body>

 <%@ include file="/WEB-INF/view/in/header.jsp" %>
<div align="center">
<form action="productregi.do" method="post">	
	<table border="1">

<tr>

<th>品目名</th>
<th>ソウル店</th>
<th>水原店</th>
<th>仁川店</th>
<th>短歌</th>
</tr>
<tr>

<td>
<input type="text" name="p_name" size="27%"/>
</td>
<td>
<input type="text" name="p_seoul" size="27%"/>
</td>
<td>
<input type="text" name="p_suwon" size="27%"/>
</td>
<td>
<input type="text" name="p_incheon" size="27%"/>
</td>
<td>
<input type="text" name="price" size="27%"/>
</td>
</tr>
</table>

<button type="submit" class="submit-button">登録</button>

<!-- 에러발생 및 등록 성공시 -->
<c:if test="${errors.NoMinus}">
正数を入力してください
</c:if>

<c:if test="${errors.numberInsert}">
入力してください
</c:if>


<c:if test="${errors.successRegi}">
<script type="text/javascript">
alert("登録されました");
</script>
</c:if>




</form>
<a href="/HEXAGONLOGISTICS/productupdate.do">

<button type="submit" class="submit-button">修正ページへ</button>	</a>

</div>
<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
<footer>

<p>&copy; 2023 Hexagon Logistics. All rights reserved.</p>
</footer>




</body>
</html>