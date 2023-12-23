<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>販売登録</title>
  <link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<!-- 에러 종류에 따른 메세지 출력
エラーの種類によるメッセージ出力 -->

<c:if test="${errors.salesDateError}">
    <script type="text/javascript">
alert("販売日を選択してください。");
</script>
</c:if>



<c:if test="${errors.salesRateError}">
<script type="text/javascript">
alert("${salesRateErrorMessage}");
</script>
</c:if>


<c:if test="${errors.salesError}">
    <script type="text/javascript">
    alert("少なくとも1つの販売量を入力してください。");
</script>
    </c:if>

<c:if test="${errors.numberFormat}">
    <script type="text/javascript">
alert("数字のみ入力可能です。");
</script>
</c:if>



<c:if test="${errors.databaseError}">
    <script type="text/javascript">
alert("${databaseErrorMessage}");
</script>
</c:if>

<c:if test="${errors.unknwonError}">
<script type="text/javascript">
alert("${unknownErrorMessage}");
</script>
</c:if>
<c:if test="${errors.success}">
<script type="text/javascript">
alert("登録されました。");
</script>
</c:if>


 <%@ include file="/WEB-INF/view/in/header.jsp" %>

    <div class="content">
        <div>
            <form action="salesList.do" method="get">
                <button type="submit">販売履歴ページへ</button>
            </form>
        </div>
        <!-- 판매하려는 품목의 정보를 검색
        販売したい品目の情報を検索 -->
        <div>
            <c:if test="${errors.p_no}">品目コードを入力してください。</c:if>
            <form action="selectSales.do" method="post">
                <input type="text" name="p_no" placeholder="品目コードを入力してください。">
                <button type="submit">検索</button>
            </form>
        </div>
    </div>

    <section>
    <form action="registSales.do" method="POST">
    <table id="myTable">
    <tr>
        <th>品目コード</th>
        <th>品目名</th>
        <th>ソウル店在庫</th>
        <th>ソウル販売</th>
        <th>仁川店在庫</th>
        <th>仁川店販売</th>
        <th>水原店在庫</th>
        <th>水原店販売</th>
        <th>単価</th>
        <th>日付</th>
        <th>action</th>
    </tr>
    <!-- 검색성공시 행을 추가해 품목정보를 보여주고,
    판매에 필요한 데이터를 입력한다.
    検索成功時に行を追加して品目情報を表示し
    販売に必要なデータを入力する -->
    <c:if test="${not empty prod.p_no }">
    <tr>
    <td><input type="hidden" name="p_no" value="${prod.p_no}">${prod.p_no }</td>
    <td>${prod.p_name }</td>
    <td><input type="hidden" name="p_seoul" value="${prod.p_seoul}">${prod.p_seoul }</td>
    <td><input type="text" name="s_seoul"></td>
    <td><input type="hidden" name="p_suwon" value="${prod.p_suwon}">${prod.p_suwon }</td>
        <td><input type="text" name="s_suwon"></td>
    <td><input type="hidden" name="p_incheon" value="${prod.p_incheon}">${prod.p_incheon }</td>
        <td><input type="text" name="s_incheon"></td>
    <td>${prod.price }</td>
    <td><input type="date" name="s_date" id="today"></td>
    <td><button onclick="deleteRow(this)">削除</button>
    </tr>
    </c:if>
    </table>
    <c:if test="${not empty prod.p_no }">
    <button type="submit" class="submit-button">登録</button>
    </c:if>
    </form>
    </section>
    <footer>
<p>&copy; 2023 Hexagon Logistics. All rights reserved.</p>
</footer>
</body>

</html>