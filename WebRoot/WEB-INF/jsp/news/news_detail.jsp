<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ include file="../../public/path.jsp"%>
<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    <title>${pageTitle}</title>
  <!--iPhone 手机上设置手机号码不被显示为拨号链接）-->
    <meta content="telephone=no, address=no" name="format-detection" />
    <meta http-equiv="Content-Type" content="*/*; charset=UTF-8" />
  	<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
  	<link rel="stylesheet" type="text/css" href="<%=skinPath%>css/news.css" media="all">
  	<script type="text/javascript" src="<%=basePath%>js/jquery-1.6.min.js"></script>
  </head>
  <body style="margin:0 auto;"> 
    <div class="bt1" style="color:white;margin:0 auto;margin-bottom:20px;"><span>${typeName}详情</span><img id="back" style="float:right;margin-top:15px;padding-right:20px;" src="<%=basePath %>images/back.png"/></div>

    <div class="tishikuang01" style="overflow:auto; padding:1%;">
		<div>
			<div class="gonggao1" style="color:#CCCCCC;">
				<div style="text-align: center;font-size: large;font-weight:700;">${content[0].TITLE}</div>
				${content[0].CONTENT }
			</div>
		</div>
	</div>
	<form id="frm" action="<%=path%>/tocServlet" method="post">
		<input type="hidden" id="reqName" name="reqName" value="newsViewMore"/>
		<input type="hidden" name="typeName" id="typeName" value="${typeName }"/>
		<input type="hidden" name="typeId" id="from" value="${typeId }"/>
	</form>
  </body>
  <script type="text/javascript">
  var type = '${from}';
  	$(function(){
		$("#back").click(function(){
			if(type == '2'){
				$("#frm").submit();
			}else{
				location.href = "<%=path%>/tocServlet?reqName=mainForward";
			}
		});
  	});
    var h = $(".tishikuang01").width();
    $("p img").css("width", h);
       var h2 =  $(window).height()-90;
    $(".tishikuang01").height(h2);
  </script>
</html>
