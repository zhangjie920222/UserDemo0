<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ include file="../../public/taglib.jsp" %>
<%@ include file="../../public/path.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<meta name="viewport" content="width=device-width,target-densitydpi=medium-dpi,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
<link rel="stylesheet" href="<%=skinPath %>/css/1_liuqw.css" type="text/css"></link>

 <link rel="stylesheet" type="text/css" href="<%=skinPath%>/css/model.css" media="all">
<script type="text/javascript" src="<%=basePath%>js/jquery-1.6.min.js"></script>
<title>订单详情</title>

<style type="text/css">
	#gnnt_filter{
		 background-color: #000;
		 position: fixed;
		 top: 0px;
		 left: 0px;
		 width: 100%;
		 height: 100%;
		 opacity: 0.5;
		 z-index:9;
		 filter: alpha(opacity=50);
		 display: none;}
	#bg
	{ 	display: none;  
		position: fixed;  
		top: 0%;  
		left: 0%;  
		width: 100%;  
		height: 100%;  
		background-color: gray;  
		/* z-index:1001;   */
		-moz-opacity: 0.7;  
		opacity:.70;  
		filter: alpha(opacity=70);
		}  
    #zyzs
    {
	    display: none;  
    } 
	._zy_span {display:block-inline;border:1px solid gray;margin-left:20px;}
	._zs_span {display:block-inline;border:1px solid gray;margin-left:20px;}
	.STYLE1 {color:#F16063;background:#fff;}
.STYLE1cd {background:#F16063;}
.STYLE1cd span{color:#fff;}
.STYLE2 {color:#1d9d56;background:#fff;}
.STYLE2cd {background:#1d9d56;}
.STYLE2cd span{color:#fff;}
</style>
</head>

<body>
	<!-- <div class="fanhui" id="_title_detail"></div> -->
	<div class="bt1" id="_title_detail" style="color:white;margin:0 auto;margin-bottom:20px;"><span></span>
     <img style="float:right;margin-top:15px;padding-right:20px;" src="<%=basePath %>images/back.png"/> 
    </div>
	<div style="height:680px;">
		<div class="tishikuang0_2" style="height:280px;">
			<div class="gao">
				<div class="zhi0-1 left">订单号</div>
				<div class="shu right">${_ccmx.h_ID}</div>
			</div>
			<div class="gao">
				<div class="zhi0-1 left">订立时间</div>
				<div class="shu right">${_ccmx.OR_T}</div>
			</div>
			<div class="gao">
				<div class="zhi0-1 left">订立价格</div>
				<div class="shu right" id="openPrice"><fmt:formatNumber value="${_ccmx.PR}" pattern="##.##" minFractionDigits="2" ></fmt:formatNumber></div>
			</div>
			<div class="gao">
				<div class="zhi0-1 left">持仓价格</div>
				<div class="shu right" id="holdPrice"><fmt:formatNumber value="${_ccmx.h_P}" pattern="##.##" minFractionDigits="2" ></fmt:formatNumber></div>
			</div> 
			<div class="gao">
				<div class="zhi0-1 left">方向</div>
				<div class="shu right" style="color:#FF0000"><c:if test="${_ccmx.TY==1}">买涨</c:if><c:if test="${_ccmx.TY==2}">买跌</c:if></div>
			</div>
			<div class="gao">
				<div class="zhi0-1 left">数量</div>
				<div class="shu right">${_ccmx.c_QTY}</div>
			</div>
		</div>
		<div class="tishikuang0_2" style="height:135px;">
			<div class="gao">
				<div class="zhi0-1 left">止盈</div>
				<div class="shu right">${zybl }</div>
				<input id="_hid_in_stop_profit" type="hidden" value="${zybl }">
			</div>
			<div class="gao">
				<div class="zhi0-1 left">止损</div>
				<div class="shu right">${zsbl}</div>
				<input id="_hid_in_stop_loss" type="hidden" value="${zsbl }">
			</div>
			<div class="gao" onclick="$.Onyingsun(1)">
				<div class="zhi0-1 left">设置</div>
				<div class="tu right"></div>
			</div>
		</div>
		<div class="tishikuang0_2" style="height:135px;">
			<div class="gao">
				<div class="zhi0-1 left">合同金额</div>
				<div class="shu right" id="_price_ht"><fmt:formatNumber value="${_ccmx.MAR}" pattern="##.##" minFractionDigits="2" ></fmt:formatNumber></div>
			</div>
			<div class="gao">
				<div class="zhi0-1 left">浮动盈亏</div>
				<div id="_now_flow" class="shu right" style="color:#FF0000;">0元（0）</div>
			</div>
			<%--
			<div class="gao">
				<div class="zhi0-1 left">本次盈余</div>
				<div class="shu right" id="_yingyu">120.5元</div>
			</div>
			 --%>
		</div>
		<!-- <div class="tishikuang0_31" style="text-align:left; line-height:25px; color:#FF0000; font-size:12px;">注：如果该订单在结算时间(凌晨04:00)前还未转让，将会被强行转让</div> -->
	</div>
	<div class="dibu">
		<div class="dibu-5 left" id="pc_pri">转让价：${_ccmx.PR}</div>
		<div class="dibu-4 right" onclick="$.zhuanrang()">我要转让</div>
	</div>
	<div class="zhuanrang" id="zhuanrang">
		<div class="zhuanrang1" style="border:0;border-radius:0;padding:0;">
			<div class="zhuanrang1-1" style="background:#f16063;color:white;">确定转让</div>
						<div class="zhuanrang1-2" id="_sp_mess" style="color:black;">现货白银（${_ccmx.PR}元）</div>
			<div class="zhuanrang1-1" style="color:black;"><fmt:formatNumber value="${_ccmx.PR}" pattern="##.##" minFractionDigits="2" ></fmt:formatNumber>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${_ccmx.c_QTY}批&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<c:if test="${_ccmx.TY==1}">买涨</c:if><c:if test="${_ccmx.TY==2}">买跌</c:if></div>
			<div class="shuliang02">
				<div class="shuliang02-1 cjcd_btn1" id="quxiao" onclick="clickabc2()">取消</div>
				<div class="shuliang02-2 cjcd_btn2" id="queding" onclick="$.marketPriceCloseOut()">确定</div>
			</div>
		</div>
	</div>
	<%-- 止盈隐藏域 --%>
	<input type="hidden" id="hq_price"/>
	<%-- 止盈隐藏域 --%>
	<input type="hidden" value="${_ccmx.STOP_PROFIT}" id="_profit_stop"/>
	<%-- 止盈隐藏域 --%>
	<input type="hidden" value="${_ccmx.STOP_LOSS}" id="_loss_stop"/>
	<%-- 设置止盈，止损 --%>
	<div id="bg"></div>
	
	<div class="zyzs" id="zyzs" style="display:none;padding-bottom:10px;width:80%;left:10%;">
	
	<div class="cjcd_t1"  style="color:white;">设置止盈止损</div>
	<div class="cjcd_j1" id="_jianjie"></div>
	<div class="cjcd_j1">
						止盈：&nbsp;&nbsp;
						<table width="100%" border="0" cellpadding="0" cellspacing="0"
							class="mytable">
							<tr>
								<td align="center" id="zybs" class="STYLE1ed _zy"><span>不设</span></td>
								<td align="center" class="STYLE1 _zy"><span>10%</span></td>
								<td align="center" class="STYLE1 _zy"><span>20%</span></td>
								<td align="center" class="STYLE1 _zy"><span>30%</span></td>
								<td align="center" class="STYLE1 _zy"><span>40%</span></td>
							</tr>
							<tr>
								<td align="center" class="STYLE1 _zy"><span>50%</span></td>
								<td align="center" class="STYLE1 _zy"><span>60%</span></td>
								<td align="center" class="STYLE1 _zy"><span>70%</span></td>
								<td align="center" class="STYLE1 _zy"><span>80%</span></td>
								<td align="center" class="STYLE1 _zy"><span>90%</span></td>
							</tr>
						</table>
					</div>
					<div class="cjcd_j1">
						止损：&nbsp;&nbsp;
						<table width="100%" border="0" cellpadding="0" cellspacing="0"
							class="mytable1">
							<tr>
								<td align="center" id="zsbs" class="STYLE1ed zhisun"><span>不设</span></td>
								<td align="center" class="STYLE1 _zs"><span>10%</span></td>
								<td align="center" class="STYLE1 _zs"><span>20%</span></td>
								<td align="center" class="STYLE1 _zs"><span>30%</span></td>
								<td align="center" class="STYLE1 _zs"><span>40%</span></td>
							</tr>
							<tr>
								<td align="center" class="STYLE1 _zs"><span>50%</span></td>
								<td align="center" class="STYLE1 _zs"><span>60%</span></td>
								<td align="center" class="STYLE1 _zs"><span>70%</span></td>
								<td align="center" class="STYLE1 _zs"><span>80%</span></td>
								<td align="center" class="STYLE1 _zs"><span>90%</span></td>
							</tr>
						</table>
					</div>
					<div class="cjcd_j1">提示：止盈止损不包含手续费</div>	
	
			<input id="zys_y_num" name="zys_y_num" type="hidden"/>
			<input id="zys_s_num" name="zys_s_num" type="hidden"/>
			<input id="openpri" type="hidden"/>
			<div class="cjcd_btn1" style="height:30px;line-height:30px;" onclick="$.Onyingsun(2)" id="zyzscencle">取消</div>
            <div class="cjcd_btn2" style="height:30px;line-height:30px;" onclick="$.ajaxSubmitys()" >确定</div>
		</div>
	<form action="<%=path%>/tocServlet" name="frm" id="frm" method="post">
			<input type="hidden" name="reqName" value="holdaposition">
			<input type="hidden" name="_co_i" id="_co_i" value="${_ccmx.CO_I}">
			<input type="hidden" name="_h_id" id="_h_id" value="${_ccmx.h_ID}">
			<input type="hidden" name="fromType" id="from" value="${fromType }">
	</form>
	<div id="gnnt_filter"></div>
</body>
<script type="text/javascript">
$(function(){

	//底层滤镜
	var filter = $("#gnnt_filter");
	//所有商品信息的JSON串
	var cmdInfos = eval('${commodity_info}');

	//持仓详情
	var holdDetail = "${_ccmx}";

	//商品代码
	var _tmp_co_i ;

	//每手价
	var _tmp_pri_ms;

	//平仓价
	var _tmp_co_price ;

	//解析字串
	$._func_analysisStr = function(_string_obj,_first_regex,_second_regex)
	{
		return _string_obj.replace("]",",").replace("["," ").split(_first_regex)[1].split(_second_regex)[0];
	}

	$.func_hold_analysis = function(attrName)
    {
      return $._func_analysisStr(holdDetail," "+attrName+"=",",");
    }

	//商品代码
	_tmp_co_i = $.func_hold_analysis("CO_I");

	//持仓方向
	var bs = $.func_hold_analysis("TY");
	var bs_cn = bs==1?"买涨":"买跌";
	var bs_pc = bs==1?2:1;
	//行情买价
	var b_p;
	//行情卖价
	var s_p;

	//建仓价
	var _pr = $.func_hold_analysis("PR");

	//委托数量
	var _tmp_c_qty_number = $.func_hold_analysis("C_QTY");


	//止盈止损div
	var gainLoss = $("#zyzs");
	var width = gainLoss.width();
	var height = gainLoss.height();
	gainLoss.css("left",($(window).width()-width)/2);
	gainLoss.css("top",($(window).height()-height)/2);
	
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

	//商品信息
	var cmd = $.getCmdInfo(_tmp_co_i);

	//止盈值
	var zys_y_num;
	//止损值
	var zys_s_num;

	//初始化 设置 赢损  
	/* $("._zy").toggle(function(){
		$("._zy").css("background","");
		$(this).css("background","#076da5");
		$("#_profit_stop").attr("value",$(this).text());
	},function(){
		$(this).css("background","");
		$("#_profit_stop").attr("value","");
	});

		$("._zs").toggle(function(){
		$("._zs").css("background","");
		$(this).css("background","#076da5");
		$("#_loss_stop").attr("value",$(this).text());
	},function(){
		$(this).css("background","");
		$("#_loss_stop").attr("value","");
	}); */
$("._zy").toggle(function(){
		$("._zy").each(function(){
			$(this).removeClass("STYLE1cd");
		});
		$(this).addClass("STYLE1cd");
		var v = $(this).children("span").text().split("%")[0];
		$("#_profit_stop").attr("value",v);
	},function(){
		$("._zy").each(function(){
			$(this).removeClass("STYLE1cd");
		});
		$("#_profit_stop").attr("value","");
	});

 $("._zs").toggle(function(){
	   $("._zs").each(function(){
			$(this).removeClass("STYLE2cd");
		});
		$(this).addClass("STYLE2cd");
		var v = $(this).children("span").text().split("%")[0];
		$("#_loss_stop").val(v);
	},function(){
		$("._zs").each(function(){
			$(this).removeClass("STYLE2cd");
		});
		$("#zys_s_num").val("");
	});
		
	//window.alert(Math.round((1-Number($("#_profit_stop").val())/Number(_pr))*10));
	//将止盈，止损设置成百分比形式
	var _prefix_y ;
	var _prefix_s ; 
	var _tmp_zy_js = $("#_profit_stop").val();
	var _tmp_zs_js = $("#_loss_stop").val();

	//加载页面后设置止盈止损显示
	$.initys_func = function()
	{
		var zybl = '${zybl}';//止盈比率
		var zsbl = '${zsbl}';//止损比率
		if(zybl=="--"){
			$("#zybs").click();
		}else{
			$("._zy").each(function(){
				var div_zybl = $(this).html();
				if(div_zybl == zybl){
					$(this).click();
				}
			});
		}
		if(zsbl=="--"){
			$("#zsbs").click();
		}else{
			$("._zs").each(function(){
				var div_zsbl = $(this).html();
				if(div_zsbl == zsbl){
					$(this).click();
				}
			});
		}
	}
	
	//获取保证金
	$.getBuyPri = function()
	{
		//建仓价
		var _tmp_pri = $.func_hold_analysis("PR");
		var CT_S = Number(cmd["CT_S"]);//合约因子
		var MA_A = cmd["MA_A"];//保证金算法
		var MA_V = Number(cmd["MA_V"]);//保证金系数
		if(MA_A == 1)
		{//百分比
			_tmp_pri_ms = _tmp_pri*_tmp_c_qty_number*CT_S*MA_V;
		}else 
		{
			_tmp_pri_ms = _tmp_c_qty_number*MA_V;
		}
		return _tmp_pri_ms;
	}

	//title写入
	$._title_default = function()
	{
		//$("#_title_detail").html(cmd["CO_N"]+" &nbsp;&nbsp;&nbsp;"+($.getBuyPri()/_tmp_c_qty_number).toFixed(2)+"/每批");
		$("#_title_detail").children("span").html(cmd["CO_N"]+" &nbsp;&nbsp;&nbsp;"+($.getBuyPri()/_tmp_c_qty_number).toFixed(2)+"/每批");
	}

	$("#_jianjie").html(cmd["CO_N"]+"&nbsp;&nbsp;&nbsp;"+_tmp_c_qty_number+"手&nbsp;&nbsp;&nbsp;<span>"+bs_cn+"</span>");

	//转让
	$.zhuanrang = function()
	{
		$("#_sp_mess").html(cmd["CO_N"]+"("+($.getBuyPri()/_tmp_c_qty_number).toFixed(2)+"元)");
		$("#zhuanrang").show();
	} 

	//行情信息获取
	$.quotationRefresh = function(){
		//window.alert(1);
		//return ;
		$.ajax({
			type:"post",
			url:"<%=path%>/tocServlet?t="+new Date(),
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			data:"reqName=quatotionAjax&_co_i="+_tmp_co_i,
			dataType: "json",
			error:function(){
				clearInterval(quo_re);
			},
			success: function(data)
			{
				if(data == "-201"){
					alert("您的账号在另一个地点登陆，您已被迫下线！");
					location.href = "<%=basePath%>jsp/logon/logon.jsp";
					return;
				}else if(data == "-2001"){
					alert("您的账号已失效，请重新登录！");
					location.href = "<%=basePath%>jsp/logon/logon.jsp";
					return;
				}
				var q_s = data["s"];
				var q_b = data["b"];
				if(bs==1)
				{
					$("#pc_pri").html("转让价："+q_s.toFixed(2));
					_tmp_co_price = q_s;
					$("#hq_price").val(q_s);
				}else
				{
					$("#pc_pri").html("转让价："+q_b.toFixed(2));
					_tmp_co_price = q_b;
					$("#hq_price").val(q_b);
				}
				//计算当日浮亏
				$.transferTradPrice(q_b,q_s);
			}
		});
	}

	//市价平仓
	$.marketPriceCloseOut = function(){
		//window.alert(1);
		//return ;
		$.ajax({
			type:"post",
			url:"<%=path%>/tocServlet?t="+new Date(),
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			data:"reqName=_sjpc_tj_1&_ty="+bs_pc+"&_co_i="+_tmp_co_i+"&co_price="+_tmp_co_price+"&_c_qty_number="+_tmp_c_qty_number+"&_h_id="+$.func_hold_analysis("H_ID"),
			dataType: "json",
			success: function(data)
			{
				$("#zhuanrang").hide();
				if(data !=null){
					var ret = data["ret"];
					if(ret == '0'){
						alert("操作成功！");
						location.href = "<%=path%>/tocServlet?reqName=mainForward";
					}else{
						var msg = data["msg"];
						alert(msg);
					}
				}
			}
		});
	}

	//当日浮亏计算
	$.transferTradPrice = function(b,s){
		b_p = b;
		s_p = s;
		var quo_pri;//行情价
		var pri = $.func_hold_analysis("PR");//建仓价
		var bs = $.func_hold_analysis("TY");
		var CT_S = cmd["CT_S"];//合约因子
		var FE_A = cmd["FE_A"];//手续费算法
		var FEE_V = cmd["FEE_V"];//手续费系数
		FEE_V = 0;//去除手续费运算
		var temp = 0;
		var temp_fenshu = 0;
		if(bs == 1){
			//添加行情为0的判读
			if(s_p == 0){
				return;
			}
			var fee = Number($.computeFee(pri,_tmp_c_qty_number,CT_S,FE_A,FEE_V));
			temp = (s_p - pri)*CT_S*_tmp_c_qty_number-fee;
			temp_fenshu = (s_p - pri)/pri;
		}else{
			//添加行情为0的判读
			if(b_p == 0){
				return;
			}
			var fee = Number($.computeFee(pri,_tmp_c_qty_number,CT_S,FE_A,FEE_V));
			temp = (pri - b_p)*CT_S*_tmp_c_qty_number-fee;
			temp_fenshu = (pri - b_p)/pri;
		}
		temp = temp.toFixed(2);
		//$("#_price_ht").html(pri*_tmp_c_qty_number*CT_S);
		var margin = Number($("#_price_ht").html())
		$("#_now_flow").html(temp+"("+Math.round(temp*10000)/margin/100+"%)");
		//$("#_now_flow").html(temp+"("+Math.round(temp_fenshu*10000)/100+"%)");
		//$("#_yingyu").html(Number(temp)*_tmp_c_qty_number);
	}
	//计算手续费
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
	//1 显示  其他 取消
	$.Onyingsun = function(ty)
	{
		if(ty==1)
		{
			$("#bg").show();
			$("#zyzs").show();
			filter.show();
		}else
		{
			$("#bg").hide();
			$("#zyzs").hide();
			filter.hide();
		}
		
	}

	//设置或撤销    止盈，止损
	$.ajaxSubmitys = function()
	{
		var tmp_alert_string = "";
		var tmp_alert_flag = "";
		var tmp_loss = $("#_loss_stop").val();
		var tmp_profit = $("#_profit_stop").val();
		var _retrun_mess = "";
		if(tmp_profit.indexOf(""+$("#_hid_in_stop_profit").val())>=0
				&&tmp_loss.indexOf(""+$("#_hid_in_stop_loss").val())>=0)
		{
			window.alert("没有修改！");
			$.Onyingsun(2);
			return ;//tmp_loss!="不设"&&tmp_profit!="不设"
		}
		if(tmp_loss=="不设"&&tmp_profit=="不设"){
			if($("#_hid_in_stop_profit").val()=="--"&&$("#_hid_in_stop_loss").val()=="--"){
				window.alert("没有修改！");
				$.Onyingsun(2);
				return
			}
		}
		if(tmp_loss=="不设"||tmp_profit=="不设")
		{
			tmp_alert_flag = $.cancel_ys(tmp_loss,tmp_profit);
			if(tmp_alert_flag!="true")
			{
				tmp_alert_string = tmp_alert_flag;
			}else{
				if(tmp_loss=="不设"&&tmp_profit=="不设"){
					tmp_alert_string = "操作成功！";
				}
			}
		}
		if(tmp_loss!="不设"||tmp_profit!="不设")
		{
			var lossP = null;
			if(tmp_loss!="不设"){
				lossP = tmp_loss.split("%")[0]/100;
			}
			var profitP = null;
			if(tmp_profit!="不设"){
				profitP = tmp_profit.split("%")[0]/100;
			}
			//检查比例是否合法
			var flag = $.checkLimitPrice(profitP,lossP);
			if(flag == -1){
				tmp_alert_string="止盈比例过低";
			}else if(flag==-2){
				tmp_alert_string="止损比例过低";
			}else if(flag==1){
				tmp_alert_flag = $.set_ys(tmp_loss,tmp_profit);
				if(tmp_alert_string!=""&&tmp_alert_flag!="true")
				{
					tmp_alert_string = "操作失败！";
				}else if(tmp_alert_string==""&&tmp_alert_flag=="true")
				{
					tmp_alert_string = "操作成功！";
				}else if(tmp_alert_string==""&&tmp_alert_flag!="true")
				{
					tmp_alert_string = tmp_alert_flag;
				}
			}
		}
		window.alert(tmp_alert_string);
		//location.reload();
		frm.submit();
	}

	//设置止盈止损
	$.set_ys = function(tmp_loss,tmp_profit)
	{
		var CT_S = Number(cmd["CT_S"]);//合约因子
		var MA_A = cmd["MA_A"];//保证金算法
		var MA_V = Number(cmd["MA_V"]);//保证金系数
		var SPREAD = Number(cmd["SPREAD"]);//最小变动价
		var tmp_s = "";
		var tmp_string = "";
		if(tmp_loss!=undefined&&tmp_loss!="")
		{
			tmp_s += "&zys_s_num="+tmp_loss.replace("%","");
		}
		if(tmp_profit!=undefined&&tmp_profit!="")
		{
			tmp_s += "&zys_y_num="+tmp_profit.replace("%","");
		}
		var _tmp_data = "reqName=_sjpc_tj_2&_h_id="
			+$.func_hold_analysis("H_ID")+"&_co_i="+$.func_hold_analysis("CO_I")
			+"&_ty="+bs_pc+"&_pri="+_pr+"&baozhengjin="+$.getBuyPri()+"&biandong="+
			SPREAD+"&hyyz="+CT_S+"&_tmp_c_qty_number="+_tmp_c_qty_number
			+tmp_s;
		//window.alert(_tmp_data);
		$.ajax({
			type:"post",
			url:"<%=path%>/tocServlet?t="+new Date(),
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			data:_tmp_data,
			dataType: "json",
			async: false,
			success: function(data)
			{
				if(data.ret==0)
				{
					tmp_string = "true";
				}else
				{
					tmp_string = "设置止盈止损失败："+data["msg"];
				}
			}
		});
		return tmp_string;
	}

	//撤销止盈止损
	$.cancel_ys = function(tmp_loss,tmp_profit)
	{
		var tmp_string = "";
		var _tmp_data = "_h_id="
			+$.func_hold_analysis("H_ID")+"&_co_i="+$.func_hold_analysis("CO_I");
		if(tmp_loss=="不设"&&tmp_profit=="不设")
		{
			_tmp_data += "&reqName=_ys_type_3";
		}else if(tmp_loss!="不设"&&tmp_profit=="不设")
		{
			_tmp_data += "&reqName=_ys_type_2";
		}else
		{
			_tmp_data += "&reqName=_ys_type_1";
		}
		$.ajax({
			type:"post",
			url:"<%=path%>/tocServlet?t="+new Date(),
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			data:_tmp_data,
			dataType: "json",
			async: false,
			success: function(data)
			{
				if(data.ret==0)
				{
					tmp_string = "true";
				}else
				{
					tmp_string = $.returnCancal(data["type"])+": 操作失败";
				}
			}
		});
		return tmp_string;
	}

	$.returnCancal = function(type)
	{
		if(type=="1")
		{
			return "止损";
		}else if(type=="2")
		{
			return "止盈";
		}else
		{
			return "止盈止损";
		}
	}

	$.compu = function(val,pri)
	{
		if(val=="0%")
		{
			return 0;
		}else if(val=="10%")
		{
			return pri*0.1;
		}else if(val=="20%")
		{
			return pri*0.2;
		}else if(val=="30%")
		{
			return pri*0.3;
		}
	}

	//参数：止盈 /止损比例
	//检验比例是否合法
	$.checkLimitPrice = function (profitP,lossP){
		var openPrice = Number($("#openPrice").html());//开仓价
		var cmdId = _tmp_co_i;//商品代码
		var bsFlag = bs;//持仓买卖方向
		var cmd = $.getCmdInfo(cmdId);
		var per_margain = Number(cmd["MA_V"]);//每手保证金
		var per_fee = Number(cmd["FEE_V"]);//每手手续费
		per_fee = 0;
		var per_con = Number(cmd["CT_S"]);//合约因子
		var stop_l_p = Number(cmd["STOP_L_P"]);//止损下单点差
		var stop_p_p = Number(cmd["STOP_P_P"]);//止盈下单点差
		var spread = Number(cmd["SPREAD"]);//最小变动价
		if(bsFlag == 1){//买
			if(profitP != null){//买涨止盈
				stop_p_p = stop_p_p*spread;
				var stop_p_profit = (per_margain*profitP+per_fee)/per_con+openPrice;//买涨时止盈价格
				var hq_price = Number($("#hq_price").val());//行情价格
				var s = hq_price+stop_p_p;
				if(stop_p_profit<=(hq_price+stop_p_p)){
					return -1;
				}
			}
			if(lossP != null){//买涨止损
				stop_l_p = stop_l_p*spread;
				var stop_p_loss = openPrice-(per_margain*lossP-per_fee)/per_con;//买涨止损
				var hq_price = Number($("#hq_price").val());//行情价格
				if(stop_p_loss>=(hq_price-stop_l_p)){
					return -2;
				}
			}
		}else if(bsFlag == 2){//卖
			if(profitP != null){//买跌止盈
				stop_p_p = stop_p_p*spread;
				var stop_p_profit = openPrice-(per_margain*profitP+per_fee)/per_con;
				var hq_price = Number($("#hq_price").val());//行情价格
				if(stop_p_profit>=(hq_price-stop_p_p)){
					return -1;
				}
			}
			if(lossP != null){//买跌止损
				stop_l_p = stop_l_p*spread;
				var stop_p_loss = (per_margain*lossP-per_fee)/per_con+openPrice;
				var hq_price = Number($("#hq_price").val());//行情价格
				if(stop_p_loss<=(hq_price+stop_l_p)){
					return -2;
				}
			}
		}
		return 1;
	}
	$("#_title_detail").click(function(){
		var fromType = '${fromType}';
		if(fromType==''){
			location.href="<%=path%>/tocServlet?reqName=mainForward";
		}else{
			location.href="<%=path%>/tocServlet?reqName=GETHOLDLIST";
		}
	});
	//title写入值
	$._title_default();

	//初始化止盈止损
	$.initys_func();

	//行情信息刷新
	$.quotationRefresh();
	var quo_re = setInterval($.quotationRefresh,3000);

});
function clickabc2(){
	$("#zhuanrang").hide();
}
var h = $(window).width();
var h1 = $(".zhuanrang").width();
$(".zhuanrang").css("left",(h-h1)/2);
</script>
</html>
