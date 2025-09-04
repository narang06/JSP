<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board-List</title>
<style>
#container {
	width: 550px;
	height: 300px;
	margin: 20px auto;
}

table, tr, td, th {
	border: 1px solid black;
	text-align: center;
	border-collapse: collapse;
	padding: 5px 10px;
}



table tr:nth-child(odd) {
    background-color: gray; 
}

#search {
	margin-bottom: 10px;
}

a {
	text-decoration: none;
}

.page a {
	text-decoration: none;
	color: black;
	padding: 5px;
	text-align: center;
}

.page .active {
	font-weight : bold;
}
</style>
</head>
<body>
	<%@ include file="../DB/DB.jsp"%>
	<%
	String column = request.getParameter("column");
	String orderKind = request.getParameter("orderKind");
	String keyword = request.getParameter("keyword");
	%>

	<div id="container">
		<div id="search">
			<!-- 원래 상태 유지 -->
			검색어 : <input type="text" id="keyword">
			<button onclick="fnSearch()">검색</button>
		</div>
		<div id="search">
			<select id="number" onchange="fnNumber()">
				<%
					int arr[] = {3, 5, 7, 10, 15, 20};
					for(int i=0; i<arr.length; i++){			
						if(request.getParameter("size") != null && Integer.parseInt(request.getParameter("size")) == arr[i]) {
				%>				
					<option value="<%= arr[i]%>" selected><%=arr[i]+"개씩"%></option>
				<%
						} else {
				%>
					<option value="<%= arr[i]%>"><%=arr[i]+"개씩"%></option>
				<%
						}
					}
				%>
			</select>
		</div>
		<table>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>
					<%
					if (orderKind == null) {
					%> 
					<a href="javascript:;" onclick="fnList('CNT', 'DESC')">조회수</a> 
					<%
				 	} else if ("DESC".equals(orderKind)) {
 					%> 
 					<a href="javascript:;" onclick="fnList('CNT', 'ASC')">조회수▼</a>
					<%
					} else {
					%> <a href="javascript:;" onclick="fnList('CNT', 'DESC')">조회수▲</a>
					<%
					}
					%>
				</th>
				<th>작성일</th>
			</tr>

			<%
			ResultSet rs = null;
			
			String orderQuery = "";
			if (column != null) {
				orderQuery = " ORDER BY " + column + " " + orderKind;  
			} else {
				orderQuery = " ORDER BY BOARDNO DESC";  // 기본 정렬
			}
			
			// 페이징 변수
			int pageSize = 5; 
			int currentPage = 1;
			
			if(request.getParameter("size") != null) {
				pageSize = Integer.parseInt(request.getParameter("size"));				
			}
			if(request.getParameter("page") != null) {
				currentPage = Integer.parseInt(request.getParameter("page"));			
			}
			
			// offset 
			int offSet = (currentPage - 1) * pageSize;
			
			// 전체 데이터 수
			String cntQuery = "SELECT COUNT(*) TOTAL FROM TBL_BOARD";
			if(keyword != null && !keyword.trim().equals("")){
				cntQuery += " WHERE TITLE LIKE '%" + keyword + "%'";
			}
			
			ResultSet rsCnt = stmt.executeQuery(cntQuery);
			rsCnt.next();
			
			int total = rsCnt.getInt("TOTAL");
			int pageList = (int) Math.ceil((double) total / pageSize);
			
			// 검색 조건
			String keywordQuery = "";
			if (keyword != null && !keyword.trim().equals("")) {
				keywordQuery = " WHERE TITLE LIKE '%" + keyword + "%'";
			}

			// Oracle 12c OFFSET/FETCH 사용 (변경됨)
			String query = "SELECT B.*, TO_CHAR(CDATETIME, 'YYYY-MM-DD') AS CTIME "
					+ "FROM TBL_BOARD B " + keywordQuery 
					+ orderQuery
					+ " OFFSET " + offSet + " ROWS FETCH NEXT " + pageSize + " ROWS ONLY";

			rs = stmt.executeQuery(query);

			while (rs.next()) {
			%>
			<tr>
				<td><%=rs.getString("BOARDNO")%></td>
				<td><a href="javascript:;"
					onclick="fnBoard('<%=rs.getString("BOARDNO")%>')"><%=rs.getString("TITLE")%></a>
				</td>
				<td><%=rs.getString("USERID")%></td>
				<td><%=rs.getString("CNT")%></td>
				<td><%=rs.getString("CTIME")%></td>
			</tr>

			<%
			}
			%>
		</table>
		<div class="page">
			<%
			for(int i =1; i <=pageList; i++){
				if(i == currentPage) {
					out.println("<a href='?page=" + i + "&size=" + pageSize + "' class='active'>" + i + "</a>");
				} else {
					out.println("<a href='?page=" + i + "&size=" + pageSize + "'>" + i + "</a>");
				}
			}
			%>
		</div>
		<div>
			<a href="Board-Add.jsp"> <input type="button" value="글쓰기">
			</a>
		</div>
	</div>
</body>
</html>
<script>
	function fnList(column ,orderKind){
		location.href="?column="+ column + "&orderKind=" +orderKind;
	}
	
	function fnBoard(boardNo){
		location.href = "Board_View.jsp?boardNo=" + boardNo;
	}
	function fnSearch(){
		let keyword = document.querySelector("#keyword").value;
		location.href ="Board-List.jsp?keyword="+keyword;
	}
	function fnNumber(){
		 let size = document.querySelector("#number").value;
		 location.href ="?size=" + size;
	}
</script>