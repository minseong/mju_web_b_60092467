<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"  import="java.sql.*" 
		import="org.apache.commons.lang3.StringUtils"%>
<%
 String content= "";
 String to = request.getParameter("to");
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
		  <form class="form-horizontal"action="messagedata.jsp" method="post">
			<fieldset>
        <legend class="legend"></legend>
				<div class="control-group">
					<label class="control-label" for="to">to <%=to %> </label>
				</div>
				<div class="control-group">
						<label class="control-label" for="content">내용</label>
						<div class="controls">
							<textarea cols="70" rows="50" placeholder="내용을 입력하세요" name="content"><%=content%></textarea>
						</div>
					</div>
				<div class="form-actions">
					<a href="map.jsp" class="btn">뒤로가기</a>
						<input type="submit" class="btn btn-primary" value="보내기">
				</div>
			</fieldset>
			
		  </form>
    </div>
  </div>
  
</body>
</html>