<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../public/taglib.jsp"%>
<%@ include file="../../public/path.jsp"%>
<!DOCTYPE>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
		<meta name="viewport"
			content="width=device-width,target-densitydpi=medium-dpi,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
		<link rel=stylesheet type="text/css" href="<%=skinPath%>css/1_liuqw_1.css" title="cool">
		<title>如何建仓</title>
	</head>
	<body style="height: 510px;">
		<a href="guigejieshao.jsp"><div class="fanhui">规则介绍</div></a>
		<div class="tishikuang01" style="overflow:auto; padding:8px;">
			<div style="color:#fafafa;">
				<div class="wenzi1_1">
					1、在交易页面，选择一种交易规格自由选择买涨或买跌，点击选择其中一个规格产品和购买方向。如下图：
				</div>
				<div class="rhzhuce"><img src="<%=basePath%>images/jiancang1.png" style="width:100%; margin-bottom:10px;" /></div>
				<div class="wenzi1_1">
					2、选择交易产品和购买方向后，跳转至建仓页面，选择建仓数量，最后点击“确认建仓”即完成入仓流程。如下图：
				</div>
				<div class="rhzhuce"><img src="<%=basePath%>images/jiancang2.png" style="width:100%; margin-bottom:10px;" /></div>
			</div>
		</div>
	</body>
</html>