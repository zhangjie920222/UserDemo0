<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ include file="../../public/taglib.jsp" %>
<%@ page language="java" import="gnnt.MEBS.common.Constant"%>
<%@ include file="../../public/path.jsp"%>
<%
request.setAttribute("LimitPriceOpenOrder", Constant.getLimitPriceOpenOrder());
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=GBK" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <link rel="stylesheet" type="text/css" href="<%=skinPath%>/css/model.css" media="all">
    <script type="text/javascript" src="<%=basePath%>/js/jquery-1.6.min.js"></script>
    <title>${pageTitle}</title>
  </head>
</head>

<body>
<div class="grzx">
 <div class=" grzx_tx"><img src="${CurrentUser.headImgUrl}" width="100" height="100" /></div>
 <div class="gezx_l1bor">
   <div class="gezx_l1">${CurrentUser.nickname}</div>
   <div class="gezx_l1">现金：0元  </div>
   <div class="gezx_l1">优惠券：0张</div>
    <c:if test="${CurrentUser.money!=null && CurrentUser.money != 0}">			
				<div class="gezx_l1">赠送资金：<fmt:formatNumber value="${CurrentUser.money}" pattern="#0.00"/></div>
   </c:if>
 </div>
 <a href="<%=path%>/tocServlet?reqName=mainForward"><div style="float:right;"><img style="float:right;margin-top:15px;padding-right:20px;" src="<%=basePath %>images/back.png"/></div></a> 
   <div class="clear"></div>
</div>
<div class="xx_line" id="recharge">
  <div class="xx_l_ico"><img src="<%=basePath%>images/cz.png" width="30" height="30" /></div>
  <div class="xx_l_txt">充值</div>
  <div class="xx_l_r">  <img src="<%=basePath%>images/jt.png" alt="" width="30" height="30" /></div> 
</div>

<div class="xx_line" id="withdrow">
  <div class="xx_l_ico"><img src="<%=basePath%>images/tx.png" width="30" height="30" /></div>
  <div class="xx_l_txt">提现</div>
  <div class="xx_l_r">  <img src="<%=basePath%>images/jt.png" alt="" width="30" height="30" /></div> 
</div>
<a href="javascript:location.href='<%=basePath%>jsp/tsust/inOutMoney.jsp'">
<div class="xx_line">
  <div class="xx_l_ico"><img src="<%=basePath%>images/crjxc.png" width="30" height="30" /></div>
  <div class="xx_l_txt">出入金查询</div>
  <div class="xx_l_r">  <img src="<%=basePath%>images/jt.png" alt="" width="30" height="30" /></div> 
</div>
</a>
<a href="javascript:location.href='<%=basePath%>jsp/tsust/withdraw.jsp'">
<div class="xx_line">
  <div class="xx_l_ico"><img src="<%=basePath%>images/txsq.png" width="30" height="30" /></div>
  <div class="xx_l_txt">提现申请查询</div>
  <div class="xx_l_r">  <img src="<%=basePath%>images/jt.png" alt="" width="30" height="30" /></div> 
</div>
</a>
  <c:if test="${LimitPriceOpenOrder==1 }">
		<div class="xx_line" id="limitOrder">
		          <div class="xx_l_ico"><img src="<%=basePath%>images/crjxc.png" width="30" height="30" /></div>
					<div class="xx_l_txt" >今日指价委托</div>
					<div class="xx_l_r">  <img src="<%=basePath%>images/jt.png" alt="" width="30" height="30" /></div>
				</div>
  </c:if>
<div class="xx_line" id="holdposition">
  <div class="xx_l_ico"><img src="<%=basePath%>images/cccx.png" width="30" height="30" /></div>
  <div class="xx_l_txt">持仓查询</div>
  <div class="xx_l_r">  <img src="<%=basePath%>images/jt.png" alt="" width="30" height="30" /></div> 
</div>
<a   href="javascript:location.href='<%=path%>/tocServlet?reqName=tradequery'">
<div class="xx_line">
  <div class="xx_l_ico"><img src="<%=basePath%>images/jrcj.png" width="30" height="30" /></div>
  <div class="xx_l_txt">今日成交</div>
  <div class="xx_l_r">  <img src="<%=basePath%>images/jt.png" alt="" width="30" height="30" /></div> 
</div>
</a>
<a  href="javascript:location.href='<%=basePath%>jsp/tsust/dealSummaryAndDetailHis.jsp'">
<div class="xx_line">
  <div class="xx_l_ico"><img src="<%=basePath%>images/lscj.png" width="30" height="30" /></div>
  <div class="xx_l_txt">历史成交</div>
  <div class="xx_l_r">  <img src="<%=basePath%>images/jt.png" alt="" width="30" height="30" /></div> 
</div>
</a>
<a href="javascript:location.href='<%=basePath %>jsp/user/gerenxinxi.jsp'">
<div class="xx_line">
  <div class="xx_l_ico"><img src="<%=basePath%>images/grxx.png" width="30" height="30" /></div>
  <div class="xx_l_txt">个人信息</div>
  <div class="xx_l_r">  <img src="<%=basePath%>images/jt.png" alt="" width="30" height="30" /></div> 
</div>
</a>
<a href="javascript:location.href='<%=path %>/tocServlet?reqName=GETBANKBINDINGLIST'">
<div class="xx_line">
  <div class="xx_l_ico"><img src="<%=basePath%>images/bdyhk.png" width="30" height="30" /></div>
  <div class="xx_l_txt">银行卡绑定</div>
  <div class="xx_l_r">  <img src="<%=basePath%>images/jt.png" alt="" width="30" height="30" /></div> 
</div>
</a>
<a href="javascript:location.href='<%=path %>/tocServlet?reqName=FIRMFUND'">
<div class="xx_line">
  <div class="xx_l_ico"><img src="<%=basePath%>images/zjcx.png" width="30" height="30" /></div>
  <div class="xx_l_txt">资金查询</div>
  <div class="xx_l_r">  <img src="<%=basePath%>images/jt.png" alt="" width="30" height="30" /></div> 
</div>
</a>
<a href="javascript:location.href='<%=path %>/app/toc/jsp/tsust/promotionacts.jsp'">
<div class="xx_line">
  <div class="xx_l_ico"><img src="<%=basePath%>images/tyq.png" width="30" height="30" /></div>
  <div class="xx_l_txt">体验卷查询</div>
  <div class="xx_l_r">  <img src="<%=basePath%>images/jt.png" alt="" width="30" height="30" /></div> 
</div>
</a>
  <script type="text/javascript">
 		$(function(){
 			$("#recharge,#recharge0").click(function(){
 				location.href="<%=path%>/tocServlet?reqName=rechargeForward";	
 			
 			});
 			$("#withdrow,#withdrow0").click(function(){
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
</body>
</html>
