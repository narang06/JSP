<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Stu-Add</title>
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
	margin-top: 5px;
}
</style>
</head>
<body>
	<%
	String id = (String) session.getAttribute("sessionId");
	%>
	<div id="container">
		<h2>학생 정보 입력</h2>
		<form name="stuInfo" action="Stu-Add-Result.jsp">
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
		</form>
		<div class="button">
			<input type="button" value="학생 추가" onclick="fnAdd()">
		</div>


	</div>
</body>
</html>
<script>
	function fnAdd() {
		let form = document.stuInfo;
		form.submit();
	}
</script>