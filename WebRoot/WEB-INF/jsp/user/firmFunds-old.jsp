<%@ page language="java" import="java.util.*,java.text.*" pageEncoding="UTF-8"%>
<%@ include file="../../public/taglib.jsp"%>
<%@ include file="../../public/path.jsp"%>
<!DOCTYPE>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
		<meta name="viewport"
			content="width=device-width,target-densitydpi=medium-dpi,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
		<link rel=stylesheet type="text/css" href="<%=skinPath%>css/1_liuqw.css" title="cool">
		<link rel=stylesheet type="text/css" href="<%=basePath%>css/jquery-ui.min.css">
		<script type="text/javascript" src="<%=basePath%>/js/jquery-1.6.min.js"></script>
		<script type="text/javascript" src="<%=basePath%>/js/jquery-ui.min.js"></script>
		<title>${pageTitle}</title>
	</head>
	<body>
		<a id="cc_bufen_title" href="javascript:location.href='<%=basePath%>/jsp/user/userInfo.jsp'">
			<div class="fanhui">
				资金查询
			</div>
		</a>
		<div id="cc_xiangqing" style="height:auto;">
			<div class="tishikuang01" style="">
			<div class="tishikuang0_2" style="height:auto;">
				<div class="gao">
					<div class="zhi0-1 left">账号</div>
					<div class="shu right" id="TR_N">${CurrentUser.userId }</div>
				</div>
				<div class="gao">
					<div class="zhi0-1 left">名称</div>
					<div class="shu right" id="TI">
						<c:choose>  
						    <c:when test="${fn:length(CurrentUser.nickname)>10}">  
						        <c:out value="${fn:substring(CurrentUser.nickname, 0, 10)}..." />  
						    </c:when>  
						   <c:otherwise>  
						      <c:out value="${CurrentUser.nickname}" />  
						    </c:otherwise>  
						</c:choose> 
					</div>
				</div>
			</div>
			<div class="tishikuang0_2" style="height:auto;">
				<div class="gao">
					<div class="zhi0-1 left">可用资金</div>
					<div class="shu right" id="CO_N">${firmFunds.UF}</div>
				</div>
				<div class="gao">
					<div class="zhi0-1 left">当前权益</div>
					<div class="shu right" id="CO_N">${firmFunds.EQT}</div>
				</div>
				<div class="gao">
					<div class="zhi0-1 left" id="TY_fangxiang">当日保证金</div>
					<div class="shu right " id="TY">${firmFunds.RM}</div>
				</div>
				<div class="gao">
					<div class="zhi0-1 left" id="TY_fangxiang">风险率</div>
					<div class="shu right " id="risk">${firmFunds.RM}</div>
				</div>
				<div class="gao">
					<div class="zhi0-1 left">延期费</div>
					<div class="shu right" id="QTY">${firmFunds.CD}</div>
				</div>
			</div>
			<br/>
		</div>
		</div>
	</body>
	<script type="text/javascript">
		var userEQT = '${firmFunds.EQT}';//当前权益
		var margain = '${firmFunds.RM}';//当日保证金
		var delayFee = '${firmFunds.CD}';//上日延期费
		var risk = "安全";
		if(margain > 0){
			risk = userEQT/margain*100;
			if(risk>200){
				risk = "安全";
			}else{
				risk = Number(risk).toFixed(2)+"%";
			}
		}
		$("#risk").html(risk);
	</script>
</html>