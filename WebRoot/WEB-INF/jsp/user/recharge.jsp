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
    <!--������������--> 
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="Cache-Control" content="no-cache, must-revalidate">
    <meta http-equiv="expires" content="Wed, 26 Feb 1997 08:21:57 GMT">
    <!--iPhone �ֻ��������ֻ����벻����ʾΪ�������ӣ�-->
    <meta content="telephone=no, address=no" name="format-detection" />
    <!--IOS˽�����ԣ�������ӵ�����Ļ-->
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <!--��Ļ����������ɫ-->
    <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
	<link rel=stylesheet type="text/css" href="<%=skinPath%>/css/model.css" title="cool">
    <script type="text/javascript" src="<%=basePath%>js/jquery-1.6.min.js"></script>
<title>������Ϣ</title>
</head>
<body>
<div class="bt1" style="color:white;margin:0 auto;margin-bottom:20px;"><span>��ǰ��ֵҳ��</span><a href="javascript:location.href='<%=basePath %>jsp/user/userInfo.jsp'"><img style="float:right;margin-top:15px;padding-right:20px;" src="<%=basePath %>images/back.png"/></a></div>
<div class="xgsj" style="padding-bottom:10px;">
<div class="grzx"> 
 <div class=" grzx_tx"><img src="<%=basePath %>/images/login.gif" width="100" height="100" /></div>
 <div class="gezx_l1bor" style="width:60%;">
 <div class="gezx_l1">${CurrentUser.nickname}</div>
 <div class="gezx_l1" id="userfulFounds">�˻���0.00Ԫ</div>
 <div class="gezx_l1" id="userfulFounds">���˽�<span id="collected">0.00</span>Ԫ</div>
  
   </div>
 <div class="clear"></div> 
</div>
<div class="cz_bt">�������ֵ��</div>
<div class="cz_bt"><input class="cz_input" id="amount" value="100" placeholder="�������ֵ��ÿ��&gt;10Ԫ��" />
</div>
<div class="cz_q" style="margin:10px 0;">
  <div class="rechargeNum">100</div>
  <div class="rechargeNum">200</div>
  <div class="rechargeNum">500</div>
  <div class="rechargeNum">1000</div>
  <div class="clear"></div>
</div>
<div class="tishikuang3 clear" style="color:white;text-align:center;">
			<!-- ÿ�������ȡ������0.8%,ÿ�ʳ�����ȡ������2Ԫ�� -->
			<!-- ���ݺ�̨��������ݶ�̬ƴ����ʾ�����ѹ���������?��jquery�����ʼ���� chenph 20161216 -->
			<span id="inOrOutToast">toast</span>
						<br/>	
					����${rechargeTime}<br/>
			ÿ�γ�ֵ����${amountRule.PERINMINLIMIT }Ԫ�����${amountRule.PERINLIMIT }Ԫ<br/>
			��������ֵ${amountRule.DAYINLIMIT }Ԫ������ֵ${amountRule.INCOUNT}��
</div>
<div class="tishikuang4 clear" id="feeRule" style="color:red;text-align:left;">
			<u>&nbsp;΢��֧�������п����޶�˵��&nbsp;</u>
</div>
		<!-- <div class="pay" style="">
			<div class="yhzf left paysure" title="UNIONRECHARGE" id="union"></div>
			<div class="wxzf right paysure" title="WXRECHARGE" id="wx"></div> 
			<div style="margin-left: 30%" class="mnzf left paysure" title="recharger" id="Analog"></div>
		</div> -->

<div class="cz_bt">��ѡ���ֵ��ʽ��</div>
<div class="cz_line paysure" id="wx"  title="WXRECHARGE" >
  <div class="xx_l_ico"><img src="<%=basePath %>images/wx.png" width="30" height="30" /></div>
  <div class="xx_l_txt">΢��֧��</div>
  <div class="xx_l_r"><img src="<%=basePath %>images/xz1.png" width="30" height="30" /></div> 
</div>
<div class="cz_line paysure" id="union" title="UNIONRECHARGE">
  <div class="xx_l_ico"><img src="<%=basePath %>images/yyl.png" /></div>
  <div class="xx_l_txt">����֧��</div>
  <div class="xx_l_r"><img src="<%=basePath %>images/mx1.png" width="30" height="30" /></div> 
</div>
   <div class="dl_txt1" id="submitform">
       <div class="dl_btn3"  style="margin:0 auto;margin-top:10px;">������ֵ</div>
  </div>


<form id="frm" action="<%=path %>/tocServlet" method="post">
		<input type="hidden" name="amount" id="money" value=""/>
		<input type="hidden" name="reqName" id="reqName" value="recharger"/>
		<input type="hidden" name="token" value="<%=token%>"/>
		<div class="zhuanrang" id="zhuanrang">
			<div class="zhuanrang1">
				<div class="zhuanrang1-1" style="background:#f05b57;color:white">��ѡ�����п�</div>
				<div class="zhuanrang1-2" >
					���п���
					 	<select id="bankNo" name="bankNo" >
					 	</select>
				</div>
				<div class="zhuanrang1-1"></div>
				<div class="shuliang02">
					<div class="shuliang02-1 left" id="quxiao" style="background:#f05b57" onclick="">ȡ��</div>
					<div class="shuliang02-2 left" id="queding" style="background:#f05b57" onclick="">ȷ��</div>
				</div>
			</div>
		</div>
	</form>
</div>
<div class="fx_neir" id="fx_neir" style="display:none;color:white;">
		<div class="content" id="content">
			<p style="margin-left: 10px;">
				��ΰ����п�<br>
				������΢�����������°汾���������²���������ɣ�<br>
				1������"��"->Ǯ��->���п������"������п�"��<br>
				2�����������˵����п����š����������֤�š�����Ԥ���ֻ��ţ�<br>
				3�����ն�����֤�룬���"��һ��"����ҳ����ʾ����֧�����뼴�ɡ�<br>
			</p>
			<p style="margin-left: 10px;">
				΢��֧�����п��޶�<br>
				1������ǰ΢��֧�������п��޶�Ĳ鿴������<br/>
  				����"��"->Ǯ��->���п�->�������Ҫ�鿴�����п����ɲ鿴��<br/>
  				2��΢��֧�����������޶����£�<br/>
				<img alt="" style="width: 95%" src="<%=basePath%>/images/wxpay.png"/>
				<br/>
				�����ڸ����ж�΢��֧��������Ʋ�ͬ���������޶�С��ϵͳ�趨���ʱ���������޶�ִ�С���
			</p>
			<div class="shuliang8_1 clear" id="feeRuleSure" style="height:50px;line-height:50px;width:100%;text-align:center;color:white;background:#1578ce;">����</div>
		</div>
	</div>
<div id="gnnt_filter"></div>
<input type="hidden" id="checkflag" value="WXRECHARGE"/>
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
 	 		
 	 		$("#recharge").click(function(){
 	 			xzsj.show();
 	 	 	});

 	 	 
 			//ˢ�����
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
 								var found = temp["UF"];//�����ʽ�
 								$("#userfulFounds").html("�˻���"+Number(found).toFixed(2)+"Ԫ");
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
 						
 						amount=amount.toFixed(2);//ȡ��λС��
 	 					break;
 					}
 				}
 				collected.html(amount);
 			}
 			//����������
 			$.computeFee = function(feealgr,feeRate,amount){
 				if(feealgr == 1){//����
 					return amount*feeRate;
 				}else if(feealgr == 2){//�̶�ֵ
 					return feealgr;
 				}else{
 					alert("δ֪���������㷨");
 				}
 				return 0;
 			}
 			$("#amount").keyup(function(){
 				var amount=$(this).val();
 				$("#money").val(amount);
 				$.collectedAmount(amount);
 			});
 			$("#feeRule").click(function(){
 				scroll(0,0);
 				$("#fx_neir").show();
 				$(".xgsj").hide();
 			});
 			$("#feeRuleSure").click(function(){
 				$(".xgsj").show();
 				$("#fx_neir").hide();
 				
 			});
 			//ˢ�����
 			$.userFoundController();	
 			var amount = $("#amount");
 			var collected = $("#collected");
 			$(".rechargeNum").click(function(){
 				//�޸ı�����ɫ
 				$(".rechargeNum").each(function(){
 					$(this).css("background-color","");
 				});
 				$(this).css("background-color","#1578ce");
				//�޸ĳ�ֵ���
				var v = $(this).html();
				amount.val(v);
				$.collectedAmount(v);
				$("#money").val(v);
 			});
 			var feeRule = '${feeRule}';
 			var feeRuleJSN = eval('(' + feeRule + ')');
 				
 			////////////////////////////////////chenph 20161216 begin
 			//ȡ���������json ƴ���ַ�����ʾ���н��ݳ�����������շѹ���
 			var toastString = '';	//inOrOutToast.html(toastString);
			var len = feeRuleJSN.length;
			for(var i=0;i<len;i++){
				var obj = feeRuleJSN[i];
				var startVal = Number(obj["STARTVAL"]);
				var endVal = Number(obj["ENDVAL"]);
				var feealgr = Number(obj["FEEALGR"]);
				var feeRate = Number(obj["FEERATE"]);  
				////��� type=2      ���� type=1         ���ͣ�����=1  0.006 �̶�ֵ=2 2
				if(feealgr == 1){
					feeRate=feeRate*100;	//0.600
					feeRate=feeRate.toFixed(1);//ȡ1λС�� 0.6   ����ȡ������0.8%
					toastString = toastString + '�������' + startVal + 'Ԫ��' + endVal + 'Ԫ֮��ʱ��ÿ�������ȡ������' + feeRate + '%��';
				}else if(feealgr == 2){
					toastString = toastString + '�������' + startVal + 'Ԫ��' + endVal + 'Ԫ֮��ʱ��ÿ�������ȡ������' + feeRate + 'Ԫ��';
				}else{
 					alert("δ֪���������㷨");
 				} 
				//ÿ�������ȡ������0.8%,ÿ�ʳ���?�ȡ�����?Ԫ 
			} 
 		 	//ȡ����������json ƴ���ַ�����ʾ���н��ݳ�����������շѹ��� 
 		 	 
			var feeRuleOut= '${feeRuleOut}';
			var feeRuleOutJSN = eval('(' + feeRuleOut + ')'); 
			var len = feeRuleOutJSN.length;
			for(var i=0;i<len;i++){
				var obj = feeRuleOutJSN[i];
				var startVal = Number(obj["STARTVAL"]);
				var endVal = Number(obj["ENDVAL"]);
				var feealgr = Number(obj["FEEALGR"]);
				var feeRate = Number(obj["FEERATE"]);  
				////��� type=2      ���� type=1         ���ͣ�����=1  0.006 �̶�ֵ=2 2
				if(feealgr == 1){
					feeRate=feeRate*100;	//0.600
					feeRate=feeRate.toFixed(1);//ȡ1λС�� 0.6   ����ȡ������0.8%
					toastString =  toastString +  '��������' + startVal + '��' + endVal + 'Ԫ֮��ʱ��ÿ�ʳ�����ȡ������' + feeRate + '%��';
				}else if(feealgr == 2){
					toastString =  toastString +  '��������' + startVal + '��' + endVal + 'Ԫ֮��ʱ��ÿ�ʳ�����ȡ������' + feeRate + 'Ԫ��';
				}else{
 					alert("δ֪���������㷨");
 				} 
				//ÿ�������ȡ������0.8%,ÿ�ʳ�����ȡ������2Ԫ 
			}    
			
			
			$("#inOrOutToast").html(toastString); 
 			/* ��ʼ��Ĭ��100��ֵ��ͬʱ���㵽�˽�� 20161216chenph */
 			$.collectedAmount(100);	//�˴���amountû�л�ȡ��ֵ��..ֱ��д��100Ĭ��ֵ��������ͬ
			////////////////////////////////////chenph 20161216 end
	 
     
 		
		//��ѡ��֧����ʽ�����ύ
		$(".paysure").click(function(){	
			$(".paysure .xx_l_r img").attr("src","<%=basePath %>images/mx1.png");
			$(this).children().eq(2).find("img").attr("src","<%=basePath %>images/xz1.png");
			$("#checkflag").val($(this).attr("title").trim());
		});	
		//�ύ
	
 });
 		$("#submitform").click(function(){
 			var a = $("#amount").val();
 			if(!isNum.test(a)){
 				alert("��ֵ���"+a+"������Ч����");
 				return ;
 			}
 			$("#money").val(a);
 			var reqN = $("#checkflag").val();
 			
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
								//������ֵ���ж���û�а����п���������˵���ѡ�����п���div,���û�У���ת�������п���ҳ��
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
												alert("���Ȱ����п�");
												window.location.href='<%=path %>/tocServlet?reqName=ADDBANKBINDINGFORWARD';
											}
										}else{
											alert("�������п���ʱ�����쳣");
										}
									}
								});
							}else{
								$("#frm").submit();
							}
						}else if(tag == -1){
							alert("ϵͳ�쳣");
						}else if(tag == -2){
							alert("��ǰʱ�䲻�����ֵ");
						}else if(tag == -4){
							alert("�����յ���������Ѵﵽ���ֵ");
						}else if(tag == -5){
							alert("�����յ������ܶ���Ѵﵽ���ֵ");
						}else if(tag == -6){
							alert("���˴ε�������С����С�����");
						}else if(tag == -3){
							alert("���˴ε������ȳ������ֵ");
						}
					}
				}
			});
 		});	
  </script>
<c:if test="${not empty returnmgs }">
	<script>
        alert('${returnmgs}');
    </script>
</c:if>
  </body>
</html>
