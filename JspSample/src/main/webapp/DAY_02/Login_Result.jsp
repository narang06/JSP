<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login_Result</title>
</head>
<body>
	<%@ include file="../../DB/DB.jsp"%>

	<%
	String userId1 = request.getParameter("userId");
	String pwd1 = request.getParameter("pwd");

	ResultSet rs = null;
	String query = "SELECT * FROM TBL_USER";
	rs = stmt.executeQuery(query);

	while (rs.next()) {
		String userId2 = rs.getString("USERID");
		String pwd2 = rs.getString("PASSWORD");
		if (userId2.equals(userId1) && pwd1.equals(pwd2)) {
			out.println("로그인 성공");
			response.sendRedirect("Main.jsp"); // Main.jsp로 이동
			break;
		}
	}
	if (rs.next() == false) {
		out.println("로그인 실패");
	}
	%>
</body>
</html>