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

	
	<!-- 위에서 받ㅍ은 결과들을 출력 -->
	<!-- 취미는 2개이상일 경우 모두 출력 -->


	<form action="Join_Result.jsp" name="join" method="get">
		<div>
			아이디 : <input name="userId"></label>
		</div>
		<div>
			비밀번호 : <input type="password" name="pwd">
		</div>
		<div>
			비밀번호확인 : <input type="password" name="pwdCheck">
		</div>
		<div>
			이름 : <input name="userName">
		</div>
		<div>
			핸드폰 : 
			<select name="phone1">
				<option value="010">010</option>
				<option value="011">011</option>
				<option value="017">017</option>
				<option value="018">018</option>
				<option value="019">019</option>
			</select>
		</div>
		<div>
			성별 : <input type="radio" name="gender" value="M" checked>남
			<input type="radio" name="gender" value="F">여
		</div>
		<div>
			취미: 
			<input type="checkbox" name="hobby" value="운동">운동
			<input type="checkbox" name="hobby" value="코딩">코딩
			<input type="checkbox" name="hobby" value="독서">독서
			<input type="checkbox" name="hobby" value="게임">게임
			<input type="checkbox" name="hobby" value="등산">등산
		</div>
		<div>
			<input type="button" value="가입" onclick="return fnJoin()">
		</div>
	</form>
</body>
</html>
<script>
	
	function fnJoin() {
		let join = document.join;
		if(join.userId.value.length < 6) {
			alert("아이디는 6글자 이상이여야 합니다.")
			join.userId.focus();
			return;
		}
		
		if(join.pwd.value.length < 8) {
			alert("비밀번호는 8글자 이상이여야 합니다.")
			join.pwd.focus();
			return;
		}
		// 비밀번호 특수문자 포함 여부 판단 정규식
		let specialRegex = /[!@#$%^&*()_+\-=\[\]{}|\\;:'",.<>\/?]/;
		if(!specialRegex.test(join.pwd.value)) {
			alert("비밀번호에는 특수문자가 포함되어야합니다.")
			join.pwd.focus();
			return;
		}
		
		if(join.pwd.value != join.pwdCheck.value) {
			alert("비밀번호가 일치하지 않습니다. 다시 확인해주세요.")
			join.pwd.focus();
			return;
		}
		if(join.userName.value.length == 0) {
			alert("이름란이 비어있습니다.")
			join.userName.focus();
			return;
		}	
		join.submit();
	}
</script>