<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ include file="../../public/taglib.jsp" %>
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
<title>微信支付加载中</title>
</head>

<body>
	<form action="${action }?showwxpaytitle=1" method="post" id="frm">
		<input type="hidden" readonly="readonly" name="reqName" value="${reqName }">
		<input type="hidden" readonly="readonly" name="code" value="${code }">
		<input type="hidden" readonly="readonly" name="type" value="${type }">
		<input type="hidden" readonly="readonly" name="amount" value="${amount }">
		<input type="hidden" readonly="readonly" name="timestamp" value="${timestamp }">
		<input type="hidden" readonly="readonly" name="nonce" value="${nonce }">
		<input type="hidden" readonly="readonly" name="sign" value="${sign }">
	</form>
</body>
<script type="text/javascript">
	frm.submit();
</script>
</html>
