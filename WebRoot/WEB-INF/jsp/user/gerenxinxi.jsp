<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ include file="../../public/taglib.jsp" %>
<%@ include file="../../public/path.jsp"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
<link rel=stylesheet type="text/css" href="<%=skinPath%>/css/1_liuqw.css" title="cool">
    <script type="text/javascript" src="<%=basePath%>js/jquery-1.6.min.js"></script>
<title>${pageTitle}</title>
</head>

<body style="margin:0 auto;">
	<div class="bt1" style="color:white;margin:0 auto;margin-bottom:20px;"><span>������Ϣ</span>
        <a id="cc_bufen_title" href="javascript:location.href='<%=basePath%>/jsp/user/userInfo.jsp'">
       <img id="cc_bufen_title" href="javascript:location.href='<%=basePath%>/jsp/user/userInfo.jsp'" style="float:right;margin-top:15px;padding-right:20px;" src="<%=basePath %>images/back.png"/></a> 
     </div>
	<div class="tishikuang11" style="height: 450px;background:#ccc">
		<div class="tishikuang0_22" style="height: 250px" >
			<div class="gao">
				<div class="zhi0-1 left">ͷ��</div>
				<div class="tu11 right"><img width="56px" height="56px" src="${CurrentUser.headImgUrl}"></div>
			</div>
			<div class="gao">
				<div class="zhi0-1 left" style="width:50px;">�û���</div>
				<div class="shu right" style="width:auto;padding-top:3px;">
				<c:choose>  
				    <c:when test="${fn:length(CurrentUser.nickname)>10}">  
				        <c:out value="${fn:substring(CurrentUser.nickname, 0, 10)}..." />  
				    </c:when>  
				   <c:otherwise>  
				      <c:out value="${CurrentUser.nickname}" />  
				    </c:otherwise>  
				</c:choose>  
				</div>
			</div>
			<div class="gao">
				<div class="zhi0-1 left">�����˺�</div>
				<div class="shu right" style="width:auto;padding-top:3px;">
					${CurrentUser.userId }
				</div>
			</div>
			<div class="gao">
				<div class="zhi0-1 left">�Ա�</div>
				<div class="shu right"><c:if test="${CurrentUser.sex=='1'}">��</c:if><c:if test="${CurrentUser.sex=='2'}">Ů</c:if><c:if test="${CurrentUser.sex=='0'}">δ֪</c:if></div>
			</div>
			<div class="gao">
				<div class="zhi0-1 left">�ֻ���</div>
				<div class="shu right">${CurrentUser.phoneNumber}</div>
			</div>
		</div>
		<a href="javascript:location.href='<%=basePath %>jsp/user/xiugaimima.jsp'">
		<div class="tishikuang0_3">
			<div class="zhi0-1 left">�޸�����</div>
			<div class="tu right"></div>
		</div>
		</a>
		<a href="javascript:location.href='<%=basePath %>jsp/user/update_phone.jsp'">
		<div class="tishikuang0_3">
			<div class="zhi0-1 left">�޸��ֻ���</div>
			<div class="tu right"></div>
		</div>
		</a> 
	</div>
</body>
</html>
