<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
  <head>
    <base href="<%=basePath%>">
    
   <title>风险揭示</title>
   	<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
   	<meta name="format-detection" content="telephone=no, email=no" />
   	<meta name="webview" content="webView.detectsPhoneNumbers=NO" />
   	<meta http-equiv="Content-Type" content="text/html; charset=GBK" />
   	<link href="<%=basePath%>app/toc/css/risk.css" rel="stylesheet">
   	<script type="text/javascript" src="<%=basePath%>app/toc/js/jquery-1.6.min.js"></script>
  </head>
  
<body>
<div class="fx_top">
	<div class="fx_bt">风险提示</div>
</div>
<div>
	
	<div class="fx_neir">
		<span>尊敬的交易商：</span><br/>
		 一、在本所上市且通过集中竞价系统交易的公司债券出现以下情形之一的，本所有权对该公司债券交易实行风险警示：
		
		<p>（一）债券主体评级或债项评级为AA-级以下（含），或债券主体评级为AA级且评级展望为负面；</p>
		
		<p>（二）发行人最近一个会计年度经审计的净利润为负值或者经更正的净利润为负值；</p>
		
		<p>（三）发行人严重违反法律法规、部门规章或者未履行合同约定义务，被中国证监会立案调查，可能对债券还本付息产生重大影响；</p>
		
		<p>（四）发行人生产经营等情况发生重大变化，可能对债券还本付息产生重大影响；</p>
		
		<p>（五）中国证券登记结算有限责任公司（以下简称“中国结算”）根据《标准券折算率（值）管理办法（2013年修订版）》第六条第（七）项的规定，下调标准券折算率；</p>
		
		<p>（六）本所认定的其他情形。</p>
		<div class="fx_1"></div>
		<div class="fx_2">
			<input id="hasRead" type="checkbox"  style="zoom:150%" />已阅读
		</div>
		<div class="fx_bottom" id="risk_sure">
			<div class="anniu">
				<div class="left"><img src="<%=basePath%>app/toc/images/qd.png" /></div>
				<div class="left anniunr">确定</div>
			</div>
		 </div>
	</div>
</div>
</body>
<script type="text/javascript">
	$(function(){
		$("#risk_sure").click(function(){
			var flag = $("#hasRead").attr("checked");
			if(!flag){
				alert("请先阅读风险提示！");
			}else{
				window.location.href="<%=basePath%>app/toc/jsp/register/zhuce.jsp"
			}
		});
	});
</script>
</html>
