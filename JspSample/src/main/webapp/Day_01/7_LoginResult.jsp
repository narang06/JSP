<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LoginResult</title>
</head>
<body>
	<div>로그인 성공</div>
	<div>아이디 : <%= request.getParameter("userId") %></div>
	<div>비밀번호: : <%= request.getParameter("pwd") %></div>
</body>
</html>