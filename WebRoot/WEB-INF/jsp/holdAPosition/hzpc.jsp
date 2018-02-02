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
	body {background: #F5F5DC;}
</style>
</head>
<body>
<form action="" method="post" id="_form">
	<div class="fx_top">
		<div class="fx_bt">平仓</div>
	</div>
	<div class="fx_neir">
		<div class="dlk">
			<div class="dl"><a href="fxts.html"><img src="<%=_basePath %>images/zjjc.png"/></a></div>
			<div class="srk" id="div" >
				市价平仓
				<input id="_pc_input" value="市价平仓" type="hidden"/>
				<img src="<%=_basePath %>images/lak.png" style="float:right; margin-right:10px; margin-top:10px;"/>
			</div>
		</div>
		<div class="dlk">
			<div class="mim"><img src="<%=_basePath %>images/shangpin2.png"/></div>
			<div class="srk">${_hold.CO_I}
				<input id="_co_i" name="_co_i" type="hidden" value="${_hold.CO_I}" />
				<img src="<%=_basePath %>images/lak.png" style="float:right; margin-right:10px; margin-top:10px;"/></div>
		</div>
		<div class="dlk1">
			<div class="zuo1">
			  <div class="srk1"><input type="number" name="_c_qty_number" id="_c_qty_number" value="1" style="width:162px;height:37px;"/></div>
			</div>
			<div class="you1">范围：（1-${_hold.QTY}）</div>
		</div>
		<div class="dlk1">
			<div class="zuo2">
			   <input id="_ty" name="_ty" type="hidden" value="<c:if test="${_hold.TY=='1'}">2</c:if><c:if test="${_hold.TY=='2'}">1</c:if>" />
			  <div class="buy" <c:if test="${_hold.TY=='1'}">disabled="disabled" style="background:#F5F5DC;color:#CCDDFF;border-color:#CCDDFF;"</c:if>
			  >买</div>
			  <div class="sell" <c:if test="${_hold.TY=='2'}">disabled="disabled" style="background:#F5F5DC;color:#CCDDFF;border-color:#CCDDFF;"</c:if>
			  >卖</div>
			</div>
		</div>
		<div class="dlk" id="srjg">
			<div class="dl"><img src="<%=_basePath %>images/shangpin2.png"/></div>
			<div class="srk">&nbsp;&nbsp;<c:if test="${_hold.TY==1}">卖出</c:if>
			<c:if test="${_hold.TY==2}">买入</c:if> ${_hold.CO_I}
		</div>
		<div class="dk sjpc1" id="_price_sp">--</div>
		<input id="co_price" name="co_price" type="hidden" value=""/><%--委托价 --%>
		
		<div class="dk" id="chadian" style="">
			<div class="bhzh3"><input id="_chadian_check" name="_chadian_check" type="checkbox" style="zoom:150%" /> </div>
			<div class="bhzh4"><label for="_chadian_check">允许成交价和报价的最大差点</label></div>
			<div class="zuo3"><input type="number" value="" id="_chadian_data" name="_chadian_data" disabled="disabled"/></div>
		</div>
		<div class="dk" id="fsjc" style="">
			<div class="bhzh3"><input id="_fsjc_check" name="_fsjc_check" type="checkbox" style="zoom:150%"/> </div>
			<div class="bhzh4"><label for="_fsjc_check">允许反手建仓</label></div>
			<div class="zuo3"><input type="number" id="_fsjc_data" name="_fsjc_data" disabled="disabled"/></div>
		</div>
		<div class="xian clear"></div>
		
			<div class="fx_bottom1 dl_bottom">
				<div class="anniu">
					<div class="left"><img src="<%=_basePath %>images/qd.png" /></div>
					<div  class="left anniunr"  id="_submit">确定</div>
				</div>
			 </div>
		
		<a href="<%=basePath %>/tocServlet?reqName=hold">
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

		//公共方法 end
	
		$(function(){
			//行情价
			continueQueryQuato();
			
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
				//window.alert(1);
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

			var _c_qty_number_data = ${_hold.QTY}==null?0:${_hold.QTY};
			//平仓数在正确范围
			$('#_c_qty_number').change(function(){varRange(1,_c_qty_number_data,"_c_qty_number");});
			//差点大于0
			$('#_chadian_data').change(function(){varRange(1,-1,"_chadian_data");});
			//反手建仓大于0
			$('#_fsjc_data').change(function(){varRange(1,-1,"_fsjc_data");});

			//市价平仓
			$('#_submit').click(function(){
				var _ty = $("#_ty").val();//买卖标志：1买；2卖
				var _co_i = $("#_co_i").val();//商品统一代码
				var co_price = $("#co_price").val();//委托价
				var _c_qty_number = $("#_c_qty_number").val();//委托数量
				//var _h_id = $("#_h_id").val();//持仓单号
				var _chadian_data = $("#_chadian_data").val();//差点
				$.ajax({
					type:"post",
					url:"<%=basePath%>/tocServlet?reqName=_sjpc_hz",
					data:"_ty="+_ty+"&_co_i="+_co_i+"&co_price="+co_price+"&_c_qty_number="
						+_c_qty_number+"&_chadian_data="+_chadian_data,
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
			});
		});

		var continueQueryQuato = function()
		{
			$.ajax({
				type:"post",
				url:"<%=basePath%>/tocServlet",
				data:"reqName=quatotionAjax&_co_i=${_hold.CO_I}",
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
	</script>
</body>
</html>
