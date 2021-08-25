<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비품등록</title>
</head>
<script type="text/javascript">
function check() {
	if(f.EQUIPMENT_NO.value == ""){
		alert("비품번호가 입력되지 안았습니다.");
		return f.EQUIPMENT_NO.focus();
	}
	
	if(f.EQUIPMENT_NO.value == ""){
		alert("비품명이 입력되지 안았습니다.");
		return f.EQUIPMENT_NO.focus();
	}
	
	if(f.EQUIPMENT_NAME.value == ""){
		alert("비품명이 입력되지 안았습니다.");
		return f.EQUIPMENT_NAME.focus();
	}
	
	if(f.EQUIPMENT_GROUP[0].checked==false && f.EQUIPMENT_GROUP[1].checked==false){ //체크박스닌깐 배열
		alert("비품분류를 입력되지 안았습니다.")
		return f.EQUIPMENT_GROUP.focus();
	}
	
	if(f.EQUIPMENT_PRICE.value == ""){
		alert("비품단가를 입력되지 안았습니다.");
		return f.EQUIPMENT_PRICE.focus();
	}
	
	if(f.REG_DATE.value == ""){
		alert("등록일자가 입력되지 안았습니다.");
		return f.REG_DATE.focus();
	}
	
	if(f.EQUIPMENT_STATUS[0].checked==false && f.EQUIPMENT_STATUS[1].checked==false){ //체크박스닌깐 배열
		alert("비품상태 체크 되지않았습니다.");
		return f.EQUIPMENT_STATUS.focus();
	}
	
	if(f.EQUIPMENT_UNIT.value == ""){
		alert("비품단위를 입력되지 안았습니다.");
		return f.EQUIPMENT_UNIT.focus();
	}
	f.submit();
}



</script>
<body>



	<%@ include file="header.jsp"%>

	<%
		sql = "select NVL(max(EQUIPMENT_NO),0)+1 from equipment_list_14";
		rs = stmt.executeQuery(sql);
		rs.next();
		String EQUIPMENT_NO = rs.getString(1);

	%> 
	
	
	<h1>비품등록</h1>
	
	<section>
	
	<form action="insertPro.jsp" method="post" name="f">
		<table border="1 solid" style="margin: 0 auto; " >
			<tr>
				<td>비품번호</td>
				<th><input type="text" name="EQUIPMENT_NO" maxlength="6" value=" <%=EQUIPMENT_NO%> "></th>
			</tr>
	
			<tr>
				<td>비품명</td>
				<th><input type="text" name="EQUIPMENT_NAME" maxlength="50"></th>
			</tr>
	
			<tr>
				<td>비품분류</td>
				<th><input type="radio" name="EQUIPMENT_GROUP" value="Y">기계기구
				<input type="radio" name="EQUIPMENT_GROUP" value="N">집기비품</th>
			</tr>
	
			<tr>
				<td>비품단가</td>
				<th><input type="text" name="EQUIPMENT_PRICE"></th>
			</tr>
	
			<tr>
				<td>등록일자</td>
				<th><input type="text" name="REG_DATE"></th>
			</tr>
	
			<tr>
				<td>비품상태</td>
				<th><label><input type="radio" name="EQUIPMENT_STATUS" value="Y">사용</label>
					<label><input type="radio" name="EQUIPMENT_STATUS" value="N">미사용</label></th>
			</tr>
	
			<tr>
				<td>비품단위</td>
				<th><input type="text" name="EQUIPMENT_UNIT" value="" maxlength="">
			</tr>
			
			<tr>
				<td colspan="3">
					<input type="submit" name="" value="등록" onclick="check(); return false">
					<input type="submit" name="" value="다시쓰기" onclick="alert('정보를지우고 처음부터 다시 입력합니다.'); f.reset(); ">
					<input type="submit" name="" value="조회" onclick="select.jsp"></td>
			</tr>

		</table>
		</form>
	</section>
	<%@ include file="footer.jsp" %>
</body>
</html>