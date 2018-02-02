<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../public/taglib.jsp"%>
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
		<meta charset="UTF-8">
		<title>委托查询</title>
		<meta name="viewport"
			content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
		<meta name="format-detection" content="telephone=no, email=no" />
		<meta name="webview" content="webView.detectsPhoneNumbers=NO" />
		<link rel=stylesheet type="text/css"
			href="<%=_basePath%>css/tsust.css">
		<link rel=stylesheet type="text/css" href="<%=_basePath%>css/1.css"
			title="cool">
		<style>
			 
				
				#scroller {
					width: 100%;
					height: 222px;
					overflow: auto;
				}
				
				/**自定义jquery dialog的一些样式**/
				.table_box {
					padding: 0;
				}
				
				
				#bg {
				display: none;
				position: absolute;
				top: 0%;
				left: 0%;
				width: 100%;
				height: 100%;
				background-color: gray;
				z-index: 1001;
				-moz-opacity: 0.7;
				opacity: .70;
				filter: alpha(opacity = 70);
			}
			
			#fx_neir {
				display: none;
				position: absolute;
				top: 0%;
				left:0%;
				width: 90%;
				padding: 8px;
				border: 8px solid #E8E9F7;
				background-color: white;
				z-index: 1002;
				overflow: auto;
			}
			</style>
	</head>
	<body>
		<form id="frm" name="frm" action="<%=basePath%>/tocServlet"
			method="post">
			<input type="hidden" id="reqName" name="reqName" value="logoff" />
			<input type="hidden" id="openType" name="openType" value="" />
			<input type="hidden" id="buy_sell" name="buy_sell" value="" />
		</form>
		<div class="fx_top">
			<div class="fx_bt">
				<div class="center">委托查询</div>
				<div class="tuic" id="logout"><a href="#"><img src="<%=_basePath%>images/tuic.png"  style="width: 30px;height: 30px;"/></a></div>
			</div>
		</div>
		 

		<div class="fx_neir">
			<div class="table_box">
				<form id="frmQuery" name="frmQuery" method="post"
					action="<%=basePath%>/tocServlet?reqName=my_order_query&orderQueryType=0">
					<ul>
						<li class="ccmx_selectBox">
							<select class="ccmx_select" name="commodityId">
								<option value="">
									商品
								</option>
								<c:forEach items="${cmdIdMap}" var="map">
									<option value="${map.key}">
										${map.value}
									</option>
								</c:forEach>
							</select>
							<select class="ccmx_select" name="orderType"
								style="margin-left: 3%;">
								<option value="">
									委托类型
								</option>
								<option value="1">
									市价
								</option>
								<option value="2">
									指价
								</option>
							</select>
						</li>
						<li class="ccmx_selectBox">
							<select class="ccmx_select" name="orderState">
								<option value="">
									委托状态
								</option>
								<option value="1">
									已委托
								</option>
								<option value="2">
									已成交
								</option>
								<option value="3">
									已撤单
								</option>
							</select>
							<select class="ccmx_select" name="buySell"
								style="margin-left: 3%;">
								<option value="" selected="selected">
									买/卖
								</option>
								<option value="1">
									买
								</option>
								<option value="2">
									卖
								</option>
							</select>
						</li>
						<li class="ccmx_selectBox">
							<select class="ccmx_select" name="type">
								<option value="" selected="selected">
									建仓/平仓
								</option>
								<option value="1">
									建仓
								</option>
								<option value="2">
									平仓
								</option>
							</select>
							<span class="tsust_has" id="buttonCommit" style="color: white;"> 查询 </span>
						</li>
					</ul>
				</form>

				<div id="scroller" style="margin-bottom: 10px;">
					<div class="new_table">
						<c:if test="${!empty list}">
							<c:forEach var="_tsust" items="${list}">
								<div class="main_t">
									<ul class="new_tr">
										<li class="new_li">
											<div class="sp">
												<div class="tb">
													<img src="<%=_basePath%>images/fl.png" />
												</div>
												<div class="dqsp">
													<div class="name1">
														${_tsust.CO_I }
													</div>
													<div class="name">
														商品
													</div>
												</div>
												<div class="tb">
													<img src="<%=_basePath%>images/dh.png" />
												</div>
												<div class="dqsp">
													<div class="name1">
														${_tsust.OR_N }
													</div>
													<div class="name">
														委托单号
													</div>
												</div>
											</div>
										</li>
										<li class="new_li">
											<div class="sp">
												<div class="tb">
													<img src="<%=_basePath%>images/maimai.png" />
												</div>
												<div class="dqsp">
													<div class="name1">
														<c:if test="${_tsust.TYPE==1}">买</c:if>
														<c:if test="${_tsust.TYPE==2}">卖</c:if>
													</div>
													<div class="name">
														买卖方向
													</div>
												</div>
												<div class="tb">
													<img src="<%=_basePath%>images/sl.png" />
												</div>
												<div class="dqsp">
													<div class="name1">
														${_tsust.QTY }
													</div>
													<div class="name">
														数量
													</div>
												</div>
											</div>

										</li>
										<li class="new_li">
											<div class="sp">
												<div class="tb">
													<img src="<%=_basePath%>images/qian1.png" />
												</div>
												<div class="dqsp">
													<div class="name1">
														${_tsust.PRI }
													</div>
													<div class="name">
														委托价
													</div>
												</div>
											</div>
										</li>
									</ul>

								</div>
							</c:forEach>
						</c:if>
						 


						<div class="more_box" style="text-align: center;">
							<c:if test="${empty list}">未查询到相关数据!</c:if>
						</div>

					</div>
				</div>

				<!-- 对话框 -->
				<div id="bg"></div>
				<div class="fx_neir" id="fx_neir">
				<div class="yhxx1">
					<div class="xxbt">
						<div class="bt1">
							委托明细表
						</div>

					</div>
					<div class="shuju">
						<div class="shuju1">
							<div class="sj-bt">
								持仓单号
							</div>
							<div class="sj-xx">
								56789
							</div>
						</div>
						<div class="shuju2">
							<div class="sj-bt">
								商品名称
							</div>
							<div class="sj-xx">
								大圆银10千克
							</div>
						</div>
					</div>
					<div class="shuju">
						<div class="shuju1">
							<div class="sj-bt">
								买/卖
							</div>
							<div class="sj-xx">
								买
							</div>
						</div>
						<div class="shuju2">
							<div class="sj-bt">
								数量
							</div>
							<div class="sj-xx">
								1
							</div>
						</div>
					</div>
					<div class="shuju">
						<div class="shuju1">
							<div class="sj-bt">
								数量
							</div>
							<div class="sj-xx">
								1
							</div>
						</div>
						<div class="shuju2">
							<div class="sj-bt">
								委托价
							</div>
							<div class="sj-xx">
								100
							</div>
						</div>
					</div>
					<div class="shuju">
						<div class="shuju1">
							<div class="sj-bt">
								止损价
							</div>
							<div class="sj-xx">
								100
							</div>
						</div>
						<div class="shuju2">
							<div class="sj-bt">
								止盈价
							</div>
							<div class="sj-xx">
								100
							</div>
						</div>
					</div>
					<div class="shuju">
						<div class="shuju1">
							<div class="sj-bt">
								冻结保证金
							</div>
							<div class="sj-xx">
								0
							</div>
						</div>
						<div class="shuju2">
							<div class="sj-bt">
								冻结手续费
							</div>
							<div class="sj-xx">
								0
							</div>
						</div>
					</div>
					<div class="shuju">
						<div class="shuju1">
							<div class="sj-bt">
								委托单状态
							</div>
							<div class="sj-xx">
								已委托
							</div>
						</div>
						<div class="shuju2">
							<div class="sj-bt">
								建仓时间
							</div>
							<div class="sj-xx">
								2015-01-23 11:39:01
							</div>
						</div>
					</div>
					<div class="shuju">
						<div class="shuju1">
							<div class="sj-bt">
								有效期限
							</div>
							<div class="sj-xx">
								当日有效
							</div>
						</div>
						<div class="shuju2">
							<div class="sj-bt">
								电话交易员
							</div>
							<div class="sj-xx"></div>
						</div>
					</div>
				</div>
				<div>
 
						<div class="fx_bottom2 dl_bottom right">
							<div class="anniu" id="detailPageReturn">
								返回
							</div>
						</div>  
				</div>

			</div>


				
			</div>
		</div>
		
				<div class="fx_neir">

					<!-- geren_info --><jsp:include page="../user/userInfo.jsp" />
				</div>
				<!-- menu -->
				<jsp:include page="../menu/menu.jsp" />
	</body>
	<script type="text/javascript">
	$(function() {
		$("#logout").click(function() {//退出
					if (confirm("确定要登出吗？")) {
						frm.submit();
					}
					;
				});
		$("#buttonCommit").click(function() {//委托条件查询 
					frmQuery.submit();
				});

		//选中单个委托单查看详情 
		var $checked =false;
		$('.main_t').toggle(function() {
			$('.main_t').each(function() {
				$(this).css("background", "");
			});
			$(this).css( {
				"background" : "#F4D5D8",
				"border" : "1px solid #DF7118"
			});
			$checked = true;
			//$('#hidd_hold_mess').attr("value",$(this).find("input").first().val());
			}, function() {
				$('.main_t').each(function() {
					$(this).css( {
						"background" : "",
						"border" : ""
					});
				});
				//$('#hidd_hold_mess').attr("value","");
				$checked = false;
			});
		
		//委托单详情 
		//$(".main_t").click(function(){
			//if($checked){
			//	$("#bg").css({ display: "block"});
				//$("#fx_neir").css({ display: "block" });
			//} 
			//});

		//返回 
		$("#detailPageReturn").click(function(){
			$("#bg").css({ display: "none"});
			$("#fx_neir").css({ display: "none" });
			});
	});
</script>
</html>