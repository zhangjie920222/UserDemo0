<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ include file="../../public/taglib.jsp" %>
<%@page import="gnnt.MEBS.util.TokenProccessor"%>
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
	<link rel=stylesheet type="text/css" href="<%=skinPath%>/css/withdraw.css" title="cool">
    <script type="text/javascript" src="<%=basePath%>js/jquery-1.6.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>js/city.js" charset="GBK"></script>
	<title>${pageTitle}</title>
</head>

<body>
	<form action="<%=path%>/tocServlet" id="frm">
	<input type="hidden" name="reqName" value="withdrawMoney"/>
	<input type="hidden" name="token" value="<%=token%>"/>
	<div class="bt1" style="color:white;margin:0 auto;margin-bottom:20px;"><span>提现</span><a href="javascript:location.href='<%=basePath %>jsp/user/userInfo.jsp'"><img id="back" style="float:right;margin-top:15px;padding-right:20px;" src="<%=basePath %>images/back.png"/></a></div>
	<div class="tishikuang0">
		<div class="tishikuang0_1">
			<div class="gao">
				<div class="zhi0-1 left">可提取金额</div>
				<div class="shu0-1 right" id="userfulFounds">${CANOUTFUND }</div>
			</div>
			<c:if test="${null != BANKINFOLIST }">
			<div class="gao">
				<div class="zhi0-1 left">曾用银行</div>
				<div class="tu_1 right">
					<select id="bankInfo" class="xgsj_input">
						<option value="">--请选择曾用银行--</option>
						<c:forEach var="info" items="${BANKINFOLIST}">
							<option value="${info.CARDNO}">${info.CARDNO}</option>
						</c:forEach>				
					</select>
				</div>
			</div>
			</c:if>
			<div class="gao">
				<div class="zhi0-1 left">银行</div>
				<div class="tu_1 right">
					<select id="bankName" name="" class="xgsj_input">
						<option value="">--请选择银行--</option>
						<c:forEach var="_deal" items="${BANKLIST}">
							<option value="${_deal.NAME }">${_deal.NAME }</option>
						</c:forEach>				
					</select>
					<input type="hidden" name="bankName" id="encodeBankName"/>
				</div>
			</div>
			<div class="gao">
				<div class="zhi0-1 left">省份</div>
				<div class="tu_1 right">
					<select id="province" name="" class="xgsj_input">
						<option value="">--请选择省份--</option>
					</select>
					<input type="hidden" name="province" id="encodeProvince"/>
				</div>
			</div>
			<div class="gao">
				<div class="zhi0-1 left">城市</div>
				<div class="tu_1 right">
					<select id="city" name="" class="xgsj_input">
						<option value="">--请选择城市--</option>
					</select>
					<input type="hidden" name="city" id="encodeCity"/>
				</div>
			</div>
			<!-- <div class="gao">
				<div class="zhi0-1 left">支行名称</div>
				<div class="tu_1 right"><input name="subBankName" id="subBankName" placeholder="请输入支行行名称(选填)" /></div>
			</div> -->
			<div class="gao">
				<div class="zhi0-1 left" >银行卡号</div>
				<div class="tu_1 right">
					<input id="bankNo" class="xgsj_input" name="bankNo" placeholder="请输入银行卡号" />
				</div>
			</div>
			<div class="gao">
				<div class="zhi0-1 left">持卡人姓名</div>
				<div class="tu_1 right">
					<input name="name" id="name" placeholder="请输入持卡人姓名" />
					<input type="hidden" name="name" id="encodeName"/>
				</div>
			</div>
			<div class="gao">
				<div class="zhi0-1 left" >提取金额</div>
				<div class="tu_1 right"><input id="amount" name="amount" placeholder="请输入提取金额"  onkeyup="value=value.replace(/[^(\d)|(\d.\d)]/g,'')" /></div>
			</div>
			<div class="gao">
				<div class="zhi0-1 left" >交易密码</div>
				<div class="tu_1 right"><input id="password" name="password" type="password" placeholder="请输入交易密码" /></div>
			</div>
		</div>
		<div class="shuliang8 clear" id="submitBt"></div>
		<p id="china_citys"></p>
	</div>
	</form>
</body> 
<script type="text/javascript">
 		$(function(){
 			var isNum = new RegExp("^[0-9]+\.{0,1}[0-9]{0,2}$");
 			var ChinesePattern = new RegExp("^(([\u4e00-\u9fa5]*·[\u4e00-\u9fa5]+)|[\u4e00-\u9fa5]*)$");
 			var englishPattern = new RegExp("^(([A-Za-z]+\\s)*)([A-Za-z]+)$");
 			function hasLength(o){
 				if(o==null || o==""){
 					return false;
 				}
 				return true;
 			}
 			$("#name").blur(function(){
 				var name = $(this).val();
 				if(name == ""){
 					alert("请输入持卡人姓名");
 					$(this).val("");
 					return;
 				}
 				var isChinese = true;
 				if(!ChinesePattern.test(name)){
 					isChinese = false;
 				}
 				if(!isChinese&&!englishPattern.test(name)){
 					alert("持卡人姓名含有非法字符");
 					$(this).val("");
 					return;
 				}
 			});
 	 		$("#submitBt").click(function(){
 	 			var bankName = $("#bankName").val();
 	 			if(!hasLength(bankName)){
 	 				alert("请选择银行");
					return;
 	 			}
 	 			$("#encodeBankName").val(encodeURI(bankName));
 	 			var province = $("#province").val();
 	 			if(!hasLength(province)){
 	 				alert("请选择省份");
					return;
 	 			}
 	 			$("#encodeProvince").val(encodeURI(province));
 	 			var city = $("#city").val();
 	 			if(!hasLength(city)){
 	 				alert("请选择城市");
					return;
 	 			}
 	 			$("#encodeCity").val(encodeURI(city));
 	 			var name= $("#name").val();
				if(!hasLength(name)){
					alert("请输入持卡人姓名");
					return;
					}
				$("#encodeName").val(encodeURI(name));
 	 			var bankNo = $("#bankNo").val();
				if(!hasLength(bankNo)){
					alert("请输入银行卡号");
					return;
					}
				var amount = $("#amount").val();
				if(!hasLength(amount)){
					alert("请输入提取金额");
					return;
					}
				var _amount=amount.match(isNum)
				if(_amount!=amount){
					alert("提取金额不是有效数字");
					return ;
					}
				var userfulFounds = Number($("#userfulFounds").html());
				if(userfulFounds<amount){
					alert("可提取金额不足");
					return;
					}
				//var flag = confirm("确定提交吗");
				//if(flag){
				//	$("#frm").submit();
				//	}
				var password = $("#password").val();
				if(!hasLength(password)){
					alert("请输入交易密码");
					return;
					}
				var code = '${CurrentUser.userId}';
				$.ajax({
					type:"post",
					url:"<%=path%>/tocServlet?t="+new Date(),
					contentType: "application/x-www-form-urlencoded; charset=UTF-8",
					data:{reqName:"ALL_WITHDRAWCHECK",amount:amount,code:code},
					dataType: "json",
					success: function(data){
						if(data !="" && data!=null && data !=undefined){
							var tag = data["retcode"];
							if(tag == 1){
								var flag = confirm("确定提交吗");
								if(flag){
									$("#frm").submit();
								}
							}else if(tag == -1){
								alert("系统异常");
							}else if(tag == -2){
								alert("当前时间不允许提现");
							}else if(tag == -3){
								alert("您当日提现申请超过次数");
							}else if(tag == -4){
								alert("您当日提现申请总额超过最大值");
							}else if(tag == -5){
								alert("您此次的申请额度超过最大值");
							}else if(tag == -6){
								alert("您的余额不足");
							}else if(tag == -7){
								alert("您此次的申请的金额小于提现最小金额");
							}
						}
					}
				});
 	 	 	});
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
 								$("#userfulFounds").html(Number(found).toFixed(2));
 							}
 						}
 					}
 				});
 			}


 			//刷新余额
 			//$.userFoundController();	
 			//设置省份
 			$.setProvince = function(){
 				for(var i=1;i<arrCity.length;i++){
 					var province = arrCity[i];
 					var name = province["name"];
 					$("#province").append("<option value='"+name+"'>"+name+"</option>");   
 				}
 			}
 			$("#province").change(function(){
 				var name = $(this).val();
 				if(name!=null&&name!=""){
 					$("#city").empty();
 					$("#city").append("<option value=''>--请选择城市--</option>");   
 					for(var i=1;i<arrCity.length;i++){
 	 					var province = arrCity[i];
 	 					var _name = province["name"];
 	 					if(name==_name){
 	 						var subcitys = province["sub"];
 	 						for(var j=1;j<subcitys.length;j++){
 	 							var subCity = subcitys[j];
 	 							var subName = subCity["name"];
 	 							$("#city").append("<option value='"+subName+"'>"+subName+"</option>");  
 	 						}
 	 					}
 	 				}
 				}
 			});
 			var bankInfos = '${BANKINFOLIST}';
 			
 			$("#bankInfo").change(function(){
 				if(bankInfos != ''){
 					bankInfos = eval(bankInfos);
 					var cardNo = $(this).val();
 					if(cardNo == ''){
 						$("#bankName").val(""); 
						$("#province").val("");
						$("#province").change();
						$("#city").val("");
						$("#bankNo").val("");
						$("#name").val("");
 					}else{
 						$(bankInfos).each(function(index){
 	 						var temp = bankInfos[index];
 	 						var _cardNo = temp["CARDNO"];
 	 						if(cardNo == _cardNo){
 	 							$("#bankName").val(temp["BANKNAME"]);
 	 							$("#province").val(temp["PROVINCE"]);
 	 							$("#province").change();
 	 							$("#city").val(temp["CITY"]);
 	 							$("#bankNo").val(_cardNo);
 	 							$("#name").val(temp["NAME"]);
 	 						}
 	 					});
 					}
 				}
 			});
 			$.setProvince();
 			
 	 	});
  </script>
  <c:if test="${not empty returnmsg }">
	<script>
        alert('${returnmsg}');
    </script>
</c:if>
</html>
 