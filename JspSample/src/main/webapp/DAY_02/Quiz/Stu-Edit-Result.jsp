<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Stu-Edit-Result</title>
</head>
<body>
	<%@ include file="../../DB/DB.jsp"%>
	<%
	String boardNo = request.getParameter("boardNo");
	String kind = request.getParameter("kind");
	String title = request.getParameter("title");
	String userId = request.getParameter("userId");
	String contents = request.getParameter("contents");

	String query = "UPDATE TBL_BOARD SET TITLE = '" + title + "', CONTENTS = '" + contents + "', KIND = '" + kind
			+ "', USERID = '" + userId + "' WHERE BOARDNO = '" + boardNo + "'";
	
	int result = stmt.executeUpdate(query);

	if (result > 0) {
		out.println("게시글이 성공적으로 수정되었습니다.");
	} else {
		out.println("게시글 수정에 실패했습니다.");
	} 
	%>
	<div>
		<a href="Board-List.jsp"><button>목록으로</button></a>
	</div>

</body>
</html>