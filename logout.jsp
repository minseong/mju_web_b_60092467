<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"  import="java.sql.*" 
		import="org.apache.commons.lang3.StringUtils" import="java.lang.*"
		import="java.io.*" import="javax.servlet.http.*"%>
<%
Connection conn = null;
PreparedStatement stmt = null;
Statement stmtn = null;
ResultSet rs = null;

String dbUrl = "jdbc:mysql://127.0.0.1:3306/web2012?characterEncoding=utf8";
String dbUser = "web";
String dbPassword = "asdf";

request.setCharacterEncoding("utf-8");

String user_id = session.getAttribute("userid").toString();
String login_flag = "0";
	


List<String> errorMsgs = new ArrayList<String>();
int result = 0;	

	try {
		
		Class.forName("com.mysql.jdbc.Driver");
		
		conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
		stmt = conn.prepareStatement(
				"UPDATE location " +
				"SET login_flag=? " +
				"WHERE user_id=?"
				);
		stmt.setString(1,  login_flag);
		stmt.setString(2,  user_id);
		
		result = stmt.executeUpdate();
		if (result != 1) {
			errorMsgs.add("등록에 실패하였습니다.");
		}
		
		

	} catch (SQLException e) {
		errorMsgs.add("SQL 에러: " + e.getMessage());
	} finally {
		// 무슨 일이 있어도 리소스를 제대로 종료
		if (rs != null) try{rs.close();} catch(SQLException e) {}
		if (stmt != null) try{stmt.close();} catch(SQLException e) {}
		if (conn != null) try{conn.close();} catch(SQLException e) {}
	}


session.invalidate();
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>로그아웃</title>
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="css/base.css" rel="stylesheet">
	<link href="./css/default.css" rel="stylesheet">
	<script src="js/jquery-1.8.2.min.js"></script>
	<script src="js/bootstrap.min.js"></script>

</head>
<body>
<div class="control-group">
<a href="login.jsp">로그인화면으로</a>
</div>
  
</body>
</html>