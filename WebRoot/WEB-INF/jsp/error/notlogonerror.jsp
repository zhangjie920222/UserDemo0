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
  	alert("账号未登录或已失效，请重新登录！");
  	window.location.href = "<%=basePath%>app/toc/jsp/logon/logon.jsp"
  </script>
  <body>
  </body>
</html>
