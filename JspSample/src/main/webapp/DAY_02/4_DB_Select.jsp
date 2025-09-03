<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DB_Select</title>
</head>
<body>
	<%@ include file="../DB/DB.jsp"%>
	<!-- DB 파일 연결(참조)  -->
	<%
	ResultSet rs = null;
	String query = "SELECT * FROM STUDENT";
	rs = stmt.executeQuery(query);

	/* rs.next(); // 데이터가 있으면 true 리턴 , 아니면 false 리턴
	String stuName = rs.getString("STU_NAME");
	out.println(stuName + "입니다.");

	rs.next(); // 데이터가 있으면 true 리턴 , 아니면 false 리턴
	String stuName1 = rs.getString("STU_NAME");
	out.println(stuName1 + "입니다."); */

	while (rs.next()) {
		String stuName = rs.getString("STU_NAME");
		out.println(stuName + "입니다.");
	}
	%>
</body>
</html>