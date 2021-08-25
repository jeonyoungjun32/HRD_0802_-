<%@page import="javafx.scene.control.Alert"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="dbcon.jsp"%>
<!-- ★★중요 : DB연결 파일 -★★★-->                 



<% 
try{
	sql ="insert into member values(?,?,?,?,?,?,?,?)";
	ps = con.prepareStatement(sql);
	
	ps.setString(1, request.getParameter("memno"));
	ps.setString(2, request.getParameter("name"));
	ps.setString(3, request.getParameter("address"));
	ps.setString(4, request.getParameter("hiredate"));
	ps.setString(5, request.getParameter("gender"));
	ps.setString(6, request.getParameter("tel1"));
	ps.setString(7, request.getParameter("tel2"));
	ps.setString(8, request.getParameter("tel3"));
	
	ps.executeUpdate();//성공하면 1줌
%>	
	<!-- 성공알림창 - script -->	
	<script>
		alert("회원등록이 완료되었습니다.");
		location="insert.jsp";
	</script>
	
<% 
}catch(Exception e){
%>	
	<!-- 실패 알림창 - script -->	
	<script>
		alert("회원등록이 실패 되었습니다.");
		history.back();
	</script>
	
<% 
	
	
}finally{
	try{
		if(con != null) con.close();
		if(stmt != null) stmt.close();
		if(ps != null) ps.close();
		if(rs != null) rs.close();
	}catch(Exception e){
		e.printStackTrace();
	}
	
}


%>



