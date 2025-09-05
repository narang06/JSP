<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Emp-View</title>
<style>
#container {
	width: 700px;
	margin: 20px auto;
}
#container div {
	
}

</style>
</head>
<body>
	<%@ include file="../DB/DB.jsp"%>
	
	<%
		String empNo = request.getParameter("empNo");
		// 사번, 이름, 상사의 이름, 내 급여, 소속부서의 평균 급여, 부서 이름
		String query =
      		"SELECT "
    		+ "  E.EMPNO, "
    		+ "  E.ENAME AS EMP_NAME, "
    		+ "  E2.ENAME AS MGR_NAME, "
    		+ "  E.SAL, "
    		+ "  CEIL(T.AVG_SAL) AS AVG_SAL, "
    		+ "  D.DNAME "
    		+ "FROM EMP E "
    		+ "INNER JOIN EMP E2 ON E.MGR = E2.EMPNO "
    		+ "INNER JOIN DEPT D ON E.DEPTNO = D.DEPTNO "
    		+ "INNER JOIN ( "
    		+ "    SELECT DEPTNO, AVG(SAL) AS AVG_SAL "
    		+ "    FROM EMP "
    		+ "    GROUP BY DEPTNO "
    		+ ") T ON E.DEPTNO = T.DEPTNO "
    		+ "WHERE E.EMPNO = " + empNo;
		
		try{
			ResultSet rs = stmt.executeQuery(query);
			
			if(rs.next()){
	%>
			<div id="container">
				<div>사번 : <%=rs.getString("EMPNO")%></div>
				<div>이름 : <%=rs.getString("EMP_NAME")%></div>
				<div>매니저 : <%=rs.getString("MGR_NAME")%></div>
				<div>급여 : <%=rs.getString("SAL")%></div>
				<div>부서 : <%=rs.getString("DNAME")%></div>
				<div>부서평균급여 : <%=rs.getString("AVG_SAL")%></div>
			</div>
			
			
	<%	
			} 
		}catch(SQLException e) {
			out.println("오류가 발생되었습니다.");
		}
	%>			
</body>
</html>