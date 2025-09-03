<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DB_Delete</title>
</head>
<body>
	<%@ include file="../DB/DB.jsp"%>
	<%
		String stuNo = "20153075";
		String query = "DELETE FROM STUDENT WHERE STU_NO = '" +stuNo + "'";
		int result = stmt.executeUpdate(query);
		
		if(result > 0) {
			out.println("삭제되었습니다.");
		} else {
			out.println("없는 학번입니다.");
		}
	%>
</body>
</html>