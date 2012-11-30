<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"  import="java.sql.*" 
		import="org.apache.commons.lang3.StringUtils" import= "java.lang.*"%>
<%
	String[] statuses = {"같이 밥 먹을 사람", "같이 영화 볼 사람", "같이 여행 갈 사람", "같이 놀이공원 갈 사람", "같이 게임 할 사람"};
	String[][] genders = {{"남자", "남성"}, {"여자", "여성"}};
	
	
	// 사용자 정보를 위한 변수 초기화
	String userid = "";
	String pwd = "";
	String name = "";
	String year = "";
	String gender = "";
	String status = "";
	
	// Request로 ID가 있는지 확인
	
int id = 0;
	try {
		id = Integer.parseInt(request.getParameter("id"));
	} catch (Exception e) {}
	if (id>0){}
	

%>    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원가입</title>
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="css/base.css" rel="stylesheet">
	<link href="./css/default.css" rel="stylesheet">
	<script src="js/jquery-1.8.2.min.js"></script>
	<script src="js/bootstrap.min.js"></script>

</head>
<body>
 <div class="container">
	  <div>
		  <form class="form-horizontal" action="index" method="post">
			<fieldset>
        <legend class="legend">회원가입</legend>
			  	<%
			  	if (id > 0) {
			  		out.println("<input type='hidden' name='id' value='"+id+"'>");
			  	}
			  	%>
				<div class="control-group">
					<label class="control-label" for="userid">ID</label>
					<div class="controls">
						<input type="text" name="userid" value="<%=userid%>">
					</div>
				</div>
				<div class="control-group">
						<label class="control-label" for="pwd">Password</label>
						<div class="controls">
							<input type="password" name="pwd">
						</div>
					</div>
	
					<div class="control-group">
						<label class="control-label" for="pwd_confirm">Password Confirmation</label>
						<div class="controls">
							<input type="password" name="pwd_confirm">
						</div>
					</div>
				<div class="control-group">
					<label class="control-label" for="name">Name</label>
					<div class="controls">
						<input type="text" placeholder="홍길동" name="name" value="<%=name%>">
					</div>
				</div>

				<div class="control-group">
					<label class="control-label" for="year">Year</label>
					<div class="controls">
						<input type="text" placeholder="23" name="year" value="<%=year%>">
					</div>
				</div>

				<div class="control-group">
					<label class="control-label">Status</label>
					<div class="controls">
						<select name="status">
							<% 
							for(String statusName: statuses) {
								out.print("<option");
								if (statusName.equals(status)) {
									out.print(" selected");
								}
								out.println(">"+statusName+"</option>");	
							}
							%>
						</select>
					</div>
				</div>

				<div class="control-group">
					<label class="control-label">Gender</label>
					<div class="controls">
						<% for(String[] genderOption : genders) { %> 
							<label class="radio"> 
							  <input type="radio" value="<%=genderOption[0] %>" name="gender"
							  <% if (genderOption[0].equals(gender)) { out.print("checked");} %>
							  > 
							  <%=genderOption[1] %>
							</label>
						<% } %> 
					</div>
				</div>


				<div class="form-actions">
					<a href="index.jsp" class="btn">뒤로가기</a>
						<input type="submit" class="btn btn-primary" value="가입">
						<%if(request.getAttribute("error")!=null){%>
							   <%= request.getAttribute("error")%>  
							   
						  <% }%>
						
						
						
				</div>
			</fieldset>
		  </form>
    </div>
  </div>
  
</body>
</html>