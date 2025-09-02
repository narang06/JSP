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
	String id = request.getParameter("userId");
	out.println("아이디 : " + id);
	String pwd = request.getParameter("pwd");
	out.println("비밀번호 : " + pwd);
	String name = request.getParameter("name");
	out.println("이름 : " + name);
	String hobby[] = request.getParameterValues("hobby");
	for (int i = 0; i < hobby.length; i++) {
		out.println("취미 : "+hobby[i]+",");
	}
	%>
</body>
</html>