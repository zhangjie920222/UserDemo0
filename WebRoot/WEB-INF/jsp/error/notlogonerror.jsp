<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>

  </head>
  <script type="text/javascript">
  	alert("�˺�δ��¼����ʧЧ�������µ�¼��");
  	window.location.href = "<%=basePath%>app/toc/jsp/logon/logon.jsp"
  </script>
  <body>
  </body>
</html>
