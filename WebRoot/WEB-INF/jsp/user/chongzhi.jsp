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
<title>������Ϣ</title>
</head>

<body>
	<a href="javascript:location.href='<%=basePath %>jsp/user/userInfo.jsp'"><div class="fanhui">�˻���ֵ</div></a>
	<div class="tishikuang">
		<div class="tishikuang1">�û�����${CurrentUser.nickname}</div>
		<div class="tishikuang1" id="userfulFounds">�˻���0.00Ԫ</div>
		<div class="tishikuang2" >
			<div id="recharge">
				<div class="zhi left" style="width: 60%;">��ֵ</div>
				<div class="tu right" ></div>
				<div class="shu right" style="width: 20%;text-align: right;" ><span id="amount">10</span><span>Ԫ</span></div>
			</div>
			<div class="xzsj" id="xzsj">
				<div class="shu1" ><span>10</span><span>Ԫ</span></div>
				<div class="shu1" ><span>20</span><span>Ԫ</span></div>
				<div class="shu1" ><span>50</span><span>Ԫ</span></div>
				<div class="shu1" ><span>100</span><span>Ԫ</span></div>
				<div class="shu1" ><span>200</span><span>Ԫ</span></div>
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
									var flag = confirm("ȷ����ֵ"+a+"Ԫ");
									if(flag){
										$("#frm").submit();
									}
								}
							}else if(tag == -1){
								alert("ϵͳ�쳣");
							}else if(tag == -2){
								alert("��ǰʱ�䲻�����ֵ");
							}else if(tag == -4){
								alert("�����յ���������Ѵﵽ���ֵ");
							}else if(tag == -5){
								alert("�����յ������ܶ���Ѵﵽ���ֵ");
							}else if(tag == -3){
								alert("���˴ε������ȳ������ֵ");
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

 			//ˢ�����
 			$.userFoundController();	 
 	 	});
  </script>
<c:if test="${not empty returnmgs }">
	<script>
        alert('${returnmgs}');
    </script>
</c:if>
</html>
