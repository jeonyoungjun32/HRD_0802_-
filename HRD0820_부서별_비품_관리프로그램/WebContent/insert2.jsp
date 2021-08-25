<%@page import="oracle.net.aso.i"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>홈으로~</title>
</head>
<body>
	<%@ include file="header.jsp"%>
	
	<%
		sql ="select NVL(max(REQ_NO),0)+1 as REQ_NO from equipment_postulat_14";
		
		rs=stmt.executeQuery(sql);
		rs.next();
		String REQ_NO = rs.getString("REQ_NO");
	%>
	
	

	<h1 class="index">비품신청등록</h1>
	
	<form action="insert2Pro.jsp" method="post"name="f">
		<table border="1 solid" style="margin: 0 auto;">
				<tr>
					<td>비품번호</td>
					<th><input type="text" name="EQUIPMENT_NO" maxlength="6" value=" <%=REQ_NO%> "></th>
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
						<input type="submit" name="" value="다시쓰기" onclick="alert('정보를지우고 처음부터 다시 입력합니다.'); f.reset();  ">
						<input type="submit" name="" value="조회" onclick="select.jsp"></td>
				</tr>
	
			</table>
		</form>
	
<%@ include file="footer.jsp" %>
</body>
</html>