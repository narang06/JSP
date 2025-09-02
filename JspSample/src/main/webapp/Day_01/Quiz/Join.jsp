<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Join</title>
</head>
<body>
	<!-- 아이디는 최소 6글자 -->
	<!-- 비밀번호는 특수문자 필수(정규식) -->
	<!-- 비밀번호와 비밀번호 확인은 같아야 함 -->
	<!-- 비밀번호는 8글자 이상 -->
	<!-- 모든값은 빈값을 허용 x, 단 체크박스는 하나도 체크 안되도 됨 -->

	
	<!-- 위에서 받은 결과들을 출력 -->
	<!-- 취미는 2개이상일 경우 모두 출력 -->


	<form action="Join_Result.jsp" name="login">
		<div>
			<label>아이디 : <input name="userId"></label>
		</div>
		<div>
			<label>비밀번호 : <input type="password" name="pwd"></label>
		</div>
		<div>
			<label>비밀번호확인 : <input type="password" name="pwdCheck"></label>
		</div>
		<div>
			<label>이름 : <input name="name"></label>
		</div>
		<!-- <div>
			<label>핸드폰 : <input type="" name="phoneNumber"></label>
		</div> -->
		<div>
			성별 : <label><input type="radio" name="gender" value="M" checked>남</label>
			<label><input type="radio" name="gender" value="F">여</label>
		</div>
		<div>
			취미: <label><input type="checkbox" name="hobby" value="운동">운동</label>
			<label><input type="checkbox" name="hobby" value="코딩">코딩</label>
			<label><input type="checkbox" name="hobby" value="독서">독서</label>
			<label><input type="checkbox" name="hobby" value="게임">게임</label>
			<label><input type="checkbox" name="hobby" value="등산">등산</label>
		</div>
		<div>
			<input type="submit" value="가입" onclick="fnCheck()">
		</div>
	</form>
</body>
</html>
<script>
	let login = document.login;
	function fnCheck() {
		if(login.userId.value.length < 6) {
			alert("아이디는 6글자 이상이여야 합니다.")
			login.userId.focus();
			return;
		}
		if(login.pwd.value.length < 8) {
			alert("비밀번호는 8글자 이상이여야 합니다.")
			login.pwd.focus();
			return;
		}
		const specialCharsRegex = /[!@#$%^&*()_+\-=\[\]{}|\\;:'",.<>\/?]/;
		if(!specialCharsRegex.test(login.pwd.value)) {
			alert("비밀번호에는 특수문자가 포함되어야합니다.")
			login.pwd.focus();
			return;
		}
		if(login.pwd.value != login.pwdCheck.value) {
			alert("비밀번호가 일치하지 않습니다. 다시 확인해주세요.")
			login.pwd.focus();
			return false;
		}
		if((login.name.value.length == 0) {
			alert("이름란이 비있습니다.")
			login.name.focus();
			return;
		}
		login.submit();
		
		
	}
</script>