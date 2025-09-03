<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Stu-View</title>
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
	<!-- Stu-View.jsp => 목록에서 학생 이름클릭하면 학생 상세정보 + 학번, 이름, 학과, 시험 평균점수 
	+ 삭제 버튼 만든 후 버튼 클릭 시 해당 학생 삭제 (Stu-Remove.jsp) -->
	<%@ include file="../../DB/DB.jsp"%>
	<div id="container">
		<%
		String stuNo = request.getParameter("STU_NO");
		ResultSet rs = null;
		String query = "SELECT S.STU_NO, STU_NAME, STU_DEPT, AVG(E.ENR_GRADE) AVGGRADE FROM STUDENT S LEFT JOIN ENROL E ON S.STU_NO = E.STU_NO WHERE S.STU_NO = '"
				+ stuNo + "' GROUP BY S.STU_NO, STU_NAME, STU_DEPT";
		rs = stmt.executeQuery(query);
		if (rs.next()) {
		%>
		<h2>학생 상세 정보</h2>
		<form name="student" action="Stu-Remove.jsp">
			<input type="hidden" name="stuNo"
				value="<%=rs.getString("STU_NO")%>">
			<table>
				<tr>
					<th>학번</th>
					<td><%=rs.getString("STU_NO")%></td>
				</tr>
				<tr>
					<th>이름</th>
					<td><%=rs.getString("STU_NAME")%></td>
				</tr>
				<tr>
					<th>학과</th>
					<td><%=rs.getString("STU_DEPT")%></td>
				</tr>
				<tr>
					<th>시험 평균점수</th>
					<td><%=rs.getString("AVGGRADE")%></td>
				</tr>
			</table>
			<div>
				<input type="submit" value="삭제" onclick="fnRemove()">
			</div>
		</form>
		<%
		} else {
		out.println("학생정보 조회에 실패했습니다.");
		}
		%>
	</div>
</body>
</html>
<script>
	function fnRemove() {
		let stuForm = document.student;
		if (!confirm("정말 삭제하시겠습니까?")) {
			
			return;
		}
		stuForm.submit();
	}
</script>