<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"  import="java.sql.*" 
		import="org.apache.commons.lang3.StringUtils" import="java.lang.*"
		import="java.io.*" import="javax.servlet.http.*"%> 
<%
		Connection conn = null;
    Statement stmt = null;
		PreparedStatement stmtn = null;
		String content= "";
	  
		ResultSet rs = null;
		
		String dbUrl = "jdbc:mysql://127.0.0.1:3306/web2012?characterEncoding=utf8";
		String dbUser = "web";
		String dbPassword = "asdf";
		
		request.setCharacterEncoding("utf-8");
		List<String> errorMsgs = new ArrayList<String>();
		
		
		try {
			
			Class.forName("com.mysql.jdbc.Driver");
			
			conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
			

		
%>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>채팅방</title>
	

	<script src="js/jquery-1.8.2.min.js"></script>
	<link href="css/mobile_chatroom.css" rel="stylesheet">
	 <meta name="viewPort" content="initial-scale=1.0; maximum-scale=1.0; minimum-scale=1.0; user-scale=no;" />

	     <script>
	     var last_id = "-1";
	     var count=0;
	     
	     setInterval(function() {
	          
	    	  $.get("sendchat.jsp", {
					 last : last_id
				}, function(data){
					  
					  var n = data.split(",").length;
					  var array = new Array();
					
					  for(var i=0; i<n; i++)
						  {
						  		array[i] = [data.split(",")[i]];
						  }
					  
					  if(n>1)
					  {
					  count+=1;
					  }else{}
					  if(count==13)
						  {
						  location.reload();
						  }
					  				last_id = parseInt(array[0]);				
					  
					  for(var i=1; i<(n-1); i++){
					  $("#chat").append("<ui><li>" + array[i] + "</ui></li>");
					  }
					  
					 
					
	    		  });
	    	  
	    	  $.get("sendmessage.jsp", function(data){
	      		
	    		  if(data.length>7){
	    			  alert(data);
	    			
	    		  }
	    		  });
	    	  
	    }, 1000);
	     </script>
	    

</head>
<body>
  <div id="wrapper"> 
  	<div id="upperPanel"> 
  			<div id="chat"> 
  				
  			</div>
  			</div>
  		
  			 <div id="friends"> 
  			    <ul> 
  			    <%
 		       String sql="SELECT * FROM users, location WHERE users.userid = location.user_id and location.login_flag = '1'";
 	     		stmt = conn.createStatement();
 	     
 	     		rs = stmt.executeQuery(sql);%>
 	     		<li><a href="menu.jsp" class="btn">뒤로가기</a></li>
			 <% while(rs.next())
				{ 
			%>
  			       <li>
  			          <form action='message.jsp' method='post'><input type='hidden' name='to' value=<%=rs.getString("users.userid")%>>
					<input type='submit' value=<%=rs.getString("users.name") %>></form>
  			        </li>
  			       <%
				}
			%>
            </ul> 
         </div>
         
          <div id="bottomPanel">
          <form>
           <input type="text" id="msg"/>
           <input type="button" id="send" value="send" />
           </form>
            </div> 
             </div> ​​​​​​​​​​​​​
</body>
    <script>
	     
			$("#send").click(function() {
				
				if ($("#msg").val().length == 0) {
					alert("내용을 입력하여 주세요.");
					$("#msg").focus();
					return;
				}
	
				$.get("chatdata.jsp", {content : $("#msg").val()});
	
				// 글을 쓴 후에는 메시지창의 내용을 없앰.
				$("#msg").val("");
			});
	
	
    </script>
</html>
<%
			} catch (ClassNotFoundException e){	
			} catch (SQLException e) {
				errorMsgs.add("SQL 에러: " + e.getMessage());
			} finally {
				// 무슨 일이 있어도 리소스를 제대로 종료
				if (rs != null) try{rs.close();} catch(SQLException e) {}
				if (stmt != null) try{stmt.close();} catch(SQLException e) {}
				if (conn != null) try{conn.close();} catch(SQLException e) {}
			}%>