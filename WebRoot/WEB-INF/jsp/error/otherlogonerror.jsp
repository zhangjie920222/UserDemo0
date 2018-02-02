<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/app/toc/";
%>

<!DOCTYPE HTML>
<html>
  <head>

  </head>
  <body style="background-color: #208bb7;">
  	<div style="text-align: center; margin-top: 50%">
  		<img alt="" src="<%=basePath %>images/error.jpg" style="width: 80%;height: 50%">
  	</div>
  </body>
</html>
