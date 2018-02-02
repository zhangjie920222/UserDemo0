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
<title>��������</title>

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
				<div class="zhi0-1 left">������</div>
				<div class="shu right">${_ccmx.h_ID}</div>
			</div>
			<div class="gao">
				<div class="zhi0-1 left">����ʱ��</div>
				<div class="shu right">${_ccmx.OR_T}</div>
			</div>
			<div class="gao">
				<div class="zhi0-1 left">�����۸�</div>
				<div class="shu right" id="openPrice"><fmt:formatNumber value="${_ccmx.PR}" pattern="##.##" minFractionDigits="2" ></fmt:formatNumber></div>
			</div>
			<div class="gao">
				<div class="zhi0-1 left">�ֲּ۸�</div>
				<div class="shu right" id="holdPrice"><fmt:formatNumber value="${_ccmx.h_P}" pattern="##.##" minFractionDigits="2" ></fmt:formatNumber></div>
			</div> 
			<div class="gao">
				<div class="zhi0-1 left">����</div>
				<div class="shu right" style="color:#FF0000"><c:if test="${_ccmx.TY==1}">����</c:if><c:if test="${_ccmx.TY==2}">���</c:if></div>
			</div>
			<div class="gao">
				<div class="zhi0-1 left">����</div>
				<div class="shu right">${_ccmx.c_QTY}</div>
			</div>
		</div>
		<div class="tishikuang0_2" style="height:135px;">
			<div class="gao">
				<div class="zhi0-1 left">ֹӯ</div>
				<div class="shu right">${zybl }</div>
				<input id="_hid_in_stop_profit" type="hidden" value="${zybl }">
			</div>
			<div class="gao">
				<div class="zhi0-1 left">ֹ��</div>
				<div class="shu right">${zsbl}</div>
				<input id="_hid_in_stop_loss" type="hidden" value="${zsbl }">
			</div>
			<div class="gao" onclick="$.Onyingsun(1)">
				<div class="zhi0-1 left">����</div>
				<div class="tu right"></div>
			</div>
		</div>
		<div class="tishikuang0_2" style="height:135px;">
			<div class="gao">
				<div class="zhi0-1 left">��ͬ���</div>
				<div class="shu right" id="_price_ht"><fmt:formatNumber value="${_ccmx.MAR}" pattern="##.##" minFractionDigits="2" ></fmt:formatNumber></div>
			</div>
			<div class="gao">
				<div class="zhi0-1 left">����ӯ��</div>
				<div id="_now_flow" class="shu right" style="color:#FF0000;">0Ԫ��0��</div>
			</div>
			<%--
			<div class="gao">
				<div class="zhi0-1 left">����ӯ��</div>
				<div class="shu right" id="_yingyu">120.5Ԫ</div>
			</div>
			 --%>
		</div>
		<!-- <div class="tishikuang0_31" style="text-align:left; line-height:25px; color:#FF0000; font-size:12px;">ע������ö����ڽ���ʱ��(�賿04:00)ǰ��δת�ã����ᱻǿ��ת��</div> -->
	</div>
	<div class="dibu">
		<div class="dibu-5 left" id="pc_pri">ת�üۣ�${_ccmx.PR}</div>
		<div class="dibu-4 right" onclick="$.zhuanrang()">��Ҫת��</div>
	</div>
	<div class="zhuanrang" id="zhuanrang">
		<div class="zhuanrang1" style="border:0;border-radius:0;padding:0;">
			<div class="zhuanrang1-1" style="background:#f16063;color:white;">ȷ��ת��</div>
						<div class="zhuanrang1-2" id="_sp_mess" style="color:black;">�ֻ�������${_ccmx.PR}Ԫ��</div>
			<div class="zhuanrang1-1" style="color:black;"><fmt:formatNumber value="${_ccmx.PR}" pattern="##.##" minFractionDigits="2" ></fmt:formatNumber>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${_ccmx.c_QTY}��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<c:if test="${_ccmx.TY==1}">����</c:if><c:if test="${_ccmx.TY==2}">���</c:if></div>
			<div class="shuliang02">
				<div class="shuliang02-1 cjcd_btn1" id="quxiao" onclick="clickabc2()">ȡ��</div>
				<div class="shuliang02-2 cjcd_btn2" id="queding" onclick="$.marketPriceCloseOut()">ȷ��</div>
			</div>
		</div>
	</div>
	<%-- ֹӯ������ --%>
	<input type="hidden" id="hq_price"/>
	<%-- ֹӯ������ --%>
	<input type="hidden" value="${_ccmx.STOP_PROFIT}" id="_profit_stop"/>
	<%-- ֹӯ������ --%>
	<input type="hidden" value="${_ccmx.STOP_LOSS}" id="_loss_stop"/>
	<%-- ����ֹӯ��ֹ�� --%>
	<div id="bg"></div>
	
	<div class="zyzs" id="zyzs" style="display:none;padding-bottom:10px;width:80%;left:10%;">
	
	<div class="cjcd_t1"  style="color:white;">����ֹӯֹ��</div>
	<div class="cjcd_j1" id="_jianjie"></div>
	<div class="cjcd_j1">
						ֹӯ��&nbsp;&nbsp;
						<table width="100%" border="0" cellpadding="0" cellspacing="0"
							class="mytable">
							<tr>
								<td align="center" id="zybs" class="STYLE1ed _zy"><span>����</span></td>
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
						ֹ��&nbsp;&nbsp;
						<table width="100%" border="0" cellpadding="0" cellspacing="0"
							class="mytable1">
							<tr>
								<td align="center" id="zsbs" class="STYLE1ed zhisun"><span>����</span></td>
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
					<div class="cjcd_j1">��ʾ��ֹӯֹ�𲻰���������</div>	
	
			<input id="zys_y_num" name="zys_y_num" type="hidden"/>
			<input id="zys_s_num" name="zys_s_num" type="hidden"/>
			<input id="openpri" type="hidden"/>
			<div class="cjcd_btn1" style="height:30px;line-height:30px;" onclick="$.Onyingsun(2)" id="zyzscencle">ȡ��</div>
            <div class="cjcd_btn2" style="height:30px;line-height:30px;" onclick="$.ajaxSubmitys()" >ȷ��</div>
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

	//�ײ��˾�
	var filter = $("#gnnt_filter");
	//������Ʒ��Ϣ��JSON��
	var cmdInfos = eval('${commodity_info}');

	//�ֲ�����
	var holdDetail = "${_ccmx}";

	//��Ʒ����
	var _tmp_co_i ;

	//ÿ�ּ�
	var _tmp_pri_ms;

	//ƽ�ּ�
	var _tmp_co_price ;

	//�����ִ�
	$._func_analysisStr = function(_string_obj,_first_regex,_second_regex)
	{
		return _string_obj.replace("]",",").replace("["," ").split(_first_regex)[1].split(_second_regex)[0];
	}

	$.func_hold_analysis = function(attrName)
    {
      return $._func_analysisStr(holdDetail," "+attrName+"=",",");
    }

	//��Ʒ����
	_tmp_co_i = $.func_hold_analysis("CO_I");

	//�ֲַ���
	var bs = $.func_hold_analysis("TY");
	var bs_cn = bs==1?"����":"���";
	var bs_pc = bs==1?2:1;
	//�������
	var b_p;
	//��������
	var s_p;

	//���ּ�
	var _pr = $.func_hold_analysis("PR");

	//ί������
	var _tmp_c_qty_number = $.func_hold_analysis("C_QTY");


	//ֹӯֹ��div
	var gainLoss = $("#zyzs");
	var width = gainLoss.width();
	var height = gainLoss.height();
	gainLoss.css("left",($(window).width()-width)/2);
	gainLoss.css("top",($(window).height()-height)/2);
	
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

	//��Ʒ��Ϣ
	var cmd = $.getCmdInfo(_tmp_co_i);

	//ֹӯֵ
	var zys_y_num;
	//ֹ��ֵ
	var zys_s_num;

	//��ʼ�� ���� Ӯ��  
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
	//��ֹӯ��ֹ�����óɰٷֱ���ʽ
	var _prefix_y ;
	var _prefix_s ; 
	var _tmp_zy_js = $("#_profit_stop").val();
	var _tmp_zs_js = $("#_loss_stop").val();

	//����ҳ�������ֹӯֹ����ʾ
	$.initys_func = function()
	{
		var zybl = '${zybl}';//ֹӯ����
		var zsbl = '${zsbl}';//ֹ�����
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
	
	//��ȡ��֤��
	$.getBuyPri = function()
	{
		//���ּ�
		var _tmp_pri = $.func_hold_analysis("PR");
		var CT_S = Number(cmd["CT_S"]);//��Լ����
		var MA_A = cmd["MA_A"];//��֤���㷨
		var MA_V = Number(cmd["MA_V"]);//��֤��ϵ��
		if(MA_A == 1)
		{//�ٷֱ�
			_tmp_pri_ms = _tmp_pri*_tmp_c_qty_number*CT_S*MA_V;
		}else 
		{
			_tmp_pri_ms = _tmp_c_qty_number*MA_V;
		}
		return _tmp_pri_ms;
	}

	//titleд��
	$._title_default = function()
	{
		//$("#_title_detail").html(cmd["CO_N"]+" &nbsp;&nbsp;&nbsp;"+($.getBuyPri()/_tmp_c_qty_number).toFixed(2)+"/ÿ��");
		$("#_title_detail").children("span").html(cmd["CO_N"]+" &nbsp;&nbsp;&nbsp;"+($.getBuyPri()/_tmp_c_qty_number).toFixed(2)+"/ÿ��");
	}

	$("#_jianjie").html(cmd["CO_N"]+"&nbsp;&nbsp;&nbsp;"+_tmp_c_qty_number+"��&nbsp;&nbsp;&nbsp;<span>"+bs_cn+"</span>");

	//ת��
	$.zhuanrang = function()
	{
		$("#_sp_mess").html(cmd["CO_N"]+"("+($.getBuyPri()/_tmp_c_qty_number).toFixed(2)+"Ԫ)");
		$("#zhuanrang").show();
	} 

	//������Ϣ��ȡ
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
					alert("�����˺�����һ���ص��½�����ѱ������ߣ�");
					location.href = "<%=basePath%>jsp/logon/logon.jsp";
					return;
				}else if(data == "-2001"){
					alert("�����˺���ʧЧ�������µ�¼��");
					location.href = "<%=basePath%>jsp/logon/logon.jsp";
					return;
				}
				var q_s = data["s"];
				var q_b = data["b"];
				if(bs==1)
				{
					$("#pc_pri").html("ת�üۣ�"+q_s.toFixed(2));
					_tmp_co_price = q_s;
					$("#hq_price").val(q_s);
				}else
				{
					$("#pc_pri").html("ת�üۣ�"+q_b.toFixed(2));
					_tmp_co_price = q_b;
					$("#hq_price").val(q_b);
				}
				//���㵱�ո���
				$.transferTradPrice(q_b,q_s);
			}
		});
	}

	//�м�ƽ��
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
						alert("�����ɹ���");
						location.href = "<%=path%>/tocServlet?reqName=mainForward";
					}else{
						var msg = data["msg"];
						alert(msg);
					}
				}
			}
		});
	}

	//���ո�������
	$.transferTradPrice = function(b,s){
		b_p = b;
		s_p = s;
		var quo_pri;//�����
		var pri = $.func_hold_analysis("PR");//���ּ�
		var bs = $.func_hold_analysis("TY");
		var CT_S = cmd["CT_S"];//��Լ����
		var FE_A = cmd["FE_A"];//�������㷨
		var FEE_V = cmd["FEE_V"];//������ϵ��
		FEE_V = 0;//ȥ������������
		var temp = 0;
		var temp_fenshu = 0;
		if(bs == 1){
			//�������Ϊ0���ж�
			if(s_p == 0){
				return;
			}
			var fee = Number($.computeFee(pri,_tmp_c_qty_number,CT_S,FE_A,FEE_V));
			temp = (s_p - pri)*CT_S*_tmp_c_qty_number-fee;
			temp_fenshu = (s_p - pri)/pri;
		}else{
			//�������Ϊ0���ж�
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
	//1 ��ʾ  ���� ȡ��
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

	//���û���    ֹӯ��ֹ��
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
			window.alert("û���޸ģ�");
			$.Onyingsun(2);
			return ;//tmp_loss!="����"&&tmp_profit!="����"
		}
		if(tmp_loss=="����"&&tmp_profit=="����"){
			if($("#_hid_in_stop_profit").val()=="--"&&$("#_hid_in_stop_loss").val()=="--"){
				window.alert("û���޸ģ�");
				$.Onyingsun(2);
				return
			}
		}
		if(tmp_loss=="����"||tmp_profit=="����")
		{
			tmp_alert_flag = $.cancel_ys(tmp_loss,tmp_profit);
			if(tmp_alert_flag!="true")
			{
				tmp_alert_string = tmp_alert_flag;
			}else{
				if(tmp_loss=="����"&&tmp_profit=="����"){
					tmp_alert_string = "�����ɹ���";
				}
			}
		}
		if(tmp_loss!="����"||tmp_profit!="����")
		{
			var lossP = null;
			if(tmp_loss!="����"){
				lossP = tmp_loss.split("%")[0]/100;
			}
			var profitP = null;
			if(tmp_profit!="����"){
				profitP = tmp_profit.split("%")[0]/100;
			}
			//�������Ƿ�Ϸ�
			var flag = $.checkLimitPrice(profitP,lossP);
			if(flag == -1){
				tmp_alert_string="ֹӯ��������";
			}else if(flag==-2){
				tmp_alert_string="ֹ���������";
			}else if(flag==1){
				tmp_alert_flag = $.set_ys(tmp_loss,tmp_profit);
				if(tmp_alert_string!=""&&tmp_alert_flag!="true")
				{
					tmp_alert_string = "����ʧ�ܣ�";
				}else if(tmp_alert_string==""&&tmp_alert_flag=="true")
				{
					tmp_alert_string = "�����ɹ���";
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

	//����ֹӯֹ��
	$.set_ys = function(tmp_loss,tmp_profit)
	{
		var CT_S = Number(cmd["CT_S"]);//��Լ����
		var MA_A = cmd["MA_A"];//��֤���㷨
		var MA_V = Number(cmd["MA_V"]);//��֤��ϵ��
		var SPREAD = Number(cmd["SPREAD"]);//��С�䶯��
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
					tmp_string = "����ֹӯֹ��ʧ�ܣ�"+data["msg"];
				}
			}
		});
		return tmp_string;
	}

	//����ֹӯֹ��
	$.cancel_ys = function(tmp_loss,tmp_profit)
	{
		var tmp_string = "";
		var _tmp_data = "_h_id="
			+$.func_hold_analysis("H_ID")+"&_co_i="+$.func_hold_analysis("CO_I");
		if(tmp_loss=="����"&&tmp_profit=="����")
		{
			_tmp_data += "&reqName=_ys_type_3";
		}else if(tmp_loss!="����"&&tmp_profit=="����")
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
					tmp_string = $.returnCancal(data["type"])+": ����ʧ��";
				}
			}
		});
		return tmp_string;
	}

	$.returnCancal = function(type)
	{
		if(type=="1")
		{
			return "ֹ��";
		}else if(type=="2")
		{
			return "ֹӯ";
		}else
		{
			return "ֹӯֹ��";
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

	//������ֹӯ /ֹ�����
	//��������Ƿ�Ϸ�
	$.checkLimitPrice = function (profitP,lossP){
		var openPrice = Number($("#openPrice").html());//���ּ�
		var cmdId = _tmp_co_i;//��Ʒ����
		var bsFlag = bs;//�ֲ���������
		var cmd = $.getCmdInfo(cmdId);
		var per_margain = Number(cmd["MA_V"]);//ÿ�ֱ�֤��
		var per_fee = Number(cmd["FEE_V"]);//ÿ��������
		per_fee = 0;
		var per_con = Number(cmd["CT_S"]);//��Լ����
		var stop_l_p = Number(cmd["STOP_L_P"]);//ֹ���µ����
		var stop_p_p = Number(cmd["STOP_P_P"]);//ֹӯ�µ����
		var spread = Number(cmd["SPREAD"]);//��С�䶯��
		if(bsFlag == 1){//��
			if(profitP != null){//����ֹӯ
				stop_p_p = stop_p_p*spread;
				var stop_p_profit = (per_margain*profitP+per_fee)/per_con+openPrice;//����ʱֹӯ�۸�
				var hq_price = Number($("#hq_price").val());//����۸�
				var s = hq_price+stop_p_p;
				if(stop_p_profit<=(hq_price+stop_p_p)){
					return -1;
				}
			}
			if(lossP != null){//����ֹ��
				stop_l_p = stop_l_p*spread;
				var stop_p_loss = openPrice-(per_margain*lossP-per_fee)/per_con;//����ֹ��
				var hq_price = Number($("#hq_price").val());//����۸�
				if(stop_p_loss>=(hq_price-stop_l_p)){
					return -2;
				}
			}
		}else if(bsFlag == 2){//��
			if(profitP != null){//���ֹӯ
				stop_p_p = stop_p_p*spread;
				var stop_p_profit = openPrice-(per_margain*profitP+per_fee)/per_con;
				var hq_price = Number($("#hq_price").val());//����۸�
				if(stop_p_profit>=(hq_price-stop_p_p)){
					return -1;
				}
			}
			if(lossP != null){//���ֹ��
				stop_l_p = stop_l_p*spread;
				var stop_p_loss = (per_margain*lossP-per_fee)/per_con+openPrice;
				var hq_price = Number($("#hq_price").val());//����۸�
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
	//titleд��ֵ
	$._title_default();

	//��ʼ��ֹӯֹ��
	$.initys_func();

	//������Ϣˢ��
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
