<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Validation</title>
</head>
<body>
	<form name="login" action="Quiz1_Result.jsp" method="get">
		<div>
			<label>아이디 : <input type="text" name="userId"></label>
		</div>
		<div>
			<label>비밀번호 : <input type="password" name="pwd"></label>
		</div>
		<div>
			<!-- <input type="submit" value="이동"> -->
			<!-- <button onclick="fnCheck() return false;">로그인</button> -->
			<input type="button" value="로그인" onclick="fnCheck()">
			<input type="button" value="회원가입">
		</div>
	</form>
</body>
</html>
<script>
	// 아이디, 비밀번호가 빈 값이 아닐 경우만 action 실행
	function fnCheck(){
		// form 태그의 name을 이용해서 객체 가져오기
		let login = document.login;
		if(login.userId.value.length == 0){
			alert("아이디를 입력해주세요.");
			login.userId.focus();
			return;
		}
		if(login.pwd.value.length == 0){
			alert("비밀번호를 확인해주세요.")
			login.pwd.focus();
			return;
		}
		// 위에 조건을 모두 통과했을떄 최종 submit(action 실행)
		login.submit();
		
	}
</script>