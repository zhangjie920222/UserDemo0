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
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<meta name="viewport" content="width=device-width,target-densitydpi=medium-dpi,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
<link rel=stylesheet type="text/css" href="<%=_basePath %>css/1.css" title="cool">
<script type="text/javascript" src="<%=_basePath %>js/jquery-1.6.min.js"></script>
<title>建仓</title>
<style type="text/css">
	body{background: #F5F5DC;}
	.srk {padding-top: 0px;border:0px solid red;}
	ul,li,div,select {margin:0px;padding:0px;}
	ul li {
	list-style: none;
	list-style-type: none;
	text-align: left;
	}
	select {
		-webkit-appearance: none;
		outline: none
	}
	.ccmx_selectBox {
		overflow: hidden;
		margin: 0px 0;
	}
	.ccmx_select {
		border: 0px solid red;
		width: 95%;
		height: 38.5px;
		border-radius: 4px;
		font-size: 0.95em;
		color: #666;
		float: left;
	}
</style>
</head>
<body>
<form action="" method="post" id="_form">
	<div class="fx_top">
		<div class="fx_bt">平仓</div>
	</div>
	<div class="fx_neir">
		<div class="dlk">
			<img src="<%=_basePath %>images/lak.png" style="float:right; margin-right:10px; margin-top:10px;"/>
			<div class="dl"><a href="fxts.html"><img src="<%=_basePath %>images/zjjc.png"/></a></div>
			<div class="srk" id="div" >
				<input id="_pc_input" type="hidden" value="<c:if test="${_sjpc_value=='_sjpc'}">市价平仓</c:if><c:if test="${_sjpc_value=='_zjpc'}">指价平仓</c:if>"/>
				<ul>
						<li class="ccmx_selectBox">
							<select class="ccmx_select" onchange="clickabc(this)">
								<option value="sjpc" <c:if test="${_sjpc_value=='_sjpc'}">selected='selected'</c:if>>市价平仓</option>
								<option value="zjpc" <c:if test="${_sjpc_value=='_zjpc'}">selected='selected'</c:if>>指价平仓</option>
							</select>
						</li>
					</ul>
			</div>
		</div>
		<div style="clear:both;"></div>
		<div class="dlk">
			<div class="mim"><img src="<%=_basePath %>images/shangpin2.png"/></div>
			<div class="srk">${_holdDetail.CO_I}
				<input id="_co_i" name="_co_i" type="hidden" value="${_holdDetail.CO_I}" />
				<img src="<%=_basePath %>images/lak.png" style="float:right; margin-right:10px; margin-top:10px;"/></div>
		</div>
		<div class="dlk1">
			<div class="zuo1">
			  <div class="srk1"><input type="number" name="_c_qty_number" id="_c_qty_number" value="1" style="width:162px;height:37px;"/></div>
			</div>
			<div class="you1">范围：（1-${_holdDetail.c_QTY}）</div>
		</div>
		<div class="dlk1">
			<div class="zuo2">
			  <input id="_ty" name="_ty" type="hidden" value="<c:if test="${_holdDetail.TY==1}">2</c:if><c:if test="${_holdDetail.TY==2}">1</c:if>" />
			  <div class="buy" <c:if test="${_holdDetail.TY==1}">disabled="disabled" style="background:#F5F5DC;color:#CCDDFF;border-color:#CCDDFF;"</c:if>
			  >买</div>
			  <div class="sell" <c:if test="${_holdDetail.TY==2}">disabled="disabled" style="background:#F5F5DC;color:#CCDDFF;border-color:#CCDDFF;"</c:if>
			  >卖</div>
			</div>
			<div id="ts1" class="you1" <c:if test="${_sjpc_value=='_sjpc'}">style="display:none;"</c:if>>提示：当天有效</div>
		</div>
		<div class="dlk" id="srjg">
			<div class="dl"><img src="<%=_basePath %>images/shangpin2.png"/></div>
			<input type="hidden" id="_h_id" name="_h_id" value="${_holdDetail.h_ID}"/>
			<div class="srk">&nbsp;&nbsp;${_holdDetail.h_ID} <c:if test="${_holdDetail.TY==1}">卖出</c:if>
			<c:if test="${_holdDetail.TY==2}">买入</c:if> ${_holdDetail.CO_I}
		</div>
		<div class="dk sjpc1" id="_price_sp">--</div>
		<input id="co_price" name="co_price" type="hidden" value=""/><%--委托价 --%>
		
		<div class="dk" id="zhiying">
			<div class="bhzh3"><input type="checkbox" id="_zhiying_check" name="_zhiying_check" style="zoom:150%"/> </div>
			<div class="bhzh4"><label for="_zhiying_check">止盈</label></div>
			<div class="zuo3"><input type="number" id="_zhiying_data" name="_zhiying_data" readonly="readonly"/></div>
			<div class="bhzh4"><img src="<%=_basePath %>images/xyh.png"/></div>
			<div class="zuo4"><input id="_stopying" readonly="readonly"/></div>
		</div>
		<div class="dk" id="zhisun">
			<div class="bhzh3"><input type="checkbox" id="_zhisun_check" name="_zhisun_check" style="zoom:150%"/> </div>
			<div class="bhzh4"><label for="_zhisun_check">止损</label></div>
			<div class="zuo3"><input type="number" id="_zhisun_data" name="_zhisun_data" readonly="readonly"/></div>
			<div class="bhzh4"><img src="<%=_basePath %>images/dyh.png"/></div>
			<div class="zuo4"><input id="_stopsun" readonly="readonly"/></div>
		</div>
		<div class="dk" id="chadian" style="display:none;">
			<div class="bhzh3"><input id="_chadian_check" name="_chadian_check" type="checkbox" style="zoom:150%" /> </div>
			<div class="bhzh4"><label for="_chadian_check">允许成交价和报价的最大差点</label></div>
			<div class="zuo3"><input type="number" value="" id="_chadian_data" name="_chadian_data" disabled="disabled"/></div>
		</div>
		<div class="dk" id="fsjc" style="display:none;">
			<div class="bhzh3"><input id="_fsjc_check" name="_fsjc_check" type="checkbox" style="zoom:150%"/> </div>
			<div class="bhzh4"><label for="_fsjc_check">允许反手建仓</label></div>
			<div class="zuo3"><input type="number" id="_fsjc_data" name="_fsjc_data" disabled="disabled"/></div>
		</div>
		<div class="xian clear"></div>
			<div class="fx_bottom1 dl_bottom">
				<div class="anniu">
					<div class="left"><img src="<%=_basePath %>images/qd.png" /></div>
					<div  class="left anniunr" id="_submit">确定</div>
				</div>
			 </div>
		
		<a href="<%=basePath %>/tocServlet?reqName=holdaposition">
			<div class="fx_bottom2 dl_bottom">
					<div class="anniu">
						<div class="left"><img src="<%=_basePath %>images/qxan.png" /></div>
						<div class="anniunr left">取消</div>
					</div>
			</div>
		</a>
	</div>
	</form>
	<script type="text/javascript">

	//公共方法 start
	function getSelectedCmdInfoFromSession(cmdId,_attr){
  	  	if(cmdId != "" && cmdId != undefined){
			var cmdInfos = '${commodity_info}';
			var cmdInfosMap = eval(cmdInfos);
			var _tmp_val ;
			$(cmdInfosMap).each(function(index){
				var temp = cmdInfosMap[index];
				var cmd = temp[cmdId];
				if(cmd != undefined)
				{
					//window.alert(cmd["CT_S"]+"---"+cmd[_attr]);
					_tmp_val = cmd[_attr]
				}
			});
			return _tmp_val;
  	  	}
	  	}

	var quotation_tmp ;
	//行情Ajax
	var continueQueryQuato = function()
	{
		$.ajax({
			type:"post",
			url:"<%=basePath%>/tocServlet",
			data:"reqName=quatotionAjax",
			success:function(result){
				quotation_tmp = JSON.parse(result);
			}
		});
		window.setTimeout("continueQueryQuato()",2000);
	}

	//控制变量范围 
	//var_name 是需要判断的标签ID
	var varRange = function(min,max,tag_id)
	{
		var var_obj = $("#"+tag_id);
		if(var_obj.val()<min)			
		{
			var_obj.attr("value",min);
		}
		if(max!=-1&&var_obj.val()>max)
		{
			var_obj.attr("value",max);
		}
	}

	//公共方法 end
	
	var _c_qty_number_data = ${_holdDetail.c_QTY}==""?1:${_holdDetail.c_QTY}
	var _co_i_tmp = '${_holdDetail.CO_I}';
	var _quotation_obj ;//行情对象

	//止损变动
	var _func_var_sun = false;
	var _func_stop_sun = function()
	{
		//window.alert(_func_var_sun);
		if(_func_var_sun)
		{
			var _stop_sun_price ;
			if($('#_ty').val()==1)
			{
				_stop_sun_price = parseInt(_quotation_obj.b) +
				parseInt(getSelectedCmdInfoFromSession(_co_i_tmp,"STOP_L_P"))*
				parseInt(getSelectedCmdInfoFromSession(_co_i_tmp,"SPREAD"))
			}else
			{
				_stop_sun_price = parseInt(_quotation_obj.s) -
				parseInt(getSelectedCmdInfoFromSession(_co_i_tmp,"STOP_L_P"))*
				parseInt(getSelectedCmdInfoFromSession(_co_i_tmp,"SPREAD"))
			}
			$('#_stopsun').attr("value",_stop_sun_price);
			window.setTimeout("_func_stop_sun()",500);
		}
	}

	//止赢变动
	var _func_var_ying = false;
	var _func_stop_ying = function()
	{
		//window.alert(_func_var_sun);
		if(_func_var_ying)
		{
			var _stop_ying_price ;
			if($('#_ty').val()==1)
			{
				_stop_ying_price = parseInt(_quotation_obj.b) -
				parseInt(getSelectedCmdInfoFromSession(_co_i_tmp,"STOP_P_P"))*
				parseInt(getSelectedCmdInfoFromSession(_co_i_tmp,"SPREAD"));
			}else
			{
				_stop_ying_price = parseInt(_quotation_obj.s) +
				parseInt(getSelectedCmdInfoFromSession(_co_i_tmp,"STOP_P_P"))*
				parseInt(getSelectedCmdInfoFromSession(_co_i_tmp,"SPREAD"));
			}
			$('#_stopying').attr("value",_stop_ying_price);
			window.setTimeout("_func_stop_ying()",500);
		}
	}
	
	$(function(){
		//行情对象变动；
		continueQueryQuato();
		
		if(${_sjpc_value=='_sjpc'})
		{
			$("#zhiying").hide();
			$("#zhisun").hide();
			$("#chadian").show();
			$("#fsjc").show();
		}else
		{
			$("#zhiying").show();
			$("#zhisun").show();
			$("#chadian").hide();
			$("#fsjc").hide();
		}

		//止盈
		var num_tmp_obj = $('#_price_sp');
		$('#_zhiying_check').click(function(){
			var tmp_check = $(this).attr("checked");
			var num_tmp = num_tmp_obj.text();
			//window.alert(num_tmp);
			if(tmp_check=='checked'||tmp_check==true)
			{
				$('#_zhiying_data').attr("readonly",false);
				if(!isNaN(num_tmp))
				{
					//num_tmp = parseFloat(num_tmp);
					_func_var_ying = true;
					_func_stop_ying();
				}
			}else
			{
				$('#_stopying').attr("value","");
				$('#_zhiying_data').attr("value","");
				$('#_zhiying_data').attr("readonly","readonly");
				_func_var_ying = false;
			}
		});
		//止损
		$('#_zhisun_check').click(function(){
			var tmp_check = $(this).attr("checked");
			var num_tmp = num_tmp_obj.text();
			if(tmp_check=='checked'||tmp_check==true)
			{
				$('#_zhisun_data').attr("readonly",false);
				if(!isNaN(num_tmp))
				{
					//num_tmp = parseFloat(num_tmp);
					_func_var_sun = true;
					_func_stop_sun();
				}
			}else
			{
				$('#_stopsun').attr("value","");
				$('#_zhisun_data').attr("value","");
				$('#_zhisun_data').attr("readonly","readonly");
				_func_var_sun = false;
			}
		});

		
		//点选check，来改变输入框状态 -- 差点
		$("#_chadian_check").click(function(){
			var tmp_check = $(this).attr("checked");
			var _chadian_obj = $('#_chadian_data');
			if(tmp_check=='checked'||tmp_check==true)
			{
				_chadian_obj.attr("disabled",false);
				_chadian_obj.attr("value",10);
			}else
			{
				_chadian_obj.attr("disabled",true);
				_chadian_obj.attr("value","");
			}
		});
		
		//点选check，来改变输入框状态 -- 反手建仓
		var fsjc_data_tmp ;
		$('#_fsjc_check').click(function(){
			var tmp_check = $(this).attr("checked");
			var _chadian_obj = $('#_fsjc_data');
			if(tmp_check=='checked'||tmp_check==true)
			{
				_chadian_obj.attr("disabled",false);
				_chadian_obj.attr("value",fsjc_data_tmp==undefined?"1":fsjc_data_tmp);
			}else
			{
				_chadian_obj.attr("disabled",true);
				fsjc_data_tmp = _chadian_obj.val();
				_chadian_obj.attr("value","");
			}
		});

		$('#_submit').click(function(){
			var _ty = $("#_ty").val();//买卖标志：1买；2卖
			var _co_i = $("#_co_i").val();//商品统一代码
			var co_price = $("#co_price").val();//委托价
			var _c_qty_number = $("#_c_qty_number").val();//委托数量
			var _h_id = $("#_h_id").val();//持仓单号
			if($("#_pc_input").val()=="市价平仓")
			{
				var _chadian_data = $("#_chadian_data").val();//差点
				$.ajax({
					type:"post",
					url:"<%=basePath%>/tocServlet?reqName=_sjpc_tj_1",
					data:"_ty="+_ty+"&_co_i="+_co_i+"&co_price="+co_price+"&_c_qty_number="
						+_c_qty_number+"&_h_id="+_h_id+"&_chadian_data="+_chadian_data,
					success:function(result){
						//window.alert(result);
						var _res = result.toString();
						if(_res.split(",")[0]==0)
						{
							window.alert(_res.split(",")[1]);
						}else
						{
							window.alert(_res.split(",")[1]);
						}
					}
				});
			}
			if($("#_pc_input").val()=="指价平仓")
			{
				//_zhiying_data _zhisun_data
				//_stopsun  _stopying
				var _tmp_ying_obj = $('#_zhiying_data');
				if(_tmp_ying_obj.val()!=undefined&&_tmp_ying_obj.val()!="")
				{
					if(_tmp_ying_obj.val()>$('#_stopying').val())
					{
						window.alert("止盈设置不合法！");
						return false;
					}
				}
				var _tmp_sun_obj = $('#_zhisun_data');
				if(_tmp_sun_obj.val()!=undefined&&_tmp_sun_obj.val()!="")
				{
					if(_tmp_sun_obj.val()<$('#_stopsun').val())
					{
						window.alert("止损设置不合法！");
						return false;
					}
				}
				//设置止损止盈 //指价平仓单
				var _zhiying_data = $("#_zhiying_data").val();
				var _zhisun_data = $("#_zhisun_data").val();
				$.ajax({
					type:"post",
					url:"<%=basePath%>/tocServlet?reqName=_sjpc_tj_2",
					data:"_ty="+_ty+"&_co_i="+_co_i+"&co_price="+co_price+"&_c_qty_number="
						+_c_qty_number+"&_h_id="+_h_id+"&_zhiying_data="+_zhiying_data+"&_zhisun_data="
						+_zhisun_data,
					success:function(result){
						var _res = result.toString();
						if(_res.split(",")[0]==0)
						{
							window.alert(_res.split(",")[1]);
						}else
						{
							window.alert(_res.split(",")[1]);
						}
					}
				});
			}
		});

		//平仓数在正确范围
		$('#_c_qty_number').change(function(){varRange(1,_c_qty_number_data,"_c_qty_number");});
		//差点大于0
		$('#_chadian_data').change(function(){varRange(1,-1,"_chadian_data");});
		//反手建仓大于0
		$('#_fsjc_data').change(function(){varRange(1,-1,"_fsjc_data");});
	});
	
	var continueQueryQuato = function()
	{
		$.ajax({
			type:"post",
			url:"<%=basePath%>/tocServlet",
			data:"reqName=quatotionAjax&_co_i=${_holdDetail.CO_I}",
			success:function(result){
				eval("_quotation_obj = " +result);
				//window.alert(result);
				var _div_tmp = $('#_price_sp');
				if($('#_ty').val()==2)
				{
					_div_tmp.text(_quotation_obj.s);
					//_div_tmp.append(_res.s); 
					$('#co_price').attr("value",_quotation_obj.s);
				}else
				{
					_div_tmp.text(_quotation_obj.b);
					$('#co_price').attr("value",_quotation_obj.b);
				}
			}
		});
		window.setTimeout("continueQueryQuato()",3000);
	}

	function clickabc(_obj)
	{
		//window.alert(_obj.value);
		if(_obj.value=="zjpc")
		{
			$('#_pc_input').attr("value","指价平仓");
			$("#zhiying").show();
			$("#zhisun").show();
			$("#chadian").hide();
			$("#fsjc").hide();
		}else
		{
			$('#_pc_input').attr("value","市价平仓");
			$("#zhiying").hide();
			$("#zhisun").hide();
			$("#chadian").show();
			$("#fsjc").show();
		}
	}
</script>
</body>
</html>
