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
    <a href="<%=path%>/tocServlet?reqName=mainForward"><div class="fanhui">�����˻�</div></a>
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
				<div class="zhi0-1 left">�����ʽ�</div>
				<div class="shu right" id="">
					<fmt:formatNumber value="${CurrentUser.money}" pattern="#0.00"/>	
				</div>
			</div>
			</c:if>
			<div class="gao" id="recharge">
				<div class="zhi0-1 left">��ֵ</div>
				<div class="tu right"></div>
			</div>
			<div class="gao" id="withdrow">
				<div class="zhi0-1 left">����</div>
				<div class="tu right"></div>
			</div>
			<a href="javascript:location.href='<%=basePath%>/jsp/tsust/inOutMoney.jsp'">
			<div class="gao">
				<div class="zhi0-1 left">������ѯ</div>
				<div class="tu right"></div>
			</div>
			</a>
			<a href="javascript:location.href='<%=basePath%>/jsp/tsust/withdraw.jsp'">
			<div class="gao">
				<div class="zhi0-1 left">���������ѯ</div>
				<div class="tu right"></div>
			</div>
			</a>
			<c:if test="${LimitPriceOpenOrder==1 }">
				<div class="gao" id="limitOrder">
					<div class="zhi0-1 left" >����ָ��ί��</div>
					<div class="tu right"></div>
				</div>
			</c:if>
			<div class="gao" id="holdposition">
				<div class="zhi0-1 left" >�ֲֲ�ѯ</div>
				<div class="tu right"></div>
			</div>
			<a   href="javascript:location.href='<%=path%>/tocServlet?reqName=tradequery'">
			<div class="gao">
				<div class="zhi0-1 left" >���ճɽ�</div>
				<div class="tu right"></div>
			</div>
			</a>
			<a  href="javascript:location.href='<%=basePath%>/jsp/tsust/dealSummaryAndDetailHis.jsp'">
			<div class="gao">
				<div class="zhi0-1 left" >��ʷ�ɽ�</div>
				<div class="tu right"></div>
			</div>
			</a>
			<a href="javascript:location.href='<%=basePath %>jsp/user/gerenxinxi.jsp'">
			<div class="gao">
				<div class="zhi0-1 left">������Ϣ</div>
				<div class="tu right"></div>
			</div>
			</a>
			<a href="javascript:location.href='<%=path %>/tocServlet?reqName=GETBANKBINDINGLIST'">
			<div class="gao">
				<div class="zhi0-1 left">���п���</div>
				<div class="tu right"></div>
			</div>
			</a>
			<a href="javascript:location.href='<%=path %>/tocServlet?reqName=FIRMFUND'">
			<div class="gao">
				<div class="zhi0-1 left">�ʽ��ѯ</div>
				<div class="tu right"></div>
			</div>
			</a>
			<a href="javascript:location.href='<%=path %>/app/toc/jsp/tsust/promotionacts.jsp'">
			<div class="gao">
				<div class="zhi0-1 left">����ȯ��ѯ</div>
				<div class="tu right"></div>
			</div>
			</a>
			<!-- 
			<a href="javascript:location.href='<%=basePath %>jsp/user/actualQuotation.jsp'">
			<div class="gao">
				<div class="zhi0-1 left">תʵ������</div>
				<div class="tu right"></div>
			</div>
			</a>
			<a href="javascript:location.href='<%=path%>/tocServlet?reqName=actualQuotationQuery'">
			<div class="gao">
				<div class="zhi0-1 left">תʵ�̲�ѯ</div>
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
 			//ָ��ί��
 			$("#limitOrder").click(function(){
 				location.href="<%=path%>/tocServlet?reqName=LIMITORDERQUERY";	
 			});
 			//�ֲֲ�ѯ
 			$("#holdposition").click(function(){
 				location.href="<%=path%>/tocServlet?reqName=GETHOLDLIST";	
 			});
 	 	});
  </script>
</html>
