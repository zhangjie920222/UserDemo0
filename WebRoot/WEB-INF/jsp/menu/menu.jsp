<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%
String _path = request.getContextPath();
String path =  request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+_path;
String basePath = path+"/app/toc/";
%>
<!DOCTYPE>
<html>
  <head>
    <title>������</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
	<meta http-equiv="expires" content="0">   
	<script type="text/javascript" src="<%=basePath%>/js/jquery-1.6.min.js"></script> 
  </head>
  <body>
  <div style="z-index:20">
    <div class="bottom">
		<div class="bottom-1"><a href="<%=basePath %>jsp/quotation/quotation.jsp">����</a></div>
		<div class="bottom-2" id="jpc"><label>����ƽ��</label>
			<div class="sjcx" id="xlk1">
				<div class="jpc2"><a href="<%=path%>/tocServlet?reqName=orderForward&openType=1">�м۽���</a></div>
				<div class="jpc2"><a href="mrjc.html">�м�ƽ��</a></div>
				<div class="jpc2"><a href="<%=path%>/tocServlet?reqName=orderForward&openType=2">ָ�۽���</a></div>
				<div class="jpc2"><a href="<%=path%>/tocServlet?reqName=my_order_query&orderQueryType=1">ָ�۳���</a></div>
			</div>
		</div>
		<div class="bottom-3" id="cx" >���ݲ�ѯ
			<div class="sjcx" id="xlk2">
				<div class="jpc2"><a href="<%=path%>/tocServlet?reqName=holdaposition">�ֲ���ϸ</a></div>
				<div class="jpc2"><a href="<%=path%>/tocServlet?reqName=hold">�ֲֻ���</a></div>
				<div class="jpc2"><a href="<%=path%>/tocServlet?reqName=my_order_query&orderQueryType=0">ί�в�ѯ</a></div>
				<div class="jpc2"><a href="<%=path%>/tocServlet?reqName=tradequery">�ɽ���ѯ</a></div>
				
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
