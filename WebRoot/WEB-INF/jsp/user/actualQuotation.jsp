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
<title>תʵ������</title>
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
	<a href="javascript:location.href='<%=basePath %>jsp/user/userInfo.jsp'"><div class="fanhui">תʵ������</div></a>
	<form action="<%=path%>/tocServlet" method="post" id="frm" name="frm">
	<input name="reqName" type="hidden" value="actualQuotation">
	<div class="tishikuang" style="height: 620px;">
		<div class="tishikuang0_23" style="height: 530px;">
			<div class="gao">
				<div class="zhi0-1 left">�ͻ�����*</div>
				<div class="tu_1 right"><input placeholder="������ͻ�����" type="text" name="name" id="name"/></div>
			</div>
			<div class="gao">
				<div class="zhi0-1 left">֤������*</div>
				<div class="tu_1 right">
					<select name="PapersType" id="PapersType">
						<option value="2">���֤</option>
						<option value="1">��������</option>
						<option value="4">Ӫҵִ��</option>
					</select>
				</div>
			</div>
			<div class="gao">
				<div class="zhi0-1 left">֤����*</div>
				<div class="tu_1 right">
					<input placeholder="������֤����" type="text" name="PapersCode" id="PapersCode"/>
				</div>
			</div>
			<div class="gao">
				<div class="zhi0-1 left">��������*</div>
				<div class="tu_1 right">
					<input placeholder="�����뽻������" type="password" name="tradePwd" id="tradePwd"/>
				</div>
			</div>
			<div class="gao">
				<div class="zhi0-1 left">��������ȷ��*</div>
				<div class="tu_1 right">
					<input placeholder="�ٴ����뽻������"  type="password" name="againTradePwd" id="againTradePwd"/>
				</div>
			</div>
			<div class="gao">
				<div class="zhi0-1 left">�绰����*</div>
				<div class="tu_1 right">
					<input placeholder="������绰����" type="password" name="PhonePWD" id="PhonePWD"/>
				</div>
			</div>
			<div class="gao">
				<div class="zhi0-1 left">�绰����ȷ��*</div>
				<div class="tu_1 right">
					<input placeholder="�ٴ�����绰����"  type="password" name="againPhonePWD" id="againPhonePWD"/>
				</div>
			</div>
			<div class="gao">
				<div class="zhi0-1 left">�������</div>
				<div class="tu_1 right">
					<input placeholder="�������(ѡ��)"  type="text" name="Fax" id="Fax"/>
				</div>
			</div>
			<div class="gao">
				<div class="zhi0-1 left">��������</div>
				<div class="tu_1 right">
					<input placeholder="��������(ѡ��)"  type="text" name="Postcode" id="Postcode"/>
				</div>
			</div>
			<div class="gao">
				<div class="zhi0-1 left">��������</div>
				<div class="tu_1 right">
					<input placeholder="��������(ѡ��)"  type="text" name="Email" id="Email"/>
				</div>
			</div>
			<div class="gao">
				<div class="zhi0-1 left">ͨѶ��ַ</div>
				<div class="tu_1 right">
					<input placeholder="ͨѶ��ַ(ѡ��)" type="text" name="Address" id="Address"/>
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
		
		//֤������
		$("#PapersType").change(function(){
			$("#PapersCode").val("");
		});	
		//�ύ
		$("#btpwdsubmit").click(function(){
			//�ͻ�����
			var name = $("#name").val();
			if(!hasLength(name)){
				alert("������ͻ���");
				return;
			}
			//֤����
			var PapersCode = $("#PapersCode").val();
			if(!hasLength(PapersCode)){
				alert("������֤����");
				return;
			}
			//��������
			var tradePwd = $("#tradePwd").val();
			if(!hasLength(tradePwd)){
				alert("�����뽻������");
				return;
			}else{
				if(tradePwd.length<6){
					alert("�������벻��С��6λ");
					return;
				}
			}
			//��������ȷ��
			var againTradePwd = $("#againTradePwd").val();
			if(!hasLength(againTradePwd)){
				alert("�����뽻������ȷ��");
				return;
			}else{
				if(againTradePwd != tradePwd){
					alert("����������ȷ�����벻һ��");
					return;
				}
			}
			//�绰����
			var PhonePWD = $("#PhonePWD").val();
			if(!hasLength(PhonePWD)){
				alert("������绰����");
				return;
			}else{
				if(PhonePWD.length<6){
					alert("�绰���벻��С��6λ");
					return;
				}
			}
			//��������ȷ��
			var againPhonePWD = $("#againPhonePWD").val();
			if(!hasLength(againPhonePWD)){
				alert("������绰����ȷ��");
				return;
			}else{
				if(againPhonePWD != PhonePWD){
					alert("�绰������ȷ�����벻һ��");
					return;
				}
			}

			var flag = confirm("ȷ���ύ��");
			if(flag){
				$("#frm").submit();
			}
		});
	});
</script>
</html>
