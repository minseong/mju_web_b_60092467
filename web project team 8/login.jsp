<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"  import="java.sql.*" 
		import="org.apache.commons.lang3.StringUtils"%>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>로그인</title>
	<link href="css/mobile_login.css" rel="stylesheet">
	<script src="js/jquery-1.8.2.min.js"></script>
	 <meta name="viewPort" content="initial-scale=1.0; maximum-scale=1.0; minimum-scale=1.0; user-scale=no;" />
</head>
<body>
<div class ="vCenter">

 <div class="center">
	  <div>
		  <form class="form-horizontal"action="check.jsp" method="post">
			<fieldset>
        <legend class="legend">로그인</legend>
				<div class="control-group">
					<div class="controls">
						아이디 입력
					</div>
					<div class="controls">
						<input type="text" name="userid">
					</div>
				</div>
				<div class="control-group">
											<div class="controls">
						비밀번호 입력
					</div>
						<div class="controls">
							<input type="password" name="pwd">
						</div>
					</div>
				<div class="form-actions">
					<a href="index.jsp" class="btn">뒤로가기</a>
						<input type="submit" class="btn btn-primary" value="로그인">
				</div>
			</fieldset>
			
		  </form>
    </div>
  </div>

  
  </div>
  
</body>
</html>