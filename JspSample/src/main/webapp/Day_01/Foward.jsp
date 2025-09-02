<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Foward</title>
</head>
<body>
	<jsp:forward page="FowardView.jsp">
		<!--  ㅁㄴㅇㅁㄴㅇ-->
		<jsp:param value="hong123" name="userId"/>
		<jsp:param value="30" name="age"/>
	</jsp:forward>
	
		
</body>
</html>