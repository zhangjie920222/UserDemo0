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
<a style="text-decoration:none;" href="javascript:location.href='<%=basePath %>jsp/user/gerenxinxi.jsp'"><div class="bt1" style="color:white;">�޸İ��ֻ���</div></a>
<form action="<%=path%>/tocServlet" method="post" id="frm" name="frm">
<div class="xgsj">
   <div class="xgsj_txt">
     <div class=" xgsj_bt">�Ѱ��ֻ��ţ�</div>
     <div class="xgsj_bor">
       <input readonly="readonly" name="currentPwd" id="currentPwd" value="${CurrentUser.phoneNumber}" />
     </div>
   </div>
   <div class="xgsj_txt">
     <div class=" xgsj_bt">���ֻ��ţ�</div>
     <div class="xgsj_bor">
       <input   name="newPhoneNum" id="newPhoneNum"/>
     </div>
   </div>
   <div class="xgsj_txt">
     <div class=" xgsj_bt">ȷ���ֻ��ţ�</div>
     <div class="xgsj_bor">
       <input   name="newPhoneNumAgain" id="newPhoneNumAgain"/>
     </div>
   </div>
   <div class="shuliang8 clear" id="btpwdsubmit"></div>
   <div class="dl_txt1">
       <div class="dl_btn3">�ύ</div>
  </div>
</div>
<input type="hidden" name="reqName" value="CHANGE_PHONE">
</form>
<script type="text/javascript">
	$(function(){
		var msg = '${msg}';
		if(msg != ''){
			alert(msg);
		}
			//ajax�ύ
		$("#btpwdsubmit").click(function(){
			var newPhoneNum = $("newPhoneNum").val();
			if(newPhoneNum == ""){
				alert("���������ֻ��ţ�");
				return;
			}
			var newPhoneNumAgain = $("#newPhoneNumAgain").val();
			if(newPhoneNum != newPhoneNum){
				alert("����������ֻ��Ų�һ�£�");
				return;
			}
			frm.submit();
		});
	});
</script>
  </body>
</html>
