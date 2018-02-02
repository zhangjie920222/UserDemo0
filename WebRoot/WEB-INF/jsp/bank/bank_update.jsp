<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ include file="../../public/path.jsp"%>
<%@ include file="../../public/taglib.jsp"%>
<!DOCTYPE>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=GBK" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
	<link rel=stylesheet type="text/css" href="<%=skinPath%>/css/1_liuqw.css" title="cool">
	<script type="text/javascript" src="<%=basePath%>js/jquery-1.6.min.js"></script>
	<title>${pageTitle}</title>
</head>

<body>
	<a href="javascript:location.href='<%=path %>/tocServlet?reqName=GETBANKBINDINGLIST'"><div class="fanhui">删除银行卡</div></a>
	<div class="tishikuang" style="height: auto;">
		<form action="<%=path%>/tocServlet" method="post" id="frm" name="frm">
			<div class="tishikuang0_23" style="height: auto;">
				<div class="gao">
					<div class="zhi0-1 left">姓名</div>
					<div class="tu_1 right"><input readonly="readonly" name="name" id="name" value="${NAME }" /></div>
				</div>
				<div class="gao">
					<div class="zhi0-1 left">银行</div>
					<div class="tu_1 right"><input readonly="readonly" id="bankNo" value="${map.BANKNAME }"/></div>
				</div>
				<div class="gao">
					<div class="zhi0-1 left">银行卡号</div>
					<div class="tu_1 right"><input readonly="readonly" id="bankNo" value="**** **** **** ${fn:substring(BANKNO, (fn:length(BANKNO)-4), fn:length(BANKNO))}"/></div>
				</div>
				<div class="gao">
					<div class="zhi0-1 left">省份</div>
					<div class="tu_1 right"><input readonly="readonly" id="bankNo" value="${map.PROVINCE }"/></div>
				</div>
				<div class="gao">
					<div class="zhi0-1 left">城市</div>
					<div class="tu_1 right"><input readonly="readonly" id="bankNo" value="${map.CITY }"/></div>
				</div>
				<div class="gao">
					<div class="zhi0-1 left">银行预留手机号</div>
					<div class="tu_1 right"><input readonly="readonly" id="bankNo" value="${map.PHONENO }"/></div>
				</div>
			</div>
			<div class="shuliang8 clear" id="btpwdsubmit"></div>
			<input type="hidden" name="reqName" value="DELETEBANKBINDING">
			<input type="hidden" name="bankNo" value="${BANKNO}">
		</form>
	</div>
</body>
<script type="text/javascript">
$(function(){
	$("#btpwdsubmit").click(function(){
		var name = $("#name").val();
		if(name == null || name == ""){
			alert("姓名不能为空");
			return;
		}
		var bankNo = $("#bankNo").val();
		if(bankNo == null || bankNo == ""){
			alert("银行卡号不能为空");
			return;
		}
		frm.submit();
	});
});
</script>
</html>
