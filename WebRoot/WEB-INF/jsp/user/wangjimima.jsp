<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ include file="../../public/taglib.jsp" %>
<%@ include file="../../public/path.jsp"%>
<!DOCTYPE>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=GBK" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
	<link rel=stylesheet type="text/css" href="<%=skinPath%>/css/1_liuqw.css" title="cool">
	<script type="text/javascript" src="<%=basePath%>js/jquery-1.6.min.js"></script>
<title>${pageTitle}</title>
</head>

<body>
		<div id="_yzm_div">
		<a href="javascript:location.href='<%=basePath %>jsp/logon/logon.jsp'"><div class="fanhui">身份验证</div></a>
		<div class="tishikuang" style="height:260px;">
			
				<%-- <div class="gao1 padding">
					为了您的账户安全，请您进行身份验证，已绑定手机：${fn:substring(CurrentUser.phoneNumber, 0, 3)}****${fn:substring(CurrentUser.phoneNumber, 7, 11)}
					<input type="hidden" id="mobile" value="${CurrentUser.phoneNumber}" name="mobile"/>
				</div> --%>
				<%--
				<div class="gao1 padding">
					为了您的账户安全，请您进行身份验证，已绑定手机：187****4293
					<input type="hidden" id="mobile" value="18744034293" name="mobile"/>
				</div>
				--%>
				<%-- <div style="height: 55px;">
					<span style="color: white;margin-left: 2%;width: 10%;font-size: 15px;">手机号</span>
					<input style="width: 78%;height: 40px;" 
						 id="mobile"
						 name="mobile"
						 value="${CurrentUser.phoneNumber}"
					/>
				</div>
				<div style="height: 55px;">
					<span style="color: white;margin-left: 2%;width: 10%;font-size: 15px;">验证码</span>
					<input style="height: 40px;"
						id="yzm_val"
						name="yzm_val"
					/>
					<button id="_submit_yzm" style="margin-left: 1%;font-size: 15px;height: 40px;font-weight:bold;">获取验证码</button>
				</div> --%>
				<div class="tishikuang0_23" style="height:110px;">
					<div class="gao">
						<div class="zhi0-1 left" style="width: 20%;">手机号</div>
						<div class="tu_1 right" style="width: 70%;">
							<input style="height:35px;width:90%;" 
								value="${CurrentUser.phoneNumber}" 
								name="mobile" 
								id="mobile"/>
						</div>
					</div>
					<div class="gao">
						<div class="zhi0-1 left" style="width: 20%;">验证码</div>
						<div style="width: 71%;height: 40px;line-height: 40px;float: right;margin-right: 3%;">
							<div  class="checkcode">
								 <input placeholder="请输入验证码" id="yzm_val" name="yzm_val" 
								 	class="checkcode_input"> 
							</div> 
							<div  style=" float: right;width: 60%;">
								<div class="zhi0-111 right" id="_submit_yzm" style="width: 90%;margin-right: 0px;">获取验证码</div>
							</div>
						</div>
					</div>
				</div>
				<!-- <div class="gao">
					<div class="zhi0-111 right" id="_submit_yzm">获取验证码</div>
					<div class="tu_10 left"><input placeholder="请输入验证码" id="yzm_val" name="yzm_val" style="height:37px;width:121px;"/></div>
				</div> -->
	
			<a href="#"><div class="shuliang8_1 clear sbj" onclick="$.yzmPostFunc()">下一步</div></a>
			</div>
			<%-- 
			<label for="_mobile">手机号：</label><br/>
			<input id="_mobile" value="" name="_mobile"/>
			<input type="button" id="_submit_yzm" value="获取验证码"/><br/>
			<label for="yzm_val">验证码：</label><br/>
			<input value="" /><br/><br/>
			<input type="button" value="下一步" />
			--%>
		</div>
		<div id="_wangjimima" style="display:none;">
			<a href="wangjimima.jsp"><div class="fanhui">重置交易密码</div></a>
			<div class="tishikuang"  >
			<div class="tishikuang0_23" style="height:110px;">
				<div class="gao">
					<div class="zhi0-1 left">新密码</div>
					<div class="tu_1 right"><input style="height:35px;width:130px;" placeholder="新密码" type="password" name="newPwd" id="newPwd"/></div>
				</div><div class="gao">
					<div class="zhi0-1 left">确认密码</div>
					<div class="tu_1 right"><input style="height:35px;width:130px;" placeholder="请确认密码" type="password" name="againNewPwd" id="againNewPwd"/></div>
				</div>
			</div>
			<a href="javascript:void(0);"><div class="shuliang8 clear" id="btpwdsubmit"></div></a>
		</div>
		</div>
		<%-- 
		<div class="tishikuang0_23" id="_wangjimima"  style="display:none;">
			<div class="gao">
				<div class="zhi0-1 left">新密码</div>
				<div class="tu_1 right"><input  type="password" name="newPwd" id="newPwd"/></div>
			</div>
			<div class="gao">
				<div class="zhi0-1 left">确认密码</div>
				<div class="tu_1 right"><input  type="password" name="againNewPwd" id="againNewPwd"/></div>
			</div>
			<div class="shuliang8 clear" id="btpwdsubmit"></div>
		</div>
		--%>
</body>
<script type="text/javascript">
	$(function(){
			//ajax提交
			$("#btpwdsubmit").bind("click",function(){
				var $nPwd = $("#againNewPwd").val();
				var $aPwd = $("#newPwd").val();
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
						url:"<%=path%>/tocServlet?t="+new Date(),
						contentType: "application/x-www-form-urlencoded; charset=UTF-8",
						data:"reqName=passwordReset&newPwd="+$aPwd+"&mobile="+$('#mobile').val()+"&yzm_val="+$('#yzm_val').val(),
						dataType: "json",
						success:function(data){
							if(data["returnMess"]=="true")
							{
								window.alert("修改成功");
								location.href = "<%=basePath %>/jsp/logon/logon.jsp";
							}else
							{
								alert(data["returnMess"]);
								location.reload();
							}
						}
						});
				});
				
		});

		$("#_submit_yzm").click(function(){$.yzmGetFunc();});
		var yzm_switch = true;

		//验证码提交
		$.yzmPostFunc = function()
		{
			var yzm_val = $('#yzm_val').val();
			if(yzm_val=="")
			{
				window.alert("填写验证码！");
				return ;
			}
			$.ajax({
				type:"post",
				url:"<%=path%>/tocServlet?t="+new Date(),
				contentType: "application/x-www-form-urlencoded; charset=UTF-8",
				data:"reqName=forgetPasswordCheck&yzm_val="+yzm_val,
				dataType: "json",
				success: function(data)
				{
					if(data["returnMess"]=="true")
					{
						$("#_yzm_div").hide();
						$("#_wangjimima").show();
					}else
					{
						window.alert(data["returnMess"]);
					}
				}
			});
		}

		var keyiGetYzm = true;
		//验证码获取
		$.yzmGetFunc = function()
		{
			var mobile = $('#mobile').val();
			if(mobile=="")
			{
				window.alert("手机号不可以为空！");
				return ;
			}
			if(!keyiGetYzm)return ;
			$.ajax({
				type:"post",
				url:"<%=path%>/tocServlet?t="+new Date(),
				contentType: "application/x-www-form-urlencoded; charset=UTF-8",
				data:"reqName=forgetPasswordGet&mobile="+mobile,
				dataType: "json",
				success: function(data)
				{
					if(data["returnCode"]==1){
						keyiGetYzm = false;
						yzm_switch = true;
						$.daojishiYZM(data["_aliveTime"]);
					}else if(data["returnCode"]==0){
						window.alert(data["returnMess"]);
					}else if(data["returnCode"]==-1){
						window.alert(data["returnMess"]);
						keyiGetYzm = false;
						yzm_switch = true;
						$.daojishiYZM(data["_aliveTime"]);
					}else if(data["returnCode"]==-2){
						window.alert(data["returnMess"]);
					}
				}
			});
		}

		$.daojishiYZM = function(_time)
		{
			if(_time==0)
			{
				yzm_switch = false;
			}
			if(yzm_switch)
			{
				--_time;
				$("#_submit_yzm").html(_time+"后重新获取");
				window.setTimeout("$.daojishiYZM("+_time+")",1000);
			}else
			{
				keyiGetYzm = true;
				$("#_submit_yzm").html("重新获取验证码");
			}
		}
</script>
</html>
