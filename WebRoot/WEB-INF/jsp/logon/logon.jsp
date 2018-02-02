<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ page isELIgnored="false" %>
<%@ include file="../../public/path.jsp"%>
<!DOCTYPE>
<html>
  <head>
    <title>${pageTitle}</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/> 
	<meta name="format-detection" content="telephone=no, email=no" />
	<meta name="webview" content="webView.detectsPhoneNumbers=NO" />
	<link rel="stylesheet" type="text/css" href="<%=skinPath%>css/logon.css"/>
	<script type="text/javascript" src="<%=basePath%>/js/jquery-1.6.min.js"></script>      

  </head>
<body onload="loading()" style="font-size:16px">

<form id="frm" name="frm" autocomplete="off" method="post" action="<%=path%>/tocServlet">
	<input type="hidden" name="reqName" value="logon">
<div class="dl" id="denglu">
   <div class="dl_ico"><img src="<%=basePath %>images/ico5.png"/></div>
   <div class="dl_txt">
     <input name="password" id="pass" class="dl_input" type="password" placeholder="交易密码" />
   </div>
<div class="dl_txt">
      <span class="font_b1" style="display: inline-block;"><input id="agree" name="agree" checked="checked" type="checkbox"style="vertical-align: bottom;" /></span><span class="font_b1">我已阅读<a href='#' style="color:white;cursor:pointer;text-decoration:none;" id='riskTip' onclick='showRisk()'>《风险提醒》</a></span>
</div>
    <div class="dl_txt"><span class="font_b1"><a style="color:white;cursor:pointer;text-decoration:none;" href="javascript:location.href='<%=basePath %>jsp/user/wangjimima.jsp'">忘记密码？</a></span></div>
     <div class="dl_txt">
       <div class="dl_btn1" id="quxiao" >取消</div>
       <div class="dl_btn2" id="queding">确定</div>
     </div>
 </div>
</form>

<div class="fx_neir" id="fx_neir" style="background:white;display: none;font-size:14px;padding: 10px;" >
		<div class="content" id="content">
			<p style="font-size:16px;text-align:center;">商品买卖风险揭示书</p>
<p style="font-size:14px;text-align:center;font-weight: bold;">商品买卖风险揭示书</p>
<p style="font-size:14px;text-align:center;font-weight: bold;">市场风险莫测　务请谨慎从事</p>
<p>
尊敬的客户：
　 根据深圳腾邦全球商品交易中心的规定，现向您提供本《商品买卖风险揭示书》。
　　进行商品买卖风险相当大，可能发生巨额损失，损失的总额可能超过您存放在深圳腾邦全球商品交易中心的全部初始订金以及追加订金。进行商品买卖风险较大，可能发生较大亏损。因此，您必须认真考虑自己的经济能力是否适合进行商品买卖。
　　考虑是否进行商品买卖时，您应当明确以下几点：<br/>
　　一、您在腾邦商城进行买卖，假如市场走势对您不利导致您的账户订金不足时。如您未于规定时间内存入所需订金，您持有的未平仓订单将可能在亏损的情况下被强行平仓，您必须承担由此导致的一切损失。
　　<br/>二、您必须认真阅读并遵守商品买卖所和深圳腾邦全球商品交易中心的业务规则，如果您无法满足商品买卖和深圳腾邦全球商品交易中心业务规则规定的要求，您所持有的未平仓订单将可能根据有关规则被强行平仓，您必须承担由此产生的后果。
　<br/>三、由于国家法律、法规、政策的变化、商品买卖规则的修改、紧急措施的出台等原因，您持有的未平仓订单可能无法继续持有，您必须承担由此导致的损失。
　<br/>四、由于非商品买卖所或者深圳腾邦全球商品交易中心所能控制的原因，例如：地震、水灾、火灾等不可抗力因素或者计算机系统、通讯系统故障等，可能造成您的指令无法成交或者无法全部成交，您必须承担由此导致的损失。
<br/>五、在国内商品买卖中，所有的买卖结果须以当日买卖所或结算机构的结算数据为依据。如果您利用盘中即时回报的买卖结果作进一步的买卖，您可能会承担额外的风险。
<br/>六、如果您未遵守深圳腾邦全球商品交易中心关于商品订金安全存管的规定，将可能会影响您的商品订金的安全性。
<br/>七、利用互联网进行商品买卖时将存在(但不限于)以下风险，您将承担由此导致的损失：
<br/>1．由于无法控制和不可预测的系统故障、设备故障、通讯故障、电力故障、网络故障及其它因素，可能导致买卖系统非正常运行甚至瘫痪，使您的买卖指令出现延迟、中断、数据错误等情况；
<br/>2．由于网上买卖系统存在被网络黑客和计算机病毒攻击的可能性，由此可能导致买卖系统故障，使买卖无法进行及行情信息出现错误或延迟；
<br/>3．互联网上的数据传输可能因通信繁忙等原因出现延迟、中断、数据错误或不完全，从而使网上买卖出现延迟、中断;
<br/>4．如果您缺乏网上买卖经验，可能因操作不当造成买卖失败或买卖失误；
<br/>5．您的密码失密或被他人盗用。
<br/>本《商品买卖风险揭示书》无法揭示从事商品买卖的所有风险和有关腾邦商城的全部情形。故您在入市买卖之前，应全面了解商品买卖法律法规、商品买卖规则及深圳腾邦全球商品交易中心的业务规则，对自身的经济承受能力、风险控制能力、身体及心理承受能力（仅对自然人客户而言）作出客观判断，对商品买卖作仔细的研究。
<br/><p style="text-align: right;"> 深圳腾邦全球商品交易中心<br/>

			</p>	
			<a id='closeRisk' href='#' onclick='hideRisk()' style="text-decoration:none;"><div class="shuliang8_1 clear" style="padding:15px;background:#1578ce;color:white;text-align:center;">确认</div></a>
			</div>
	</div>
<script type="text/javascript">
function showRisk(){
         $("#denglu").hide();
	$('#fx_neir').show();
	};
function hideRisk(){
	$('#fx_neir').hide();
          $("#denglu").show();
	$('#agree')[0].checked = true;
	};
function loading(){
	var msg = '${resultMsg}';
	if(msg !=""){
		alert(msg);
	}
	//var userIds = getCookie("userIds");
	//if(userIds != null){
	//	$("#userId").val(userIds);
	//}
}
function getCookie(name)
{
    var bikky = document.cookie;
    name += "=";
   var i = 0;
   while (i < bikky.length)
   {
        var offset = i + name.length;
        if (bikky.substring(i, offset) == name)
        {
             var endstr = bikky.indexOf(";", offset);
             if (endstr == -1) endstr = bikky.length;
   
         //alert(bikky.substring(offset, endstr));
             return (bikky.substring(offset, endstr)); //返回的是string类型
        }
        i = bikky.indexOf(" ", i) + 1;
        if (i == 0) break;
   }
    return null;
}
	$(function(){
		var denglu = $("#denglu");
		$("#quxiao").click(function(){
			$("#pass").val("");
		});
		$("#queding").click(function(){
			var pass = $("#pass").val();
			if(pass == null || pass==""){
				alert("请输入交易密码！");
				return;
			}
			var agree = document.getElementById("agree").checked;
			if(!agree){
				alert("请先阅读风险提醒");
				return;
				}
			$("#frm").submit();
			
		});
	});
</script>

</body>
</html>
