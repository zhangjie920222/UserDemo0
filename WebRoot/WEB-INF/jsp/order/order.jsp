<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ include file="../../public/taglib.jsp" %>
<%@ include file="../../public/path.jsp"%>

<!DOCTYPE HTML>
<html>
  <head>
  	<title>${pageTitle}</title>
    <meta http-equiv="Content-Type" content="text/html; charset=GBK" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <link rel="stylesheet" type="text/css" href="<%=skinPath%>/css/1.css" media="all">
    <script type="text/javascript" src="<%=basePath%>/js/jquery-1.6.min.js"></script>
 	<style type="text/css">
	select{-webkit-appearance:none;outline:none}
 	</style>
 	<script type="text/javascript">
 	var returnCode = '${returnCode}';
	if(returnCode != ""){
	  var returnMsg = '${returnMsg}';
	  if(returnCode == '0'){
			var flag = confirm("�����ɹ������ȷ����ת���ֲ���ϸ���档");
			if(flag){
				//��ת
				window.location.href="<%=path%>/tocServlet?reqName=holdaposition";
			}
	  }else{
			alert(returnMsg);	
      }
	}
 	</script>
  </head>
  
  <body onload="loading()">
  <form id="frm" name="frm" action="<%=path%>/tocServlet" method="post">
  	<input type="hidden" name="reqName" value="order">
    <div class="fx_top">
		<div class="fx_bt">����</div>
	</div>
	<div class="fx_neir">
		<div class="dlk">
			<div class="dl" style="width: 13%"><img src="<%=basePath%>images/zjjc.png"/></div>
			<div class="srk" id="div" >
				<select id="openType" style="ime-mode:disabled;width: 86%" class="select" name="openType">
					<option value="1">�м۽���</option>
					<option value="2">ָ�۽���</option>
				</select>
			</div>
		</div>
		<div class="dlk">
			<div class="srk">
				<div class="mim" style="width: 13%"><img src="<%=basePath%>images/shangpin2.png"/></div>
				<select style="ime-mode:disabled;width: 86%" id="cmd_id" class="select" name="commodityId" >
					<c:forEach items="${cmdIdMap}" var="map">
						<option value="${map.key}">${map.value}</option>
					</c:forEach>
				</select>
			</div>
		</div>
		<div class="dlk1">
			<div class="zuo1">
			  <div class="srk1">
			  	<input style="width: 98%;height: 38px;" id="quantity" type="number" name="quantity" placeholder="����" required="required" value=""/>
			  </div>
			</div>
			<div class="you1">��Χ����<span id="min_qty"></span>-<span id="max_qty"></span>��</div>
		</div>
		<div class="dlk1">
			<div class="zuo2">
			  <div id="buy" class="buy">��</div>
			  <div id="sell" class="sell">��</div>
			  <input id="buy_sell" name="buy_sell" value="1" type="hidden"/>
			</div>
			<div id="ts1" class="you1">��ʾ��������Ч</div>
		</div>
		<div class="dk" id="maimaij">
			<div class="maijia" id="maijia"></div>
			<div class="maijia1" id="maijia1"></div>
		</div>
		<div id="sjpcjg" class="dk sjpc1" style="display:none;">
		</div>
		<input type="hidden" id="price" name="price" value=""/>
		<div class="dlk" id="srjg">
			<div class="dl" style="width: 13%"><img src="<%=basePath%>images/qian.png"/></div>
			<div class="srk">
				<input style="width: 85%;height: 38px" placeholder="������۸�" name="limitPrice" id="limitPrice" required="required"/>
			</div>
		</div>
		<div class="dk" id="zhisun">
			<div class="bhzh3"><input type="checkbox" id="stop_loss_check" style="zoom:150%"/> </div>
			<div class="bhzh4">ֹ��</div>
			<div class="zuo3"><input name="stop_loss" id="stop_loss" required="required"/></div>
			<div class="bhzh4" id="l_l"><img src="<%=basePath%>images/xyh.png"/></div>
			<div class="bhzh4" id="l_g"><img src="<%=basePath%>images/dyh.png"/></div>
			<div class="zuo4"><input disabled="disabled" id="stop_loss_lable"/></div>
		</div>
		<div class="dk" id="zhiying">
			<div class="bhzh3"><input type="checkbox"  id="stop_profit_check" style="zoom:150%"/> </div>
			<div class="bhzh4">ֹӯ</div>
			<div class="zuo3"><input name="stop_profit" id="stop_profit" required="required"/></div>
			<div class="bhzh4" id="p_g"><img src="<%=basePath%>images/dyh.png"/></div>
			<div class="bhzh4" id="p_l"><img src="<%=basePath%>images/xyh.png"/></div>
			<div class="zuo4"><input disabled="disabled" id="stop_profit_lable"/></div>
		</div>
		<div class="dk" id="chadian" style="display:none;">
			<div class="bhzh3"><input id="chadian_check" name="chadian_check"  type="checkbox" style="zoom:150%"/> </div>
			<div class="bhzh4">����ɽ��ۺͱ��۵������</div>
			<div class="zuo3"><input id="chadianId" type="number" name="chadian" value=""/></div>
		</div>
		<div class="xian clear"></div>
		
		<div class="fx_bottom1 dl_bottom" id="sure">
			<div class="anniu">
				<div class="left"><img src="<%=basePath%>images/qd.png" /></div>
				<div  class="left anniunr">ȷ��</div>
			</div>
		 </div>
	
		<div class="fx_bottom2 dl_bottom" id="cencle">
			<div class="anniu">
				<div class="left"><img src="<%=basePath%>images/qxan.png" /></div>
				<div class="anniunr left">ȡ��</div>
			</div>
		</div>
	</div>
	<div style="display: none;">
		<input id="submit" type="submit">
	</div>
	</form>
	<input type="hidden" id="X_O_S_D_D"/>
	<input type="hidden" id="X_O_B_D_D"/>
	<input type="hidden" id="SPREAD"/>
	<input type="hidden" id="STOP_P_P"/>
	<input type="hidden" id="STOP_L_P"/>
	<input type="hidden" id="B_P_D_D"/>
	<input type="hidden" id="S_P_D_D"/>
  </body>
  <script type="text/javascript">
  	$(function(){
  	  	$("#stop_loss_check").click(function(){
  	  		stop_loss_check();
  	  	});
  	  	function stop_loss_check(){
	  	  	var flag = $("#stop_loss_check").attr("checked");
			var limitPrice = $("#limitPrice").val();
			if(flag ){
				if(limitPrice != ""){
					var limitPrice = Number($("#limitPrice").val());
					var buy_sell = Number($("#buy_sell").val());
					var STOP_L_P = Number($("#STOP_L_P").val());
					var SPREAD = Number($("#SPREAD").val());
					var B_P_D_D = Number($("#B_P_D_D").val());
					var stop_loss = 0;
					if(buy_sell == 1){
						stop_loss =limitPrice - STOP_L_P*SPREAD - B_P_D_D*SPREAD;
					}else{
						stop_loss =limitPrice + STOP_L_P*SPREAD + B_P_D_D*SPREAD;
					}
					$("#stop_loss_lable").val(stop_loss.toFixed(2));
					$("#stop_loss").attr("disabled",false);
				}else{
					$("#stop_loss_lable").val("");
					$("#stop_loss").attr("disabled",true);
					$("#stop_loss_check").attr("checked",false);
					alert("������۸�");
				}
			}else{
				$("#stop_loss_lable").val("");
				$("#stop_loss").attr("disabled",true);
			}
  	  	}
  	  	$("#stop_profit_check").click(function(){
  	  		stop_profit_check();
  	  	});
		function stop_profit_check(){
			var flag = $("#stop_profit_check").attr("checked");
	  	  	var limitPrice = $("#limitPrice").val();
			if(flag ){
				if(limitPrice != ""){
					var limitPrice = Number($("#limitPrice").val());
					var buy_sell = Number($("#buy_sell").val());
					var STOP_P_P = Number($("#STOP_P_P").val());
					var SPREAD = Number($("#SPREAD").val());
					var B_P_D_D = Number($("#B_P_D_D").val());
					var stop_profit = 0;
					var buy_sell = $("#buy_sell").val();
					if(buy_sell == 1){
						stop_profit = limitPrice + STOP_P_P*SPREAD - B_P_D_D*SPREAD;
					}else{
						stop_profit = limitPrice - STOP_P_P*SPREAD + B_P_D_D*SPREAD;
					}
					$("#stop_profit_lable").val(stop_profit.toFixed(2));
					$("#stop_profit").attr("disabled",false);
				}else{
					$("#stop_profit_lable").val("");
					$("#stop_profit").attr("disabled",true);
					$("#stop_profit_check").attr("checked",false);
					alert("������۸�");
				}
			}else{
				$("#stop_profit_lable").val("");
				$("#stop_profit").attr("disabled",true);
			}
		}
  	  	$("#cencle").click(function(){
			window.history.back();
  	  	});
  	  	$("#sure").click(function(){
			//frm.submit();
			var openType = $("#openType").val();
			if(openType == 2){
				var limitPrice = Number($("#limitPrice").val());
				var maijia = Number($("#maijia").html());
				var maijia1 = Number($("#maijia1").html());
				if(limitPrice<0 || (limitPrice>=maijia && limitPrice<=maijia1)){
					alert("�۸񲻺Ϸ���");
					return;
				}
				var stop_profit_check = $("#stop_profit_check").attr("checked");
				var stop_loss_check = $("#stop_loss_check").attr("checked");
				var buy_sell = $("#buy_sell").val();
				if(stop_loss_check){
					var stop_loss = $("#stop_loss").val();
					if(stop_loss == ""){
						alert("������ֹ��");
						return;
					}
					var stop_loss_lable = $("#stop_loss_lable").val();
					if(buy_sell == 1){
						if(stop_loss>=stop_loss_lable){
							alert("ֹ��ֵ����");
							return;
						}
					}else{
						if(stop_loss<=stop_loss_lable){
							alert("ֹ��ֵ��С");
							return;
						}
					}
				}
				if(stop_profit_check){
					var stop_profit = $("#stop_profit").val();
					if(stop_profit == ""){
						alert("������ֹӯ");
						return;
					}
					var stop_profit_lable = $("#stop_profit_lable").val();
					if(buy_sell == 1){
						if(stop_profit<=stop_profit_lable){
							alert("ֹ��ֵ��С");
							return;
						}
					}else{
						if(stop_profit>=stop_profit_lable){
							alert("ֹ��ֵ����");
							return;
						}
					}
				}
			}
			$("#submit").click();
  	  	});
		$("#buy").click(function(){
			$(this).css("background-color","#00FF00");
			$("#sell").css("background-color","#FFFFFF");
			$("#buy_sell").val(1);
			var openType= $("#openType").val();
			if(openType == '2'){
				$("#l_l").show();
				$("#l_g").hide();
				$("#p_g").show();
				$("#p_l").hide();
				stop_profit_check();
				stop_loss_check();
			}
			$("#sjpcjg").html("���ڲ�ѯ");
			$("#maijia").html("���ڲ�ѯ");
			$("#maijia1").html("���ڲ�ѯ");
		});
		$("#sell").click(function(){
			$(this).css("background-color","#00FF00");
			$("#buy").css("background-color","#FFFFFF");
			$("#buy_sell").val(2);
			var openType= $("#openType").val();
			if(openType == '2'){
				$("#l_l").hide();
				$("#l_g").show();
				$("#p_g").hide();
				$("#p_l").show();
				stop_profit_check();
			}
			$("#sjpcjg").html("���ڲ�ѯ");
			$("#maijia").html("���ڲ�ѯ");
			$("#maijia1").html("���ڲ�ѯ");
		});
		function openTypeChange(){
			var op_ty = $("#openType").val();
			if(op_ty == 1){
				$("#ts1").hide();
				$("#maimaij").hide();
				$("#srjg").hide();
				$("#zhiying").hide();
				$("#zhisun").hide();
				$("#sjpcjg").show();
				$("#chadian").show();
				$("#chadianId").attr("disabled",true);
				$("#limitPrice").attr("disabled",true);
			}else{
				$("#ts1").show();
				$("#maimaij").show();
				$("#srjg").show();
				$("#zhiying").show();
				$("#zhisun").show();
				$("#sjpcjg").hide();
				$("#chadian").hide();
				var buy_sell = '${buy_sell}';
				if(buy_sell == 1){
					$("#buy").click();
				}else{
					$("#sell").click();
				}
				$("#stop_loss").attr("disabled",true);
				$("#stop_profit").attr("disabled",true);
				$("#limitPrice").attr("disabled",false);
			}
		}
		$("#openType").change(function(){
			getCmdQuotation();
			openTypeChange();
		});
		$("#chadian_check").click(function(){
			var flag = $(this).attr("checked");
			if(flag){
				$("#chadianId").attr("disabled",false);
			}else{
				$("#chadianId").attr("disabled",true);
			}
		});
  	  	
  	  	function getSelectedCmdInfoFromSession(cmdId){
	  	  	if(cmdId != "" && cmdId != undefined){
				var cmdInfos = '${commodity_info}';
				var cmdInfosMap = eval(cmdInfos);
				$(cmdInfosMap).each(function(index){
					var temp = cmdInfosMap[index];
					var cmd = temp[cmdId];
					if(cmd != undefined){
						var P_MIN_H = cmd["p_MIN_H"];//������С��ί������
						var P_M_H = cmd["p_M_H"];//��������ί������
						$("#quantity").attr("min",P_MIN_H);
						$("#quantity").attr("max",P_M_H);
						var CT_S = cmd["CT_S"];//���׵�λ
						var SPREAD = cmd["SPREAD"];//��С�䶯��λ
						var U_O_D_D_MIN = cmd["u_O_D_D_MIN"];//�û����۵����Сֵ
						var U_O_D_D_MAX = cmd["u_O_D_D_MAX"];//�û����۵�����ֵ
						var U_O_D_D_DF = cmd["u_O_D_D_DF"];//�û����۵��Ĭ��ֵ
						var X_O_B_D_D = cmd["x_O_B_D_D"];//�޼۽�������
						var X_O_S_D_D = cmd["x_O_S_D_D"];//�޼۽��������
						var STOP_L_P = cmd["STOP_L_P"];//ֹ���µ����
						var STOP_P_P = cmd["STOP_P_P"];//ֹӯ�µ����
						var B_P_D_D = cmd["b_P_D_D"];//��۵��
						var S_P_D_D = cmd["s_P_D_D"];//���۵��
						$("#SPREAD").val(SPREAD);
						$("#B_P_D_D").val(B_P_D_D);
						$("#S_P_D_D").val(S_P_D_D);
						$("#STOP_L_P").val(STOP_L_P);
						$("#STOP_P_P").val(STOP_P_P);
						$("#X_O_S_D_D").val(X_O_S_D_D);
						$("#X_O_B_D_D").val(X_O_B_D_D);
						$("#chadianId").attr("max",U_O_D_D_MAX);
						$("#chadianId").attr("min",U_O_D_D_MIN);
						$("#chadianId").val(U_O_D_D_DF);
						$("#min_qty").html(P_MIN_H);
						$("#max_qty").html(P_M_H);
					}
				});
	  	  	}
  	  	}
  	  	
  	  	$("#cmd_id").change(function(){
  	  		var cmdId = $(this).val()
  	  		getSelectedCmdInfoFromSession(cmdId);
	  	  	$("#sjpcjg").html("���ڲ�ѯ");
			$("#maijia").html("���ڲ�ѯ");
			$("#maijia1").html("���ڲ�ѯ");
			//getCmdQuotation(cmdId);
  	  	});
  		getSelectedCmdInfoFromSession($("#cmd_id").val());
		getCmdQuotation();
		var for_order = setInterval(getCmdQuotation,3000);// ע�⺯����û�����ź�������
  	  	function getCmdQuotation(cmdId){
  	  	  	if(cmdId == null || cmdId == ""){
  	  	  		cmdId = $("#cmd_id").val();
  	  	  	 }
			if(cmdId != "" && cmdId != undefined){
				$.ajax({
					type:"post",
					url:"<%=path%>/tocServlet?t="+new Date(),
					contentType: "application/x-www-form-urlencoded; charset=UTF-8",
					data:{reqName:"quotation",dataType:"json",commodityId:cmdId},
					dataType: "json",
					beforeSend:function(){
						cmdId = $("#cmd_id").val();
						return true;
					},
					success: function(data){
						if(data !="" && data!=null && data !=undefined){
							var ret = data[0];
							var retCode = ret["retcode"];
							if(retCode == 0){
								for(var i=1;i<data.length;i++){
									var temp =data[i];
									var _cmdId = temp["C"];
									if(_cmdId == cmdId){
										var B = Number(temp["B"]);//��
										var S = Number(temp["S"]);//��
										var openType = $("#openType").val();
										if(openType == 1){//�м�
											var buy_sell = $("#buy_sell").val();
											if(buy_sell==1){
												$("#price").val(B);
												$("#sjpcjg").html(B);
											}else{
												$("#price").val(S);
												$("#sjpcjg").html(S);
											}
										}else{//ָ��
											var X_O_S_D_D = Number($("#X_O_S_D_D").val());
											var X_O_B_D_D = Number($("#X_O_B_D_D").val());
											var SPREAD = Number($("#SPREAD").val());
											var _b = B+X_O_B_D_D*SPREAD;
											var _s = S-X_O_S_D_D*SPREAD;
											$("#maijia").html(_s.toFixed(2));
											$("#maijia1").html(_b.toFixed(2));
										}
									}
								}
							}else if(retCode == -201){
								alert("�����˺�����һ���ص��½�����ѱ������ߣ�");
								window.location.href = "<%=basePath%>jsp/logon/logon.jsp";
							}else if(retCode == -2001){
								alert("�����˺���ʧЧ�������µ�¼��");
								window.location.href = "<%=basePath%>jsp/logon/logon.jsp";
							}else{
								clearInterval(for_order);
							}
						}
					}
				});
			}
  	  	}
  	  
  	  });

  	function loading(){
  		$("#openType").val('${openType}');
		$("#openType").change();
		var buy_sell = '${buy_sell}';
		if(buy_sell == 1){
			$("#buy").click();
		}else{
			$("#sell").click();
		}
		
		$("#stop_loss").attr("disabled",true);
		$("#stop_profit").attr("disabled",true);

  	}
  </script>
</html>
