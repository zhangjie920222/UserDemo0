<%@ page language="java" import="java.util.*,java.text.*" pageEncoding="UTF-8"%>
<%@ include file="../../public/taglib.jsp"%>
<%@ include file="../../public/path.jsp"%>
<!DOCTYPE>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
		<meta name="viewport"
			content="width=device-width,target-densitydpi=medium-dpi,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
		<link rel=stylesheet type="text/css" href="<%=skinPath%>css/query.css" title="cool">
		<link rel=stylesheet type="text/css" href="<%=basePath%>css/jquery-ui.min.css">
		<script type="text/javascript" src="<%=basePath%>/js/jquery-1.6.min.js"></script>
		<script type="text/javascript" src="<%=basePath%>/js/jquery-ui.min.js"></script>
		<title>${pageTitle}</title>
		<style type="text/css">
		</style>
	</head>
	<body>
		<%-- 持仓详情 start --%> 
		<a href="<%=basePath%>/jsp/tsust/withdraw.jsp"><div class="fanhui">提现申请详情</div></a>
		<div id="cc_xiangqing" class="tishikuang01" style="height:auto; margin-bottom:60px;">
		<div class="tishikuang0_2" style="height:530px;">
			<div class="gao">
				<div class="zhi0-1 left">申请时间</div>
				<div class="shu right" id="TI">
					<fmt:formatDate value="${data.TIME}" pattern="yyyy-MM-dd HH:mm:ss"/><br/>
				</div>
			</div>
			<div class="gao">
				<div class="zhi0-1 left">状态</div>
				<div class="shu right" id="SE_F">
					<c:choose>
						<c:when test="${data.STATUS==0 }">申请</c:when>
						<c:when test="${data.STATUS==1 }">通过</c:when>
						<c:when test="${data.STATUS==2 }">拒绝</c:when>
					</c:choose>
				</div>
			</div>
			<div class="gao">
				<div class="zhi0-1 left">金额</div>
				<div class="shu right" id="CO_N">
					<fmt:formatNumber value="${data.ACOUNT}" pattern="##.##" minFractionDigits="2" />
				</div>
			</div>
			<div class="gao">
				<div class="zhi0-1 left">手续费</div>
				<div class="shu right" id="CO_N">
					<fmt:formatNumber value="${data.FEE}" pattern="##.##" minFractionDigits="2" />
				</div>
			</div>
			<div class="gao">
				<div class="zhi0-1 left">银行</div>
				<div class="shu right" id="CO_N">
					${data.BANKNAME }
				</div>
			</div>
			<div class="gao">
				<div class="zhi0-1 left">省份</div>
				<div class="shu right" id="CO_N">
					${data.PROVINCE }
				</div>
			</div>
			<div class="gao">
				<div class="zhi0-1 left">城市</div>
				<div class="shu right" id="CO_N">
					${data.CITY }
				</div>
			</div>
			<div class="gao">
				<div class="zhi0-1 left">姓名</div>
				<div class="shu right" id="CO_N">
					${data.NAME }
				</div>
			</div>
			<div class="gao">
				<div class="zhi0-1 left">银行卡号</div>
				<div class="shu right" id="CO_N">
					**** **** **** ${fn:substring(data.CARDNUMBER, (fn:length(data.CARDNUMBER)-4), fn:length(data.CARDNUMBER))}
				</div>
			</div>
			<c:if test="${data.STATUS==2}">
				<div class="gao">
					<div class="zhi0-1 left">拒绝原因</div>
					<div class="shu right" id="CO_N">
						${data.REFUSENOTE}
					</div>
				</div>
			</c:if>
		</div>
		<br/>
	</div>
		<%-- 持仓详情 end --%> 
	</body>
	<script type="text/javascript">
		$(function(){
			$.back = function(){
				history.go(-1);
			}
		});
	</script>
</html>