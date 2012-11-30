<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"  import="java.sql.*" 
		import="org.apache.commons.lang3.StringUtils"%>
    
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
		  <form class="form-horizontal"action="check.jsp" method="post">
			<fieldset>
        <legend class="legend">로그인</legend>
				<div class="control-group">
					<label class="control-label" for="userid">ID</label>
					<div class="controls">
						<input type="text" name="userid">
					</div>
				</div>
				<div class="control-group">
						<label class="control-label" for="pwd">Password</label>
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
  
</body>
</html>