<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board-Add-Result</title>
</head>
<body>
	<%@ include file="../DB/DB.jsp"%>

	<%
	String kind = request.getParameter("kind");
	String title = request.getParameter("title");
	String userId = request.getParameter("userId");
	String contents = request.getParameter("contents");

	String query = "INSERT INTO TBL_BOARD VALUES (B_SEQ.NEXTVAL, '" + title + "', '" + contents + "', '" + userId
			+ "', 0, 0, '" + kind + "', SYSDATE, SYSDATE)";

	int result = stmt.executeUpdate(query);

	if (result > 0) {
		out.println("작성되었습니다.");
	%>
	<div>
		<a href="Board-List.jsp">목록으로</a>
	</div>

	<%
	} else {
	out.println("오류가 발생되었습니다.");
	}
	%>

</body>
</html>