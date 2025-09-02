<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Join_Result</title>
</head>
<body>
	<%
	String pwd = request.getParameter("pwd");
	String id = request.getParameter("userId");
	String userName = request.getParameter("userName");
	String gender = request.getParameter("gender");
	String hobby[] = request.getParameterValues("hobby");
	%>
	
	<div>아이디 : <%= id %></div>
	<div>비밀번호 : <%= pwd %></div>
	<div>이름 : <%= userName %></div>
	<div>성별 : <%= gender.equals("M")? "남자" : "여자" %></div>
	
	

</body>
</html>