<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@ include file="../../public/taglib.jsp"%>
<%@ include file="../../public/path.jsp"%>
<!DOCTYPE>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<meta name="viewport"
			content="width=device-width,target-densitydpi=medium-dpi,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
		<link rel=stylesheet type="text/css" href="<%=skinPath%>css/1_liuqw.css" title="cool">
		<script type="text/javascript" src="<%=basePath%>js/jquery-1.6.min.js"></script>
		<title>${pageTitle}</title>
		<style type="text/css"></style>
	</head>
	<body style="margin:0 auto;">
	<div id="list">
		<div class="bt1" style="color:white;margin:0 auto;margin-bottom:20px;"><span>持仓</span>
        <a id="cc_bufen_title" href="javascript:location.href='<%=basePath%>/jsp/user/userInfo.jsp'">
       <img id="cc_bufen_title" href="javascript:location.href='<%=basePath%>/jsp/user/userInfo.jsp'" style="float:right;margin-top:15px;padding-right:20px;" src="<%=basePath %>images/back.png"/></a> 
     </div>
		<%-- <a id="cc_bufen_title" href="javascript:location.href='<%=basePath%>/jsp/user/userInfo.jsp'"><div class="fanhui">
				持仓
			</div>
		</a> --%>
		<div class="tishikuang11" id="cc_bufen" style="height:99%;padding-top: 2px;">
		<div class="liuqw_div" style="width:100%;text-align: center;height:30px;">
			<div class="liuqw_div" style="width:20%;float: left;text-align: center;">盈亏</div>
			<div style="width:55%;float: left;text-align: center;" class="liuqw_div">持仓</div>
			<div style="width:20%;float: left;text-align: right;" class="liuqw_div">操作</div>
		</div>
		<div class="tishikuang0_221" style="height:90%;padding-top: 2px;">
			<div id="scroller">
				<c:forEach var="hold" items="${HOLDLIST}">
					<div class="bottom1">
						<div title="${hold.H_ID}" id="${hold.CO_I}" class="holdInfo">
							<div class="bottom_1 left">
								<span id="db_1043" style="color: red;" 
									class="${hold.CO_I}_profit_and_loss" 
									openPrice="${hold.PR}" 
									holdQty = "${hold.C_QTY}"
									holdId = "${hold.H_ID}" 
									bsType="${hold.TY }">0.80</span>
							</div>
							<div class="bottom_2 left">${hold.C_QTY}手<c:if test="${hold.TY==1}">买涨</c:if><c:if test="${hold.TY==2}">买跌</c:if></div>
							<div class="bottom_2 left">
								<div class="bottom_2_1 cmdName">${hold.CO_I}</div>
								<div class="bottom_2_1"><span id="pri_1043">${hold.PR}</span></div>
							</div>
						</div>
						<div class="bottom_3 right zhuanrangBtn" id="zran_AG100g" holdId="${hold.H_ID}">转让</div>
						<input type="hidden" id="${hold.H_ID}_openPrice" value="${hold.PR}">
						<input type="hidden" id="${hold.H_ID}_qty" value="${hold.C_QTY}">
						<input type="hidden" id="${hold.H_ID}_bsType" value="${hold.TY}">
						<input type="hidden" id="${hold.H_ID}_margin" value="${hold.MAR}">
						<input type="hidden" id="${hold.H_ID}_cmdId" value="${hold.CO_I}">
						<input type="hidden" id="${hold.H_ID}_sellPrice" value="">
					</div>
				</c:forEach>
			</div>
		</div>
		</div>
		</div>
		<div class="zhuanrang" id="zhuanrang">
			<div class="refrash3" id="closeOrderrefrash"></div>
			<div class="zhuanrang1">
				<div class="zhuanrang1-1" style="background:#f16063;color:white">确定转让</div>
				<!-- <div class="fgx"></div> -->
				<div class="zhuanrang1-2">5铜原油（120元）</div>
				<div class="zhuanrang1-1 zhuanrang1-1-1">5铜原油（120元）</div>
				<div class="shuliang02" style="margin-top:10px;">
					<div class="shuliang02-1 cjcd_btn1 " id="ZRCencle"  style="height:30px;line-height:30px;">取消</div>
					<div class="shuliang02-2 cjcd_btn2 " id="ZRSure">确定</div>
				</div>
			</div>
		</div>
		<div id="gnnt_filter"></div>
		<form action="<%=path%>/tocServlet" name="frm" id="frm" method="post">
			<input type="hidden" name="reqName" value="holdaposition">
			<input type="hidden" name="_co_i" id="_co_i" value="">
			<input type="hidden" name="_h_id" id="_h_id" value="">
			<input type="hidden" name="fromType" id="from" value="hodllist">
		</form>
	</body>
	<script type="text/javascript">
		//所有商品信息的JSON串
		var cmdInfos = eval('${commodity_info}');
		//展示的商品与品种的对应关系
		var showedCmd = eval('${show_commodity}');
		//转让层
		var zhuanrang = $("#zhuanrang");
		var width = zhuanrang.width();
		var height = zhuanrang.height();
		zhuanrang.css("left",($(window).width()-width)/2);
		zhuanrang.css("top",($(window).height()-height)/2);
		//转让层刷新
		var closeOrderrefrash = $("#closeOrderrefrash");
		//过滤层
		var filter = $("#gnnt_filter");
		$(function(){
			//根据商品代码从所有商品信息的JSON串中找出指定商品
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
			//根据品种id获取商品代码
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
			$.setCmdName = function(){
				$(".cmdName").each(function(){
					var cmdId = $(this).html();
					
					var cmdInfo = $.getCmdInfo(cmdId);
					$(this).html(cmdInfo["CO_N"]);
				});
			}
			$.updateFloatProfitAndLost = function(qn){
				var breadId = qn["BD"];
				var sellPrice = Number(qn["S"]);//卖价
				var buyPrice = qn["B"];//买价
				var cmdIds = $.getShowedCmdId(breadId).split(",");
				for(var i=0;i<cmdIds.length;i++){
					var cmdId = cmdIds[i];
					var cmdInfo = $.getCmdInfo(cmdId);
					var CTS = cmdInfo["CT_S"];//合约因子
					$("."+cmdId+"_profit_and_loss").each(function(){
						var bsType = $(this).attr("bsType");
						var openPrice = $(this).attr("openPrice");
						var holdQty=$(this).attr("holdQty");
						var ft_pf_lt;
						if(bsType==1){//买涨建仓
							ft_pf_lt = (sellPrice-openPrice)*holdQty*CTS;
						}else if(bsType==2){//买跌建仓
							ft_pf_lt = (openPrice-buyPrice)*holdQty*CTS;
						}else{
							alert("无法解析买卖方向："+bsType);
							return;
						}
						if(ft_pf_lt>0){
							$(this).css("color","red");
						}else{
							$(this).css("color","#0F0");
						}
						$(this).html(ft_pf_lt.toFixed(2));
						var holdId = $(this).attr("holdId");
						$("#"+holdId+"_sellPrice").val(sellPrice);
					});
				}
			}
			var for_hq;
			$.floatProfitAndLossController = function(){
				$.ajax({
					type:"post",
					url:"<%=path%>/tocServlet?t="+new Date(),
					contentType: "application/x-www-form-urlencoded; charset=GBK",
					data:{reqName:"quotation"},
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
									$.updateFloatProfitAndLost(temp);
								}
							}else if(retCode == -201){
								alert("您的账号在另一个地点登陆，您已被迫下线！");
								clearInterval(for_hq);
								//$.relogon();
								location.href = "<%=basePath%>jsp/logon/logon.jsp";
							}else if(retCode == -2001){
								alert("您的账号已失效，请重新登录！");
								clearInterval(for_hq);
								//$.relogon();
								location.href = "<%=basePath%>jsp/logon/logon.jsp";
							}else{
								alert("查询行情失败，请重新登录！");
								clearInterval(for_hq);
								location.href = "<%=basePath%>jsp/logon/logon.jsp";
							}
						}
					}
				});
			}
			var _tmp_pri_ms;
			var _tmp_pri;
			var _tmp_c_qty_number;
			var _tmp_ty_cn;
			var _tmp_ty;
			var _tmp_co_i;
			var _tmp_h_id;
			//转让按钮
			$(".zhuanrangBtn").click(function(){
				var holdId = $(this).attr("holdId");
				_tmp_h_id = holdId;
				var margin = $("#"+holdId+"_margin").val();
				var cmdId = $("#"+holdId+"_cmdId").val();
				_tmp_co_i = cmdId;
				var name = $.getCmdInfo(cmdId)["CO_N"];
				_tmp_pri_ms = Number(margin);
				var openPrice = $("#"+holdId+"_openPrice").val();
				_tmp_pri = Number(openPrice);
				var qty = $("#"+holdId+"_qty").val();
				_tmp_c_qty_number = Number(qty);
				var bsType = $("#"+holdId+"_bsType").val();
				_tmp_ty = 2;
				var _tmp_ty_cn = "买涨";
				if(bsType ==2){
					_tmp_ty_cn = "买跌";
					_tmp_ty = 1;
				}
				$(".zhuanrang1-2").html(name+"（"+_tmp_pri_ms.toFixed(2)+"元）");
				$(".zhuanrang1-1-1").html(Number(_tmp_pri).toFixed(2)+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+_tmp_c_qty_number+"手&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+_tmp_ty_cn);
				filter.show();
				zhuanrang.show();
				closeOrderrefrash.hide();
			});
			//取消转让
			$("#ZRCencle").click(function(){
				closeOrderrefrash.hide();
				zhuanrang.hide();
				filter.hide();
			});
			//确定转让
			$("#ZRSure").click(function(){
				var price = $("#"+_tmp_h_id+"_sellPrice").val();
				$.ajax({
					type:"post",
					url:"<%=path%>/tocServlet?t="+new Date(),
					contentType: "application/x-www-form-urlencoded; charset=UTF-8",
					data:"reqName=_sjpc_tj_1&_ty="+_tmp_ty+"&_co_i="+_tmp_co_i+"&co_price="+price+"&_c_qty_number="+_tmp_c_qty_number+"&_h_id="+_tmp_h_id,
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
								alert("操作成功！");
								zhuanrang.hide();
								filter.hide();
								location.href = "<%=path%>/tocServlet?reqName=GETHOLDLIST";
							}else{
								var msg = data["msg"];
								alert(msg);
								zhuanrang.hide();
								filter.hide();
							} 
						}
					}
				});
			});
			$(".holdInfo").click(function(){
				var cmdId = $(this).attr("id");
				$("#_co_i").val(cmdId);
				var holdId = $(this).attr("title");
				$("#_h_id").val(holdId);
				frm.submit();
			});
			$.setCmdName();
			$.floatProfitAndLossController();
			for_hq = setInterval($.floatProfitAndLossController,3000);
		});

          var h = $(".tishikuang11").height();
                 $(".tishikuang0_221").height(h-60);
	</script>
</html> 