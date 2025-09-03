<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Review3</title>
</head>
<body>

	<%
	String name = request.getParameter("userName");
	String age = request.getParameter("age"); /* getParameter로 데이터를 꺼낼땐 기본적으로 String 사용 */
	/* js -> parseInt()  */
	/* java -> Integer.parseInt()  */
	out.println("스크립틀릿 : " + name + "님의 나이는 " + age + " 입니다.");
	%>
	<div style="color: blue;">
		표현식 :
		<%=name + "님의 나이는 " + age + " 입니다."%>
	</div>
</body>
</html>