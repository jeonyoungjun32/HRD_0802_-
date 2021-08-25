<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쇼핑몰관리 프로그램</title>
</head>
<body>
	<%@ include file = "header.jsp" %><!-- header.jsp안에 dbconn.jsp(DB연결) -->
	<section>
		<div>
			<h2>회원조회</h2>
		</div>
		<div style = "height : 500px; overflow : auto;">   <!-- footer내려가고 스크롤바 생김 -->
		<table class ="abc" style = "margin : 0 auto" border = "1" width = "1000" >
			<tr>
				<th>회원번호</th>
				<th>이름</th>
				<th>주소</th>
				<th>가입일</th>
				<th>성별</th>
				<th>전화번호</th>
			</tr>
			<%
			//sql = "select memno, name, address, to_char(hiredate, 'yyyy.mm.dd') as hiredate, decode(gender, 'M', '남', 'F', '여') as gender, tel1, tel2, tel3 from member";
			sql += "select memno, name, address, "; // 초기값 null일 경우 +를 빼고 =만 사용
			sql += "to_char(hiredate, 'yyyy.mm.dd'), ";
			sql += "decode(gender, 'M', '남', 'F', '여'), ";
			sql += "tel1, tel2, tel3";
			sql += " from member"; // ★주의 : 마지막 제일 앞부분 한칸씩 띄우기
			rs = stmt.executeQuery(sql);
				while(rs.next()) {
			%>
			<tr align = "center">
				<td><a href="update.jsp?memno=<%=rs.getString(1)%>"><%=rs.getString(1)%></a></td>
				<td><%=rs.getString(2)%></td>
				<td><%=rs.getString(3)%></td>
				<td><%=rs.getString(4)%></td>
				<td><%=rs.getString(5)%></td>
				<td><%=rs.getString(6)%>-<%=rs.getString(7)%>-<%=rs.getString(8)%></td>
			</tr>
			<%
				}
			%>
		</table>
		</div>
	</section>
	<%@ include file = "footer.jsp" %><!-- DB연결 해제 -->
</body>
</html>