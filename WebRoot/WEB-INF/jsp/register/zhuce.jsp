<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../../public/path.jsp"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK" />
<meta name="viewport" content="width=device-width,target-densitydpi=medium-dpi,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
<link rel=stylesheet type="text/css" href="<%=skinPath %>css/register.css" title="cool">
<script type="text/javascript" src="<%=basePath%>js/special-char.js"></script>
<script type="text/javascript" src="<%=basePath%>js/jquery-1.6.min.js"></script>
<title>${pageTitle}</title>
<c:if test="${not empty resultMsg }">
	<script>
        alert('${resultMsg}');
    </script>
</c:if>
<script type="text/javascript">
	var CharPattern = new RegExp("^(([\u4e00-\u9fa5a-zA-Z0-1]*·[\u4e00-\u9fa5a-zA-Z0-9]+)|[\u4e00-\u9fa5a-zA-Z0-9]*)$");
	function showRisk(){
		$('#bg').show();
		$('#fx_neir').show();
		};
	function hideRisk(){
		$('#bg').hide();
		$('#fx_neir').hide();
		$('#agree')[0].checked = true;
		};
	var time = 0;
	function countTime() {
		    var clock = setInterval(function() {
			time = time - 1;
			document.getElementById("sms").value="获取验证码("+time+'s)';
			if (time<=0){
				window.clearInterval(clock);
				document.getElementById("sms").disabled=false;
				document.getElementById("sms").value="获取验证码";
			}
		}, 1000)
	};
	function sendSMS() {
		var mobile = $('#tel').val();
		if(!checkTel())
		{
			return ;
		}
		$.ajax({
			type:"post",
			url:"<%=path%>/tocServlet?t="+new Date(),
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			data:"reqName=registerYZM&mobile="+mobile,
			dataType: "json",
			success: function(data)
			{
				if(data != null){
					var ret = data["code"];
					if(ret != 0){
						alert(data["message"]);
					}else{
						time=180;
						document.getElementById("sms").disabled=true;
						countTime();
					}
				}
			}
		});
	};
	function checkAndSubmit(){
		var flag1 = checkTel() && checkConfirm() && checkAgree();
		if (flag1){
			var mobile = $('#tel').val();
			var flag = false;
			var yzm_val = $('#smsval').val();
			if(yzm_val=="")
			{
				window.alert("填写验证码！");
				return ;
			}
			$.ajax({
				type:"post",
				url:"<%=path%>/tocServlet?t="+new Date(),
				contentType: "application/x-www-form-urlencoded; charset=UTF-8",
				data:"reqName=registerYZMCheck&yzm_val="+yzm_val+"&mobile="+mobile,
				dataType: "text",
				success: function(data)
				{
					if(data=="true")
					{
						document.getElementById("frm").submit();
					}else
					{
						window.alert(data);
					}
				}
			});
		}
	};
	function checkConfirm(){
		var flag = false;
		var name = document.getElementById('name');
		if(name==null||name.value==""){
			alert("请输入姓名");
			return flag;
		}
		$("#encodeName").val(encodeURI(name.value))
		var flag = checkSpecialChar(name.value);
		if(!flag){
			alert("姓名中含有特殊字符");
			$(this).val("");
			return false;
		}
		if(!CharPattern.test(name.value)){
			alert("姓名含有非法字符");
			$(this).val("");
			$(this).focus();
			return;
		}
		var psd = document.getElementById('psd');
		var psdconfirm = document.getElementById('psdconfirm');
		if (psd.value==null||psd.value==""){
			alert("请输入密码");
		}else if (psd.value!=psdconfirm.value){
			alert("两次密码不一致");
		}else {
			flag = true;
		}
		return flag;
	};
	function checkTel(){
		var flag = false;
		var tel = document.getElementById("tel");
		if (tel.value==null||tel.value==""){
			alert("请填写手机号码再操作");
		} else if(isNaN(tel.value)||tel.value <= 0){
			alert("手机号码只能为数字");
		} else if(tel.value.length != 11){
			alert("请核对您填写的手机号码");
		} else {
			flag = true;
		}
		return flag;
	};
	function checkAgree(){
		var agree = document.getElementById("agree");
		var flag = agree.checked;
		if (!flag){
			alert("请先阅读风险提醒");
		}
		return flag;
	};
	$(function(){
		$("#name").blur(function(){
			var name = $(this).val();
			if(name != ""){
				var flag = checkSpecialChar(name);
				if(!flag){
					alert("姓名中含有特殊字符");
					$(this).val("");
					return;
				}
				if(!CharPattern.test(name)){
					alert("姓名含有非法字符");
					$(this).val("");
					$(this).focus();
					return;
				}
			}
		});
	});
</script>
</head>
<body style="margin:0 auto;background:#ccc;">
	<div class="bt1" style="color:white;margin:0 auto;margin-bottom:20px;"><span>手机绑定注册</span>	
	</div>
	<form id="frm" action="<%=path%>/tocServlet">
		<input type="hidden" name="reqName" value="registerByPhone"/>
		<input type="hidden" name="openId" value="${OPENID }">
		<input type="hidden" name="appCode" value="${APPCODE }">
		<div class="tishikuang" style="height:360px;">
			<div class="tishikuang0_23" style="height:240px;">
				<div class="gao">
					<div class="tu_11 "><input id="tel" name="tel" placeholder="请输入手机号" /></div>
				</div>
				<div class="gao">
					<div class="tu_11 ">
						<input id="name" placeholder="请输入姓名" />
						<input id="encodeName" name="name" type="hidden" />
					</div>
				</div>
				<div class="gao">
					<div class="tu_11 "><input id="psd" name="psd" type="password" placeholder="请输入密码" /></div>
				</div><div class="gao">
					<div class="tu_11 "><input id="psdconfirm" name="psdAgain" type="password" placeholder="请确认密码" /></div>
				</div>
				<div class="gao">
					<div class="tu_10 left"><input id="smsval" name="yzm" placeholder="请输入验证码" /></div>
					<div class="zhi0-11 right"><input style="height:40;width:90%;" id="sms" type="button" value="获取验证码" onclick="sendSMS()"></div>
				</div>
			</div>
			<div class="clear">
				<div class="zhi0-12"><input id="agree" name="agree" type="checkbox" />我已阅读<a href='#' style="color:#0099FF" id='riskTip' onclick='showRisk()'>《风险提醒》</a></div>
			</div>
			<div class="shuliang8 clear" onclick="checkAndSubmit()"></div>
		</div>
	</form>
	<div id="bg"></div>
	<div class="fx_neir" id="fx_neir">
		<div id="content" style="color:#fafafa;">
				<p>
				重要提示：请您务必在参与吉林农产品微盘前详细阅读本规则并充分理解下列文字内容：
				</p>
				<p> 吉林农产品微盘提供实盘资金和交易通道，客户根据本参与规则，通过入金或充值支付交易综合费用及承诺承担有限交易亏损赔付义务后，获得在限定时间内限定数量的商品交易权和利润分配权。
				</p>
				<p>
				交易标的物
				</p>
				<p>
				在吉林农产品微盘交易平台上进行交易的所有交易品种。
				</p>
				<p>
				交易数量
				</p>
				<p>
				具体细则参照吉林农产品微盘发布的相关交易规则及管理规定执行。
				</p>
				<p>
				交易报价
				</p>
				<p>吉林农产品微盘综合国际市场商品价格和国内其他市场价格以及中国人民银行人民币兑美元基准汇率、市场供求关系等，连续报出交易中心商品现货的人民币价格。
				</p>
				<p>
				交易时间、结算时间
				</p>
				<p>
				具体细则参照吉林农产品微盘发布的相关交易规则及管理规定执行。
				</p>
				<p>
				结算止盈
				</p>
				<p>当客户订货浮盈额达到保证金的一定比例时，系统将自动中止客户交易权并按止盈额进行结算。该比例可由客户自行设为10%、20%、30%、40%、50%，或不选择。
				</p>
				<p>
				结算止损
				</p>
				<p>
				当客户订货浮亏额达到保证金的一定比例时，系统将自动中止客户交易权并按止亏额进行结算。该比例可由客户自行设为10%、20%、30%、40%、50%，或不选择。
				</p>
				<p>
				交易手续费
				</p>
				<p>
				用于支付在委托买卖产品时应支付服务费用。具体细则参照吉林农产品微盘发布的相关交易规则及管理规定执行。
				</p>
				<p>
				交易风险申明
				</p>
				<p>1）技术风险：由于交易是通过电子通讯技术来实现的，这些技术存在着被网络黑客和病毒攻击的可能，由此可能给客户带来损失，客户将不得不承担由此导致的损失。
				</p>
				<p>2）由于微盘并不能控制电讯信号的中断和连接以及互联网的畅通，也不能保证客户自身网络设备及电讯设备的稳定性，由此等原因而使客户遭受的损失，由客户自行承担，吉林农产品微盘不负有任何责任。
				</p>
				<p>3）不可抗力因素导致的风险：诸如地震、火灾、水灾、战争、暴动、罢工等不可抗力因素导致的交易中断、延误等风险，吉林农产品微盘不承担责任，但应在条件允许的范围内采取必要的补救措施以减少因不可抗力造成的损失
				</p>
				<p>4）其他风险：由于客户密码失密、操作不当、投资决策失误等原因可能会发生亏损，该损失将由客户自行承担；
				</p>
				<p>
				本规则解释权归属吉林农产品交易中心，同时吉林农产品交易中心保留对参与规则进行必要变更和完善的权利。		
				</p>		
				<p style="text-align: right;">
				 吉林农产品交易中心<br/>
                             400-640-1599
				</p>
			<a id='closeRisk' href='#' onclick='hideRisk()'><div class="shuliang8_1 clear">确认</div></a>
			</div>
	</div>
</body>
</html>
