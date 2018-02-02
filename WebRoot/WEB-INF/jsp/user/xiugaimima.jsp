<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ include file="../../public/path.jsp"%>
<!DOCTYPE>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=GBK" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
	<link rel=stylesheet type="text/css" href="<%=skinPath%>/css/model.css" title="cool">
	<script type="text/javascript" src="<%=basePath%>js/jquery-1.6.min.js"></script>
	<title>${pageTitle}</title>

</head>

<body>
	<div class="bt1" style="color:white;margin:0 auto;margin-bottom:20px;"><span>修改密码</span></div>
	<form action="<%=path%>/tocServlet?reqName=change_password" method="post" id="updatePwdFrm" name="updatePwdFrm">
	 <div class="xgsj">
		<div class="xgsj_txt">
			<div class="xgsj_bt">当前密码</div>
			<div class="xgsj_bor"><input  type="password" class="xgsj_input" name="currentPwd" id="currentPwd"/></div>
		</div>
		
		<div class="xgsj_txt">
		    <div class="xgsj_bt">新密码</div>
			<div class="xgsj_bor"><input  type="password" class="xgsj_input" name="newPwd" id="newPwd"/></div>
		</div>
	   <div class="xgsj_txt">
				<div class="xgsj_bt">确认密码</div>
				<div class="xgsj_bor"><input  type="password" class="xgsj_input" name="againNewPwd" id="againNewPwd"/></div>
		</div>
	   <div class="dl_txt1" id="btpwdsubmit" style="padding:10px 0;">
	    <div class="dl_btn3">提交</div>
	   </div>	
	</div>
	
	</form>
</body>
<script type="text/javascript">
	$(function(){
			//ajax提交
			$("#btpwdsubmit").bind("click",function(){
				var $cPwd = $("#currentPwd").val();
				var $nPwd = $("#againNewPwd").val();
				var $aPwd = $("#newPwd").val();
				if($cPwd==""){
					alert("请输入当前密码");
					return false;
				}
				if($aPwd==""){
					alert("请输入新密码");
					return false;
				}
				if($nPwd==""){
					alert("请输入确认密码");
					return false;
				}
				if($nPwd!=$aPwd){
					alert("两次输入密码不一致！");
					return false;
				}
					$.ajax({
						type:"post",
						url:"<%=path%>/tocServlet",
						contentType: "application/x-www-form-urlencoded; charset=UTF-8",
						data:"reqName=change_password&currentPwd="+$cPwd+"&againNewPwd="+$nPwd,
						dataType: "json",
						success:function(msg){
							if(msg["code"]=="0")
							{
								window.alert(msg["msg"]);
								location.href = "<%=basePath %>/jsp/quotation/main.jsp";
							}else
							{
								window.alert(msg["msg_tishi"]+msg["msg"]);
								return ;		
							}
						}
						});
				});
				
		});
</script>
</html>
