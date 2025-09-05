<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
</head>
<body>
	<form name="form" action="Login-Result.jsp">
		<div>
			아이디 : <input type="text" name="id">
		</div>
		<div>
			비밀번호 : <input type="password" name="pwd">
		</div>
		<input type="button" value="로그인(button)" onclick="fnLogin()">
		<input type="submit" value="로그인(submit)">
	</form>
</body>
</html>
<script>
	function fnLogin(){
		let form = document.form;
		let id = form.id.value;
		let pwd = form.pwd.value;
		if(id.length == 0) {
			alert("아이디를 확인해주세요.");
			return;
		}
		if(pwd.length == 0) {
			alert("비밀번호를 확인해주세요.")
			return;
		}
		form.submit();
	}

</script>