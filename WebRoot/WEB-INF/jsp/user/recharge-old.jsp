<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@page import="gnnt.MEBS.util.TokenProccessor"%>
<%@ include file="../../public/taglib.jsp" %>
<%@ include file="../../public/path.jsp"%>
<%
TokenProccessor proccessor=TokenProccessor.getInstance();
String token = proccessor.makeToken();
request.getSession().setAttribute("token",token);
%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
	<link rel=stylesheet type="text/css" href="<%=skinPath%>/css/recharge.css" title="cool">
    <script type="text/javascript" src="<%=basePath%>js/jquery-1.6.min.js"></script>
<title>个人信息</title>
</head>

<body>
	<a href="javascript:location.href='<%=basePath %>jsp/user/userInfo.jsp'"><div class="fanhui">账户充值</div></a>
	<div class="tishikuang">
		<div class="tishikuang1">用户名：${CurrentUser.nickname}</div>
		<div class="tishikuang1" id="userfulFounds">账户余额：0.00元</div>
		<div class="tishikuang1" id="userfulFounds">到账金额：<span id="collected">0.00</span>元</div>
		<div class="tishikuang2" >
			<div id="recharge">
				<div class="zhi left">充值</div>
				<div class="shu1 right">
					<div class="tu_1">
						<input id="amount" value="100" placeholder="请输入充值金额" />
						<!-- 设置默认值为100 chenph20161215 -->
					</div>
				</div>
				<div class="shu right">元</div>
			</div>
			<div class="fgx1"></div>
			<div class="shuliang">
				<div class="shuliang1" style="margin-bottom:10px;">
					<div  class="shuliang2 left">10</div>
					<div  class="shuliang2 left">20</div>
					<div  class="shuliang2 left">50</div>
				</div>
				<div class="shuliang1">
					<div  class="shuliang2 left">100</div>.
					<div  class="shuliang2 left">200</div>
					<div  class="shuliang2 left">500</div>
				</div>
			</div>
			<div class="fgx1"></div>
		</div>
		<div class="tishikuang3 clear">
			每笔入金收取手续费0.8%,每笔出金收取手续费2元。<br/>
			当日${rechargeTime}<br/>
			每次充值最少${amountRule.PERINMINLIMIT }元，最多${amountRule.PERINLIMIT }元<br/>
			当天最多充值${amountRule.DAYINLIMIT }元，最多充值${amountRule.INCOUNT}次
		</div>
		<div class="tishikuang4 clear" id="feeRule">
			<u>&nbsp;微信支付绑定银行卡及限额说明&nbsp;</u>
		</div>
		<div class="pay" style="">
			<div class="yhzf left paysure" title="UNIONRECHARGE" id="union"></div>
			<div class="wxzf right paysure" title="WXRECHARGE" id="wx"></div> 
			<!-- <div style="margin-left: 30%" class="mnzf left paysure" title="recharger" id="Analog"></div> -->
		</div>
	</div>
	<form id="frm" action="<%=path %>/tocServlet" method="post">
		<input type="hidden" name="amount" id="money" value="">
		<input type="hidden" name="reqName" id="reqName" value="recharger">
		<input type="hidden" name="token" value="<%=token%>">
		<div class="zhuanrang" id="zhuanrang">
			<div class="zhuanrang1">
				<div class="zhuanrang1-1">请选择银行卡</div>
				<div class="fgx"></div>
				<div class="zhuanrang1-2" >
					银行卡：
					 	<select id="bankNo" name="bankNo" >
					 	</select>
				</div>
				<div class="zhuanrang1-1"></div>
				<div class="shuliang02">
					<div class="shuliang02-1 left" id="quxiao" onclick="">取消</div>
					<div class="shuliang02-2 left" id="queding" onclick="">确定</div>
				</div>
			</div>
		</div>
	</form>
	<div class="fx_neir" id="fx_neir">
		<div class="content" id="content">
			<p style="margin-left: 10px;">
				如何绑定银行卡<br>
				请您将微信升级到最新版本，根据以下步骤操作即可：<br>
				1、进入"我"->钱包->银行卡，点击"添加银行卡"；<br>
				2、输入您本人的银行卡卡号、姓名、身份证号、银行预留手机号；<br>
				3、接收短信验证码，点击"下一步"根据页面提示设置支付密码即可。<br>
			</p>
			<p style="margin-left: 10px;">
				微信支付银行卡限额<br>
				1、您当前微信支付绑定银行卡限额的查看方法：<br/>
  				进入"我"->钱包->银行卡->点击您需要查看的银行卡即可查看；<br/>
  				2、微信支付常见银行限额如下：<br/>
				<img alt="" style="width: 95%" src="<%=basePath%>/images/wxpay.png"/>
				<br/>
				（由于各银行对微信支付额度限制不同，当银行限额小于系统设定金额时，按银行限额执行。）
			</p>
			<div class="shuliang8_1 clear" id="feeRuleSure">确认</div>
		</div>
	</div>
	<div id="gnnt_filter"></div>
</body>
<script type="text/javascript">
		var xzsj = $("#xzsj");
		var amount = $("#amount");
		var money = $("#money");
		var isNum = new RegExp("^[0-9]+\.{0,1}[0-9]{0,2}$");
		var zhuanrang = $("#zhuanrang");
		var width = zhuanrang.width();
		var height = zhuanrang.height();
		zhuanrang.css("left",($(window).width()-width)/2);
		zhuanrang.css("top",($(window).height()-height)/2);
		var filter = $("#gnnt_filter");
 		$(function(){
			$("#quxiao").click(function(){
				zhuanrang.hide();
				filter.hide();
			});
			$("#queding").click(function(){
				frm.submit();
			});
			$(".paysure").click(function(){
				var a = $("#amount").val();
				if(!isNum.test(a)){
					alert("充值金额"+a+"不是有效数字");
					return ;
				}
				$("#money").val(a);
				var reqN = $(this).attr("title");
				//验证金额格式是够正确
				//$("#frm").submit();
				var code = '${CurrentUser.userId}';
				$.ajax({
					type:"post",
					url:"<%=path%>/tocServlet?t="+new Date(),
					contentType: "application/x-www-form-urlencoded; charset=UTF-8",
					data:{reqName:"ALL_RECHARGECHECK",amount:a,code:code},
					dataType: "json",
					success: function(data){
						if(data !="" && data!=null && data !=undefined){
							var tag = data["retcode"];
							if(tag == 1){
								$("#reqName").val(reqN);
								if(reqN == "UNIONRECHARGE"){
									//银联充值，判断有没有绑定银行卡，如果绑定了弹出选择银行卡的div,如果没有，跳转到绑定银行卡的页面
									$.ajax({
										type:"post",
										url:"<%=path%>/tocServlet?t="+new Date(),
										contentType: "application/x-www-form-urlencoded; charset=UTF-8",
										data:{reqName:"BINGDINGBANKCHECK"},
										dataType: "json",
										success: function(data1){
											if(data1 !="" && data1!=null && data1 !=undefined){
												var retcode = data1["retcode"];
												if(retcode == 1){
													var retval = data1["retval"];
													var len = retval.length;
													$("#bankNo").empty(); 
													for(var i = 0;i < len; i++){
														var bank = retval[i];
														var bankNo = bank["BANKNO"];
														var subBankNo = bankNo.substring(bankNo.length-4);
														$("#bankNo").append("<option value='"+bankNo+"'>**** **** ****"+subBankNo+"</option>");
													}
													filter.show();
													$("#zhuanrang").show();
												}else{
													alert("请先绑定银行卡");
													window.location.href='<%=path %>/tocServlet?reqName=ADDBANKBINDINGFORWARD';
												}
											}else{
												alert("检验银行卡绑定时数据异常");
											}
										}
									});
								}else{
									$("#frm").submit();
								}
							}else if(tag == -1){
								alert("系统异常");
							}else if(tag == -2){
								alert("当前时间不允许充值");
							}else if(tag == -4){
								alert("您当日的申请次数已达到最大值");
							}else if(tag == -5){
								alert("您当日的申请总额度已达到最大值");
							}else if(tag == -6){
								alert("您此次的申请额度小于最小入金金额");
							}else if(tag == -3){
								alert("您此次的申请额度超过最大值");
							}
						}
					}
				});
			});
 	 		
 	 		$("#recharge").click(function(){
 	 			xzsj.show();
 	 	 	});

 	 	 	//$(".shu1").click(function(){
 	 	 	//	xzsj.hide();
 	 	 	//	var a = $(this).find("span").eq(0).html();
 	 	 	//	amount.html(a);
 	 	 	//	money.val(a);
 	 	 	//	$("#money").val(a);
 	 	 	//});
 			//刷新余额
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
 								var found = temp["UF"];//可用资金
 								$("#userfulFounds").html("账户余额："+Number(found).toFixed(2)+"元");
 							}
 						}
 					}
 				});
 			}
 			$.collectedAmount = function(amount){
 				amount = Number(amount);
 				var len = feeRuleJSN.length;
 				for(var i=0;i<len;i++){
 					var obj = feeRuleJSN[i];
 					var startVal = Number(obj["STARTVAL"]);
 					var endVal = Number(obj["ENDVAL"]);
 					if(amount>=startVal&&amount<endVal){
 						var feealgr = Number(obj["FEEALGR"]);
 						var feeRate = Number(obj["FEERATE"]);
 						var fee = $.computeFee(feealgr,feeRate,amount);
 						amount = amount-fee;
 						
 						amount=amount.toFixed(2);//取两位小数
 	 					break;
 					}
 				}
 				collected.html(amount);
 			}
 			//计算手续费
 			$.computeFee = function(feealgr,feeRate,amount){
 				if(feealgr == 1){//比例
 					return amount*feeRate;
 				}else if(feealgr == 2){//固定值
 					return feealgr;
 				}else{
 					alert("未知的手续费算法");
 				}
 				return 0;
 			}
 			$("#amount").keyup(function(){
 				var amount=$(this).val();
 				$("#money").val(amount);
 				$.collectedAmount(amount);
 			});
 			$("#feeRule").click(function(){
 				$("#fx_neir").show();
 			});
 			$("#feeRuleSure").click(function(){
 				$("#fx_neir").hide();
 			});
 			//刷新余额
 			$.userFoundController();	
 			var amount = $("#amount");
 			var collected = $("#collected");
 			$(".shuliang2").click(function(){
 				//修改背景颜色
 				$(".shuliang2").each(function(){
 					$(this).css("background-color","");
 				});
 				$(this).css("background-color","#17506d");
				//修改充值金额
				var v = $(this).html();
				amount.val(v);
				$.collectedAmount(v);
				$("#money").val(v);
 			});
 			var feeRule = '${feeRule}';
 			var feeRuleJSN = eval('(' + feeRule + ')');
 			
 	 	});
  </script>
<c:if test="${not empty returnmgs }">
	<script>
        alert('${returnmgs}');
    </script>
</c:if>
</html>
