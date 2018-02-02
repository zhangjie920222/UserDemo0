<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%
String _path = request.getContextPath();
String path =  request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+_path;
String basePath = path+"/app/toc/";
%>
<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title></title>
    <meta http-equiv="Content-Type" content="*/*; charset=UTF-8" />
  	<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
  	<link rel="stylesheet" type="text/css" href="<%=basePath%>/css/news.css" media="all">
  	<script type="text/javascript" src="<%=basePath%>js/jquery-1.6.min.js"></script>
  </head>
  <body>
    <div class="fanhui" id="back">详情</div>
    <div class="tishikuang01" style="overflow:auto; padding:5px; height:350px;">
		<div>
			<div class="gonggao1" style="color:#CCCCCC;">
				<div style="text-align: center;font-size: large;font-weight:700;">
				系统没有找到您的上级用户，您可以通过扫描某个经纪人的二维码绑定此经纪人，然后再次注册
				</div>
			</div>
		</div>
	</div>
	<form id="frm" action="<%=path%>/tocServlet" method="post">
		<input type="hidden" id="reqName" name="reqName" value="newsViewMore"/>
		<input type="hidden" name="typeName" id="typeName" value="${typeName }"/>
		<input type="hidden" name="typeId" id="from" value="${typeId }"/>
	</form>
  </body>
</html>
