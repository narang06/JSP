<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Emp-Add</title>
<style>
input[readonly] {
	background-color: #eee;
	border: 2px solid #eee;
}
</style>
</head>
<body>
	<form name="form" action="Emp-Add-Result.jsp">
		<div>
			사번 : <input name="empNo">
			<button onclick="fnCheck(); return false;">중복체크</button>
		</div>
		<div>
			이름 : <input name="empName">
		</div>
		<div>
			급여 : <input name="sal">
		</div>
		<div>
			부서명 : 
			<label><input name="deptNo" type="radio" value="10"checked>ACCOUNTING</label> 
			<label><input name="deptNo"type="radio" value="20">RESEARCH</label> 
			<label><input name="deptNo" type="radio" value="30">SALES</label> 
			<label><input name="deptNo" type="radio" value="40">OPERATIONS</label>
		</div>
		<div>
			<input type="button" value="추가" onclick="fnAdd()">
		</div>
	</form>
</body>
</html>
<script>
	let addFlg = false;
	
	function fnAdd(){
		let form = document.form;
		if(addFlg) {
			form.submit();
		} else {
			alert("중복체크 통과후에 추가해주세요.");
		}
	}
	function fnCheck() {
		let form = document.form;
		let empNo = form.empNo.value;
		window.open(`EmpNo-Check.jsp?empNo=\${empNo}`, "check",
				"width=300, height=300");
	}
	function fnReturn(flg) {
		let form = document.form;
		if (flg == "N") {
			let obj = form.empNo;
			obj.readOnly = true;
			addFlg = true;
		}

	}
</script>