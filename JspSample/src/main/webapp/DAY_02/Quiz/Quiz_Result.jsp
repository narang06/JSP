<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quiz_Result</title>
</head>
<body>
	<!-- userId, pwd를 전달받아  -->
	<!-- TBL_USER테이블의 아이디와 비밀번호를 비교해서  -->
	<!-- 값이 있으면 '로그인 성공' 없으면 '로그인 실패' 출력  -->
	<%@ include file="../../DB/DB.jsp"%>
	
	<% 
		String userId1 = request.getParameter("userId");
		String pwd1 = request.getParameter("pwd");
		
		ResultSet rs = null;
		String query = "SELECT * FROM TBL_USER";
		rs = stmt.executeQuery(query);
		
		while(rs.next()){
			String userId2 = rs.getString("USERID");
			String pwd2 = rs.getString("PASSWORD");
			if(userId2.equals(userId1) && pwd1.equals(pwd2)){
				out.println("로그인 성공");	
				break;
				}		
			}	
		if(rs.next() == false){
			out.println("로그인 실패");
		}
	%>
	
</body>
</html>