<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
  <head>
    <base href="<%=basePath%>">
    
   <title>���ս�ʾ</title>
   	<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
   	<meta name="format-detection" content="telephone=no, email=no" />
   	<meta name="webview" content="webView.detectsPhoneNumbers=NO" />
   	<meta http-equiv="Content-Type" content="text/html; charset=GBK" />
   	<link href="<%=basePath%>app/toc/css/risk.css" rel="stylesheet">
   	<script type="text/javascript" src="<%=basePath%>app/toc/js/jquery-1.6.min.js"></script>
  </head>
  
<body>
<div class="fx_top">
	<div class="fx_bt">������ʾ</div>
</div>
<div>
	
	<div class="fx_neir">
		<span>�𾴵Ľ����̣�</span><br/>
		 һ���ڱ���������ͨ�����о���ϵͳ���׵Ĺ�˾ծȯ������������֮һ�ģ�������Ȩ�Ըù�˾ծȯ����ʵ�з��վ�ʾ��
		
		<p>��һ��ծȯ����������ծ������ΪAA-�����£���������ծȯ��������ΪAA��������չ��Ϊ���棻</p>
		
		<p>���������������һ�������Ⱦ���Ƶľ�����Ϊ��ֵ���߾������ľ�����Ϊ��ֵ��</p>
		
		<p>����������������Υ�����ɷ��桢���Ź��»���δ���к�ͬԼ�����񣬱��й�֤����������飬���ܶ�ծȯ������Ϣ�����ش�Ӱ�죻</p>
		
		<p>���ģ�������������Ӫ����������ش�仯�����ܶ�ծȯ������Ϣ�����ش�Ӱ�죻</p>
		
		<p>���壩�й�֤ȯ�Ǽǽ����������ι�˾�����¼�ơ��й����㡱�����ݡ���׼ȯ�����ʣ�ֵ������취��2013���޶��棩���������ڣ��ߣ���Ĺ涨���µ���׼ȯ�����ʣ�</p>
		
		<p>�����������϶����������Ρ�</p>
		<div class="fx_1"></div>
		<div class="fx_2">
			<input id="hasRead" type="checkbox"  style="zoom:150%" />���Ķ�
		</div>
		<div class="fx_bottom" id="risk_sure">
			<div class="anniu">
				<div class="left"><img src="<%=basePath%>app/toc/images/qd.png" /></div>
				<div class="left anniunr">ȷ��</div>
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
				alert("�����Ķ�������ʾ��");
			}else{
				window.location.href="<%=basePath%>app/toc/jsp/register/zhuce.jsp"
			}
		});
	});
</script>
</html>
