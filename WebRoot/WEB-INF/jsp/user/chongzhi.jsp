<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@page import="gnnt.MEBS.util.TokenProccessor"%>
<%@ include file="../../public/taglib.jsp" %>
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
	<link rel=stylesheet type="text/css" href="<%=basePath%>/css/recharge.css" title="cool">
    <script type="text/javascript" src="<%=basePath%>js/jquery-1.6.min.js"></script>
<title>个人信息</title>
</head>

<body>
	<a href="javascript:location.href='<%=basePath %>jsp/user/userInfo.jsp'"><div class="fanhui">账户充值</div></a>
	<div class="tishikuang">
		<div class="tishikuang1">用户名：${CurrentUser.nickname}</div>
		<div class="tishikuang1" id="userfulFounds">账户余额：0.00元</div>
		<div class="tishikuang2" >
			<div id="recharge">
				<div class="zhi left" style="width: 60%;">充值</div>
				<div class="tu right" ></div>
				<div class="shu right" style="width: 20%;text-align: right;" ><span id="amount">10</span><span>元</span></div>
			</div>
			<div class="xzsj" id="xzsj">
				<div class="shu1" ><span>10</span><span>元</span></div>
				<div class="shu1" ><span>20</span><span>元</span></div>
				<div class="shu1" ><span>50</span><span>元</span></div>
				<div class="shu1" ><span>100</span><span>元</span></div>
				<div class="shu1" ><span>200</span><span>元</span></div>
			</div>
		</div>
		<div class="shuliang7 clear" id="sure"></div>
	</div>
	<form id="frm" action="<%=path %>/tocServlet" method="post">
		<input type="hidden" name="amount" id="money" value="10">
		<input type="hidden" name="reqName" value="recharger">
		<input type="hidden" name="token" value="<%=token%>">
	</form>
</body>
<script type="text/javascript">
		var xzsj = $("#xzsj");
		var amount = $("#amount");
		var money = $("#money");
		var realMoneyTag = '${realMoneyTag}';
 		$(function(){

			$("#sure").click(function(){
				var a = money.val();
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
								if(realMoneyTag==1){
									$("#frm").submit();
								}else{
									var flag = confirm("确定充值"+a+"元");
									if(flag){
										$("#frm").submit();
									}
								}
							}else if(tag == -1){
								alert("系统异常");
							}else if(tag == -2){
								alert("当前时间不允许充值");
							}else if(tag == -4){
								alert("您当日的申请次数已达到最大值");
							}else if(tag == -5){
								alert("您当日的申请总额度已达到最大值");
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

 	 	 	$(".shu1").click(function(){
 	 	 		xzsj.hide();
 	 	 		var a = $(this).find("span").eq(0).html();
 	 	 		amount.html(a);
 	 	 		money.val(a);
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
 								$("#userfulFounds").html("账户余额："+Number(found).toFixed(2)+"元");
 							}
 						}
 					}
 				});
 			}

 			//刷新余额
 			$.userFoundController();	 
 	 	});
  </script>
<c:if test="${not empty returnmgs }">
	<script>
        alert('${returnmgs}');
    </script>
</c:if>
</html>
