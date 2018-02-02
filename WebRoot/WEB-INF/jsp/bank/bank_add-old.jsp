<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ include file="../../public/path.jsp"%>
<%@ include file="../../public/taglib.jsp"%>
<%@page import="gnnt.MEBS.util.TokenProccessor"%>
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
	<a href="javascript:location.href='<%=path %>/tocServlet?reqName=GETBANKBINDINGLIST'"><div class="fanhui">添加银行卡</div></a>
	<div class="tishikuang" style="height: auto;">
		<form action="<%=path%>/tocServlet" method="post" id="frm" name="frm">
			<input type="hidden" name="token" value="<%=token%>">
			<div class="tishikuang0_23" style="height: auto;">
				<div class="gao">
					<div class="zhi0-1 left">姓名</div>
					<div class="tu_1 right">
						<input  name="" id="name" value="${NAME }" />
						<input type="hidden" name="name" id="nameEncode"/>
					</div>
				</div>
				<c:if test="${NAME==null }">
					<div class="gao">
						<div class="zhi0-1 left">身份证</div>
						<div class="tu_1 right">
							<input  name="idcardNo" id="idcardNo" value="${IDCARDNO }" />
						</div>
					</div>
				</c:if>
				<div class="gao">
					<div class="zhi0-1 left">银行</div>
					<div class="tu_1 right">
						<select id="bankName" name="">
							<option value="">--请选择银行--</option>
							<c:forEach var="_deal" items="${BANKLIST}">
								<option value="${_deal.NAME }">${_deal.NAME }</option>
							</c:forEach>				
						</select>
						<input type="hidden"  name="bankName" id="bankNameEncode"/>
					</div>
				</div>
				<div class="gao">
					<div class="zhi0-1 left">银行卡号</div>
					<div class="tu_1 right"><input   name="bankNo" id="bankNo"/></div>
				</div>
				<div class="gao">
					<div class="zhi0-1 left">省份</div>
					<div class="tu_1 right">
						<select id="province" name="">
							<option value="">--请选择省份--</option>
						</select>
						<input type="hidden" name="province" id="provinceEncode"/>
					</div>
				</div>
				<div class="gao">
					<div class="zhi0-1 left">城市</div>
					<div class="tu_1 right">
						<select id="city" name="">
							<option value="">--请选择城市--</option>
						</select>
						<input type="hidden"  name="city" id="cityEncode"/>
					</div>
				</div>
				<div class="gao">
					<div class="zhi0-1 left">预留手机号</div>
					<div class="tu_1 right">
						<input name="" id="mobile" value="" />
						<input type="hidden"  name="mobile" id="mobileEncode"/>
					</div>
				</div>
			</div>
			<div class="shuliang8 clear" id="btpwdsubmit"></div>
			<c:if test="${NAME==null }">
			<div class="gao" style="color: red;height: auto;">
				注意：只能绑定一个人的银行卡，即如果绑定多张卡，那么这些卡必须属于同一人。姓名和身份证号以第一次添加时为准。姓名和身份证号添加成功后不能修改。
			</div>
			</c:if>
			<input type="hidden" name="reqName" value="ADDBANKBINDING">
			<input type="hidden" value="${hasBing}" name="hasBing">
		</form>
	</div>
</body>
<script type="text/javascript">
$(function(){
	var hasBing = '${hasBing}';
	$("#btpwdsubmit").click(function(){
		var name = $("#name").val();
		if(name == null || name == ""){
			alert("请输入姓名");
			return;
		}
		$("#nameEncode").val(encodeURI(name));
		if(!hasBing){
			var idcardNo = $("#idcardNo").val();
			if(idcardNo==null || idcardNo==""){
				alert("请输入身份证号");
				return;
			}
		}
		var bankNo = $("#bankNo").val();
		if(bankNo == null || bankNo == ""){
			alert("请输入银行卡号");
			return;
		}
		var bankName = $("#bankName").val();
		if(bankName == null || bankName == ""){
			alert("请选择银行");
			return;
		}
		$("#bankNameEncode").val(encodeURI(bankName));
		var province = $("#province").val();
		if(province == null || province == ""){
			alert("请选择银行");
			return;
		}
		$("#provinceEncode").val(encodeURI(province));
		
		var city = $("#city").val();
		if(city == null || city == ""){
			alert("请选择城市");
			return;
		}
		$("#cityEncode").val(encodeURI(city));
		var mobile = $("#mobile").val();
		if(mobile == null || mobile == ""){
			alert("请选输入预留手机号");
			return;
		}
		if(mobile.length !=11){
			alert("手机号格式错误");
			return;
		}
		$("#mobileEncode").val(encodeURI(mobile));
		frm.submit();
	});
	var msg = '${returnmsg}';
	if(msg != "" && msg != null){
		alert(msg);
	}
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
</html>
