<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insertPro</title>
</head>
<body>
<%@ include file="dbcon.jsp" %>

<%
try{
	sql = "insert into equipment_list_14 values(?,?,?,?,?,?,?)";
	
	ps=con.prepareStatement(sql);
	
	ps.setString(1, request.getParameter("EQUIPMENT_NO"));
	ps.setString(2, request.getParameter("EQUIPMENT_NAME"));
	ps.setString(3, request.getParameter("EQUIPMENT_GROUP"));
	ps.setString(4, request.getParameter("EQUIPMENT_PRICE"));
	ps.setString(5, request.getParameter("REG_DATE"));
	ps.setString(6, request.getParameter("EQUIPMENT_STATUS"));
	ps.setString(7, request.getParameter("EQUIPMENT_UNIT"));
	
	ps.executeUpdate();
%>
	<script>
		alert("비품등록이 완료되었씁니다.");
		location="insert.jsp";
	</script>

<%
}catch(Exception e){
%>	
	<script>
		alert("비품명이 등록이 실패했습니다");
		history.back();
	</script>
<%
}finally{
	
}


%>


	


%>
</body>
</html>