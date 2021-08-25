<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비품목록조회/수정</title>
</head>
<body>
	<%@ include file="header.jsp"%>
	<h1>비품목록조회/수정</h1>

	<table border="1" width="90%" style="margin: 0 auto;">
		<tr>
			<th>비품번호</th>
			<th>비품명</th>
			<th>비품분류</th>
			<th>등록일자</th>
			<th>비품상태</th>
			<th>비품단위</th>
		</tr>

		<%
			sql += "select EQUIPMENT_NO, EQUIPMENT_NAME,";
			sql += " decode(EQUIPMENT_GROUP,'1','기계기구','2','집기비품'),";
			sql += " to_char(REG_DATE,'yyyy-mm-dd'), ";
			sql += " decode(EQUIPMENT_STATUS,'Y','사용','N','미사용'),";
			sql += " EQUIPMENT_UNIT";
			sql += " from equipment_list_14"; 
			sql += " order by 1 desc";

		rs = stmt.executeQuery(sql);
		while (rs.next()) {
		%>
		<tr>
			<td> <%=rs.getString(1) %></a></td>
			<td><a href="update.jsp"><%=rs.getString(2) %></td>
			<td><%=rs.getString(3) %></td>
			<td><%=rs.getString(4) %></td>
			<td><%=rs.getString(5) %></td>
			<td><%=rs.getString(6) %></td>
		</tr>


		<%
			}
		%>

	</table>
	<%@ include file="footer.jsp" %>
</body>
</html>