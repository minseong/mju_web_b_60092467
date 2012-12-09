<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"  import="java.sql.*" 
		import="org.apache.commons.lang3.StringUtils" import="java.lang.*"
		import="java.io.*" import="javax.servlet.http.*"%>
 <%
			Connection conn = null;
			Statement stmt= null;
      ResultSet rs= null;
      PreparedStatement stmtn = null;
			String dbUrl = "jdbc:mysql://127.0.0.1:3306/web2012?characterEncoding=utf8";
			String dbUser = "web";
			String dbPassword = "asdf";
			
			request.setCharacterEncoding("utf-8");
			String userid = request.getParameter("userid");
			String pwd = request.getParameter("pwd");
			String errror = "";
			List<String> errorMsgs = new ArrayList<String>();
			int result = 0;	
     try{
    
			Class.forName("com.mysql.jdbc.Driver");
			
			 conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
			 stmtn=conn.prepareStatement("select * from users where userid=? && pwd=?");
       stmtn.setString(1, userid);
       stmtn.setString(2, pwd);
       rs=stmtn.executeQuery();
       String name="";
       if(rs.next()){
    	   name=rs.getString("name");
       }
       if(name==""){
    	   errror = "아이디나 비밀번호가 틀립니다." + "<br/>"+
    			        "다시입력해주세요."; 
       }else{
			
    	   session.setAttribute("userid",userid);
    	   session.setAttribute("name",name);
    	   
    	   
    	   request.getRequestDispatcher("map.jsp").forward(request, response);
       }
     
     result = stmtn.executeUpdate();
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

%>   
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원정보체크</title>
	<script src="js/jquery-1.8.2.min.js"></script>
	<link href="css/mobile_check.css" rel="stylesheet">
	 <meta name="viewPort" content="initial-scale=1.0; maximum-scale=1.0; minimum-scale=1.0; user-scale=no;" />
</head>
<body>
<div class ="vCenter">
 <div class="center">
				<div class="control-group">
					<div class="controls">
						<%=errror %>
					</div>
				</div>
			<a href="login.jsp" class="btn">뒤로가기</a>
					</div>
  </div>		
  
</body>
</html>