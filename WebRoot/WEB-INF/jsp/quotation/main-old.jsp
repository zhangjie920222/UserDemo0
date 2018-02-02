<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ page language="java" import="gnnt.MEBS.common.Constant"%>
<%@ include file="../../public/taglib.jsp" %>
<%@ include file="../../public/path.jsp"%>
<%
response.setHeader("Cache-Control", "no-cache");         
response.setHeader("Cache-Control", "no-store");        
response.setDateHeader("Expires", 0);
response.setHeader("Pragma", "no-cache");
request.setAttribute("MianJSPMaxHoldNum", Constant.getMianJSPMaxHoldNum());
request.setAttribute("LimitPriceOpenOrder", Constant.getLimitPriceOpenOrder());
%>

<!DOCTYPE HTML>
<html>
<head>
  <title>${pageTitle}</title>
  <meta http-equiv="Content-Type" content="*/*; charset=UTF-8" />
  <meta http-equiv="Expires" CONTENT="0"> 
  <meta http-equiv="Cache-Control" CONTENT="no-cache"> 
  <meta http-equiv="Pragma" CONTENT="no-cache"> 
  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
  <link rel="stylesheet" type="text/css" href="<%=skinPath%>/css/main.css" media="all">
  <script type="text/javascript" src="<%=basePath%>js/jquery-1.6.min.js"></script>
<script type="text/javascript">
var returnMsg = '${returnMsg}';	
if(returnMsg != null && returnMsg != ""){
	alert(returnMsg);
}
</script>
</head>
<body onload="btClick(-2);">
	<div class="top">
		<div class="top_tx">
			<div class="tx">
				<img width="56px" height="56px" src="${CurrentUser.headImgUrl}">
			</div>
		</div>
		<div class="xsbj">
		<div class="cz" style="width: 100%">
				<div class="cz_l" style="width: 30%" id="userInfo">
					<div class="jb2"></div>
					<div class="wz1">�˻�</div>
				</div>
				<div class="cz_l" style="width: 37%">
					<div class="jb"></div>
					<div class="wz" id="userfulFounds"></div>
				</div>
				<div class="cz_l" style="width: 30%" id="recharge">
					<div class="jb1"></div>
					<div class="wz1">��ֵ</div>
				</div>
			</div>
		</div>
	</div>
	<div id="breadDiv"></div>
	<div id="cmds"></div>
	<div class="hqzs">
		<div class="refrash4" id="lineRefrash"></div>
		<div id="hqTit" class="hqTit" style="display: none;">��������</div>
		<div class="zgzd">
			<div style="width: 90%;margin-left: 5%;">
				<div id="hq_cmd"></div>
				<input type="hidden" id="hp_sel_cmd">
			</div>
		</div>
		<div class="zgzd" >
			<div class="zgzd_1">
				��ߣ�<span id="hightPrice"></span>&nbsp;&nbsp;&nbsp;&nbsp;
				���գ�<span id="closePrice"></span>
			</div>
			<div class="zgzd_1">
				��ͣ�<span id="lowPrice"></span>&nbsp;&nbsp;&nbsp;&nbsp;
				���̣�<span id="openPrice"></span>
			</div>
		</div>
		<div class="fst"  id="contener">
		</div>
		<div class="fs_anniu">
			<div class="xuanzhong left kLine" onclick="btClick(-2)">��ʱ��</div>
			<div class="wxzhong left kLine" onclick="btClick(1)">1������</div>
			<div class="wxzhong left kLine" onclick="btClick(5)">5������</div>
			<div class="wxzhong left kLine" onclick="btClick(60)">1Сʱ��</div>
			<div class="wxzhong left kLine" onclick="btClick(-1)">����</div>
		</div>
	</div>
	<div id="transfer"></div>
	<c:choose>
		<c:when test="${ LimitPriceOpenOrder!=1 }">
			<div class="tck" id="tck">
				<div class="refrash" id="orderrefrash"></div>
				<div class="tck2">
					<div class="qux" id="orderClose"></div>
					<div class="shuliang">
						<div class="shuliang1" style="margin-bottom:10px;">
							<div class="shuliang4 left" style="width: 50%;">
								<span id="orderCmdName"></span>
									:<span id="orderQtyHtml"></span> <span id="orderUnit"></span>
							</div>
							<div class="shuliang3 left" style="width: 30%;">
								<span class="orderBuySellHtml" id="orderBuySellHtml" style=""></span>
							</div>
						</div>
						<div class="shuliang1">
							<div class="shuliang3" style="width: 100%">
								�۸�:<span id="orderPriceHtml" style=""></span>
							</div>
						</div>
					</div>
					<div class="fgx1"></div>
					<div class="shuliang">
						<div class="shuliang1" style="margin-bottom:10px;">
							<div id="qty_1" class="shuliang2 left qty_selected">1</div>
							<div id="qty_2" class="shuliang2 left">2</div>
							<div id="qty_3" class="shuliang2 left">3</div>
							<div id="qty_4" class="shuliang2 left">4</div>
							<div id="qty_5" class="shuliang2 left">5</div>
						</div>
						<div class="shuliang1">
							<div id="qty_6" class="shuliang2 left">6</div>
							<div id="qty_7" class="shuliang2 left">7</div>
							<div id="qty_8" class="shuliang2 left">8</div>
							<div id="qty_9" class="shuliang2 left">9</div>
							<div id="qty_10" class="shuliang2 left">10</div>
						</div>
					</div>
					<div class="fgx1"></div>
					<div class="shuliang">
						<div class="shuliang1" style="margin-bottom:10px;">
							<div class="shuliang5 left" style="width: 40%;margin-left: 6%;">
								��֤��:<span id="margain" ></span>
							</div>
							<div class="shuliang5 left"  style="width: 40%;margin-left: 6%;">
								������:<span id="fee" ></span>
							</div>
						</div>
						<div class="shuliang1">
							<div id="recharge12" class="shuliang6"></div>
							<div id="submit12" class="shuliang8"></div>
						</div>
					</div>
				</div>
			</div>
		</c:when>
		<c:otherwise>
			<div class="tck" id="tck">
				<div class="refrash" id="orderrefrash"></div>
				<div class="tck1">
					<div class="tab1"></div>
					<div class="tab3" id="marketPriceTab">�м�</div>
					<div class="tab4" id="limitPriceTab">ָ��</div>
					<div class="tab2"></div>
					<div class="qux" id="orderClose"></div>
					<div class="tab_content" id="limitPriceTabContent" style="display: none;">
						<div style="height: 40px;">
							<div class="shuliang1" style="margin-bottom:10px;">
								<div class="shuliang4 left" style="width: 50%;">
									<span id="orderCmdName_limit"></span>
										:<span id="orderQtyHtml_limit"></span> <span id="orderUnit_limit"></span>
								</div>
								<div class="shuliang3 left" style="width: 30%;">
									<span id="orderBuySellHtml_limit" class="orderBuySellHtml_limit"></span>
								</div>
							</div>
						</div>
						<div class="fgx1"></div>
						<div class="shuliang">
							<div class="shuliang1">
								<div id="qty_limit_1" class="qty left" >1</div>
								<div id="" class="qty left">2</div>
								<div id="" class="qty left">3</div>
								<div id="" class="qty left">4</div>
								<div id="" class="qty left">5</div>
							</div>
							<div class="shuliang1">
								<div id="" class="qty left">6</div>
								<div id="" class="qty left">7</div>
								<div id="" class="qty left">8</div>
								<div id="" class="qty left">9</div>
								<div id="" class="qty left">10</div>
							</div>
						</div>
						<div class="fgx1"></div>
						<div style="height: 40px;margin-top: 10px;">
							<div class="shuliang1">
								<div class="shuliang3" style="width: 100%">
									<input id="firstPrice" class="firstPrice" >
									<input id="secondPrice" class="secondPrice" >
									<input id="X_O_B_D_D" type="hidden">
									<input id="X_O_S_D_D" type="hidden">
									<input id="SPREAD" type="hidden">
									<input id="orderQty_limit" type="hidden">
								</div>
							</div>
							<div class="shuliang1">
								<div class="shuliang3" style="width: 100%">
									�۸�:<input id="limitPrice" onkeyup="value=value.replace(/[^(\d)|(\d.\d)]/g,'')" maxlength="8" type="text" style="width: 68%;text-align: right;">
								</div>
							</div>
						</div>
						<div class="shuliang" style="margin-top: 10px;">
							<div class="shuliang1" style="margin-bottom:10px;">
								<div class="shuliang5 left" style="width: 40%;margin-left: 6%;">
									��֤��:<span id="margain_limit" ></span>
								</div>
								<div class="shuliang5 left"  style="width: 40%;margin-left: 6%;">
									������:<span id="fee_limit" ></span>
								</div>
							</div>
							<div class="shuliang1">
								<div id="recharge12_limit" class="shuliang6" style="display: none;"></div>
								<div id="submit12_limit" class="shuliang8"></div>
							</div>
						</div>
					</div>
					<div class="tab_content" id="marketPriceTabContent">
						<div class="shuliang">
							<div class="shuliang1" style="margin-bottom:10px;">
								<div class="shuliang4 left" style="width: 50%;">
									<span id="orderCmdName"></span>
										:<span id="orderQtyHtml"></span> <span id="orderUnit"></span>
								</div>
								<div class="shuliang3 left" style="width: 30%;">
									<span id="orderBuySellHtml" class="orderBuySellHtml"></span>
								</div>
							</div>
							<div class="shuliang1">
								<div class="shuliang3" style="width: 100%">
									�۸�:<span id="orderPriceHtml" class="orderPriceHtml"></span>
								</div>
							</div>
						</div>
						<div class="fgx1"></div>
						<div class="shuliang">
							<div class="shuliang1" style="margin-bottom:10px;">
								<div id="qty_1" class="shuliang2 left qty_selected">1</div>
								<div id="qty_2" class="shuliang2 left">2</div>
								<div id="qty_3" class="shuliang2 left">3</div>
								<div id="qty_4" class="shuliang2 left">4</div>
								<div id="qty_5" class="shuliang2 left">5</div>
							</div>
							<div class="shuliang1">
								<div id="qty_6" class="shuliang2 left">6</div>
								<div id="qty_7" class="shuliang2 left">7</div>
								<div id="qty_8" class="shuliang2 left">8</div>
								<div id="qty_9" class="shuliang2 left">9</div>
								<div id="qty_10" class="shuliang2 left">10</div>
							</div>
						</div>
						<div class="fgx1"></div>
						<div class="shuliang">
							<div class="shuliang1" style="margin-bottom:10px;">
								<div class="shuliang5 left" style="width: 40%;margin-left: 6%;">
									��֤��:<span id="margain" ></span>
								</div>
								<div class="shuliang5 left"  style="width: 40%;margin-left: 6%;">
									������:<span id="fee" ></span>
								</div>
							</div>
							<div class="shuliang1">
								<div id="recharge12" class="shuliang6"></div>
								<div id="submit12" class="shuliang8"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</c:otherwise>
	</c:choose>
	<div class="zhuanrang" id="zhuanrang">
		<div class="refrash3" id="closeOrderrefrash"></div>
		<div class="zhuanrang1">
			<div class="zhuanrang1-1">ȷ��ת��</div>
			<div class="fgx"></div>
			<div class="zhuanrang1-2">5ͭԭ�ͣ�120Ԫ��</div>
			<div class="zhuanrang1-1 zhuanrang1-1-1">5ͭԭ�ͣ�120Ԫ��</div>
			<div class="shuliang02">
				<div class="shuliang02-1 left" id="quxiao">ȡ��</div>
				<div class="shuliang02-2 left" id="queding" onclick="$.marketPriceCloseOut()">ȷ��</div>
			</div>
		</div>
	</div>
	
	<div id="gnnt_filter"></div>
	<form id="frm" action="<%=path%>/tocServlet" method="post">
		<input type="hidden" id="orderQty" 		name="quantity"/>
		<input type="hidden" id="orderPrice" 	name="price"/>
		<input type="hidden" id="orderCmdId" 	name="commodityId">
		<input type="hidden" id="orderBuySell" 	name="buy_sell"/>
		<input type="hidden" name="reqName" id="reqName" value="order"/>
		<input type="hidden" name="typeId" id="typeId" value=""/>
		<input type="hidden" name="typeName" id="typeName" value=""/>
		<input type="hidden" name="newsId" id="newsId" value=""/>
		<input type="hidden" name="type" id="newsId" value="1"/>
	</form>
	<div class="zyzs" id="gainLoss" style="display: none;">
	<div class="refrash2" id="zyzsrefrash"></div>
	<div class="zyzs1">
		<div class="zqux" id="zyzsClose"></div>
		<div class="jianjie">
			<span id="zyzsname"></span>&nbsp;&nbsp;&nbsp;
			<span id="zyzsqty"></span>��&nbsp;&nbsp;&nbsp;
			<span id="zyzspri"></span>&nbsp;&nbsp;&nbsp;
			<span id="zyzsbs"></span>
		</div>
		<div class="shezhi">
			<div class="zyzs_bt">����ֹӯֹ��</div>
			<div class="sl1">
				<div class="sl_1">ֹӯ</div>
				<div class="sl_2">
					<div class="jutizhi">
						<div id="zhiyingno" class="jutizhi_1 zhiying selected">����</div>
						<div class="jutizhi_1 zhiying">20%</div>
						<div class="jutizhi_1 zhiying">30%</div>
						<div class="jutizhi_1 zhiying">50%</div>
						<div class="jutizhi_1 zhiying">80%</div>
						<div class="jutizhi_1 zhiying">100%</div>
					</div>
					<%--<div class="jutizhi">
						<div class="jutizhi_1 zhiying">60%</div>
						<div class="jutizhi_1 zhiying">70%</div>
						<div class="jutizhi_1 zhiying">80%</div>
						<div class="jutizhi_1 zhiying">90%</div>
					</div>
				--%></div>
			</div>
			<div class="sl1">
				<div class="sl_1">ֹ��</div>
				<div class="sl_2">
					<div class="jutizhi">
						<div id="zhisunno" class="jutizhi_1 zhisun">����</div>
						<div class="jutizhi_1 zhisun">10%</div>
						<div class="jutizhi_1 zhisun">20%</div>
						<div class="jutizhi_1 zhisun">30%</div>
						<div class="jutizhi_1 zhisun">40%</div>
						<div class="jutizhi_1 zhisun">50%</div>
					</div>
					<%--<div class="jutizhi">
						<div class="jutizhi_1 zhisun">60%</div>
						<div class="jutizhi_1 zhisun">70%</div>
						<div class="jutizhi_1 zhisun">80%</div>
						<div class="jutizhi_1 zhisun">90%</div>
						
					</div>
					--%>
				</div>
			</div>
			<input id="zys_y_num" name="zys_y_num" type="hidden"/>
			<input id="zys_s_num" name="zys_s_num" type="hidden"/>
			<%--<input id="openpri" type="hidden"/>--%>
			<div class="anniu">
				<div class="queding" id="zyzsok">ȷ��</div>
				<div class="quxiao" id="zyzscencle">ȡ��</div>
			</div>
			
		</div>
	</div>
	</div>
	<div id="news">
	
	</div>
	<div style="height: 40px;"></div>
</body>
<script type="text/javascript">
$(function(){
	//�ֲ���ʾ�������
	var MianJSPMaxHoldNum = '${MianJSPMaxHoldNum}';
	//��ѯ
	var news = $("#news");
	//������Ʒ��Ϣ��JSON��
	var cmdInfos = eval('${commodity_info}');
	//չʾ����Ʒ��Ʒ�ֵĶ�Ӧ��ϵ
	var showedCmd = eval('${show_commodity}');
	//��Ʒ�������ڵ�div
	var cmds = $("#cmds");
	//���ֲ�
	var order = $("#tck");
	var orderwidth = order.width();
	var orderheight = order.height();
	order.css("left",($(window).width()-orderwidth)/2);
	order.css("top",($(window).height()-orderheight)/2);
	//���ֱ�
	var orderForm = $("#frm");
	//�˾�
	var filter = $("#gnnt_filter");
	//ת�ò�
	var transfer = $("#transfer");
	var zhuanrang = $("#zhuanrang");

	//liuqw attribute ƽ����Ҫ�ύ���� 
	//��������
	var _tmp_ty ;
	//��Ʒ����
	var _tmp_co_i;
	//ί�м�
	var _tmp_co_price;
	//ί������
	var _tmp_c_qty_number;
	//�ֲֵ���
	var _tmp_h_id;
	//ˢ�����
	var for_uf = null;
	//ˢ������
	var for_hq = null;
	//������Ʒѡ��ť
	var hq_cmd = $("#hq_cmd");

	var relogonDiv = $("#relogon");
	//���ֲ��ύ��ʾˢ��
	var orderrefrash = $("#orderrefrash");
	//ֹӯֹ����ʾˢ��
	var zyzsrefrash = $("#zyzsrefrash");
	//ƽ����ʾˢ��
	var closeOrderrefrash = $("#closeOrderrefrash")

	//ֹӯֹ��div
	var gainLoss = $("#gainLoss");
	var gainLosswidth = order.width();
	var gainLossheight = order.height();
	gainLoss.css("left",($(window).width()-gainLosswidth)/2);
	gainLoss.css("top",($(window).height()-gainLossheight)/2);

	$("#recharge12_limit").click(function(){
		$("#recharge12").click();
	});
	//ָ�۽��ּ۸�
	$("#limitPrice").focus(function(){
		order.css("top",($(window).height()-orderheight)/10);
	});
	$("#limitPrice").blur(function(){
		//���ü۸�
		var limitPrice = $("#limitPrice").val();
		if(limitPrice ==""){
			alert("��������۸�");
			return;
		}
		limitPrice = Number(limitPrice);
		var spread = Number($("#SPREAD").val());
		if((limitPrice*100)%(spread*100)!=0){
			alert("�۸�����С�䶯��"+spread+"��������!");
			return;
		}
		var firstPrice = $("#firstPrice").val();
		var secondPrice = $("#secondPrice").val();
		if(limitPrice>firstPrice&&limitPrice<secondPrice){
			alert("�۸��ܴ���"+firstPrice+"��"+secondPrice+"֮��");
			return;
		}
		var cmdId = $("#orderCmdId").val();
		var buySell = $("#orderBuySell").val();
		var cmd = $.getCmdInfo(cmdId);
		var CT_S = cmd["CT_S"];//��Լ����
		var MA_A = cmd["MA_A"];//��֤���㷨
		var MA_V = cmd["MA_V"];//��֤��ϵ��
		var FE_A = cmd["FE_A"];//�������㷨
		var FEE_V = cmd["FEE_V"];//������ϵ��
		var qty = Number($("#orderQty_limit").val());
		//���ñ�֤��
		var margain = Number($.computeMargain(limitPrice,qty,CT_S,MA_A,MA_V));
		$("#margain_limit").html(margain);
		//����������
		var fee = Number($.computeFee(limitPrice,qty,CT_S,FE_A,FEE_V));
		$("#fee_limit").html(fee);
		//������ʾ�ύ��ť���ǳ�ֵ��ť
		var userfulFounds = Number($("#userfulFounds").html())
		if(userfulFounds >=(margain+fee)){
			$("#recharge12_limit").hide();
			$("#submit12_limit").show();
		}else{
			$("#recharge12_limit").show();
			$("#submit12_limit").hide();
		}
		order.css("top",($(window).height()-orderheight)/2);
	});
	//ָ���ύ
	$("#submit12_limit").click(function(){
		var limitPrice = $("#limitPrice").val();
		if(limitPrice ==""){
			alert("��������۸�");
			return;
		}
		var isNum = new RegExp("^[0-9]+\.{0,1}[0-9]{0,2}$");
		if(!isNum.test(limitPrice)){
			alert("���������֣�");
			return;
		}
		limitPrice = Number(limitPrice);
		var spread = Number($("#SPREAD").val());
		if((limitPrice*100)%(spread*100)!=0){
			alert("�۸�����С�䶯��"+spread+"��������!");
			return;
		}
		var firstPrice = $("#firstPrice").val();
		var secondPrice = $("#secondPrice").val();
		if(limitPrice>firstPrice&&limitPrice<secondPrice){
			alert("�۸��ܴ���"+firstPrice+"��"+secondPrice+"֮��");
			return;
		}
		
		var commodityId = $("#orderCmdId").val();
		var quantity = $("#orderQty_limit").val();
		var buy_sell = $("#orderBuySell").val();
		$.ajax({
			type:"post",
			url:"<%=path%>/tocServlet?t="+new Date(),
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			data:{reqName:"LIMITORDER",commodityId:commodityId,quantity:quantity,price:limitPrice,buy_sell:buy_sell},
			dataType: "json",
			beforeSend: function(){
				orderrefrash.show();
				price = oderPrice;
				},
			success: function(data){
				if(data !="" && data!=null && data !=undefined){
					var ret = data["retcode"];
					orderrefrash.hide();
					if(ret==0){
						//���ؽ��ֲ�
						order.hide();
						filter.hide();
						if(confirm("�����ɹ������ȷ���鿴ί��")){
							location.href="<%=path%>/tocServlet?reqName=LIMITORDERQUERY";	
						}else{
							location.href = "<%=path%>/tocServlet?reqName=mainForward";
						}
					}else{
						var msg = data["msg"];
						alert(msg);
						if(ret == -2001||ret == -201){
							location.href = "<%=basePath%>jsp/logon/logon.jsp";
						}
					}
				}
			}
		});
	});
	//ָ�۽���
	$("#limitPriceTab").click(function(){
		
		$("#limitPriceTabContent").show();
		$("#marketPriceTabContent").hide();
		
		var cmdId = $("#orderCmdId").val();
		var SPREAD = Number($("#SPREAD").val());
		var X_O_B_D_D = Number($("#X_O_B_D_D").val());
		var X_O_S_D_D = Number($("#X_O_S_D_D").val());
		
		var sell_price = Number($("#"+cmdId+"_spr").val());
		var buy_price = Number($("#"+cmdId+"_bpr").val());
		
		var firstPrice = sell_price - X_O_S_D_D*SPREAD;
		var secondPrice = buy_price + X_O_B_D_D*SPREAD;
		$("#firstPrice").val(firstPrice.toFixed(2));
		$("#secondPrice").val(secondPrice.toFixed(2));
		
		$(".qty").each(function(){
			$(this).css("background-color","");
		});
		$("#qty_limit_1").click();
		$("#limitPrice").val("");
		$("#margain_limit").html("");
		$("#fee_limit").html("");
		
		$("#limitPriceTab").css("background-color","");
		$("#marketPriceTab").css("background-color","#087AB2");
		
	});
	
	$("#marketPriceTab").click(function(){
		$("#limitPriceTabContent").hide();
		$("#marketPriceTabContent").show();
		$("#qty_1").click();
		$("#limitPriceTab").css("background-color","#087AB2");
		$("#marketPriceTab").css("background-color","");
	});

	$("#recharge").click(function(){	
		window.location.href="<%=path%>/tocServlet?reqName=rechargeForward";	
	});

	//���㱣֤��
	$.computeMargain = function(price,qty,CT_S,MA_A,MA_V){
		var margain = null;
		if(MA_A ==1){//���ٷֱ�
			margain = price*qty*CT_S*MA_V;
		}else{
			margain = qty*MA_V;
		}
		if(margain != null){
			margain = margain.toFixed(2);
		}
		return margain;
	}
	//����������
	$.computeFee = function(price,qty,CT_S,FE_A,FEE_V){
		var fee = null;
		if(FE_A == 1){
			fee = price*qty*CT_S*FEE_V;
		}else{
			fee = qty*FEE_V;
		}
		if(fee != null){
			fee = fee.toFixed(2);
		}
		return fee;
	}
	
	//������Ʒ�����������Ʒ��Ϣ��JSON�����ҳ�ָ����Ʒ
	$.getCmdInfo = function(cmdId){
		var cmd = null;
		$(cmdInfos).each(function(index){
			var temp = cmdInfos[index];
			cmd = temp[cmdId];
			if(cmd != undefined){
				return;
			}else{
				cmd = null;
			}
		});
		return cmd;
	}
	$("#zyzsClose").click(function(){
		//gainLoss.hide();
		//filter.hide();
		location.href = "<%=path%>/tocServlet?reqName=mainForward";
	});
	$("#zyzscencle").click(function(){
		//gainLoss.hide();
		//filter.hide();
		location.href = "<%=path%>/tocServlet?reqName=mainForward";
	});
	//ֹӯֹ��
	$("#zyzsok").click(function(){
		var zys_s_num = $("#zys_s_num").val();
		var zys_y_num = $("#zys_y_num").val();
		var commodityId = $("#orderCmdId").val();
		if(zys_s_num=="����" && zys_y_num=="����"){
			gainLoss.hide();
			//�����˾�
			filter.hide();
			alert("�����ɹ�");
			location.href = "<%=path%>/tocServlet?reqName=mainForward";
		}else{
			$.ajax({
				type:"post",
				url:"<%=path%>/tocServlet?t="+new Date(),
				contentType: "application/x-www-form-urlencoded; charset=GBK",
				data:{reqName:"openOrderStopLossAndProfit",_co_i:commodityId,zys_y_num:zys_y_num,zys_s_num:zys_s_num},
				dataType: "json",
				beforeSend: function(){
					zyzsrefrash.show();
				},
				success: function(data){
					if(data !="" && data!=null && data !=undefined){
						zyzsrefrash.hide();
						var ret = data["code"];
						if(ret==0){
							gainLoss.hide();
							//�����˾�
							filter.hide();
							alert("�����ɹ�");
							location.href = "<%=path%>/tocServlet?reqName=mainForward";
						}else{
							var msg = data["msg"];
							alert(msg);
							gainLoss.hide();
							filter.hide();
							if(ret == -2001||ret == -201){
								//alert("�����˺���ʧЧ�������µ�¼��");
								//$.relogon();
								location.href = "<%=basePath%>jsp/logon/logon.jsp";
							}else{
								location.href = "<%=path%>/tocServlet?reqName=mainForward";
							}
						}
					}
				}
			});
		}
	});
	$(".zhiying").click(function(){
		$(".zhiying").each(function(){
			$(this).css("background-color","");
			$(this).removeClass("qty_selected");
		});
		//$(this).css("background-color","#17506d");
		$(this).addClass("qty_selected");
		var v = $(this).html().split("%")[0];
		$("#zys_y_num").val(v);
	});
	$(".zhisun").click(function(){
		$(".zhisun").each(function(){
			$(this).css("background-color","");
			$(this).removeClass("qty_selected");
		});
		//$(this).css("background-color","#17506d");
		$(this).addClass("qty_selected");
		var v = $(this).html().split("%")[0];
		$("#zys_s_num").val(v);
	});
	$("#userInfo").click(function(){
		location.href = "<%=basePath%>jsp/user/userInfo.jsp";
	});

	//�µ��ر�
	$("#orderClose").click(function(){
		order.hide();
		filter.hide();
	});

	var oderPrice = 0;
	//�޼��µ���������¼�
	$(".qty").click(function(){
		$(".qty").each(function(){
			$(this).css("background-color","");
			$(this).removeClass("qty_selected");
		});
		//$(this).css("background-color","#17506d");
		$(this).addClass("qty_selected");
		//��������
		var cmdId = $("#orderCmdId").val();
		var cmd = $.getCmdInfo(cmdId);
		var CT_S = cmd["CT_S"];//��Լ����
		var qty = Number($(this).html());
		var qtyHtml = Number(qty*CT_S);
		qtyHtml = qtyHtml.toFixed(2);
		$("#orderQtyHtml_limit").html(qtyHtml);
		$("#orderQty_limit").val(qty);
		
		var limitPrice = $("#limitPrice").val();
		if(limitPrice != ""){
			var buySell = $("#orderBuySell").val();
			var cmd = $.getCmdInfo(cmdId);
			var CT_S = cmd["CT_S"];//��Լ����
			var MA_A = cmd["MA_A"];//��֤���㷨
			var MA_V = cmd["MA_V"];//��֤��ϵ��
			var FE_A = cmd["FE_A"];//�������㷨
			var FEE_V = cmd["FEE_V"];//������ϵ��
			//���ñ�֤��
			var margain = Number($.computeMargain(limitPrice,qty,CT_S,MA_A,MA_V));
			$("#margain_limit").html(margain);
			//����������
			var fee = Number($.computeFee(limitPrice,qty,CT_S,FE_A,FEE_V));
			$("#fee_limit").html(fee);
			//������ʾ�ύ��ť���ǳ�ֵ��ť
			var userfulFounds = Number($("#userfulFounds").html())
			if(userfulFounds >=(margain+fee)){
				$("#recharge12_limit").hide();
				$("#submit12_limit").show();
			}else{
				$("#recharge12_limit").show();
				$("#submit12_limit").hide();
			}
		}
	});
	//�µ���������¼�
	$(".shuliang2").click(function(){
		$(".shuliang2").each(function(){
			$(this).css("background-color","");
			$(this).removeClass("qty_selected");
		});
		//$(this).css("background-color","#17506d");
		$(this).addClass("qty_selected");
		var cmdId = $("#orderCmdId").val();
		var buySell = $("#orderBuySell").val();
		var cmd = $.getCmdInfo(cmdId);
		var CT_S = cmd["CT_S"];//��Լ����
		var MA_A = cmd["MA_A"];//��֤���㷨
		var MA_V = cmd["MA_V"];//��֤��ϵ��
		var FE_A = cmd["FE_A"];//�������㷨
		var FEE_V = cmd["FEE_V"];//������ϵ��
		//���ü۸�
		var price = 0;
		if(buySell == 1){
			price = $("#"+cmdId+"_bpr").val();
		}else{
			price = $("#"+cmdId+"_spr").val();
		}
		oderPrice = price;
		price = Number(price).toFixed(2);
		$("#orderPriceHtml").html(price);
		$("#orderPrice").val(price);
		//��������
		var qty = Number($(this).html());
		var qtyHtml = Number(qty*CT_S);
		qtyHtml = qtyHtml.toFixed(2);
		$("#orderQtyHtml").html(qtyHtml);
		$("#orderQty").val(qty);
		//���ñ�֤��
		var margain = Number($.computeMargain(price,qty,CT_S,MA_A,MA_V));
		$("#margain").html(margain);
		//����������
		var fee = Number($.computeFee(price,qty,CT_S,FE_A,FEE_V));
		$("#fee").html(fee);
		//������ʾ�ύ��ť���ǳ�ֵ��ť
		var userfulFounds = Number($("#userfulFounds").html())
		if(userfulFounds >=(margain+fee)){
			$("#recharge12").hide();
			$("#submit12").show();
		}else{
			$("#recharge12").show();
			$("#submit12").hide();
		}
	});
	$("#recharge12").click(function(){
		$("#recharge").click();
	});
	//�µ��ύ����¼�
	$("#submit12").click(function(){
		//orderForm.submit();
		var commodityId = $("#orderCmdId").val();
		var quantity = $("#orderQty").val();
		var price = oderPrice;//$("#orderPrice").val();
		var buy_sell = $("#orderBuySell").val();
		var cmd = $.getCmdInfo(commodityId);
		var name = cmd["CO_N"];
		$.ajax({
			type:"post",
			url:"<%=path%>/tocServlet?t="+new Date(),
			contentType: "application/x-www-form-urlencoded; charset=GBK",
			data:{reqName:"order",commodityId:commodityId,quantity:quantity,price:price,buy_sell:buy_sell},
			dataType: "json",
			beforeSend: function(){
				orderrefrash.show();
				price = oderPrice;
				},
			success: function(data){
				if(data !="" && data!=null && data !=undefined){
					var ret = data["code"];
					orderrefrash.hide();
					if(ret==0){
						//���ؽ��ֲ�
						order.hide();
						//����ֹӯֹ��
						//$("#openpri").val(price);
						$("#zhiyingno").click();
						$("#zhisunno").click();
						$("#zyzsname").html(name);
						$("#zyzsqty").html(quantity);
						$("#zyzspri").html(price);
						//$("#zyzsqty").himl(quantity);
						gainLoss.show();
					}else{
						var msg = data["msg"];
						alert(msg);
						if(ret == -2001||ret == -201){
							//alert("�����˺���ʧЧ�������µ�¼��");
							//$.relogon();
							location.href = "<%=basePath%>jsp/logon/logon.jsp";
						}
					}
				}
			}
		});
	});
	//չʾ��Ʒ
	$.showCmds = function(){
		var count = 0;
		$(showedCmd).each(function(index){
			var bread = $(this)[0];
			var code = bread["code"];
			var breadId = bread["breadId"];
			$.createBread(breadId,index);
			$("#"+breadId+"_xia").hide();
			$("#"+breadId+"_shang").hide();
			var name = bread["name"];
			$("#"+breadId).html(name);
			var cmdIds = code.split(",");
			var len = cmdIds.length;
			for(var i=0;i<len;i++){
				count=count+1;
				var cmdId = cmdIds[i];
				$.creatCmd(cmdId,count);
			}
			//��������������Ʒ��ť
			var div = null;
			if(index==0){
				div = jQuery("<div class=\"xuanzhong left cmd\" id=\"hq_"+cmdIds[0]+"\" >"+name+"</div>");
				$("#hp_sel_cmd").val(cmdIds[0]);
			}else{
				div = jQuery("<div class=\"wxzhong left cmd\" id=\"hq_"+cmdIds[0]+"\" >"+name+"</div>");
			}
			div.click(function(){
				//��Ʒ���������ɫ����
				$(".cmd").each(function(){
					$(this).removeClass("xuanzhong");
					$(this).addClass("wxzhong");
				});
				$(this).removeClass("wxzhong");
				$(this).addClass("xuanzhong");
				var t = div.attr("id");
				var tt = t.split("_");
				var _cmdId = tt[1];
				$("#hp_sel_cmd").val(_cmdId);
				reflashLine();
			});
			hq_cmd.append(div);
		});
	}
	//����Ʒ��
	var breadDiv = $("#breadDiv");
	var row = null;
	$.createBread = function(breadId,i){
		var twodiv = i%2;
		var div1 = null;
		if(twodiv==0){
			row = jQuery("<div class=\"bj\"></div>");
			breadDiv.append(row);
			div1 = jQuery("<div class=\"bj_1 left\"></div>");
		}else{
			div1 = jQuery("<div class=\"bj_1 right\"></div>");
		} 
		var div2 = jQuery("<div class=\"name\"><span id=\""+breadId+"\"></span>ʵʱ����</div>");
		var div3 = jQuery("<div class=\"jiage\"></div>");
		var div3_1 = jQuery("<div class=\"jiage_1 left\" id=\""+breadId+"_p\"></div>");
		var div3_2 = jQuery("<div class=\"jiantou left\"></div>");
		var div3_2_1 = jQuery("<img id=\""+breadId+"_xia\" src=\"<%=basePath %>images/ljt.png\" />");
		var div3_2_2 = jQuery("<img id=\""+breadId+"_shang\" src=\"<%=basePath %>images/hjt.png\" />");
		div3_2.append(div3_2_1).append(div3_2_2);
		div3.append(div3_1).append(div3_2);
		div1.append(div2).append(div3);
		row.append(div1);
	}
	//������Ʒ
	var cmdDiv = null;
	cmds.append(cmdDiv);
	var skinName = '<%=skinName%>';
	if(skinName!=''&&skinName!='default'){
		$("#hqTit").show();
	}
	$.creatCmd = function(cmdId,i){
		var cmdInfo = $("#"+cmdId).html();
		var sell_price = 0;//����
		var buy_price = 0;//����
		if(cmdInfo == null ||cmdInfo == ""){//û�д���Ʒ�����
			var cmd = $.getCmdInfo(cmdId);
			var CON_U = cmd["CON_U"];
			var CT_S = cmd["CT_S"];
			//ÿ3������1��
			var cmdOne = null;
			if(((i-1)%3)==0){
				cmdDiv = jQuery("<div class=\"spdg\"></div>");
				if(skinName!=''&&skinName!='default'){
					var cmdTit = jQuery("<div class=\"cmdTit\">��Ʒ�۹�</div>");
					cmdDiv.append(cmdTit);
				}
				cmds.append(cmdDiv);
				cmdOne = jQuery("<div class=\"jgxq left\" id=\""+cmdId+"\"></div>");
			}else{
				cmdOne = jQuery("<div class=\"jgxq left\" id=\""+cmdId+"\"></div>");
			}
			var cmdFilter = jQuery("<div class=\"shangpin1_div left\" id=\""+cmdId+"_filter\"></div>");
			var cmdOneTop;
			var cmdOneDom;
			if(skinName!=''&&skinName!='default'){
				cmdOneTop = jQuery("<div class=\"mz\" id=\""+cmdId+"_top\">����</div>");
				cmdOneDom = jQuery("<div class=\"md\" id=\""+cmdId+"_dom\">���</div>");
			}else{
				cmdOneTop = jQuery("<div class=\"mz\" id=\""+cmdId+"_top\"></div>");
				cmdOneDom = jQuery("<div class=\"md\" id=\""+cmdId+"_dom\"></div>");
			}
			
			var name = cmd["CO_N"];//��Ʒ����
			var cmdOneNam = jQuery("<div class=\"tux1\">"+name+"</div>");
			var cmdOneArg = jQuery("<div class=\"jghq\"></div>");
			var cmdOneQty = jQuery("<div class=\"jghq_1\"><span id=\""+cmdId+"_price\">"+CT_S+"</span><span>"+CON_U+"</span>/��</div>");
			var cmdOneBPr = jQuery("<input type=\"hidden\" id=\""+cmdId+"_bpr\" value=\""+buy_price+"\"/>");
			var cmdOneSPr = jQuery("<input type=\"hidden\" id=\""+cmdId+"_spr\" value=\""+sell_price+"\"/>");
			var CT_S = Number(cmd["CT_S"]);//��Լ����
			var MA_A = cmd["MA_A"];//��֤���㷨
			var MA_V = Number(cmd["MA_V"]);//��֤��ϵ��
			var cmdOneMgn = null;
			if(MA_A == 1){//���ٷֱ�
				MA_V = MA_V*100;
				cmdOneMgn = jQuery("<div class=\"jghq_1\"><span>"+MA_V+"%</span>/��</div>");
			}else{//������
				var margin = 1*MA_V;//��֤��
				cmdOneMgn = jQuery("<div class=\"jghq_1\"><span>"+margin+"</span>Ԫ/��</div>");
			}
			var SPREAD = Number(cmd["SPREAD"]);//��С�䶯��λ
			var flt = CT_S*SPREAD;
			var cmdOneFlt = jQuery("<div class=\"jghq_2\">����ӯ��:<span>"+flt+"</span>Ԫ</div>");

			cmdOneArg.append(cmdOneQty).append(cmdOneBPr).append(cmdOneSPr).append(cmdOneMgn).append(cmdOneFlt);
			cmdOne.append(cmdFilter);			
			cmdOne.append(cmdOneTop);			
			cmdOne.append(cmdOneDom);			
			cmdOne.append(cmdOneNam);			
			cmdOne.append(cmdOneArg);	
			cmdDiv.append(cmdOne);		
			//���
			cmdOneDom.click(function(){
				var cmdId = $(this).attr("id");
				cmdId = cmdId.split("_")[0];
				$.buyFall(cmdId);
			});	
			//����
			cmdOneTop.click(function(){
				var cmdId = $(this).attr("id");
				cmdId = cmdId.split("_")[0];
				$.buyRise(cmdId);
			});	
		}
	}
	//���
	$.buyFall = function(cmdId){
		var cmd = $.getCmdInfo(cmdId);
		//���÷���
		$("#orderBuySellHtml").html("���");
		$("#orderBuySell").val(2);
		//�������ơ���λ
		var name = cmd["CO_N"];//��Ʒ����
		var CON_U = cmd["CON_U"];//��Ʒ��λ
		$("#orderCmdName").html(name);
		$("#orderUnit").html(CON_U);
		//����form�е���Ʒ����
		$("#orderCmdId").val(cmdId);
		//����Ǯ
		$("#qty_1").click();
		
		$("#orderBuySellHtml_limit").html("���");
		$("#orderCmdName_limit").html(name);
		$("#orderUnit_limit").html(CON_U);
		$("#X_O_B_D_D").val(cmd["x_O_B_D_D"]);
		$("#X_O_S_D_D").val(cmd["x_O_S_D_D"]);
		var sread = Number(cmd["SPREAD"]);
		$("#SPREAD").val(sread);
		$("#limitPrice").attr("step",sread);
		
		$("#marketPriceTab").click();
		//��ʾ�˾�
		filter.show();
		//չʾ�µ���
		
		order.show();
	}
	//����
	$.buyRise = function(cmdId){
		var cmd = $.getCmdInfo(cmdId);
		//���÷���
		$("#orderBuySellHtml").html("����");
		$("#orderBuySell").val(1);
		//�������ơ���λ
		var name = cmd["CO_N"];//��Ʒ����
		var CON_U = cmd["CON_U"];//��Ʒ��λ
		$("#orderCmdName").html(name);
		$("#orderUnit").html(CON_U);
		//����form�е���Ʒ����
		$("#orderCmdId").val(cmdId);
		//����Ǯ
		$("#qty_1").click();
		
		//�����޼۲�
		$("#orderBuySellHtml_limit").html("����");
		$("#orderCmdName_limit").html(name);
		$("#orderUnit_limit").html(CON_U);
		$("#X_O_B_D_D").val(cmd["x_O_B_D_D"]);
		$("#X_O_S_D_D").val(cmd["x_O_S_D_D"]);
		var sread = Number(cmd["SPREAD"]);
		$("#SPREAD").val(sread);
		$("#limitPrice").attr("step",sread);
		
		$("#marketPriceTab").click();
		//��ʾ�˾�
		filter.show();
		//չʾ�µ���
		order.show();
	}
	
	//����ˢ��
	$.quotationController = function(){
		//��AJAX	�����ȡ������Ϣ
		$.ajax({
			type:"post",
			url:"<%=path%>/tocServlet?t="+new Date(),
			contentType: "application/x-www-form-urlencoded; charset=GBK",
			data:{reqName:"quotation_memory"},
			dataType: "json",
			error:function(json){
				clearInterval(for_hq);
			},
			success: function(data){
				if(data !="" && data!=null && data !=undefined){
					var ret = data[0];
					var retCode = ret["retcode"];
					if(retCode == 0){
						var len = data.length;
						for(var i=1;i<len;i=i+1){
							var temp = data[i];
							$.updateCommodity(temp,i);
						}
						//����ȫ������
						$.transferTradPriceAll();
					}else if(retCode == -201){
						alert("�����˺�����һ���ص��½�����ѱ������ߣ�");
						clearInterval(for_hq);
						//$.relogon();
						location.href = "<%=basePath%>jsp/logon/logon.jsp";
					}else if(retCode == -2001){
						alert("�����˺���ʧЧ�������µ�¼��");
						clearInterval(for_hq);
						//$.relogon();
						location.href = "<%=basePath%>jsp/logon/logon.jsp";
					}
				}
			}
		});
	}
	//�������鶯̬չʾ��Ʒ��Ϣ
	//qn:һ��������Ϣ i:�ڼ�������
	$.updateCommodity = function(qn,i){
		var breadId = qn["BD"];
		var sell_price = Number(qn["S"]);//����
		var buy_price = qn["B"];//����
		var price = Number($("#"+breadId+"_p").html());
		//alert(breadId+" "+ sell_price+"<"+price+"="+(sell_price < price));
		if(sell_price < price){
			//alert("xxx");
			$("#"+breadId+"_xia").show();
			$("#"+breadId+"_shang").hide();
		}else if(sell_price > price){
			//alert("zzz");
			$("#"+breadId+"_xia").hide();
			$("#"+breadId+"_shang").show();
		}
		$("#"+breadId+"_p").html(sell_price.toFixed(2));
		var cmdIds = $.getShowedCmdId(breadId).split(",");
		var len = cmdIds.length;
		for(var i=0;i<len;i++){
			var cmdId = cmdIds[i];
			$("#"+cmdId+"_spr").val(sell_price);
			$("#"+cmdId+"_bpr").val(buy_price);
			var flag = order.is(':hidden');
			if(!flag){//���ֲ�����ʾ
				var orderCmdId = $("#orderCmdId").val();
				if(orderCmdId == cmdId){
					var qty = $("#orderQty").val();
					$("#qty_"+qty).click();
					//�޼�
					var SPREAD = Number($("#SPREAD").val());
					var X_O_B_D_D = Number($("#X_O_B_D_D").val());
					var X_O_S_D_D = Number($("#X_O_S_D_D").val());
					var firstPrice = Number(sell_price) - X_O_S_D_D*SPREAD;
					var secondPrice = Number(buy_price) + X_O_B_D_D*SPREAD;
					$("#firstPrice").val(firstPrice.toFixed(2));
					$("#secondPrice").val(secondPrice.toFixed(2));
				}
			}
		}
	}
	//����Ʒ��id��ȡ��Ʒ����
	$.getShowedCmdId = function(breadId){
		var code = null;
		$(showedCmd).each(function(){
			var bread = $(this)[0];
			var _breadId = bread["breadId"];
			if(breadId == _breadId){
				code = bread["code"];
			}			
		});
		return code;
	}
	//���ո�����������
	$.transferTradPriceAll = function(){
		$(".bottom").each(function(){
			var _hid = $(this).attr("title");
			var cmdId = $(this).attr("name");
			$.transferTradPrice(cmdId,_hid);
		});
	}
	//���ո������ֲֺż���
	$.transferTradPrice = function(cmdId,holdId){
		var b_p = $("#"+cmdId+"_bpr").val();
		var s_p = $("#"+cmdId+"_spr").val();
		var pri = $("#pri_"+holdId).html();
		var bs = $("#bs_"+holdId).val();
		var qty = $("#_tmp_qty_"+holdId).val();
		var cmd = $.getCmdInfo(cmdId);
		var CT_S = cmd["CT_S"];//��Լ����
		var FE_A = cmd["FE_A"];//�������㷨
		var FEE_V = cmd["FEE_V"];//������ϵ��
		var temp = 0;
		if(bs == 1){
			//�������Ϊ0���ж�
			if(s_p == 0){
				return;
			}
			//����������
			//var fee = Number($.computeFee(pri,qty,CT_S,FE_A,FEE_V));
			var fee = 0;
			temp = (s_p - pri)*CT_S*qty-fee;
		}else{
			//�������Ϊ0���ж�
			if(b_p == 0){
				return;
			}
			//����������
			//var fee = Number($.computeFee(pri,qty,CT_S,FE_A,FEE_V));
			var fee = 0;
			temp = (pri - b_p)*CT_S*qty-fee;
		}
		temp = temp.toFixed(2);
		$("#db_"+holdId).html(temp);
		if(temp>0){
			$("#db_"+holdId).css("color","red");
		}else{
			$("#db_"+holdId).css("color","#0F0");
		}
	}
	//ˢ�����
	$.userFoundController = function(){
		$.ajax({
			type:"post",
			url:"<%=path%>/tocServlet?t="+new Date(),
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			data:{reqName:"firmInfo",needArgs:"UF"},
			dataType: "json",
			error:function(json){
				clearInterval(for_uf);
			},
			success: function(data){
				if(data !="" && data!=null && data !=undefined){
					var ret = data[0];
					var retCode = ret["retcode"];
					if(retCode == 0){
						var temp = data[1];
						var found = Number(temp["UF"]);//�����ʽ�
						found = found.toFixed(2);
						$("#userfulFounds").html(found);
					}else{
						var temp = data[1];
						var msg = temp["message"];
						alert(msg);
						clearInterval(for_uf);
						location.href = "<%=basePath%>jsp/logon/logon.jsp";
					}
				}
			}
		});
	}
	$.addTransferDiv=function(data){
		if(data !="" && data!=null && data !=undefined){
			var transfer_div = jQuery("<div id=\"transfer_div\"><div>");
			var divArry = new Array();
			var len = data.length;
			for(var i=0;i<len;i++ ){
				if(i==MianJSPMaxHoldNum){
					//�����Ű�
					for(var k=0;k<divArry.length;k++){
						var bottomDiv = divArry[k];
						var bottomV = 35*k+35;
						//bottomDiv.styles.bottom=bottomV;
						bottomDiv.css("bottom",bottomV);
					}
					var one = jQuery("<div class=\"bottom_more\" id=\"viewmorehold\">�鿴����<div>");
					//�ֲֿ�������
					one.click(function(){
						location.href="<%=path%>/tocServlet?reqName=GETHOLDLIST";
					});
					transfer_div.append(one);
					return transfer_div;
				}
				var temp = data[i];
				var h_id = temp["H_ID"];//�ւ}id
				var id = temp["CO_I"];//id
				var cmd = $.getCmdInfo(id);
				var CON_U = cmd["CON_U"];//��Ʒ��λ
				var CT_S = cmd["CT_S"];//��Լ����
				var name = cmd["CO_N"];//����
				var qty  = temp["C_QTY"];//�ֲ���
				var pri  = Number(temp["PR"]);//���ּ�
				pri = pri.toFixed(2);
				var bs  = temp["TY"];//��������
				var hid  = temp["H_ID"];//�ֲֵ���
				var b_s = "����";
				if(bs == '2'){
					b_s = "���";
				}
				var one = jQuery("<div class=\"bottom\" key=\""+i+"\" name=\""+id+"\" title=\""+hid+"\" id=\"zr_"+h_id+"\"><div>");
				var one_0 = jQuery("<div title=\""+hid+"\" id=\"dt"+id+"\"></div>");
				var one_1 = jQuery("<div class=\"bottom_1 left\"><span id=\"db_"+h_id+"\"></span></div>");
				var one_2 = jQuery("<div class=\"bottom_2 left\">"+qty+"��"+b_s+"</div>");
				var one_3 = jQuery("<div class=\"bottom_2 left\"><div class=\"bottom_2_1\">"+name+"</div><div class=\"bottom_2_1\"><span id=\"pri_"+h_id+"\">"+pri+"</span></div></div>");
				var one_4 = jQuery("<div class=\"bottom_3 right\" title=\""+hid+"\" id=\"zran_"+id+"\">ת��</div>");
				var one_5 = jQuery("<input type=\"hidden\" id=\"bs_"+h_id+"\" value=\""+bs+"\">");
				var one_6 = jQuery("<input type=\"hidden\" id=\"hid_"+id+"\" value=\""+hid+"\">");
				var one_7 = jQuery("<input type=\"hidden\" id=\"_tmp_qty_"+h_id+"\" value=\""+qty+"\">");
				var bottom = 35*i;
				one.css("bottom",bottom);
				one_0.append(one_1).append(one_2).append(one_3);
				one.append(one_0).append(one_4).append(one_5).append(one_6).append(one_7);
				transfer_div.append(one);
				divArry.push(one);
				$.transferTradPrice(id,h_id);
				one_0.click(function(){
					//��Ʒ����
					_tmp_co_i = $(this).attr("id").replace("dt","");
					var hid=$(this).attr("title");
					location.href="<%=path%>/tocServlet?reqName=holdaposition&_co_i="+_tmp_co_i+"&_h_id="+hid;
				});
				one_4.click(function(){
					filter.show();
					//��Ʒ����
					_tmp_co_i = $(this).attr("id").split("_")[1];
					//��������
					var hId = $(this).attr("title");
					_tmp_ty = $("#bs_"+hId).val()==1?2:1;
					_tmp_ty_cn = _tmp_ty==1?"���":"����";
					//ί�м�
					if(_tmp_ty=="1")
					{
						_tmp_co_price = $("#"+_tmp_co_i+"_bpr").val();
					}else
					{
						_tmp_co_price = $("#"+_tmp_co_i+"_spr").val();
					}
					//ί������
					_tmp_c_qty_number = $("#_tmp_qty_"+hId).val();
					//�ֲֵ���
					_tmp_h_id = hId;
					var _tmp_pri = $("#pri_"+hId).text();
					var cmd = $.getCmdInfo(_tmp_co_i);
					var CT_S = Number(cmd["CT_S"]);//��Լ����
					var MA_A = cmd["MA_A"];//��֤���㷨
					var MA_V = Number(cmd["MA_V"]);//��֤��ϵ��
					var name = cmd["CO_N"];
					var _tmp_pri_ms;
					if(MA_A == 1)
					{//�ٷֱ�
						_tmp_pri_ms = _tmp_pri*_tmp_c_qty_number*CT_S*MA_V;
					}else 
					{
						_tmp_pri_ms = _tmp_c_qty_number*MA_V;
					}
					var width = zhuanrang.width();
					var height = zhuanrang.height();
					zhuanrang.css("left",($(window).width()-width)/2);
					zhuanrang.css("top",($(window).height()-height)/2);
					
					$(".zhuanrang1-2").html(name+"��"+_tmp_pri_ms.toFixed(2)+"Ԫ��");
					$(".zhuanrang1-1-1").html(Number(_tmp_pri).toFixed(2)+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+_tmp_c_qty_number+"��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+_tmp_ty_cn);
					zhuanrang.show();
				});
				
			}
			return transfer_div;
		}
		return "";
	}
	//ת�ò����
	$.transferController = function(){
		//ɾ������ת�ò�
		transfer.html("");
		$.ajax({
			type:"post",
			url:"<%=path%>/tocServlet?t="+new Date(),
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			data:{reqName:"transfer"},
			dataType: "json",
			success: function(data){
				if(data !="" && data!=null && data !=undefined){
					//addTransferDiv
					transfer.append($.addTransferDiv(data));
					$.transferTradPriceAll();
				}
			}
		});
	}
	//ת��ȡ��
	$("#quxiao").click(function(){
		zhuanrang.hide();
		filter.hide();
	});
	//�м�ƽ��
	$.marketPriceCloseOut = function(){
		//window.alert(1);
		//return ;
		$.ajax({
			type:"post",
			url:"<%=path%>/tocServlet?t="+new Date(),
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			data:"reqName=_sjpc_tj_1&_ty="+_tmp_ty+"&_co_i="+_tmp_co_i+"&co_price="+_tmp_co_price+"&_c_qty_number="+_tmp_c_qty_number+"&_h_id="+_tmp_h_id,
			dataType: "json",
			beforeSend: function(){
				closeOrderrefrash.show();
			},
			success: function(data)
			{
				if(data !=null){
					closeOrderrefrash.hide();
					var ret = data["ret"];
					if(ret == '0'){
						alert("�����ɹ���");
						zhuanrang.hide();
						filter.hide();
						location.href = "<%=path%>/tocServlet?reqName=mainForward";
					}else{
						var msg = data["msg"];
						alert(msg);
						zhuanrang.hide();
						filter.hide();
					}
				}
				
				//window.alert(data);
			}
		});
	}
	var for_hold =null;
	$.queryHoldDetail = function(){
		var remArry = new Array();
		$.ajax({
			type:"post",
			url:"<%=path%>/tocServlet?t="+new Date(),
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			data:{reqName:"transfer"},
			dataType: "json",
			error:function(json){
				clearInterval(for_hold);
			},
			success: function(data){
				if(data !="" && data!=null && data!=undefined){
					//ɾ������ĳֲ�
					var transfer_div = $.addTransferDiv(data);
					transfer.html("");
					transfer.append(transfer_div);
					$.transferTradPriceAll();//���㸡��
				}
			}
		});
	}
	//���ɹ���
	$.createNews = function(){
		$.ajax({
			type:"post",
			url:"<%=path%>/tocServlet?t="+new Date(),
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			data:{reqName:"newsOverview"},
			dataType: "json",
			success: function(data){
				if(data !="" && data!=null && data !=undefined){
					var len = data.length;
					for(var i=0;i<len;i++){
						var temp = data[i];
						var ty_nm = temp["TYPENAME"];
						var ty_id = temp["TYPEID"];
						var gaoshi = jQuery("<div class=\"gonggao"+ty_id+"\"></div>");
						if(skinName!=''&&skinName!='default'){
							var newTit = jQuery("<div class=\"newsTit\">"+ty_nm+"</div>");
							gaoshi.append(newTit);
						}else{
							var newTit = jQuery("<div class=\"newsTit\"></div>");
							gaoshi.append(newTit);
						}
						//var iurl = "<%=basePath%>images/news_"+ty_id+".png";
						//gaoshi.css("background-image","url("+iurl+")");
						var name = jQuery("<div class=\"ziti\"></div>");
						
						gaoshi.append(name);
						var n_info = temp["NEWS"];
						if(n_info != null &&  n_info !=undefined && n_info !="" && n_info.length>0){
							var n_len = n_info.length;
							for(var j=0;j<n_len;j++){
								var n_temp = n_info[j];
								var title = n_temp["TITLE"];
								var time = n_temp["TIME"];
								var newsId = n_temp["NEWSID"]
								var n = null;
								if(j==0){
									n = jQuery("<div class=\"zgzd_1_0\"><div>");
								}else{
									n = jQuery("<div class=\"zgzd_1_1\"><div>");
								}
								var n_tl = jQuery("<div class=\"zgzd_1_1_left\" id=\"news_"+newsId+"_"+ty_id+"_"+ty_nm+"\">"+title+"</div>");
								n_tl.click(function(){
							  		var ids = $(this).attr("id").split("_");
							  		var id = ids[1];
							  		var ty_id = ids[2];
							  		var ty_nm = ids[3];
							  		$("#newsId").val(id);
							  		$("#reqName").val("newsDetail");
							  		$("#typeId").val(ty_id);
									$("#typeName").val(ty_nm);
							  		$("#frm").submit();
							  	});
								var n_tm = jQuery("<div class=\"zgzd_1_1_right\">"+time+"</div>");
								n.append(n_tl).append(n_tm);
								gaoshi.append(n);
							}
							var more = jQuery("<div class=\"zgzd_1_3\" id=\"news_"+ty_id+"_"+ty_nm+"\">�鿴����...</div>");
							more.click(function(){
								var id_nm = $(this).attr("id").split("_");
								var typeId = id_nm[1];
								var typeName = id_nm[2];
								$("#reqName").val("newsViewMore");
								$("#typeId").val(typeId);
								$("#typeName").val(typeName);
								$("#frm").submit();
							});
							gaoshi.append(more);
						}
						news.append(gaoshi);
					}
				}
			}
		});
	}
	$.createNews();
	$.showCmds();
	//��������ˢ��
	$.quotationController();
	for_hq = setInterval($.quotationController,3000);
	//�������ˢ��
	$.userFoundController();
	for_uf = setInterval($.userFoundController,5000);
	//��ѯ�ֲ���ϸ������ת�ò���ʾ
	$.transferController();
	//for_hold = setInterval($.queryHoldDetail,10000)
});
</script>
<script type="text/javascript" src="<%=basePath%>js/echarts.js"></script>
<script type="text/javascript">
//K��
var lineRefrash = $("#lineRefrash");
//k�� 
  var option = {
	grid:{
		x:50,
		y:10,
		x2:24,
		y2:25
	},
	backgroundColor:{
	  color:"#FF0000"
	  },
	title : {
		text: ''
	},
	tooltip : {
		trigger: 'axis',
		formatter: function (params) {
			var res = params[0].seriesName + ' ' + params[0].name;
			res += '<br/>  ���� : ' + params[0].value[0] + '  ��� : ' + params[0].value[3];
			res += '<br/>  ���� : ' + params[0].value[1] + '  ��� : ' + params[0].value[2];
			return res;
		},
		showDelay:400,
		transitionDuration:0.5,
		position:function(array){
			var a = array.length;
			var x = array[0];
			var y = array[1];
			//alert(x+"/"+y);
			if(x<260){
				x = 300;
			}else if(x>300){
				x = 260;
			}
			if(y>100){
				y = 100;
			}
			//x = 280;
			//y = 100;
			//alert(x+"/"+y);
			var t = new Array();
			t.push(x);
			t.push(y);
			return t;
		}
	},
	toolbox: {
		show : false,
	},
	dataZoom : {
		show : false,
		realtime: true,
		start : 0,
		end : 100,
		handleSize:10
	},
	xAxis : [
		{
			type : 'category',
			boundaryGap : true,
			axisTick: {onGap:false},
			splitLine: {show:false},
			data : ['00.00']
		}
	],
	yAxis : [
		{
			type : 'value',
			scale:true,
			boundaryGap: []
		}
	],
	series : [
		{
			name:'',
			type:'k',
			data:[ // ���̣����̣���ͣ����
			       [0,0,0,0],
				]
		}
	]
};

  //��ʱ�� 
	var  option2 = {
			grid:{
				x:50,
				y:10,
				x2:15,
				y2:25
			},
		    tooltip : {//��ʾ
		        trigger: 'axis',
		        position:function(array){
					var a = array.length;
					var x = array[0];
					var y = array[1];
					if(x<250){
						x = 250
					}else if(x>300){
						x = 300;
					}
					var t = new Array();
					t.push(x);
					t.push(y);
					return t;
				}
		    },
			backgroundColor:{
			  color:"#FF0000"
			  },
		    toolbox: {//������ 
		        show : false
		    },
		    xAxis : [//ֱ������ϵ�еĺ��� ,ͨ����Ĭ��Ϊ��Ŀ�� 
		        {
		             
		                    type : 'category',
		        			boundaryGap : true,
		        			axisTick: {onGap:false},
		        			splitLine: {show:false},
		        			data : ['00.00']
		        }
		    ],
		    yAxis : [//ֱ������ϵ�е����ᣬͨ��Ĭ��Ϊ��ֵ�� 
		        {
		        	type : 'value',
					scale:true,
					boundaryGap:[]
		        }
		    ],
		    series : [//����ϵ�У�һ��ͼ����ܰ������ϵ�У�ÿһ��ϵ�п��ܰ���������� 
		        {
		            name:'���¼۸�',
		            type:'line',//��ͼ 
		            data:[0],
		            symbol:'none'   //ȥ�����ϵ�Բ�� 
		            
		        } 
		    ]
		};

 		var myChart = null;
 		var charts = null;
 		require.config({
 		    paths: {
 				echarts: '<%=basePath%>js'
 		    }
 		});
 		//k
       	var series = option.series;
       	var series_data = series[0].data;
       	//fs
       	var series2 = option2.series;
       	var series_data2 = series2[0].data;

        var lastTime = null;
        var lp_m = null;//���
		var hp_m = null;//���
		var for_kLine = null;
		var type = -2;
		function kLineQuery (f){
			//��AJAX	�����ȡk����Ϣ
			var times = new Array();
	        var sdatas = new Array();
	        var fsdatas = new Array();//��ʱ��ר�� 
	        var hp_sel_cmd = $("#hp_sel_cmd").val();
			//alert(hp_sel_cmd+"----hp_sel_cmd");
			$.ajax({
				type:"post",
				url:"<%=path%>/tocServlet?t="+new Date(),
				contentType: "application/x-www-form-urlencoded; charset=GBK",
				data:{reqName:"kLine",type:type,cmdId:hp_sel_cmd,lastTime:lastTime},
				dataType: "json",
				error:function(json){
					clearInterval(for_kLine);
				},
				success: function(data){
					if(!stop){
						if(data !="" && data!=null && data !=undefined){
							if(f){
								var len = data.length;
								var lastData = data[len-1];
								lastTime = lastData["LT"];
								var cp = Number(lastData["CP"]);//�������̼�
								var op = Number(lastData["OP"]);//���̼�
								var hp = Number(lastData["HP"]);//��߼�
								var lp = Number(lastData["LP"]);//��ͼ�
								$("#closePrice").html(cp.toFixed(2));
								$("#openPrice").html(op.toFixed(2));
								$("#lowPrice").html(lp.toFixed(2));
								$("#hightPrice").html(hp.toFixed(2));
								if(len>1){
									var n = len-1;
									if(type == -2){
										for(var i=0;i<n;i++){
											var d = data[i];
											var t = d["T"];
											times.push(t);
											var np = Number(d["NP"]);//��ʱ�õ����¼�
											fsdatas.push(np.toFixed(2));//��ʱ��ר�� 
										}
										option2.xAxis[0].data = times;
										option2.series[0].data = fsdatas;
									}else{
										for(var i=0;i<n;i++){
											var d = data[i];
											var t = d["T"];
											times.push(t);
											var hp = Number(d["HP"]);
											var lp = Number(d["LP"]);
											var op = Number(d["OP"]);
											var cp = Number(d["CP"]);
											var sdata = new Array();
											sdata.push(op.toFixed(2));
											sdata.push(cp.toFixed(2));
											sdata.push(lp.toFixed(2));
											sdata.push(hp.toFixed(2));
											sdatas.push(sdata);
										}
										option.xAxis[0].data = times;
										option.series[0].data = sdatas;
									}
								}
								require(
							 		      [
							 		       	'echarts',
							 		       	'echarts/chart/line',
							 		       	'echarts/chart/k'
							 		      ],
							 		      function (ec) {
							 		          //--- k��ͼ ---
							 		          charts = ec;
							 		          myChart = ec.init(document.getElementById('contener'));
							 		         if(type == -2){ //k�߲��� 
							 		          	myChart.setOption(option2);//��ʱ 
							 		         }else{
							 		        	myChart.setOption(option);
								 		     }
							 		          
							 		      }
							 		  );
							}else{
								var len = data.length;
								if(len>1){
									if(type == -2){//��ʱ��
										var n = len-1;
										var xa_tm = option2.xAxis[0].data;
										var sr_dt = option2.series[0].data;
										var xa_tm_len = xa_tm.length;
										var xa_tm_lt = xa_tm[xa_tm_len-1];
										for(var i=0;i<n;i++){
											var d = data[i];
											var t = d["T"];
											var np = Number(d["NP"]);
											var sdata = new Array();
											sdata.push(np.toFixed(2));
											if(xa_tm_lt == t){
												var sr_dt_len = sr_dt.length;
												sr_dt[sr_dt_len-1] = sdata;
											}else{
												xa_tm.push(t);
												sr_dt.push(sdata);
											}
										}
		
									}else{
										var n = len-1;
										var xa_tm = option.xAxis[0].data;
										var sr_dt = option.series[0].data;
										var xa_tm_len = xa_tm.length;
										var xa_tm_lt = xa_tm[xa_tm_len-1];
										for(var i=0;i<n;i++){
											var d = data[i];
											var t = d["T"];
											var hp = Number(d["HP"]);
											var lp = Number(d["LP"]);
											var op = Number(d["OP"]);
											var cp = Number(d["CP"]);
											var sdata = new Array();
											sdata.push(op.toFixed(2));
											sdata.push(cp.toFixed(2));
											sdata.push(lp.toFixed(2));
											sdata.push(hp.toFixed(2));
											if(xa_tm_lt == t){
												var sr_dt_len = sr_dt.length;
												sr_dt[sr_dt_len-1] = sdata;
											}else{
												xa_tm.push(t);
												sr_dt.push(sdata);
											}
										}	
									}
								}
								var len = data.length;
								var lastData = data[len-1];
								var hp = Number(lastData["HP"]);//��߼�
								var lp = Number(lastData["LP"]);//��ͼ�
								$("#lowPrice").html(lp.toFixed(2));
								$("#hightPrice").html(hp.toFixed(2));
								if(lastTime != lastData["LT"]){
									lastTime = lastData["LT"];
									if(type == -2){//K�� 
										myChart.setOption(option2);
									}else{
										myChart.setOption(option);
									}
								}
							}
						}
					}
					lineRefrash.hide();
				}
			});
		}
		window.addEventListener("orientationchange",function(){ 
			reflashLine();
			},false);
		function reflashLine(){
			lineRefrash.show();
			lastTime = null;
			lp_m = null;
			hp_m = null;
			kLineQuery(true);
		}
		var stop = false;
		function btClick(ty){
			lineRefrash.show();
			stop = true;
			window.clearInterval(for_kLine);
			type = ty;//-2��ʱ�� -1 ����
			lastTime = null;
			lp_m = null;
			hp_m = null;
			stop = false;
			kLineQuery(true);
			for_kLine = window.setInterval("kLineQuery(false)", 5000);  //��ʱע��  
		}
		$(function(){
			//����K�߷�����ѡ�к����ɫ�仯
			$(".kLine").click(function(){
				$(".kLine").each(function(){
					$(this).removeClass("xuanzhong");
					$(this).addClass("wxzhong");
				});
				$(this).removeClass("wxzhong");
				$(this).addClass("xuanzhong");
			});
		});
		window.setTimeout(function(){
			 //var hp_sel_cmd = $("#hp_sel_cmd").val();
			 //alert(hp_sel_cmd);
			 btClick(-2)
		},1000);
</script>
</html>
