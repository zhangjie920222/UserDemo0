<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%
String _path = request.getContextPath();
String path =  request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+_path;
String basePath = path+"/app/toc/";
%>
<!DOCTYPE>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=GBK" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
	<link rel=stylesheet type="text/css" href="<%=basePath%>/css/1_liuqw.css" title="cool">
	<script type="text/javascript" src="<%=basePath%>js/jquery-1.6.min.js"></script>
<title>转实盘查询</title>
<style type="text/css">
.tu_1 select{
border:0px;
width:80%;
background-color:#b3e6ff;
height:70%;
margin-top:2%;
margin-left:2%;
color:#2684b2;
}
</style>
</head>

<body>
	<a href="javascript:location.href='<%=basePath %>jsp/user/userInfo.jsp'"><div class="fanhui">转实盘查询</div></a>
	<form action="<%=path%>/tocServletd" method="post" id="frm" name="frm">
	<input name="reqName" type="hidden" value="actualQuotation">
	<div class="tishikuang" style="height: 300px;">
		<div class="tishikuang0_23" style="height: 200px;">
			<div class="gao">
				<div class="gonggao1" style="color:#CCCCCC;">
					<div style="text-align: center;font-size: large;font-weight:700;">${msg }</div>
				</div>
			</div>
		</div>
	</form>
	</div>
</body>
<script type="text/javascript">
	$(function(){
	});
</script>
</html>
