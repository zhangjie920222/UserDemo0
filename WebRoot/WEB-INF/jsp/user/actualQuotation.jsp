<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%
String _path = request.getContextPath();
String path =  request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+_path;
String basePath = path+"/app/toc/";
%>
<!DOCTYPE>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=GBK" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
	<link rel=stylesheet type="text/css" href="<%=basePath%>/css/1_liuqw.css" title="cool">
	<script type="text/javascript" src="<%=basePath%>js/jquery-1.6.min.js"></script>
<title>转实盘申请</title>
<style type="text/css">
.tu_1 select{
border:0px;
width:80%;
background-color:#b3e6ff;
height:70%;
margin-top:2%;
margin-left:2%;
color:#2684b2;
}
</style>
</head>

<body>
	<a href="javascript:location.href='<%=basePath %>jsp/user/userInfo.jsp'"><div class="fanhui">转实盘申请</div></a>
	<form action="<%=path%>/tocServlet" method="post" id="frm" name="frm">
	<input name="reqName" type="hidden" value="actualQuotation">
	<div class="tishikuang" style="height: 620px;">
		<div class="tishikuang0_23" style="height: 530px;">
			<div class="gao">
				<div class="zhi0-1 left">客户名称*</div>
				<div class="tu_1 right"><input placeholder="请输入客户名称" type="text" name="name" id="name"/></div>
			</div>
			<div class="gao">
				<div class="zhi0-1 left">证件类型*</div>
				<div class="tu_1 right">
					<select name="PapersType" id="PapersType">
						<option value="2">身份证</option>
						<option value="1">机构代码</option>
						<option value="4">营业执照</option>
					</select>
				</div>
			</div>
			<div class="gao">
				<div class="zhi0-1 left">证件号*</div>
				<div class="tu_1 right">
					<input placeholder="请输入证件号" type="text" name="PapersCode" id="PapersCode"/>
				</div>
			</div>
			<div class="gao">
				<div class="zhi0-1 left">交易密码*</div>
				<div class="tu_1 right">
					<input placeholder="请输入交易密码" type="password" name="tradePwd" id="tradePwd"/>
				</div>
			</div>
			<div class="gao">
				<div class="zhi0-1 left">交易密码确认*</div>
				<div class="tu_1 right">
					<input placeholder="再次输入交易密码"  type="password" name="againTradePwd" id="againTradePwd"/>
				</div>
			</div>
			<div class="gao">
				<div class="zhi0-1 left">电话密码*</div>
				<div class="tu_1 right">
					<input placeholder="请输入电话密码" type="password" name="PhonePWD" id="PhonePWD"/>
				</div>
			</div>
			<div class="gao">
				<div class="zhi0-1 left">电话密码确认*</div>
				<div class="tu_1 right">
					<input placeholder="再次输入电话密码"  type="password" name="againPhonePWD" id="againPhonePWD"/>
				</div>
			</div>
			<div class="gao">
				<div class="zhi0-1 left">传真机号</div>
				<div class="tu_1 right">
					<input placeholder="传真机号(选填)"  type="text" name="Fax" id="Fax"/>
				</div>
			</div>
			<div class="gao">
				<div class="zhi0-1 left">邮政编码</div>
				<div class="tu_1 right">
					<input placeholder="邮政编码(选填)"  type="text" name="Postcode" id="Postcode"/>
				</div>
			</div>
			<div class="gao">
				<div class="zhi0-1 left">电子邮箱</div>
				<div class="tu_1 right">
					<input placeholder="电子邮箱(选填)"  type="text" name="Email" id="Email"/>
				</div>
			</div>
			<div class="gao">
				<div class="zhi0-1 left">通讯地址</div>
				<div class="tu_1 right">
					<input placeholder="通讯地址(选填)" type="text" name="Address" id="Address"/>
				</div>
			</div>
		</div>
		<div class="shuliang8 clear" id="btpwdsubmit"></div>
	</form>
	</div>
</body>
<script type="text/javascript">
	$(function(){
		function hasLength(e){
			if(e!=null && e!=""){
				return true;
			}
			return false;
		}
		var returnmgs = '${returnmgs}';
		if(hasLength(returnmgs)){
			alert(returnmgs);
		}
		
		//证件类型
		$("#PapersType").change(function(){
			$("#PapersCode").val("");
		});	
		//提交
		$("#btpwdsubmit").click(function(){
			//客户名称
			var name = $("#name").val();
			if(!hasLength(name)){
				alert("请输入客户称");
				return;
			}
			//证件号
			var PapersCode = $("#PapersCode").val();
			if(!hasLength(PapersCode)){
				alert("请输入证件号");
				return;
			}
			//交易密码
			var tradePwd = $("#tradePwd").val();
			if(!hasLength(tradePwd)){
				alert("请输入交易密码");
				return;
			}else{
				if(tradePwd.length<6){
					alert("交易密码不能小于6位");
					return;
				}
			}
			//交易密码确认
			var againTradePwd = $("#againTradePwd").val();
			if(!hasLength(againTradePwd)){
				alert("请输入交易密码确认");
				return;
			}else{
				if(againTradePwd != tradePwd){
					alert("交易密码与确认密码不一致");
					return;
				}
			}
			//电话密码
			var PhonePWD = $("#PhonePWD").val();
			if(!hasLength(PhonePWD)){
				alert("请输入电话密码");
				return;
			}else{
				if(PhonePWD.length<6){
					alert("电话密码不能小于6位");
					return;
				}
			}
			//交易密码确认
			var againPhonePWD = $("#againPhonePWD").val();
			if(!hasLength(againPhonePWD)){
				alert("请输入电话密码确认");
				return;
			}else{
				if(againPhonePWD != PhonePWD){
					alert("电话密码与确认密码不一致");
					return;
				}
			}

			var flag = confirm("确认提交吗");
			if(flag){
				$("#frm").submit();
			}
		});
	});
</script>
</html>
