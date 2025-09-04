<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DB_Insert</title>
</head>
<body>
	<form action="7_Insert_Result.jsp" name="stu">
		<div>
			학번: <input name="StuNo">
			<button onclick="fnCheck(); return false">중복체크</button>
		</div>
		<div>
			이름: <input name="StuName">
		</div>
		<div>
			학과: <input name="StuDept">
		</div>
		<div>
			<input type="button" value="추가" onclick="fnAdd()">
		</div>
	</form>
</body>
</html>
<script>
	let joinFlg = false;
	function fnAdd() {
		let stu = document.stu;
		if(joinFlg) {
			stu.submit();
		} else {
			alert("중복체크 통과후에 추가해주세요.");
		}
	}

	function fnCheck() {
		let stu = document.stu;
		let stuNo = stu.StuNo.value;
		window.open(`Id-Check.jsp?stuNo=\${stuNo}`, "check",
				"width=300, height=300");
	}
	function fnReturn(flg) {
		if (flg == "N") {
			let form = document.stu;
			form.StuNo.disabled = true;
			joinflg = true;
		}

	}
</script>