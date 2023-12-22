<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>販売登録</title>


<style>


header h1 {
  text-align: center;
}

footer{
text-align:center;
}

  body {
    display: flex;
    flex-direction: column;
	font-family: Arial, sans-serif;
  }


nav {
  display: flex;
  justify-content: center; /* 좌우 여백을 최대로 확보하고 버튼을 오른쪽으로 정렬 */
  align-items: center; /* 수직 정렬을 위해 추가 */
  margin-top: 20px;
  margin-bottom: 25px;
}

    nav ul {
      list-style: none;
      padding: 0;
      display: flex;
      margin: 0;
    }

    nav li {
      margin: 0 50px; /* 메뉴 간 간격 조절 */
    }

    nav a {
      text-decoration: none;
      padding: 15px 40px; /* 위아래 여백, 좌우 여백 */
      border-radius: 10px; /* 모서리 둥글게 만들기 */
      background-color: #3498db; /* 배경 색상 */
      color: #fff; /* 글자색 */
      transition: background-color 0.3s ease; /* 배경 색상 변경 효과 */
    }

    nav a:hover {
      background-color: #2980b9; /* 호버 시 배경 색상 변경 */
    }
    .content, section {
        margin-bottom: 20px;
    }
    .content {
        display: flex;
        justify-content: space-between;
    }
    table {
        border-collapse: collapse;
        width: 100%;
        margin-bottom:10px;
    }
    th, td {
        border: 1px solid black;
        text-align: center;
        padding: 8px;
    }
    th {
        background-color: #f2f2f2;
    }
    button {
        background-color: #add8e6; /* 연한 푸른색 */
        color: black;
        padding: 10px 15px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
    }
    button:hover {
        background-color: #9acfe4;
    }
    
        .delete-button {
        background-color: #add8e6; /* 연한 푸른색 */
        color: black;
        padding: 10px 15px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
    }
    
    .submit-button {
    background-color: #4CAF50; /* 짙은 녹색 */
    color: white;
    padding: 10px 15px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    float: right;
    }
      section {
    position: relative;
	padding: 20px; /* 적절한 여백 추가 */
  }
  
  #loginButton {
float: right;
}

#loginButton a {
  display: inline-block;
  padding: 10px;
  border-radius: 5px;
  background-color: #3498db;
  color: #fff;
  text-decoration: none;
  text-align: center;
}

#loginButton a:hover {
  background-color: #2980b9;
}
    
</style>
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


    <header>
<h1><a href="index.jsp">Hexagon Logistics ver 1.0</a></h1>
    <div id="loginButton">
    <u:notLogin>
    <a href="login.do">ログイン</a>
    </u:notLogin>
    <u:isLogin>
    ${authUser.name}様こんにちは。
<a href="logout.do">[ログアウト]</a>
</u:isLogin>


  </div>
    </header>

<nav>
  <ul>
    <li><a href="productlist.do">在庫状況</a></li>
    <li><a href="productregi.do">在庫管理</a></li>
    <li><a href="registSales.do">販売/履歴</a></li>
    <li><a href="list.do">お知らせ</a></li>
  </ul>
</nav>

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
        <th>短歌</th>
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