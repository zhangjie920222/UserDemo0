<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ include file="../../public/taglib.jsp"%>
<%@ include file="../../public/path.jsp"%>
<!DOCTYPE>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
		<meta name="viewport"
			content="width=device-width,target-densitydpi=medium-dpi,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
		<link rel=stylesheet type="text/css" href="<%=skinPath%>css/model.css" title="cool">
		<script type="text/javascript" src="<%=basePath%>js/jquery-1.6.min.js"></script>
		<title>${pageTitle}</title>
	</head>

<body>

<div class="bt1" style="color:white;margin:0 auto;margin-bottom:20px;"><span>银行卡绑定</span><a id="cc_bufen_title" href="javascript:location.href='<%=basePath%>/jsp/user/userInfo.jsp'"><img style="float:right;margin-top:15px;padding-right:20px;" src="<%=basePath %>images/back.png"/></a> </div>
<div class="xgsj">
 <c:if test="${NAME != null }">
  <div class="xgsj_txt">
     <div class=" xgsj_bt">姓名</div>
     <div class="xgsj_bor" style="padding:0">${NAME}
     </div>
  </div>
  </c:if>
  <c:forEach var="bank" items="${LIST}">					
	<div class="xgsj_txt bank" title="${bank.BANKNO }">
      <div class=" xgsj_bt">银行卡号</div>
      <div class="xgsj_bor" style="padding:0">
       <label></label>
       **** **** **** ${fn:substring(bank.BANKNO, (fn:length(bank.BANKNO)-4), fn:length(bank.BANKNO))}
      </div>
   </div>			
  </c:forEach>
   
   <div class="dl_txt1">
    <div class="dl_btn3" id="add">添加银行卡</div> 
  </div>
   
</div>
<script type="text/javascript">
	$(function(){
		$("#add").click(function(){
			window.location.href='<%=path %>/tocServlet?reqName=ADDBANKBINDINGFORWARD';
		});
		$(".bank").click(function(){
			var bankNo = $(this).attr("title");
			if(bankNo == null){
				return;
			}
			$("#bankNo").val(bankNo);
			$("#frm").submit();
		});
	});
	var msg = '${returnmsg}';
	if(msg != "" && msg != null){
		alert(msg);
	}
	</script>
  </body>
</html>
