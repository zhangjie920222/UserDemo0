<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ include file="../../public/taglib.jsp"%>
<%@ include file="../../public/path.jsp"%>
<!DOCTYPE>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
		<meta name="viewport"
			content="width=device-width,target-densitydpi=medium-dpi,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
		<link rel=stylesheet type="text/css" href="<%=skinPath%>css/1_liuqw.css" title="cool">
		<script type="text/javascript" src="<%=basePath%>js/jquery-1.6.min.js"></script>
		<title>${pageTitle}</title>
	</head>
	<body>
		<div id="list">
		<a id="cc_bufen_title" href="javascript:location.href='<%=basePath%>/jsp/user/userInfo.jsp'"><div class="fanhui">
				银行卡绑定
			</div>
		</a>
		<div class="tishikuang11" id="cc_bufen" style="height:99%;padding-top: 2px;">
		<div class="liuqw_div" style="height:5%">
			<div class="liuqw_div" style="width:40%;float: left;text-align: left;,margin-left: 2px;">
				<c:if test="${NAME != null }">
					姓名:${NAME }
				</c:if>
			</div>
		</div>
		<div class="tishikuang0_221" style="height:84%;padding-top: 2px;">
			<div id="scroller">
				<c:forEach var="bank" items="${LIST}">
					<div class="bottom1 bank" title="${bank.BANKNO }">
						<div  class="holdInfo">
							<div class="bottom_1 left" style="text-align: right; width: 95%">
								<span style="color: red;">**** **** **** ${fn:substring(bank.BANKNO, (fn:length(bank.BANKNO)-4), fn:length(bank.BANKNO))}</span>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
		<div class="shuliang02" style="margin-left: 30%">
			<div class="shuliang02-2 left" id="add" >添加银行卡</div>
		</div>
		</div>
		</div>
		<form id="frm" action="<%=path %>/tocServlet" method="post">
			<input type="hidden" name="bankNo" id="bankNo" value="">
			<input type="hidden" name="name"  value="${NAME }">
			<input type="hidden" name="reqName" value="DELETEBANKBINDINGFORWARD">
		</form>
	</body>
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
	})
	var msg = '${returnmsg}';
	if(msg != "" && msg != null){
		alert(msg);
	}
	</script>
</html>