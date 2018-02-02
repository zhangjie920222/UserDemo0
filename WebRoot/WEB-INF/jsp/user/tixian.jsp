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
<title>������Ϣ</title>
</head>

<body>
	<form action="<%=path%>/tocServlet" id="frm">
	<input type="hidden" name="reqName" value="withdrawMoney"/>
	<input type="hidden" name="token" value="<%=token%>">
	<a href="javascript:location.href='<%=basePath %>jsp/user/userInfo.jsp'"><div class="fanhui">����</div></a>
	<div class="tishikuang0" style="height: 320px;">
		<div class="tishikuang0_1" style="height: 250px;">
			<div class="gao">
				<div class="zhi0-1 left">����ȡ���</div>
				<div class="shu0-1 right" id="userfulFounds">0.00</div>
			</div>
			<div class="gao">
				<div class="zhi0-1 left">�ֿ�������</div>
				<div class="tu_1 right"><input name="name" id="name" placeholder="������ֿ�������" /></div>
			</div>
			<div class="gao">
				<div class="zhi0-1 left" >���п���</div>
				<div class="tu_1 right"><input id="bankNo" name="bankNo" placeholder="���������п���" /></div>
			</div>
			<div class="gao">
				<div class="zhi0-1 left">��������</div>
				<div class="tu_1 right"><input name="bankName" placeholder="�������������ƣ�ѡ�" /></div>
			</div>
			<div class="gao">
				<div class="zhi0-1 left" >��ȡ���</div>
				<div class="tu_1 right"><input id="amount" name="amount" placeholder="��������ȡ���" /></div>
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
					alert("������ֿ�������");
					return;
					}
 	 			var bankNo = $("#bankNo").val();
				if(!hasLength(bankNo)){
					alert("���������п���");
					return;
					}
				var amount = $("#amount").val();
				if(!hasLength(amount)){
					alert("��������ȡ���");
					return;
					}
				if(!isNum.test(amount)){
					alert("��ȡ������Ч����");
					return ;
					}
				var userfulFounds = Number($("#userfulFounds").html());
				if(userfulFounds<amount){
					alert("����ȡ����");
					return;
					}
				//var flag = confirm("ȷ���ύ��");
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
								var flag = confirm("ȷ���ύ��");
								if(flag){
									$("#frm").submit();
								}
							}else if(tag == -1){
								alert("ϵͳ�쳣");
							}else if(tag == -2){
								alert("��ǰʱ�䲻��������");
							}else if(tag == -3){
								alert("�������������볬������");
							}else if(tag == -4){
								alert("���������������ܶ�����ֵ");
							}else if(tag == -5){
								alert("���˴ε������ȳ������ֵ");
							}else if(tag == -6){
								alert("��������");
							}else if(tag == -7){
								alert("���˴ε�����Ľ��С��������С���");
							}
						}
					}
				});
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
 								$("#userfulFounds").html(Number(found).toFixed(2));
 							}
 						}
 					}
 				});
 			}


 			//ˢ�����
 			$.userFoundController();	 
 	 	});
  </script>
  <c:if test="${not empty returnmsg }">
	<script>
        alert('${returnmsg}');
    </script>
</c:if>
</html>
