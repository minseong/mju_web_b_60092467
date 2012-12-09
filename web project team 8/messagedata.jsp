<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"  import="java.sql.*" 
		import="org.apache.commons.lang3.StringUtils"%>
<% 
			Connection conn = null;
		PreparedStatement stmt = null;
		Statement stmtn = null;
		ResultSet rs = null;
		
		String dbUrl = "jdbc:mysql://127.0.0.1:3306/web2012?characterEncoding=utf8";
		String dbUser = "web";
		String dbPassword = "asdf";
		
		request.setCharacterEncoding("utf-8");
		String from_ = session.getAttribute("userid").toString();
		String to_ = request.getParameter("to");
		String content = request.getParameter("content");
		String message_flag = "1";
			
		
		
		List<String> errorMsgs = new ArrayList<String>();
		int result = 0;	
		
			try {
				
				Class.forName("com.mysql.jdbc.Driver");
				
				conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
				
				stmt = conn.prepareStatement(
						"INSERT INTO message(from_, to_, content, message_flag)" +
						"VALUES(?, ?, ?, ?)"
						);
				stmt.setString(1,  from_);
				stmt.setString(2,  to_);
				stmt.setString(3,  content);
				stmt.setString(4,  message_flag);
				
								 
				result = stmt.executeUpdate();
				if (result != 1) {
					errorMsgs.add("등록에 실패하였습니다.");
				}
		
			} catch (ClassNotFoundException e){	
			} catch (SQLException e) {
				errorMsgs.add("SQL 에러: " + e.getMessage());
			} finally {
				// 무슨 일이 있어도 리소스를 제대로 종료
				if (rs != null) try{rs.close();} catch(SQLException e) {}
				if (stmt != null) try{stmt.close();} catch(SQLException e) {}
				if (conn != null) try{conn.close();} catch(SQLException e) {}
			}
		
			
			%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원가입</title>
	<script src="js/jquery-1.8.2.min.js"></script>
	<link href="css/mobile_messagedata.css" rel="stylesheet">
	 <meta name="viewPort" content="initial-scale=1.0; maximum-scale=1.0; minimum-scale=1.0; user-scale=no;" />
</head>
<body>
 <div class ="vCenter">
 <div class="center">
				<div class="control-group">
					<div class="controls">
						메세지가 보내졌습니다.
						</div>
						<div class="controls">
						from : <%= from_ %> to : <%= to_ %>
						</div> 
						<div class="controls">
						 content : <%= content %>
					</div>
				</div>
        <a href="menu.jsp" class="btn">메뉴얼로 이동</a>
					</div>
  </div>		
		  
		
			 
        
				
				
		
  
</body>
</html>