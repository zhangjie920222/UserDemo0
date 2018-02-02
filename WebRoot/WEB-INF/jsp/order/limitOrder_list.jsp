<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../public/taglib.jsp"%>
<%@page import="gnnt.MEBS.util.TokenProccessor"%>
<%@ include file="../../public/path.jsp"%>
<%
	TokenProccessor proccessor=TokenProccessor.getInstance();
	String token = proccessor.makeToken();
	request.getSession().setAttribute("token",token);
%>
<!DOCTYPE>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
		<meta name="viewport"
			content="width=device-width,target-densitydpi=medium-dpi,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
		<link rel=stylesheet type="text/css" href="<%=skinPath%>css/1_liuqw.css" title="cool">
		<script type="text/javascript" src="<%=basePath%>js/jquery-1.6.min.js"></script>
		<title>${pageTitle}</title>
		<style type="text/css"></style>
	</head>
	<body>
		<div id="list">
		<a id="cc_bufen_title" href="javascript:location.href='<%=basePath%>/jsp/user/userInfo.jsp'"><div class="fanhui">
				今日指价委托
			</div>
		</a>
		<div class="tishikuang11" id="cc_bufen" style="height:99%;padding-top: 2px;">
		<div  class="gao condition" >
			<form id="frm1" action="<%=path%>/tocServlet">
				<input type="hidden" name="reqName" value="LIMITORDERQUERY">
				委托单状态：
				<select id="status" name="status" style="width: 30%;">
					<option value="1">已委托</option>
					<option value="2">已成交</option>
					<option value="3">已撤单</option>
				</select>
				<input type="button" onclick="submit()" value="查 询"/>
			</form>
		</div>
		<div class="liuqw_div" style="width:100%;text-align: center;height:22px;"><div class="liuqw_div" style="width:15%;float: left;padding-left:30px;">时间</div><div style="width:50%;float: left;" class="liuqw_div">操作&nbsp;&nbsp;&nbsp;&nbsp;</div><div style="width:16%;float: left;" class="liuqw_div">价格</div></div>
		<div class="tishikuang0_221"  style="height: 80%">
			<div id="scroller">
				<c:forEach var="_deal" items="${data}">
					<div class="gao1 item" style="border:0px solid red;" onclick="detail('${_deal}')">
						<div class="lishi-3 left">
						<fmt:formatDate value="${_deal.UPDATETIME}" pattern="HH:mm:ss"/>
						</div>
						<div class="lishi-4 left" style="border-left:0px solid red;text-align: center;">
							<div class="lishi-4-1">
								${_deal.NAME}<br/>(<font color="red"><c:if test="${_deal.BS_FLAG==1}">买涨</c:if><c:if test="${_deal.BS_FLAG==2}">买跌</c:if></font>${_deal.QUANTITY}手)
							</div>
							<div class="lishi-4-1">
							</div>
						</div>
						<div class="lishi-5 right" style="border-left:0px solid red;">
							${_deal.PRICE}
						</div>
						<div class="fengexian clear"></div>
					</div>
				</c:forEach>
			</div>
		</div>
		</div>
		</div>
		
		<div id="detail" style="display:none;">
		<div class="fanhui" onclick="back()">返回</div>
		<div id="cc_xiangqing" class="tishikuang01">
		<div class="tishikuang0_2" style="height: 450px;">
			<div class="gao">
				<div class="zhi0-1 left">委托号</div>
				<div class="shu right" id="orderNo"></div>
			</div>
			<div class="gao">
				<div class="zhi0-1 left">商品名称</div>
				<div class="shu right" id="name"></div>
			</div>
			<div class="gao">
				<div class="zhi0-1 left"">方向</div>
				<div class="shu right" style="color:#FF0000" id="bsFlag"></div>
			</div>
			<div class="gao">
				<div class="zhi0-1 left">数量</div>
				<div class="shu right" id="qty"></div>
			</div>
			<div class="gao">
				<div class="zhi0-1 left">委托价</div>
				<div class="shu right" id="price"></div>
			</div>
			<div class="gao">
				<div class="zhi0-1 left">冻结保证金</div>
				<div class="shu right" id="margin"></div>
			</div>
			<div class="gao">
				<div class="zhi0-1 left">冻结手续费</div>
				<div class="shu right" id="fee"></div>
			</div>
			<div class="gao">
				<div class="zhi0-1 left">委托状态</div>
				<div class="shu right" id="statusOne"></div>
			</div>
			<div class="gao">
				<div class="zhi0-1 left">有效期限</div>
				<div class="shu right">当日有效</div>
			</div>
			<div class="gao">
				<div class="zhi0-1 left">委托时间</div>
				<div class="shu right" id="time"></div>
			</div>
		</div>
		<div class="shuliang02" id="chedanButton">
			<div class="shuliang02-2 left" style="margin-left: 30%;" onclick="chedan()" >撤单</div>
		</div>
		</div>
		</div>
		<form id="frm" name="frm" action="<%=basePath%>/tocServlet" method="post">
			<input type="hidden" value="" name="orderNo" id="orderNOForm">
			<input type="hidden" value="ORDERWD" name="reqName">
			<input type="hidden" name="token" value="<%=token%>">
		</form>
	</body>
	<script type="text/javascript">
		function submit(){
			frm1.submit();
		}
		function back(){
			$("#list").show();
			$("#detail").hide();
		}
		function detail(order){
			var len = order.length;
			order = order.substring(1,len-1);
			var items = order.split(",");
			$("#orderNo").html(findItem(items,"ORDERNO"));
			$("#orderNOForm").val(findItem(items,"ORDERNO"));
			$("#name").html(findItem(items,"NAME"));
			var bsFlag = "买涨";
			if(findItem(items,"BS_FLAG") == 2){
				bsFlag = "买跌";
			}
			$("#bsFlag").html(bsFlag);
			$("#qty").html(findItem(items,"QUANTITY"));
			$("#price").html(findItem(items,"PRICE"));
			$("#margin").html(findItem(items,"FROZENMARGIN"));
			$("#fee").html(findItem(items,"FROZENFEE"));
			
			var status = findItem(items,"STATUS");
			if(status == '1'){
				$("#statusOne").html("已委托");
				$("#chedanButton").show();
			}else if(status == '2'){
				$("#statusOne").html("已成交");
				$("#chedanButton").hide();
			}else if(status == '3'){
				$("#statusOne").html("已撤单");
				$("#chedanButton").hide();
			}else{
				alert(status);
			}
			
			var time = findItem(items,"UPDATETIME");
			time =time.substring(0,16);
			$("#time").html(time);
			$("#list").hide();
			$("#detail").show();
		}
		function findItem(items,itemName){
			var len = items.length;
			for(var i=0;i<len;i++){
				var item = items[i];
				var val = item.split("=");
				if($.trim(val[0])==itemName){
					return $.trim(val[1]);
				}
			}
		}
		function chedan(){
			if(confirm("确定要撤单吗？")){
				frm.submit();
			}
		}
		var msg = '${returnmsg}';
		if(msg !=null && msg !=""){
			alert(msg);
		}
		var sta = '${status}';
		$("#status").val(sta);
	</script>
</html>