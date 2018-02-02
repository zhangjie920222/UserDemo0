<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../public/taglib.jsp"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path;
	String _basePath = basePath + "/app/toc/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
		<meta name="viewport"
			content="width=device-width,target-densitydpi=medium-dpi,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
		<link rel=stylesheet type="text/css" href="<%=_basePath%>css/1.css"
			title="cool">
		<title>持仓明细</title>
		<script type="text/javascript">
	function clickabc() {
		var xlk1 = document.getElementById('xlk1');
		xlk1.style.display = "block";
	}
	function clickabc1() {
		var xlk2 = document.getElementById('xlk2');
		xlk2.style.display = "block";
	}
</script>

		<style>
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
		<div class="fx_top">
			<div class="fx_bt">
				<div class="center">
					指价委托单
				</div>
				<div class="tuic">
					<a href="fxts.html"><img src="<%=_basePath%>images/tuic.png" />
					</a>
				</div>
			</div>

		</div>
		<div class="fx_neir">


			<div class="clear zuiwai">
			<c:if test="${!empty list}">
			<c:forEach var="_specified" items="${list}" >
				<div class="main-top">
				<input type="hidden" value="${_specified}"/><!-- 委托对象 -->	
				<input type="hidden" value="${_specified.OR_N}"/><!-- 委托单号 -->
					<div class="hq">
						<div class="sp">
							<div class="tb">
								<img src="<%=_basePath%>images/fl.png" />
							</div>
							<div class="dqsp">
								<div class="name1">
									${_specified.CO_I }
								</div>
								<div class="name">
									当前商品
								</div>
							</div>
							<div class="tb">
								<img src="<%=_basePath%>images/dh.png" />
							</div>
							<div class="dqsp">
								<div class="name1">
									${_specified.OR_N }
								</div>
								<div class="name">
									单号
								</div>
							</div>
						</div>

					</div>
					<div class="hq">
						<div class="sp">
							<div class="tb">
								<img src="<%=_basePath%>images/maimai.png" />
							</div>
							<div class="dqsp">
								<div class="name1">
									<c:if test="${_specified.TYPE==1}">买</c:if><c:if test="${_specified.TYPE==2}">卖</c:if>
								</div>
								<div class="name">
									买卖方向
								</div>
							</div>
							<div class="dqsp">
							<div class="name"><img src="<%=_basePath %>images/zy.png"/>止盈：<span><c:if test="${_specified.STOP_PROFIT==0}">--</c:if><c:if test="${_specified.STOP_PROFIT!=0}">${_HOLD.STOP_PROFIT}</c:if></span></div>
							<div class="name"><img src="<%=_basePath %>images/zs.png"/>止损：<span><c:if test="${_specified.STOP_LOSS==0}">--</c:if><c:if test="${_specified.STOP_LOSS!=0}">${_HOLD.STOP_LOSS}</c:if></span></div>
							</div>
						</div>

					</div>
					<div class="hq">
						<div class="sp">
							<div class="tb">
								<img src="<%=_basePath%>images/qian1.png" />
							</div>
							<div class="dqsp">
								<div class="name1">
									${_specified.PRI }
								</div>
								<div class="name">
									委托价
								</div>
							</div>
							 <div class="tb">
								<img src="<%=_basePath%>images/sl.png" />
							</div>
							<div class="dqsp">
								<div class="name1">
									${_specified.QTY }
								</div>
								<div class="name">
									委托数量
								</div>
							</div>
						</div>

					</div>

				</div>
				</c:forEach>
				</c:if>
				<input type="hidden" id="hidden_param_value" name="hidden_param_value" value=""/><!-- 保存对象 -->
				<input type="hidden" id="hidden_order_no" name="hidden_order_no" value=""/><!-- 保存委托单号 -->
		 
			</div>
			<div class="more_box" style="text-align: center;">
							<c:if test="${empty list}">未查询到相关数据!</c:if>
						</div>
			<div class="jiangc">
				<div class="fx_bottom1 dl_bottom left">
					<div class="anniu" id="cancelOrderId" >
						撤销委托单
					</div>
				</div>
				 
					<div class="fx_bottom2 dl_bottom right">
						<div class="anniu" id="orderDetail">
							委托单详情
						</div>
					</div>  
			</div>

			<%--持仓详情部分 start --%>
			<div id="bg"></div>
			<div class="fx_neir" id="fx_neir">
				<div class="yhxx1">
					<div class="xxbt">
						<div class="bt1">
							指价委托明细表
						</div>
					</div>
					<div class="shuju">
						<div class="shuju1">
							<div class="sj-bt">
								持仓单号
							</div>
							<div class="sj-xx">
								 
							</div>
						</div>
						<div class="shuju2">
							<div class="sj-bt">
								商品名称
							</div>
							<div class="sj-xx">
								 
							</div>
						</div>
					</div>
					<div class="shuju">
						<div class="shuju1">
							<div class="sj-bt">
								买/卖
							</div>
							<div class="sj-xx">
								 
							</div>
						</div>
						<div class="shuju2">
							<div class="sj-bt">
								数量
							</div>
							<div class="sj-xx">
								 
							</div>
						</div>
					</div>
					<div class="shuju">
						<div class="shuju1">
							<div class="sj-bt">
								数量
							</div>
							<div class="sj-xx">
								 
							</div>
						</div>
						<div class="shuju2">
							<div class="sj-bt">
								委托价
							</div>
							<div class="sj-xx">
								 
							</div>
						</div>
					</div>
					<div class="shuju">
						<div class="shuju1">
							<div class="sj-bt">
								止损价
							</div>
							<div class="sj-xx">
								 
							</div>
						</div>
						<div class="shuju2">
							<div class="sj-bt">
								止盈价
							</div>
							<div class="sj-xx">
								 
							</div>
						</div>
					</div>
					<div class="shuju">
					<div class="shuju1">
							<div class="sj-bt">
								委托单状态
							</div>
							<div class="sj-xx">
								 
							</div>
						</div>
						<div class="shuju2">
							<div class="sj-bt">
								冻结手续费
							</div>
							<div class="sj-xx">
								 
							</div>
						</div>
						
					</div>
					 
					 
				</div>
				<div>

					<div class="fx_bottom1 dl_bottom left">
						<div class="anniu" id="cancelOrderId2">
							撤销委托单
						</div>
					</div>
					 
						<div class="fx_bottom2 dl_bottom right">
							<div class="anniu" id="detailPageReturn">
								返回
							</div>
						</div>  
				</div>

			</div>
			<%--持仓详情部分 end --%>
			<div id="test"></div>

			<!-- geren_info --><jsp:include page="../user/userInfo.jsp" />

		</div>
		<!-- menu --><jsp:include page="../menu/menu.jsp" />
	</body>
	
	<script type="text/javascript">
		$(function(){
				//退出
				$("#logout").click(function(){
					if(confirm("确定要登出吗？")){
						frm.submit();
					};
				});
				//委托条件查询
				$("#buttonCommit").click(function (){ 
					frmQuery.submit();
					});
				//选中单个委托单查看详情 
				var $checked =false;
				$('.main-top').toggle(
						function(){
							$('.main-top').each(function(){
								$(this).css("background","");
							});
							$(this).css({"background":"#F4D5D8","border":"1px solid #DF7118"});
							$checked = true;
							//TODO 获取到委托单号   撤销委托用 
							
							$('#hidden_param_value').attr("value",$(this).find("input").first().val());
							$('#hidden_order_no').attr("value",$(this).find("input").first().next().val());
							//alert($('#hidden_order_no').val());
						},function(){
							$('.main-top').each(function(){
								$(this).css({"background":"","border":""});
							});		
							//$('#hidd_hold_mess').attr("value","");
							$checked = false;
						}	
					);

				//解析字串
				var _func_analysisStr = function(_string_obj,_first_regex,_second_regex)
				{
					return _string_obj.replace("]",",").replace("["," ").split(_first_regex)[1].split(_second_regex)[0];
				}
				//返回 
				$("#detailPageReturn").click(function(){
					$("#bg").css({ display: "none"});
					$("#fx_neir").css({ display: "none" });
					});
				//委托单详情 
				$("#orderDetail").click(function(){
					if($checked){
						$("#bg").css({ display: "block"});
						$("#fx_neir").css({ display: "block" });
					 		//获取到整个对象 
						    var _hold_string = $('#hidden_param_value').val();
						     
					        var func_hold_analysis = function(attrName)
					        {
						      if(attrName==""||attrName==" P")
						  	      return "--";
						      return _func_analysisStr(_hold_string,attrName+"=",",");
					        }
							var _arr_hold = new Array();
							var _arr_hold_attr = new Array(" OR_N"," CO_I"," TYPE"," QTY"," PRI"
									," STOP_LOSS"," STOP_PROFIT"," F_MAR"," F_FEE"," STA"," TIME");
							for( var v in _arr_hold_attr )
							{
								// window.alert(_arr_hold_attr[v]+"--"+func_hold_analysis(_arr_hold_attr[v]));
								var _attr = _arr_hold_attr[v];
								var _tmp = func_hold_analysis(_attr);
								if(_arr_hold_attr[v]==" TYPE")
								{
									if(_tmp==1)
									{
										_arr_hold[v] = "买";
									}else
									{
										_arr_hold[v] = "卖";
									}
								} else
								{
									_arr_hold[v] = _tmp;
								}
							}
							$('.sj-xx').each(function(i){
								$(this).text(_arr_hold[i])
							});
							 
						
					}else{
						alert("没有选中委托单!");
						}
					});
				//撤销委托 
				$('#cancelOrderId').bind("click",function(){
					if($checked){
						var $orderNo = $('#hidden_order_no').val();
						$.ajax({
							type:"post",
							url:"<%=basePath%>/tocServlet",
							data:"reqName=order_wd&orderNo="+$orderNo,
							success:function(msg){
								alert(msg);
							}
						});
						}else{
							alert("没有选中委托单!");
						}
				});

				//详情撤销委托 
				$('#cancelOrderId2').bind("click",function(){
					var $orderNo = $('#hidden_order_no').val();
						$.ajax({
							type:"post",
							url:"<%=basePath%>/tocServlet",
							data:"reqName=order_wd&orderNo="+$orderNo,
							success:function(msg){
								alert(msg);
							}
						});
				});
 
		 });


				
	</script>
	<style>
		.b{ display: block;}
	</style>
</html>
