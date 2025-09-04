<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board_View</title>
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

th {
	background-color: #ccc;
	witdh: 100px;
}

td {
	width: 500px;
}

.contents {
	height: 300px;
}
</style>
</head>
<body>
	<!-- 제목, 작성자, 작성일, 내용 -->
	<%@ include file="../DB/DB.jsp"%>

	<div id="container">

		<%
		String boardNo = request.getParameter("boardNo");
		ResultSet rs = null;
		String query = "SELECT B.*, TO_CHAR(CDATETIME, 'YYYY-MM-DD') AS CTIME FROM TBL_BOARD B WHERE BOARDNO = '" + boardNo
				+ "'";
		rs = stmt.executeQuery(query);

		if (rs.next()) {
		%>
		<h2>게시글 상세 정보</h2>
		<form name="board" action="Board-Remove.jsp">
			<input type="hidden" name="boardNo"
				value="<%=rs.getString("BOARDNO")%>">
			<table>
				<tr>
					<th>제목</th>
					<td><%=rs.getString("TITLE")%></td>
				</tr>
				<tr>
					<th>작성자</th>
					<td><%=rs.getString("USERID")%></td>
				</tr>
				<tr>
					<th>작성일</th>
					<td><%=rs.getString("CTIME")%></td>
				</tr>
				<tr>
					<th>내용</th>
					<td class="contents"><%=rs.getString("CONTENTS")%></td>
				</tr>
			</table>

			<%
			String sessionId = (String) session.getAttribute("sessionId");
			String userId = rs.getString("USERID");
			String status = (String) session.getAttribute("sessionStatus");
			if ("A".equals(status) || userId.equals(sessionId)) {
			%>
			<div>
				<input type="button" value="삭제" onclick="fnRemove()"> 
				<input type="button" value="수정" onclick="fnEdit()">
			</div>
			<%
			}
			%>

		</form>
		<%
		} else {
		out.println("게시글 조회에 실패했습니다.");
		}
		%>
	</div>
</body>
</html>
<script>
	function fnEdit() {
		let board = document.board;
		let boardNo = board.boardNo.value;
		location.href = "Board-Edit.jsp?boardNo=" + boardNo;
	}

	function fnRemove() {
		let board = document.board;
		if (!confirm("정말 삭제하시겠습니까?")) {
			return;
		}
		board.submit();
	}
</script>