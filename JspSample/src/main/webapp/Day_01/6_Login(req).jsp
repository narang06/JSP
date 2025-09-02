<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login(req)</title>
</head>
<body>
	<!-- form태그의 action을 실행하게 되면  -->
	<!-- 내부에 있는 input 값을 파라미터로 보낸다 -->
	<!-- 이떄, name속성이 key, 입력받은 값이 value  -->
	
	<!-- method 속성은 생략이 가능, default는 get  -->
	<!-- get 전송방식은 url(주소)의 값을 담아서 보냄, 보안에 취약 -->
	<!-- 사용자 개인정보나 패스워드 등을 전송할 때 사용하면 안된다.  -->
	<!-- 간단한 정보를 전송할 때 주로 사용  -->
	
	<!-- post 전송 방식은 get과 반대  -->
	
	<form action="7_LoginResult.jsp" method="post">
		<div>
			<label>아이디 : <input type="text" name="userId"></label>
		</div>
		<div>
			<label>비밀번호 : <input type="password" name="pwd"></label>
		</div>
		<div>
			<input type="submit" value="이동"> <!-- 클릭시 foam태그의 action에 있는 페이지로 이동  -->
		</div>
	</form>
</body>
</html>