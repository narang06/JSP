<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board-List</title>
<style>
#container {
	width: 700px;
	margin: 20px auto;
}

table, tr, td, th {
	border: 1px solid black;
	text-align: center;
	border-collapse: collapse;
	padding: 5px 10px;
}
</style>
</head>
<body>
	<%@ include file="../DB/DB.jsp"%>
	<div id="container">
		<table>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>조회수</th>
				<th>작성일</th>
			</tr>

			<%
			ResultSet rs = null;
			String query = "SELECT B.*, TO_CHAR(CDATETIME, 'YYYY-MM-DD') AS CTIME FROM TBL_BOARD B";
			rs = stmt.executeQuery(query);

			while (rs.next()) {
			%>
			<tr>
				<td><%=rs.getString("BOARDNO")%></td>
				<td>
					<%-- <a href="Board_View.jsp?boradNo="><%=rs.getString("TITLE")%> --%>
					<a href="javascript:;" onclick="fnBoard(<%=rs.getString("BOARDNO")%>)"><%=rs.getString("TITLE")%></a>
				</td>
				<td><%=rs.getString("USERID")%></td>
				<td><%=rs.getString("CNT")%></td>
				<td><%=rs.getString("CTIME")%></td>
			</tr>

			<%
			}
			%>
		</table>
	</div>
</body>
</html>
<script>
	function fnBoard(boardNo){
		location.href = "Board_view.jsp?boardNo=" + boardNo;
	}
</script>