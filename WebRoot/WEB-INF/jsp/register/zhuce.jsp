<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../../public/path.jsp"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK" />
<meta name="viewport" content="width=device-width,target-densitydpi=medium-dpi,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
<link rel=stylesheet type="text/css" href="<%=skinPath %>css/register.css" title="cool">
<script type="text/javascript" src="<%=basePath%>js/special-char.js"></script>
<script type="text/javascript" src="<%=basePath%>js/jquery-1.6.min.js"></script>
<title>${pageTitle}</title>
<c:if test="${not empty resultMsg }">
	<script>
        alert('${resultMsg}');
    </script>
</c:if>
<script type="text/javascript">
	var CharPattern = new RegExp("^(([\u4e00-\u9fa5a-zA-Z0-1]*��[\u4e00-\u9fa5a-zA-Z0-9]+)|[\u4e00-\u9fa5a-zA-Z0-9]*)$");
	function showRisk(){
		$('#bg').show();
		$('#fx_neir').show();
		};
	function hideRisk(){
		$('#bg').hide();
		$('#fx_neir').hide();
		$('#agree')[0].checked = true;
		};
	var time = 0;
	function countTime() {
		    var clock = setInterval(function() {
			time = time - 1;
			document.getElementById("sms").value="��ȡ��֤��("+time+'s)';
			if (time<=0){
				window.clearInterval(clock);
				document.getElementById("sms").disabled=false;
				document.getElementById("sms").value="��ȡ��֤��";
			}
		}, 1000)
	};
	function sendSMS() {
		var mobile = $('#tel').val();
		if(!checkTel())
		{
			return ;
		}
		$.ajax({
			type:"post",
			url:"<%=path%>/tocServlet?t="+new Date(),
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			data:"reqName=registerYZM&mobile="+mobile,
			dataType: "json",
			success: function(data)
			{
				if(data != null){
					var ret = data["code"];
					if(ret != 0){
						alert(data["message"]);
					}else{
						time=180;
						document.getElementById("sms").disabled=true;
						countTime();
					}
				}
			}
		});
	};
	function checkAndSubmit(){
		var flag1 = checkTel() && checkConfirm() && checkAgree();
		if (flag1){
			var mobile = $('#tel').val();
			var flag = false;
			var yzm_val = $('#smsval').val();
			if(yzm_val=="")
			{
				window.alert("��д��֤�룡");
				return ;
			}
			$.ajax({
				type:"post",
				url:"<%=path%>/tocServlet?t="+new Date(),
				contentType: "application/x-www-form-urlencoded; charset=UTF-8",
				data:"reqName=registerYZMCheck&yzm_val="+yzm_val+"&mobile="+mobile,
				dataType: "text",
				success: function(data)
				{
					if(data=="true")
					{
						document.getElementById("frm").submit();
					}else
					{
						window.alert(data);
					}
				}
			});
		}
	};
	function checkConfirm(){
		var flag = false;
		var name = document.getElementById('name');
		if(name==null||name.value==""){
			alert("����������");
			return flag;
		}
		$("#encodeName").val(encodeURI(name.value))
		var flag = checkSpecialChar(name.value);
		if(!flag){
			alert("�����к��������ַ�");
			$(this).val("");
			return false;
		}
		if(!CharPattern.test(name.value)){
			alert("�������зǷ��ַ�");
			$(this).val("");
			$(this).focus();
			return;
		}
		var psd = document.getElementById('psd');
		var psdconfirm = document.getElementById('psdconfirm');
		if (psd.value==null||psd.value==""){
			alert("����������");
		}else if (psd.value!=psdconfirm.value){
			alert("�������벻һ��");
		}else {
			flag = true;
		}
		return flag;
	};
	function checkTel(){
		var flag = false;
		var tel = document.getElementById("tel");
		if (tel.value==null||tel.value==""){
			alert("����д�ֻ������ٲ���");
		} else if(isNaN(tel.value)||tel.value <= 0){
			alert("�ֻ�����ֻ��Ϊ����");
		} else if(tel.value.length != 11){
			alert("��˶�����д���ֻ�����");
		} else {
			flag = true;
		}
		return flag;
	};
	function checkAgree(){
		var agree = document.getElementById("agree");
		var flag = agree.checked;
		if (!flag){
			alert("�����Ķ���������");
		}
		return flag;
	};
	$(function(){
		$("#name").blur(function(){
			var name = $(this).val();
			if(name != ""){
				var flag = checkSpecialChar(name);
				if(!flag){
					alert("�����к��������ַ�");
					$(this).val("");
					return;
				}
				if(!CharPattern.test(name)){
					alert("�������зǷ��ַ�");
					$(this).val("");
					$(this).focus();
					return;
				}
			}
		});
	});
</script>
</head>
<body style="margin:0 auto;background:#ccc;">
	<div class="bt1" style="color:white;margin:0 auto;margin-bottom:20px;"><span>�ֻ���ע��</span>	
	</div>
	<form id="frm" action="<%=path%>/tocServlet">
		<input type="hidden" name="reqName" value="registerByPhone"/>
		<input type="hidden" name="openId" value="${OPENID }">
		<input type="hidden" name="appCode" value="${APPCODE }">
		<div class="tishikuang" style="height:360px;">
			<div class="tishikuang0_23" style="height:240px;">
				<div class="gao">
					<div class="tu_11 "><input id="tel" name="tel" placeholder="�������ֻ���" /></div>
				</div>
				<div class="gao">
					<div class="tu_11 ">
						<input id="name" placeholder="����������" />
						<input id="encodeName" name="name" type="hidden" />
					</div>
				</div>
				<div class="gao">
					<div class="tu_11 "><input id="psd" name="psd" type="password" placeholder="����������" /></div>
				</div><div class="gao">
					<div class="tu_11 "><input id="psdconfirm" name="psdAgain" type="password" placeholder="��ȷ������" /></div>
				</div>
				<div class="gao">
					<div class="tu_10 left"><input id="smsval" name="yzm" placeholder="��������֤��" /></div>
					<div class="zhi0-11 right"><input style="height:40;width:90%;" id="sms" type="button" value="��ȡ��֤��" onclick="sendSMS()"></div>
				</div>
			</div>
			<div class="clear">
				<div class="zhi0-12"><input id="agree" name="agree" type="checkbox" />�����Ķ�<a href='#' style="color:#0099FF" id='riskTip' onclick='showRisk()'>���������ѡ�</a></div>
			</div>
			<div class="shuliang8 clear" onclick="checkAndSubmit()"></div>
		</div>
	</form>
	<div id="bg"></div>
	<div class="fx_neir" id="fx_neir">
		<div id="content" style="color:#fafafa;">
				<p>
				��Ҫ��ʾ����������ڲ��뼪��ũ��Ʒ΢��ǰ��ϸ�Ķ������򲢳����������������ݣ�
				</p>
				<p> ����ũ��Ʒ΢���ṩʵ���ʽ�ͽ���ͨ�����ͻ����ݱ��������ͨ�������ֵ֧�������ۺϷ��ü���ŵ�е����޽��׿����⸶����󣬻�����޶�ʱ�����޶���������Ʒ����Ȩ���������Ȩ��
				</p>
				<p>
				���ױ����
				</p>
				<p>
				�ڼ���ũ��Ʒ΢�̽���ƽ̨�Ͻ��н��׵����н���Ʒ�֡�
				</p>
				<p>
				��������
				</p>
				<p>
				����ϸ����ռ���ũ��Ʒ΢�̷�������ؽ��׹��򼰹���涨ִ�С�
				</p>
				<p>
				���ױ���
				</p>
				<p>����ũ��Ʒ΢���ۺϹ����г���Ʒ�۸�͹��������г��۸��Լ��й�������������Ҷ���Ԫ��׼���ʡ��г������ϵ�ȣ�������������������Ʒ�ֻ�������Ҽ۸�
				</p>
				<p>
				����ʱ�䡢����ʱ��
				</p>
				<p>
				����ϸ����ռ���ũ��Ʒ΢�̷�������ؽ��׹��򼰹���涨ִ�С�
				</p>
				<p>
				����ֹӯ
				</p>
				<p>���ͻ�������ӯ��ﵽ��֤���һ������ʱ��ϵͳ���Զ���ֹ�ͻ�����Ȩ����ֹӯ����н��㡣�ñ������ɿͻ�������Ϊ10%��20%��30%��40%��50%����ѡ��
				</p>
				<p>
				����ֹ��
				</p>
				<p>
				���ͻ�����������ﵽ��֤���һ������ʱ��ϵͳ���Զ���ֹ�ͻ�����Ȩ����ֹ������н��㡣�ñ������ɿͻ�������Ϊ10%��20%��30%��40%��50%����ѡ��
				</p>
				<p>
				����������
				</p>
				<p>
				����֧����ί��������ƷʱӦ֧��������á�����ϸ����ռ���ũ��Ʒ΢�̷�������ؽ��׹��򼰹���涨ִ�С�
				</p>
				<p>
				���׷�������
				</p>
				<p>1���������գ����ڽ�����ͨ������ͨѶ������ʵ�ֵģ���Щ���������ű�����ڿͺͲ��������Ŀ��ܣ��ɴ˿��ܸ��ͻ�������ʧ���ͻ������ò��е��ɴ˵��µ���ʧ��
				</p>
				<p>2������΢�̲����ܿ��Ƶ�Ѷ�źŵ��жϺ������Լ��������ĳ�ͨ��Ҳ���ܱ�֤�ͻ����������豸����Ѷ�豸���ȶ��ԣ��ɴ˵�ԭ���ʹ�ͻ����ܵ���ʧ���ɿͻ����ге�������ũ��Ʒ΢�̲������κ����Ρ�
				</p>
				<p>3�����ɿ������ص��µķ��գ�������𡢻��֡�ˮ�֡�ս�����������չ��Ȳ��ɿ������ص��µĽ����жϡ�����ȷ��գ�����ũ��Ʒ΢�̲��е����Σ���Ӧ����������ķ�Χ�ڲ�ȡ��Ҫ�Ĳ��ȴ�ʩ�Լ����򲻿ɿ�����ɵ���ʧ
				</p>
				<p>4���������գ����ڿͻ�����ʧ�ܡ�����������Ͷ�ʾ���ʧ���ԭ����ܻᷢ�����𣬸���ʧ���ɿͻ����ге���
				</p>
				<p>
				���������Ȩ��������ũ��Ʒ�������ģ�ͬʱ����ũ��Ʒ�������ı����Բ��������б�Ҫ��������Ƶ�Ȩ����		
				</p>		
				<p style="text-align: right;">
				 ����ũ��Ʒ��������<br/>
                             400-640-1599
				</p>
			<a id='closeRisk' href='#' onclick='hideRisk()'><div class="shuliang8_1 clear">ȷ��</div></a>
			</div>
	</div>
</body>
</html>
