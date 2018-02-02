<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ include file="../../public/path.jsp"%>
<%@ include file="../../public/taglib.jsp" %>
<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    <title>${pageTitle}--</title>
    <!--iPhone 手机上设置手机号码不被显示为拨号链接）-->
    <meta content="telephone=no, address=no" name="format-detection" /> 
    <meta http-equiv="Content-Type" content="*/*; charset=UTF-8" />
  	<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
  	<link rel="stylesheet" type="text/css" href="<%=skinPath%>css/news.css" media="all">
  	<script type="text/javascript" src="<%=basePath%>js/jquery-1.6.min.js"></script>
  </head>
  <body>
   <%--  <div class="fanhui" id="back">${typeName}</div> --%>
     <div class="bt1" style="color:white;margin:0 auto;margin-bottom:20px;"><span>${typeName}</span><img id="back" style="float:right;margin-top:15px;padding-right:20px;" src="<%=basePath %>images/back.png"/></div>
	<div class="tishikuang01" style="overflow:auto; padding:5px; height:350px;">
		<div>
			<div class="gonggao1">
				<c:forEach items="${newsList}" var="map">
					<div class="zgzd_1_1">
							<div class="zgzd_1_1_left" id="${map.ID}">${map.TITLE }</div>
							<div class="zgzd_1_1_right">${map.TIME} </div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	<form id="frm" action="<%=path%>/tocServlet" method="post">
		<input type="hidden" id="reqName" name="reqName" value="newsDetail"/>
		<input type="hidden" id="newsId" name="newsId" value=""/>
		<input type="hidden" name="typeName" id="typeName" value="${typeName }"/>
		<input type="hidden" name="from" id="from" value="2"/>
		<input type="hidden" name="typeId" id="from" value="${typeId }"/>
	</form>
  </body>
  <script type="text/javascript">
  $(function(){
	  $(".zgzd_1_1_left").click(function(){
	  		var id = $(this).attr("id");
	  		$("#newsId").val(id);
	  		$("#frm").submit();
	  	});
	$("#back").click(function(){
		location.href = "<%=path%>/tocServlet?reqName=mainForward";
	});
  });
    var h2 =  $(window).height()-90;
    $(".tishikuang01").height(h2);
  </script>
</html>
