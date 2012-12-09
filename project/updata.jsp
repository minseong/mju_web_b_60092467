<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"  import="java.sql.*" 
		import="org.apache.commons.lang3.StringUtils"%>
<%
	String[] statuses = {"같이 밥 먹을 사람", "같이 영화 볼 사람", "같이 여행 갈 사람", "같이 놀이공원 갈 사람", "같이 게임 할 사람"};
	String[][] genders = {{"M", "남성"}, {"F", "여성"}};
	String stat="";
%>    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원정보수정</title>
	<script src="js/jquery-1.8.2.min.js"></script>
	<link href="css/mobile_updata.css" rel="stylesheet">
	 <meta name="viewPort" content="initial-scale=1.0; maximum-scale=1.0; minimum-scale=1.0; user-scale=no;" />
</head>
<body>
<div class ="vCenter">

 <div class="center">
		  <form class="form-horizontal" action="updatach.jsp"method="post">
			<fieldset>
        <legend class="legend">회원정보수정</legend>
			  	
			
			
	
				<div class="control-group">
					<label class="control-label" for="name">Name</label>
					<div class="controls">
						<input type="text" name="name">
					</div>
				</div>

				<div class="control-group">
					<label class="control-label" for="year">Year</label>
					<div class="controls">
						<input type="text" name="year">
					</div>
				</div>

				<div class="control-group">
					<label class="control-label">Status</label>
					<div class="controls">
						<select name="status">
							<% 
							for(String statusName: statuses) {
								out.print("<option");
								if (statusName.equals(stat)) {
									out.print(" selected");
								}
								out.println(">"+statusName+"</option>");	
							}
							%>
						</select>
					</div>
				</div>
				<div class="form-actionss">
					<a href="menu.jsp" class="btn">뒤로가기</a>
						<input type="submit" class="btn btn-primary" value="확인">
				</div>
			</fieldset>
		
		  </form>
    </div>
  </div>
  
</body>
</html>