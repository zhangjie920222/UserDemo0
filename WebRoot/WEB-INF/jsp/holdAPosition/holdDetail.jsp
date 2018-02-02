<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ include file="../../public/taglib.jsp" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path;
	String _basePath = basePath + "/app/toc/";
%>
<!DOCTYPE html>
<html>
	<head>
		<title>大圆银泰</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="viewport"
			content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
		<meta name="format-detection" content="telephone=no, email=no" />
		<meta name="webview" content="webView.detectsPhoneNumbers=NO" />
		<link href="<%=_basePath%>css/two_weixin.css" rel="stylesheet">
		<link href="<%=_basePath%>css/jquery/jquery-ui.min.css"
			rel="stylesheet">
		<style>
* {
	font-family: "微软雅黑";
	color: #666;
}

#scroller {
	width: 100%;
	height: 290px;
	overflow: auto;
}

.table_box {
	padding: 0;
}

.dialog_fanhui {
	display: block;
}

.ccmx_selectBox {
	list-style: none;
}
</style>
	</head>
	<body ng-app="mimicPanel" ng-controller="holdingDetailsCtrl"
		ng-init="initPage()" check-tr-selected="">

		<div class="name_title">
			<img src="<%=_basePath%>/images/title_5.png">
			<sign-out signOutUrl="<%=_basePath%>/jsp/risk/riskTip.jsp">
			<a href="javascript:void(0);" class="dengchu_box"> <img
					src="<%=_basePath%>/images/dengchu_btn.png" class="dengchu" /> </a>
			</sign-out>
		</div>

		<div class="divbox">
			<div class="table_box">
				<div id="scroller">
					<div class="new_table">
						<div ng-repeat="result in resultList">
							<ul class="new_tr" clicktr="">
								<span ng-bind="$index" style="display: none;"></span>
								<span id="commodityId" ng-bind="result.commodityId"
									style="display: none;"></span>
								<span ng-bind="result.tradeMarkCode" style="display: none;"></span>
								<span ng-bind="result.holdingId" style="display: none;"></span>
								<li class="new_li">
									<div class="content_box">
										<img src="<%=_basePath%>/images/cion_1.png" class="icon" />
										<ul class="text_rigth">
											<li class="text_zw" ng-bind="result.name"
												style="font-size: 90%;">
													12
											</li>
											<li class="title_text">
												商品
											</li>
										</ul>
									</div>
									<div class="content_box">
										<img src="<%=_basePath%>/images/icon_2.png" class="icon" />
										<ul class="text_rigth">
											<li id="holdNo" class="text_zw" ng-bind="result.holdingId">

											</li>
											<li class="title_text">
												单号
											</li>
										</ul>
									</div>
								</li>
								<li class="new_li">
									<div class="content_box">
										<img src="<%=_basePath%>/images/icon_4.png" class="icon" />
										<ul class="text_rigth">
											<li class="text_zw" ng-bind="result.tradeMarkName">

											</li>
											<li class="title_text">
												买卖方向
											</li>
										</ul>
									</div>
									<div class="content_box">
										<img src="<%=_basePath%>/images/icon_3.png" class="icon" />
										<ul class="text_rigth">
											<li class="text_zw" ng-bind="result.todayProfit">

											</li>
											<li class="title_text">
												浮动盈亏
											</li>
										</ul>
									</div>
								</li>
								<li class="new_li">
									<div class="content_box">
										<img src="<%=_basePath%>/images/icon_5.png" class="icon" />
										<ul class="text_rigth">
											<li id="holdQty" class="text_zw"
												ng-bind="result.holdQuantity">

											</li>
											<li class="title_text">
												持仓数量
											</li>
										</ul>
									</div>
									<div class="content_box">
										<ul class="text_rigth">
											<li class="text_zw">
												<span> </span>
												<img class="next_top"
													src="<%=_basePath%>/images/next_top.png" />
												<span class="zstext"> 止损： </span>
												<label ng-if="result.stoploss==0">
													<span id="stoploss" style="display: none;">0</span>
													<span style="float: left; color: #d64a27;"> -- </span>
												</label>
												<label ng-if="result.stoploss!=0">
													<span id="stoploss" style="float: left; color: #d64a27;"
														ng-bind="result.stoploss"> </span>
												</label>
											</li>
											<li class="text_zw">
												<span> </span>
												<img class="next_top"
													src="<%=_basePath%>/images/next_bot.png" />
												<span class="zstext"> 止盈： </span>
												<label ng-if="result.stopprofit==0">
													<span id="stopprofit" style="display: none;">0</span>
													<span style="float: left; color: #d64a27;"> -- </span>
												</label>
												<label ng-if="result.stopprofit!=0">
													<span id="stopprofit" style="float: left; color: #d64a27;"
														ng-bind="result.stopprofit"> </span>
												</label>
											</li>
										</ul>
									</div>
								</li>
							</ul>


						</div>
						<div class="more_box" style="text-align: center;"
							ng-if="resultList.length==0">
							未查询到相关数据!
						</div>

					</div>
				</div>

				<ul style="padding: 4% 0;">
					<li>
						<holding-details-operate type="ccxq">
						<a href="javascript:void(0);" class="ccmx_btn3"> <img
								src="<%=_basePath%>/images/ccxx.png " /> </a>
						</holding-details-operate>
					</li>
					<li class="ccmx_selectBox">
						<holding-details-operate type="sjpc">
						<a href="javascript:void(0);" class="ccmx_btn4"> <img
								src="<%=_basePath%>/images/sjpc.png " /> </a>
						</holding-details-operate>
						<holding-details-operate type="zjpc">
						<a href="javascript:void(0);" class="ccmx_btn5"> <img
								src="<%=_basePath%>/images/zjpc.png " /> </a>
						</holding-details-operate>
					</li>
					<li class="ccmx_selectBox">
						<holding-details-operate type="cxzy">
						<a href="javascript:void(0);" class="ccmx_btn4"> <img
								src="<%=_basePath%>/images/cxzy.png " /> </a>
						</holding-details-operate>
						<holding-details-operate type="cxzs">
						<a href="javascript:void(0);" class="ccmx_btn5"> <img
								src="<%=_basePath%>/images/cxzs.png " /> </a>
						</holding-details-operate>
					</li>
				</ul>

				<dialog-direc>
				<div id="dialog" style="display: none;">

					<div style="border: 1px #ccc solid;" class="table_g">
						<ul>
							<li
								style="background: #eceaea; height: 40px; text-align: center; line-height: 40px; font-size: 0.9em; border-bottom: 1px #ccc solid;">
								持仓明细
							</li>
							<li style="overflow: hidden; border-bottom: 1px #ccc solid;">
								<div class="mnpzy_textsize"
									style="border-right: 1px #ccc solid;">
									<p>
										持仓单号：
										<br />
										<span ng-bind="holdingDetailsObject.holdingId"></span>
									</p>
								</div>
								<div class="mnpzy_textsize">
									<p>
										商品名称：
										<br />
										<span ng-bind="holdingDetailsObject.name"></span>
									</p>
								</div>
							</li>
							<li style="overflow: hidden; border-bottom: 1px #ccc solid;">
								<div class="mnpzy_textsize"
									style="border-right: 1px #ccc solid;">
									<p>
										买/卖：
										<br />
										<span ng-bind="holdingDetailsObject.tradeMarkName"></span>
									</p>
								</div>
								<div class="mnpzy_textsize">
									<p>
										数量：
										<br />
										<span ng-bind="holdingDetailsObject.openQuantity"></span>
									</p>
								</div>
							</li>
							<li style="overflow: hidden; border-bottom: 1px #ccc solid;">
								<div class="mnpzy_textsize"
									style="border-right: 1px #ccc solid;">
									<p>
										持仓数量：
										<br />
										<span ng-bind="holdingDetailsObject.holdQuantity"></span>
									</p>
								</div>
								<div class="mnpzy_textsize">
									<p>
										止损价：
										<br />
										<label ng-if="holdingDetailsObject.stoploss==0">
											<span>--</span>
										</label>
										<label ng-if="holdingDetailsObject.stoploss!=0">
											<span ng-bind="holdingDetailsObject.stoploss"></span>
										</label>
									</p>
								</div>
							</li>
							<li style="overflow: hidden; border-bottom: 1px #ccc solid;">
								<div class="mnpzy_textsize"
									style="border-right: 1px #ccc solid;">
									<p>
										止盈价：
										<br />
										<label ng-if="holdingDetailsObject.stopprofit==0">
											<span>--</span>
										</label>
										<label ng-if="holdingDetailsObject.stopprofit!=0">
											<span ng-bind="holdingDetailsObject.stopprofit"></span>
										</label>
									</p>
								</div>
								<div class="mnpzy_textsize">
									<p>
										持仓价：
										<br />
										<span ng-bind="holdingDetailsObject.holdPrice"></span>
									</p>
								</div>
							</li>
							<li style="overflow: hidden; border-bottom: 1px #ccc solid;">
								<div class="mnpzy_textsize"
									style="border-right: 1px #ccc solid;">
									<p>
										平仓价：
										<br />
										<span ng-bind="holdingDetailsObject.closePrice"></span>
									</p>
								</div>
								<div class="mnpzy_textsize">
									<p>
										当日浮动盈亏：
										<br />
										<span ng-bind="holdingDetailsObject.todayProfit"></span>
									</p>
								</div>
							</li>
							<li style="overflow: hidden; border-bottom: 1px #ccc solid;">
								<div class="mnpzy_textsize"
									style="border-right: 1px #ccc solid;">
									<p>
										占用保证金：
										<br />
										<span ng-bind="holdingDetailsObject.usedMargin"></span>
									</p>
								</div>
								<div class="mnpzy_textsize">
									<p style="width: 120%;">
										建仓时间：
										<br />
										<span ng-bind="holdingDetailsObject.openTime"
											style="font-size: 0.9em;"></span>
									</p>
								</div>
							</li>
							<li style="overflow: hidden;">
								<div class="mnpzy_textsize"
									style="border-right: 1px #ccc solid;">
									<p>
										电话交易员：
										<br />
										<div ng-if='!holdingDetailsObject.telephoneTraders'>
											<span>&nbsp;</span>
										</div>
										<div ng-if='holdingDetailsObject.telephoneTraders'>
											<span ng-bind="holdingDetailsObject.telephoneTraders"></span>
										</div>
									</p>
								</div>
								<div class="mnpzy_textsize">
									<p>

										<br />
										<span ng-bind=""></span>
									</p>
								</div>
							</li>
						</ul>
					</div>

					<p>
						<li class="ccmx_selectBox">
							<holding-details-operate type="sjpc">
							<a href="javascript:void(0);" class="ccmx_btn4"> <img
									src="<%=_basePath%>/images/sjpc.png " /> </a>
							</holding-details-operate>
							<holding-details-operate type="zjpc">
							<a href="javascript:void(0);" class="ccmx_btn5"> <img
									src="<%=_basePath%>/images/zjpc.png " /> </a>
							</holding-details-operate>
						</li>
						<li class="ccmx_selectBox">
							<holding-details-operate type="cxzy">
							<a href="javascript:void(0);" class="ccmx_btn4"> <img
									src="<%=_basePath%>/images/cxzy.png " /> </a>
							</holding-details-operate>
							<holding-details-operate type="cxzs">
							<a href="javascript:void(0);" class="ccmx_btn5"> <img
									src="<%=_basePath%>/images/cxzs.png " /> </a>
							</holding-details-operate>
						</li>
						<a href="javascript:void(0);" ng-click="close();"
							class="dialog_fanhui" style="margin-top: 10px"><img
								src="<%=_basePath%>/images/btn2_fh.png" /> </a>
					</p>

				</div>
				</dialog-direc>

				<input type="hidden"
					value="/gateway/wx/trade/v1/{userid}/holdingdetailspage/{commodityId}-{pageIndex}-{pageSize}"
					id="holdingDetailsUrl" />
				<input type="hidden"
					value="/gateway/wx/trade/v1/{userid}/revocatetradeorder/{holdno}-{type}-{commodityId}"
					id="evocateTradeOrderUrl" />
				<input type="hidden"
					value="/gateway/{source}/base/v1/{userid}/signout/" id="signOutUrl" />
				<input type="hidden"
					value="/gateway/wx/base/v1/{userId}/syntime/{tradeCount}"
					id="syntimeUrl" />
				<input type="hidden"
					value="/gateway/wx/trade/v1/{userid}/commodityrealprice/{commodityId}"
					id="commodityRealPrieceUrl" />






				<script src="<%=_basePath%>/js/jquery/jquery-1.11.1.min.js"
					type="text/javascript"></script>
				<script src="<%=_basePath%>/js/jquery/jquery-ui.min.js"
					type="text/javascript"></script>

				<div ng-app='mimicPanel'>

					<div style="border: 1px #ccc solid;" class="table_g"
						init-user-info=''>
						<ul>
							<li show-user=''
								style="background: #eceaea; height: 40px; text-align: center; line-height: 40px; font-size: 0.9em; border-bottom: 1px #ccc solid; color: #666;">
								账户信息
								<img class="xl_icon" src="<%=_basePath%>/images/xl_icon.png" />
							</li>
							<li style="overflow: hidden; border-bottom: 1px #ccc solid;"
								ng-show='showFlag'>
								<div class="mnpzy_textsize"
									style="border-right: 1px #ccc solid;">
									<p>
										账户名称:
										<br>
										<span ng-bind='firmName'></span>
									</p>
								</div>
								<div class="mnpzy_textsize">
									<p>
										浮动盈亏:
										<br>
										<span ng-bind='profit'></span>
									</p>
								</div>
							</li>

							<li style="overflow: hidden; border-bottom: 1px #ccc solid;"
								ng-show='showFlag'>
								<div class="mnpzy_textsize"
									style="border-right: 1px #ccc solid;">
									<p>
										当前权益:
										<br>
										<span ng-bind='currentInterests'></span>
									</p>
								</div>
								<div class="mnpzy_textsize">
									<p>
										可用保证金:
										<br>
										<span ng-bind='availableMargin'></span>
									</p>
								</div>
							</li>

							<li style="overflow: hidden; border-bottom: 1px #ccc solid;"
								ng-show='showFlag'>
								<div class="mnpzy_textsize"
									style="border-right: 1px #ccc solid;">
									<p>
										占用保证金:
										<br>
										<span ng-bind='usedMargin'></span>
									</p>
								</div>
								<div class="mnpzy_textsize">
									<p>
										冻结保证金:
										<br>
										<span ng-bind='freezeMargin'></span>
									</p>
								</div>
							</li>

							<li style="overflow: hidden;" ng-show='showFlag'>
								<div class="mnpzy_textsize"
									style="border-right: 1px #ccc solid;">
									<p>
										风险率:
										<br>
										<span ng-bind='risk'></span>
									</p>
								</div>
								<div class="mnpzy_textsize">
									<p>
										冻结手续费:
										<br>
										<span ng-bind='freezeFee'></span>
									</p>
								</div>
							</li>
						</ul>

					</div>


					<input id='accountUrl' type="hidden"
						value='/gateway/wx/trade/v1/{userid}/account/'>
					<input id='queryPriceFlag' type="hidden" value='1'>
					<input id='realPriceUrl' type="hidden" value=''>
				</div>
			</div>
		</div>
	</body>
</html>