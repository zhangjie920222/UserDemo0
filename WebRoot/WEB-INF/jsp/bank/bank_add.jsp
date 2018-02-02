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
<div class="bt1" style="color:white;margin:0 auto;margin-bottom:20px;"><span>������п�</span><a href="javascript:location.href='<%=path %>/tocServlet?reqName=GETBANKBINDINGLIST'"><img style="float:right;margin-top:15px;padding-right:20px;" src="<%=basePath %>images/back.png"/></a> </div>
<form action="<%=path%>/tocServlet" method="post" id="frm" name="frm">
			<input type="hidden" name="token" value="<%=token%>">
<div class="xgsj">
   <div class="xgsj_txt">
     <div class=" xgsj_bt">������</div>
     <div class="xgsj_bor">
       <input id="name" value="${NAME }" type="text" class="xgsj_input"  />
       <input type="hidden" name="name" id="nameEncode"/>
     </div>
   </div>
   <c:if test="${NAME==null }">
	 <div class="xgsj_txt">
       <div class=" xgsj_bt">���֤��</div>
       <div class="xgsj_bor">
       <input  name="idcardNo" id="idcardNo"  class="xgsj_input" value="${IDCARDNO }" />
       </div>
      </div>
	</c:if>
   
   <div class="xgsj_txt">
     <div class=" xgsj_bt">���У�</div>
     <div class="xgsj_bor">
       <label>
      
       <select id="bankName" class="xgsj_input" name="">
							<option value="">--��ѡ������--</option>
							<c:forEach var="_deal" items="${BANKLIST}">
								<option value="${_deal.NAME }">${_deal.NAME }</option>
							</c:forEach>				
		</select>
		<input type="hidden"  name="bankName" id="bankNameEncode"/>
       </label>
     </div>
   </div>
   <div class="xgsj_txt">
     <div class=" xgsj_bt">���п��ţ�</div>
     <div class="xgsj_bor">
       <input class="xgsj_input"   name="bankNo" id="bankNo"/>
     </div>
   </div>
   <div class="xgsj_txt">
     <div class=" xgsj_bt">ʡ�ݣ�</div>
     <div class="xgsj_bor">
       <select id="province" class="xgsj_input" name="">
							<option value="">--��ѡ��ʡ��--</option>
						</select>
		<input type="hidden" name="province" id="provinceEncode"/>
     </div>
   </div>
   <div class="xgsj_txt">
     <div class=" xgsj_bt">���У�</div>
     <div class="xgsj_bor">
      <select id="city" class="xgsj_input" name="">
							<option value="">--��ѡ�����--</option>
						</select>
						<input type="hidden"  name="city" id="cityEncode"/>
     </div>
   </div>
   <div class="xgsj_txt">
     <div class=" xgsj_bt">Ԥ���ֻ��ţ�</div>
     <div class="xgsj_bor">
       <input name="" class="xgsj_input" id="mobile" value="" />
						<input type="hidden"  name="mobile" id="mobileEncode"/>
     </div>
   </div>
  
  <c:if test="${NAME==null }">
			<div class="gao" style="width:80%;color: red;height: auto;margin:0 auto;margin-top:10px;margin-bottom:20px;">
				ע�⣺ֻ�ܰ�һ���˵����п���������󶨶��ſ�����ô��Щ����������ͬһ�ˡ����������֤���Ե�һ�����ʱΪ׼�����������֤����ӳɹ������޸ġ�
			</div>
			</c:if>
<div class="dl_txt1">
    <div class="dl_btn3" id="btpwdsubmit">�ύ</div>
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
			alert("����������");
			return;
		}
		$("#nameEncode").val(encodeURI(name));
		if(!hasBing){
			var idcardNo = $("#idcardNo").val();
			if(idcardNo==null || idcardNo==""){
				alert("���������֤��");
				return;
			}
		}
		var bankNo = $("#bankNo").val();
		if(bankNo == null || bankNo == ""){
			alert("���������п���");
			return;
		}
		var bankName = $("#bankName").val();
		if(bankName == null || bankName == ""){
			alert("��ѡ������");
			return;
		}
		$("#bankNameEncode").val(encodeURI(bankName));
		var province = $("#province").val();
		if(province == null || province == ""){
			alert("��ѡ������");
			return;
		}
		$("#provinceEncode").val(encodeURI(province));
		
		var city = $("#city").val();
		if(city == null || city == ""){
			alert("��ѡ�����");
			return;
		}
		$("#cityEncode").val(encodeURI(city));
		var mobile = $("#mobile").val();
		if(mobile == null || mobile == ""){
			alert("��ѡ����Ԥ���ֻ���");
			return;
		}
		if(mobile.length !=11){
			alert("�ֻ��Ÿ�ʽ����");
			return;
		}
		$("#mobileEncode").val(encodeURI(mobile));
		frm.submit();
	});
	var msg = '${returnmsg}';
	if(msg != "" && msg != null){
		alert(msg);
	}
	//����ʡ��
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
			$("#city").append("<option value=''>--��ѡ�����--</option>");   
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

