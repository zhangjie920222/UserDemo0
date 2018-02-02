<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%
String _path = request.getContextPath();
String path =  request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+_path;
String basePath = path+"/app/toc/";
%>
<!DOCTYPE>
<html>
  <head>
    <title>导航条</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
	<meta http-equiv="expires" content="0">   
	<script type="text/javascript" src="<%=basePath%>/js/jquery-1.6.min.js"></script> 
  </head>
  <body>
  <div style="z-index:20">
    <div class="bottom">
		<div class="bottom-1"><a href="<%=basePath %>jsp/quotation/quotation.jsp">行情</a></div>
		<div class="bottom-2" id="jpc"><label>建仓平仓</label>
			<div class="sjcx" id="xlk1">
				<div class="jpc2"><a href="<%=path%>/tocServlet?reqName=orderForward&openType=1">市价建仓</a></div>
				<div class="jpc2"><a href="mrjc.html">市价平仓</a></div>
				<div class="jpc2"><a href="<%=path%>/tocServlet?reqName=orderForward&openType=2">指价建仓</a></div>
				<div class="jpc2"><a href="<%=path%>/tocServlet?reqName=my_order_query&orderQueryType=1">指价撤单</a></div>
			</div>
		</div>
		<div class="bottom-3" id="cx" >数据查询
			<div class="sjcx" id="xlk2">
				<div class="jpc2"><a href="<%=path%>/tocServlet?reqName=holdaposition">持仓明细</a></div>
				<div class="jpc2"><a href="<%=path%>/tocServlet?reqName=hold">持仓汇总</a></div>
				<div class="jpc2"><a href="<%=path%>/tocServlet?reqName=my_order_query&orderQueryType=0">委托查询</a></div>
				<div class="jpc2"><a href="<%=path%>/tocServlet?reqName=tradequery">成交查询</a></div>
				
			</div>
		</div>
	</div>
	</div>
  </body>
  <script type="text/javascript">
		$(function(){
			var jpc_flag = false;
			$("#jpc").click(function(){
				if(jpc_flag){
					jpc_flag = false;
					$("#xlk1").hide();
				}else{
					jpc_flag = true;
					$("#xlk1").show();
				}
			});
			var cx_flag = false;
			$("#cx").click(function(){
				if(cx_flag){
					cx_flag = false;
					$("#xlk2").hide();
				}else{
					cx_flag = true;
					$("#xlk2").show();
				}
			});
		});
	</script>
</html>
