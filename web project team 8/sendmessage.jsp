<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"  import="java.sql.*" 
		import="org.apache.commons.lang3.StringUtils" import="java.lang.*"
		import="java.io.*" import="javax.servlet.http.*"%> 
<%
		Connection conn = null;
		PreparedStatement stmt = null;
		PreparedStatement stmtn = null;
		
		ResultSet rs = null;
		
		String dbUrl = "jdbc:mysql://127.0.0.1:3306/web2012?characterEncoding=utf8";
		String dbUser = "web";
		String dbPassword = "asdf";
		
		request.setCharacterEncoding("utf-8");
		String to_ = session.getAttribute("userid").toString();


		String message_flag = "0";
	  
		
			
		
		
		List<String> errorMsgs = new ArrayList<String>();
		int result = 0;	
		
			try {
				
				Class.forName("com.mysql.jdbc.Driver");
				
				conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
				
			       String sql="SELECT * FROM message WHERE to_ = ? and message.message_flag = '1'";
		     		stmt = conn.prepareStatement(sql);
		     		stmt.setString(1,  to_);
		     		rs = stmt.executeQuery();
		    
			       while(rs.next())
					{ 
			    	 
			    		 out.println("from: " + rs.getString("from_") + "  " + "content: " + rs.getString("content"));
			   
					}
			       
			       stmt = conn.prepareStatement(
							"UPDATE message " +
							"SET message_flag=? " +
							"WHERE to_=?"
							);
					stmt.setString(1,  message_flag);
					stmt.setString(2,  to_);
			     
		 
		     	
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
			}%>
		