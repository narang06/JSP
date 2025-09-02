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
		String hobby[] = request.getParameterValues("hobby");
		
		for(int i=0; i<hobby.length; i++) {
			out.println(hobby[i]);
		}
	
	
	%>
</body>
</html>