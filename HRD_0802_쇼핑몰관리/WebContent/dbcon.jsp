<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.sql.*"%>


<%
	//한글 꺠짐 방지
request.setCharacterEncoding("UTF-8");

// 드라이버 로딩
Class.forName("oracle.jdbc.OracleDriver");

//구문객체생ㅅ어
String url = "jdbc:oracle:thin:@localhost:1521:xe";
String id = "system";
String password = "1234";

Connection con = DriverManager.getConnection(url, id, password); //

Statement stmt = con.createStatement(); //sql문 없는 "빈 구문객체" 생성 : select(조회)
PreparedStatement ps = null; //참조하는 객체가 없다. insert(추가), update(수정), delete(삭제)

//옵션
//결과셋 선언
ResultSet rs = null;
//쿼리문 선언 
String sql = "";
%>




