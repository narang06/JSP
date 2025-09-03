<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert_Result</title>
</head>
<body>
	<%@ include file="../DB/DB.jsp"%>
	<!-- insert 하기전 stuno가 db에 있는지 확인하고  -->
	<!-- 없으면 insert, 있으면 '해당학번은 이미 사용중입니다' 출력  -->
	<%
	String stuNo = request.getParameter("StuNo");
	String stuName = request.getParameter("StuName");
	String stuDept = request.getParameter("StuDept");

	ResultSet rs = null;
	String query = "SELECT * FROM STUDENT WHERE STU_NO = '" + stuNo + "'";
	rs = stmt.executeQuery(query);
	if (rs.next()) {
		out.print("해당학번은 이미 사용중입니다");
	} else {
		String insertQuery = "INSERT INTO STUDENT(STU_NO, STU_NAME, STU_DEPT) VALUES ('" + stuNo + "', '" + stuName + "', '"
		+ stuDept + "')";
		int result = stmt.executeUpdate(insertQuery);
		if (result > 0) {
			out.print("추가되었습니다.");
		} else {
			out.print("오류가 발생했습니다.");
		}
	}
	%>
</body>
</html>