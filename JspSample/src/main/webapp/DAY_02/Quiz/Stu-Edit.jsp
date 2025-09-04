<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Stu-Edit</title>
<style>
#container {
	width: 700px;
	margin: 20px auto;
}

table, tr, td, th {
	border: 1px solid black;
	border-collapse: collapse;
	padding: 5px 10px;
}

table {
    width: 300px;  
    table-layout: fixed; /
}

th {
    background-color: #ccc;
    width: 100px; 
}

td {
    width: 300px;  
}

.input-txt {
    width: 70%;     
    height: 20px;
}

.button {
	margin-top: 2px;
}
</style>
</head>
<body>
	<%@ include file="../../DB/DB.jsp"%>
	<%
	String stuNo = request.getParameter("stuNo");
	ResultSet rs = null;
	String query = "SELECT * FROM STUDENT WHERE STU_NO = '" + stuNo + "'";
	rs = stmt.executeQuery(query);
	rs.next();
	%>
	<div id="container">
		<h2>학생 정보 수정</h2>
		<form name="board" action="Stu-Edit-Result.jsp">
			<input name="stuNo" value="<%= rs.getString("STU_NO")%>" hidden>
			<table>			
				<tr>
					<th>학번</th>
					<td><input type="text" name="stuNo" class="input-txt"></td>
				</tr>
				<tr>
					<th>이름</th>
					<td><input type="text" name="stuName" class="input-txt"></td>
				</tr>
				<tr>
					<th>학과</th>
					<td><input type="text" name="stuDept" class="input-txt"></td>
				</tr>
				<tr>
					<th>키</th>
					<td><input type="text" name="stuHeight" class="input-txt"></td>
				</tr>
			</table>
			<div class="button">
				<input type="submit" value="수정" onclick="fnEdit()">
			</div>
		</form>


	</div>
</body>
</html>
<script>
	function fnEdit() {
		let form = document.board;
		form.submit();
	}
</script>