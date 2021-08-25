<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비품수정</title>
</head>
<body>
	<%@ include file="header.jsp"%>
	
	
	<table border="1" style="margin: 0 auto;">
	
	<h1>비품수정</h1>
		<tr>
			<th>비품번호</th>
			<td><input type="text" value="" name=""> </td>
		</tr>

		<tr>
			<th>비품명</th>
			<td><input type="text" value="" name=""> </td>
		</tr>


		<tr>
			<th>비품분류</th>
			<td><input type="radio" value="" name="">기계기구
				<input type="radio" value="" name="">집기비용 </td>
		</tr>


		<tr>
			<th>비품단가</th>
			<td><input type="text" value="" name=""> </td>
		</tr>

		<tr>
			<th>등록일자</th>
			<td><input type="text" value="" name=""> </td>
		</tr>

		<tr>
			<th>비품상태</th>
			<td><input type="text" value="" name=""> </td>
		</tr>

		<tr>
			<th>비품단위</th>
			<td><input type="text" value="" name=""> </td>
		</tr>
		
		<tr>
			<th colspan="2">
			<input type="submit" value="수정" name="" onclick=""> 
			<input type="submit" value="조회" name="" onclick=""> </th>
		</tr>


	</table>
</body>
</html>