<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login-Result</title>
</head>
<body>
	<div>
		<%@ include file="../DB/DB.jsp"%>
		<%
			String id = request.getParameter("id");
			String pwd = request.getParameter("pwd");

			String query = "SELECT * FROM TBL_USER WHERE USERID = '" + id + "' AND PASSWORD = '" + pwd + "'";
			ResultSet rs = stmt.executeQuery(query);
			
			if(rs.next()){
				/* out.println("로그인 성공"); */
				String loginId = rs.getString("USERID");
				String status = rs.getString("STATUS");
				
				session.setAttribute("sId", loginId);
				session.setAttribute("status", status);
				
				response.sendRedirect("Emp-List.jsp");
			} else {
				out.println("로그인 실패");
			}
			

		%>
	</div>
</body>
</html>