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
    <div class="fanhui" id="back">����</div>
    <div class="tishikuang01" style="overflow:auto; padding:5px; height:350px;">
		<div>
			<div class="gonggao1" style="color:#CCCCCC;">
				<div style="text-align: center;font-size: large;font-weight:700;">
				ϵͳû���ҵ������ϼ��û���������ͨ��ɨ��ĳ�������˵Ķ�ά��󶨴˾����ˣ�Ȼ���ٴ�ע��
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
