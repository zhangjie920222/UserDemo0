<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ include file="../../public/taglib.jsp" %>
<%@ page language="java" import="gnnt.MEBS.common.Constant"%>
<%@ include file="../../public/path.jsp"%>
<%
request.setAttribute("LimitPriceOpenOrder", Constant.getLimitPriceOpenOrder());
%>

<!DOCTYPE>
<html>
  <head>
	<meta http-equiv="Content-Type" content="text/html; charset=GBK" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <link rel="stylesheet" type="text/css" href="<%=skinPath%>/css/1_liuqw.css" media="all">
    <script type="text/javascript" src="<%=basePath%>/js/jquery-1.6.min.js"></script>
    <title>${pageTitle}</title>
  </head>
  
  <body>
    <a href="<%=path%>/tocServlet?reqName=mainForward"><div class="fanhui">个人账户</div></a>
	<div class="tishikuang01" style="height: 800px;">
		<div class="tishikuang0_11">
			<div class="tishikuang0_12">
				<div class="touxiang"><img width="96px" height="96px" src="${CurrentUser.headImgUrl}"></div>
			</div>
			<div class="tishikuang0_31">${CurrentUser.nickname}</div>
		</div>
		<div class="tishikuang0_2" style="height: 600px;">
			
			<c:if test="${CurrentUser.money!=null && CurrentUser.money != 0}">
				<div class="gao">
				<div class="zhi0-1 left">赠送资金</div>
				<div class="shu right" id="">
					<fmt:formatNumber value="${CurrentUser.money}" pattern="#0.00"/>	
				</div>
			</div>
			</c:if>
			<div class="gao" id="recharge">
				<div class="zhi0-1 left">充值</div>
				<div class="tu right"></div>
			</div>
			<div class="gao" id="withdrow">
				<div class="zhi0-1 left">提现</div>
				<div class="tu right"></div>
			</div>
			<a href="javascript:location.href='<%=basePath%>/jsp/tsust/inOutMoney.jsp'">
			<div class="gao">
				<div class="zhi0-1 left">出入金查询</div>
				<div class="tu right"></div>
			</div>
			</a>
			<a href="javascript:location.href='<%=basePath%>/jsp/tsust/withdraw.jsp'">
			<div class="gao">
				<div class="zhi0-1 left">提现申请查询</div>
				<div class="tu right"></div>
			</div>
			</a>
			<c:if test="${LimitPriceOpenOrder==1 }">
				<div class="gao" id="limitOrder">
					<div class="zhi0-1 left" >今日指价委托</div>
					<div class="tu right"></div>
				</div>
			</c:if>
			<div class="gao" id="holdposition">
				<div class="zhi0-1 left" >持仓查询</div>
				<div class="tu right"></div>
			</div>
			<a   href="javascript:location.href='<%=path%>/tocServlet?reqName=tradequery'">
			<div class="gao">
				<div class="zhi0-1 left" >今日成交</div>
				<div class="tu right"></div>
			</div>
			</a>
			<a  href="javascript:location.href='<%=basePath%>/jsp/tsust/dealSummaryAndDetailHis.jsp'">
			<div class="gao">
				<div class="zhi0-1 left" >历史成交</div>
				<div class="tu right"></div>
			</div>
			</a>
			<a href="javascript:location.href='<%=basePath %>jsp/user/gerenxinxi.jsp'">
			<div class="gao">
				<div class="zhi0-1 left">个人信息</div>
				<div class="tu right"></div>
			</div>
			</a>
			<a href="javascript:location.href='<%=path %>/tocServlet?reqName=GETBANKBINDINGLIST'">
			<div class="gao">
				<div class="zhi0-1 left">银行卡绑定</div>
				<div class="tu right"></div>
			</div>
			</a>
			<a href="javascript:location.href='<%=path %>/tocServlet?reqName=FIRMFUND'">
			<div class="gao">
				<div class="zhi0-1 left">资金查询</div>
				<div class="tu right"></div>
			</div>
			</a>
			<a href="javascript:location.href='<%=path %>/app/toc/jsp/tsust/promotionacts.jsp'">
			<div class="gao">
				<div class="zhi0-1 left">体验券查询</div>
				<div class="tu right"></div>
			</div>
			</a>
			<!-- 
			<a href="javascript:location.href='<%=basePath %>jsp/user/actualQuotation.jsp'">
			<div class="gao">
				<div class="zhi0-1 left">转实盘申请</div>
				<div class="tu right"></div>
			</div>
			</a>
			<a href="javascript:location.href='<%=path%>/tocServlet?reqName=actualQuotationQuery'">
			<div class="gao">
				<div class="zhi0-1 left">转实盘查询</div>
				<div class="tu right"></div>
			</div>
			</a>
			 -->
		</div>
	</div>
  </body>
  <script type="text/javascript">
 		$(function(){
 			$("#recharge").click(function(){
 				location.href="<%=path%>/tocServlet?reqName=rechargeForward";	
 			
 			});
 			$("#withdrow").click(function(){
 				//location.href="<%=path%>/tocServlet?reqName=CANOUTFUNDS";	
 				location.href="<%=path%>/tocServlet?reqName=NEWWITHDAROWFORWARD";	
 			});
 			//指价委托
 			$("#limitOrder").click(function(){
 				location.href="<%=path%>/tocServlet?reqName=LIMITORDERQUERY";	
 			});
 			//持仓查询
 			$("#holdposition").click(function(){
 				location.href="<%=path%>/tocServlet?reqName=GETHOLDLIST";	
 			});
 	 	});
  </script>
</html>
