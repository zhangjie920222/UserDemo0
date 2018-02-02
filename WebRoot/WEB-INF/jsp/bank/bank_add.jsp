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
	<link rel=stylesheet type="text/css" href="<%=skinPath%>/css/model.css" title="cool">
	<script type="text/javascript" src="<%=basePath%>js/jquery-1.6.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/city.js" charset="GBK"></script>
	<title>${pageTitle}</title>
</head>

<body>
<div class="bt1" style="color:white;margin:0 auto;margin-bottom:20px;"><span>添加银行卡</span><a href="javascript:location.href='<%=path %>/tocServlet?reqName=GETBANKBINDINGLIST'"><img style="float:right;margin-top:15px;padding-right:20px;" src="<%=basePath %>images/back.png"/></a> </div>
<form action="<%=path%>/tocServlet" method="post" id="frm" name="frm">
			<input type="hidden" name="token" value="<%=token%>">
<div class="xgsj">
   <div class="xgsj_txt">
     <div class=" xgsj_bt">姓名：</div>
     <div class="xgsj_bor">
       <input id="name" value="${NAME }" type="text" class="xgsj_input"  />
       <input type="hidden" name="name" id="nameEncode"/>
     </div>
   </div>
   <c:if test="${NAME==null }">
	 <div class="xgsj_txt">
       <div class=" xgsj_bt">身份证：</div>
       <div class="xgsj_bor">
       <input  name="idcardNo" id="idcardNo"  class="xgsj_input" value="${IDCARDNO }" />
       </div>
      </div>
	</c:if>
   
   <div class="xgsj_txt">
     <div class=" xgsj_bt">银行：</div>
     <div class="xgsj_bor">
       <label>
      
       <select id="bankName" class="xgsj_input" name="">
							<option value="">--请选择银行--</option>
							<c:forEach var="_deal" items="${BANKLIST}">
								<option value="${_deal.NAME }">${_deal.NAME }</option>
							</c:forEach>				
		</select>
		<input type="hidden"  name="bankName" id="bankNameEncode"/>
       </label>
     </div>
   </div>
   <div class="xgsj_txt">
     <div class=" xgsj_bt">银行卡号：</div>
     <div class="xgsj_bor">
       <input class="xgsj_input"   name="bankNo" id="bankNo"/>
     </div>
   </div>
   <div class="xgsj_txt">
     <div class=" xgsj_bt">省份：</div>
     <div class="xgsj_bor">
       <select id="province" class="xgsj_input" name="">
							<option value="">--请选择省份--</option>
						</select>
		<input type="hidden" name="province" id="provinceEncode"/>
     </div>
   </div>
   <div class="xgsj_txt">
     <div class=" xgsj_bt">城市：</div>
     <div class="xgsj_bor">
      <select id="city" class="xgsj_input" name="">
							<option value="">--请选择城市--</option>
						</select>
						<input type="hidden"  name="city" id="cityEncode"/>
     </div>
   </div>
   <div class="xgsj_txt">
     <div class=" xgsj_bt">预留手机号：</div>
     <div class="xgsj_bor">
       <input name="" class="xgsj_input" id="mobile" value="" />
						<input type="hidden"  name="mobile" id="mobileEncode"/>
     </div>
   </div>
  
  <c:if test="${NAME==null }">
			<div class="gao" style="width:80%;color: red;height: auto;margin:0 auto;margin-top:10px;margin-bottom:20px;">
				注意：只能绑定一个人的银行卡，即如果绑定多张卡，那么这些卡必须属于同一人。姓名和身份证号以第一次添加时为准。姓名和身份证号添加成功后不能修改。
			</div>
			</c:if>
<div class="dl_txt1">
    <div class="dl_btn3" id="btpwdsubmit">提交</div>
  </div>
	<input type="hidden" name="reqName" value="ADDBANKBINDING">
	<input type="hidden" value="${hasBing}" name="hasBing">
</div>
</form>
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
  </body>
</html>

