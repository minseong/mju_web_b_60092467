<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"  import="java.sql.*" 
		import="org.apache.commons.lang3.StringUtils" import="java.lang.*"
		import="java.io.*" import="javax.servlet.http.*"%><% 

		Connection conn = null;
		PreparedStatement stmt = null;
		Statement stmtn = null;
		
		ResultSet rs = null;
		
		String dbUrl = "jdbc:mysql://127.0.0.1:3306/web2012?characterEncoding=utf8";
		String dbUser = "web";
		String dbPassword = "asdf";
		
		request.setCharacterEncoding("utf-8");
	

	
		int last = Integer.parseInt(request.getParameter("last"));
	  String last_id = "";
		
			
		
		
		List<String> errorMsgs = new ArrayList<String>();
		int result = 0;	
		
			try {
				
				Class.forName("com.mysql.jdbc.Driver");
				
				conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
				
				if (last==-1) {
					
					stmt = conn.prepareStatement("select * from (select * from chat order by chat_id desc limit 10)as a order by a.chat_id asc ;");
					rs = stmt.executeQuery();
					 while(rs.next())
						{ 
				    	 	last_id = rs.getString("chat_id");
						}
					 if(last_id=="")
				       {
				       		out.println(last);
				       
				       }else{
				    	   out.println(last_id + ",");
				    	   
				    	   stmt = conn.prepareStatement("select * from (select * from chat order by chat_id desc limit 10)as a order by a.chat_id asc ;");
							rs = stmt.executeQuery();
					    	   while(rs.next())
					    	   {
					    		      out.println(rs.getString("from_") + ": " + rs.getString("content") + ",");
					    	   }
					    	   
					       }
							
				} else {
					
					stmt = conn.prepareStatement("SELECT * FROM chat WHERE chat_id > ? ;");
					stmt.setInt(1,  last);
					rs = stmt.executeQuery();
					
				       while(rs.next())
						{ 
				    	 	last_id = rs.getString("chat_id");
						}
				       if(last_id=="")
				       {
				       		out.println(last);
				       
				       }else{
				    	   
				    	   out.println(last_id + ",");
				    	stmt = conn.prepareStatement("SELECT * FROM chat WHERE chat_id > ?");
							stmt.setInt(1,  last);
							rs = stmt.executeQuery();
				    	   while(rs.next())
				    	   {
				    		      out.println(rs.getString("from_") + ": " + rs.getString("content") + ",");
				    	   }
				    	   
				       }
				}
			
				
			  
			     
			   
		     	
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