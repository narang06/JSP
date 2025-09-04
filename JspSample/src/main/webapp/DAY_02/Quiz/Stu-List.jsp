<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Stu-List</title>
<style>
#container {
	width: 500px;
	height: 300px;
	margin: 20px auto;
}

table, tr, td, th {
	border: 1px solid black;
	text-align: center;
	border-collapse: collapse;
	padding: 5px 10px;
}

#search {
	margin-bottom: 10px;
}

.button {
	margin-top: 5px;
}
</style>
</head>
<body>
	<!-- Stu-List.jsp => 학생목록을 테이블 형태로 출력 +(출력컬럼 - 학번,이름,학과,키) + 검색 기능 추가(이름으로 검색) -->
	<%@ include file="../../DB/DB.jsp"%>
	<div id="container">
		<div id="search">
			검색어 : <input type="text" id="keyword">
			<button onclick="fnSearch()">검색</button>
		</div>
		<table>
			<tr>
				<th>학번</th>
				<th>이름</th>
				<th>학과</th>
				<th>키</th>
			</tr>

			<%
			ResultSet rs = null;
			String keyword = request.getParameter("keyword");

			String keywordQuery = "";
			if (keyword != null) {
				keywordQuery = "WHERE STU_NAME LIKE '%" + keyword + "%'";
			}

			String query = "SELECT * FROM STUDENT " + keywordQuery;
			rs = stmt.executeQuery(query);

			while (rs.next()) {
			%>
			<tr>
				<td><%=rs.getString("STU_NO")%></td>
				<td><a href="javascript:;"
					onclick="fnBoard(<%=rs.getString("STU_NO")%>)"><%=rs.getString("STU_NAME")%></a>
				</td>
				<td><%=rs.getString("STU_DEPT")%></td>
				<td><%=rs.getString("STU_HEIGHT")%></td>
			</tr>
			<%
			}
			%>
		</table>
		<div class="button">
			<a href="Stu-Add.jsp"> <input type="button" value="학생 추가"></a>
		</div>
	</div>
</body>
</html>
<script>
	function fnBoard(stuNo){
		location.href = "Stu-View.jsp?STU_NO=" + stuNo;
	}
	function fnSearch(){
		let keyword = document.querySelector("#keyword").value;
		location.href ="Stu-List.jsp?keyword="+keyword;
	}
</script>