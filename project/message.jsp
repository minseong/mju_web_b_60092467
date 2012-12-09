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
	<title>쪽지보내기</title>
	<script src="js/jquery-1.8.2.min.js"></script>
<link href="css/mobile_message.css" rel="stylesheet">
	 <meta name="viewPort" content="initial-scale=1.0; maximum-scale=1.0; minimum-scale=1.0; user-scale=no;" />
</head>
<body>
 
	  <div class ="vCenter">

 <div class="center">
		  <form class="form-horizontal"action="messagedata.jsp" method="post">
			<fieldset>
			<input type="hidden" name="to" value=<%=to %>>
        
				<div class="control-group">
					<label class="control-label" for="to">to  </label>
					<label class="control-label"><%=to %></label>
				</div>
				<div class="control-group">
						<label class="control-label" for="content">내용</label>
						
							<textarea cols="25px" rows="10px" placeholder="내용을 입력하세요" name="content"><%=content%></textarea>
						
					</div>
				<div class="form-actionss">
					<a href="map.jsp" class="btn">뒤로가기</a>
						<input type="submit" class="btn btn-primary" value="보내기">
				</div>
			</fieldset>
			
		  </form>
    </div>
  </div>
  
</body>
</html>