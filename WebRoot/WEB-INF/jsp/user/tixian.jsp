<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ include file="../../public/taglib.jsp" %>
<%@page import="gnnt.MEBS.util.TokenProccessor"%>
<%
String _path = request.getContextPath();
String path =  request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+_path;
String basePath = path+"/app/toc/";

TokenProccessor proccessor=TokenProccessor.getInstance();
String token = proccessor.makeToken();
request.getSession().setAttribute("token",token);
%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
<link rel=stylesheet type="text/css" href="<%=basePath%>/css/1_liuqw.css" title="cool">
    <script type="text/javascript" src="<%=basePath%>js/jquery-1.6.min.js"></script>
<title>个人信息</title>
</head>

<body>
	<form action="<%=path%>/tocServlet" id="frm">
	<input type="hidden" name="reqName" value="withdrawMoney"/>
	<input type="hidden" name="token" value="<%=token%>">
	<a href="javascript:location.href='<%=basePath %>jsp/user/userInfo.jsp'"><div class="fanhui">提现</div></a>
	<div class="tishikuang0" style="height: 320px;">
		<div class="tishikuang0_1" style="height: 250px;">
			<div class="gao">
				<div class="zhi0-1 left">可提取金额</div>
				<div class="shu0-1 right" id="userfulFounds">0.00</div>
			</div>
			<div class="gao">
				<div class="zhi0-1 left">持卡人姓名</div>
				<div class="tu_1 right"><input name="name" id="name" placeholder="请输入持卡人姓名" /></div>
			</div>
			<div class="gao">
				<div class="zhi0-1 left" >银行卡号</div>
				<div class="tu_1 right"><input id="bankNo" name="bankNo" placeholder="请输入银行卡号" /></div>
			</div>
			<div class="gao">
				<div class="zhi0-1 left">银行名称</div>
				<div class="tu_1 right"><input name="bankName" placeholder="请输入银行名称（选填）" /></div>
			</div>
			<div class="gao">
				<div class="zhi0-1 left" >提取金额</div>
				<div class="tu_1 right"><input id="amount" name="amount" placeholder="请输入提取金额" /></div>
			</div>
		</div>
		<div class="shuliang8 clear" id="submitBt"></div>
	</div>
	</form>
</body>
<script type="text/javascript">
 		$(function(){
 			var isNum = new RegExp("^[0-9]+\.{0,1}[0-9]{0,2}$");
 			function hasLength(o){
 				if(o==null || o==""){
 					return false;
 				}
 				return true;
 			}
 	 		$("#submitBt").click(function(){
 	 			var name= $("#name").val();
				if(!hasLength(name)){
					alert("请输入持卡人姓名");
					return;
					}
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
				if(!isNum.test(amount)){
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
 			$.userFoundController();	 
 	 	});
  </script>
  <c:if test="${not empty returnmsg }">
	<script>
        alert('${returnmsg}');
    </script>
</c:if>
</html>
