<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ include file="../../public/taglib.jsp" %>
<%@page import="gnnt.MEBS.util.TokenProccessor"%>
<%@ include file="../../public/path.jsp"%>
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
<form action="<%=path%>/tocServlet" id="frm">
	<input type="hidden" name="reqName" value="NEWWITHDRAWMONEY"/>
	<input type="hidden" name="token" value="<%=token%>">

<div class="bt1" style="color:white;margin:0 auto;margin-bottom:20px;"><span>����</span>
<a href="javascript:location.href='<%=basePath %>jsp/user/userInfo.jsp'">
<img style="float:right;margin-top:15px;padding-right:20px;" src="<%=basePath %>images/back.png"/></a> 
</div>
<div class="xgsj">
   <div class="xgsj_txt">
     <div class=" xgsj_bt">����ȡ���</div>
     <div class="xgsj_bor" id="userfulFounds">${CANOUTFUND }</div>
  </div>
   <div class="xgsj_txt">
     <div class=" xgsj_bt">����</div>
     <div class="xgsj_bor" id="userfulFounds">${NAME}</div>
  </div>
   <div class="xgsj_txt">
     <div class=" xgsj_bt">���п���</div> 
     <div class="xgsj_bor">
       <label>
       <select id="bankNo" name="bankNo" class="xgsj_input">
						<option value="">--��ѡ�����п�--</option>
						<c:forEach var="_deal" items="${BANKLIST}">
							<option value="${_deal.BANKNO }">**** **** **** ${fn:substring(_deal.BANKNO, (fn:length(_deal.BANKNO)-4), fn:length(_deal.BANKNO))}</option>
						</c:forEach>				
					</select>
       </label>
     </div>
   </div>
   <div class="xgsj_txt">
     <div class=" xgsj_bt">��ȡ���</div>
     <div class="xgsj_bor">
       <input id="amount" name="amount" class="xgsj_input" placeholder="��������ȡ���"  onkeyup="value=value.replace(/[^(\d)|(\d.\d)]/g,'')" />
     </div>
   </div>
   <div class="xgsj_txt">
     <div class=" xgsj_bt">��������</div>
     <div class="xgsj_bor">
       
       <input id="password" class="xgsj_input" name="password" type="password" placeholder="�����뽻������" />
     </div>
   </div>
  <!--  <div class="xgsj_txt">
     <div class=" xgsj_bt">���У�</div>
     <div class="xgsj_bor">
       <input name="" type="text" class="xgsj_input" id=" " />
     </div>
   </div>
   <div class="xgsj_txt">
     <div class=" xgsj_bt">Ԥ���ֻ��ţ�</div>
     <div class="xgsj_bor">
       <input name="" type="text" class="xgsj_input" id=" " />
     </div>
   </div> -->
   <div class="xgsj_txt" style="height:60px;line-height:20px;">      
				����${rechargeTime}
				ÿ����������${amountRule.OUTMINCOUNT }Ԫ�����${amountRule.PEROUTLIMIT }Ԫ
				�����������${amountRule.DAYOUTLIMIT }Ԫ���������${amountRule.OUTCOUNT}��
   </div>
  <div class="dl_txt1">
    <div class="dl_btn3" id="submitBt">�ύ</div>
  </div>
 <p id="china_citys"></p>
 </div>
 </form> 
 <script type="text/javascript">
 		$(function(){
 			var isNum = new RegExp("^[0-9]+\.{0,1}[0-9]{0,2}$");
 			function hasLength(o){
 				if(o==null || o==""){
 					return false;
 				}
 				return true;
 			}
 	 		$("#submitBt").click(function(){
 	 			var bankNo = $("#bankNo").val();
				if(!hasLength(bankNo)){
					alert("�����п���");
					return;
					}
				var amount = $("#amount").val();
				if(!hasLength(amount)){
					alert("��������ȡ���");
					return;
					}
				var _amount=amount.match(isNum)
				if(_amount!=amount){
					alert("��ȡ������Ч����");
					return ;
					}
				var userfulFounds = Number($("#userfulFounds").html());
				if(userfulFounds<amount){
					alert("����ȡ����");
					return;
					}
				var password = $("#password").val();
				if(!hasLength(password)){
					alert("�����뽻������");
					return;
					}
				var code = '${CurrentUser.userId}';
				$.ajax({
					type:"post",
					url:"<%=path%>/tocServlet?t="+new Date(),
					contentType: "application/x-www-form-urlencoded; charset=UTF-8",
					data:{reqName:"ALL_WITHDRAWCHECK",amount:amount,code:code},
					dataType: "json",
					success: function(data){
						if(data !="" && data!=null && data !=undefined){
							var tag = data["retcode"];
							if(tag == 1){
								var flag = confirm("ȷ���ύ��");
								if(flag){
									$("#frm").submit();
								}
							}else if(tag == -1){
								alert("ϵͳ�쳣");
							}else if(tag == -2){
								alert("��ǰʱ�䲻��������");
							}else if(tag == -3){
								alert("�������������볬������");
							}else if(tag == -4){
								alert("���������������ܶ�����ֵ");
							}else if(tag == -5){
								alert("���˴ε������ȳ������ֵ");
							}else if(tag == -6){
								alert("��������");
							}else if(tag == -7){
								alert("���˴ε�����Ľ��С��������С���");
							}else if(tag == -8){
								alert("��ȡ������Ч����");
							}
						}
					}
				});
 	 	 	});
 	 	});
  </script>
  <c:if test="${not empty returnmsg }">
	<script>
        alert('${returnmsg}');
    </script>
</c:if>
  </body>
</html>
