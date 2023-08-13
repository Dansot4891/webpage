<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");

String uid = request.getParameter("id");
String sql = "DELETE FROM user where id = ?";

Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysns?serverTimezone=UTC", "root", "1111");
PreparedStatement stmt = conn.prepareStatement(sql);

stmt.setString(1,uid);

int count = stmt.executeUpdate();
if (count == 1) {
    out.print("회원 탈퇴가 완료되었습니다.");
}

stmt.close(); conn.close();
%>
</body>
</html>
