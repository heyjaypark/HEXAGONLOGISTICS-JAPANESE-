<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="u" tagdir="/WEB-INF/tags" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>在庫状況</title>
  <link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

 <%@ include file="/WEB-INF/view/in/header.jsp" %>

<div align="center">
<%-- <form action="productsearch.do" method="post">
<p>
品目コード:<input type="text" name="p_no" value="${param.p_no}"><input type="submit" value="検索">
<br/>
<c:if test="${errors.NumberFormatException}">
   <script type="text/javascript">
alert("数字のみ入力可能です。");
</script>
</c:if>
</p>
</form> --%>


<table border="1">
<tr>

</tr>
<tr>
<th>入庫番号</th>
<th>タイプ</th>
<th>品目番号</th>
<th>品目名</th>
<th>ソウル店</th>
<th>水原店</th>
<th>仁川店</th>
<th>単価</th>
<th>登録日</th>
<th>登録者</th>

</tr>

<c:if test="${productPage.hasNoArticles()}">
<tr>
<td colspan="4">商品がありません</td>
</tr>
</c:if>

<!-- 특정품목 검색시 결과를 표시하고 테이블을 닫는다.
特定品目検索時に結果を表示し、テーブルを閉じる。 -->
<%-- <c:if test= "${errors.notnull}">
<tr>
<td>
${product1.p_no}
</td>
<td>
${product1.p_name}
</td>
<td>
${product1.p_seoul}
</td>
<td>
${product1.p_suwon}
</td>
<td>
${product1.p_incheon}
</td>
<td>
${product1.price}
</td>
</tr>
</table>
</c:if> --%>
<!-- 페이지에 따른 품목리스트 표시
ページによる品目リストの表示 -->
<c:forEach var="product" items="${productLogPage.content}">
<tr>
<td>
${product.l_no}
</td>
<td>
${product.l_class}
</td>
<td>
${product.p_no}
</td>
<td>
${product.l_name}
</td>
<td>
${product.l_seoul}
</td>
<td>
${product.l_suwon}
</td>
<td>
${product.l_incheon}
</td>
<td>
${product.l_price}
</td>
<td>
${product.l_date}
</td>
<td>
${product.l_writer}
</td>
</tr>
</c:forEach>

<!-- 페이징 코드. 단위는 5개.
ページングコード。 単位は5つ。 -->
<c:if test="${productLogPage.hasArticles()}">
<tr>
<td colspan="4">
<c:if test="${productLogPage.startPage > 5}">
<a href="ProductLog.do?pageNo=${productLogPage.startPage - 5}">[以前]</a>
</c:if>
<c:forEach var="pNo"
begin="${productLogPage.startPage}"
end="${productLogPage.endPage}">
<a href="ProductLog.do?pageNo=${pNo}">[${pNo}]</a>
</c:forEach>
<c:if test="${productLogPage.endPage < productLogPage.totalPages}">
<a href="ProductLog.do?pageNo=${productLogPage.startPage + 5}">[次のページ]</a>
</c:if>
</td>
</tr>
</c:if>
</table>
</div>
<form action= "ProductLog.do" method="post">
<button type="submit" class="submit-button">入庫/登録 記録</button>
</form>

  <footer>
<p>&copy; 2023 Hexagon Logistics. All rights reserved.</p>
</footer>
</body>
</html>