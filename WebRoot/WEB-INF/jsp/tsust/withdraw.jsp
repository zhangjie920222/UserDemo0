<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ include file="../../public/taglib.jsp"%>
<%@ include file="../../public/path.jsp"%>
<!DOCTYPE>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<meta name="viewport"
			content="width=device-width,target-densitydpi=medium-dpi,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
		<link rel=stylesheet type="text/css" href="<%=skinPath%>css/query.css" title="cool">
		<link rel=stylesheet type="text/css" href="<%=basePath%>css/jquery-ui.min.css">
		<script type="text/javascript" src="<%=basePath%>/js/jquery-1.6.min.js"></script>
		<script type="text/javascript" src="<%=basePath%>/js/jquery-ui.min.js"></script>
		<title>${pageTitle}</title>
	</head>
	<body>
	<div class="bt1" style="color:white;margin:0 auto;margin-bottom:20px;"><span>提现申请</span>
	<a href="javascript:location.href='<%=basePath %>jsp/user/userInfo.jsp'">
	<img id="back" style="float:right;margin-top:15px;padding-right:20px;" src="<%=basePath %>images/back.png"/></a>
	</div>
		<div class="tishikuang11" id="cc_bufen" style="height:500px;padding-top: 2px;">
		<div class="gao" style="height: 60px;">
				<form id="frm" name="frm" action="<%=path%>/tocServlet" method="post">
				<input type="hidden" name="reqName" value="WITHDRAWQUERY">
				<div class="query_condition">
					开始日期<input id="sdate" class="date" name="sdate" readonly="readonly" value="${sdate}" style="width:25%;margin-left:3%;"/></div>
				<div class="query_condition">
					结束日期<input id="edate" class="date" name="edate" readonly="readonly" value="${edate}" style="width:25%;margin-left:3%;"/>
					<input type="button" id="query" value="查 询" style="background: #f16063;border:none;width:20%;height:20px;line-height:20px;color:white;margin-left:3%;"/>
				</div>
				<input id="pageSize" name="pageSize" type="hidden" value="${pageInfo.pageSize}">
  				<input id="pageNo" name="pageNo" type="hidden" value="${pageInfo.pageNo}">
				</form>
		</div>
		<div class="title_div" style="width:100%;text-align: center;height:30px;background:#333;color:white;">
		<div class="title_div" style="width:15%;float: left;padding-left:30px;height:30px;line-height:30px;">时间</div>
		<div style="width:50%;float: left;" class="title_div">状态&nbsp;&nbsp;&nbsp;&nbsp;</div>
		<div style="width:16%;float: left;" class="title_div">金额</div></div>
		<div class="tishikuang0_221_1" style="border:0px solid red;height:350px;">
			<div id="scroller" style="border:0px solid red;width:97%;">
				<c:forEach var="_deal" items="${data}">
					<div class="gao1 withdrow" id="${_deal.ID }" style="border:0px solid red;">
						<div class="lishi-3 left" style="width: 30%">
							<fmt:formatDate value="${_deal.TIME}" pattern="yyyy-MM-dd"/><br/>
							<fmt:formatDate value="${_deal.TIME}" pattern="HH:mm:ss"/>
						</div>
						<div class="lishi-4 left" style="border-left:0px solid red;text-align: center;width: 20%;">
							<div class="lishi-4-1">
								<c:choose>
									<c:when test="${_deal.STATUS==0 }">申请</c:when>
									<c:when test="${_deal.STATUS==1 }">通过</c:when>
									<c:when test="${_deal.STATUS==2 }">拒绝</c:when>
								</c:choose>
							</div>
						</div>
						<div class="lishi-5 right" style="border-left:0px solid red;text-align: center;width: 40%;">
							<fmt:formatNumber value="${_deal.acount}" pattern="##.##" minFractionDigits="2" />
						</div>
						<div class="fengexian clear"></div>
					</div>
				</c:forEach>
			</div>
		</div>
		<div style="width: 100%;">
			<%@include file="./mobilePagerInc.jsp" %>
		</div>
		</div>
	</body>
	<script type="text/javascript">
	$(function(){
		function subDate(date,days){
			date.setDate(date.getDate()-days);
			return date;
		}
		var _date_tmp = new Date();
		_date_tmp = subDate(_date_tmp,0);
		//初始化日期
		var _month = _date_tmp.getMonth()+1;
		if(_month<10){
			_month = "0"+_month;
		}
		var _day = _date_tmp.getDate();
		var _date_s = _date_tmp.getFullYear()+"-"+_month+"-"+_day;
		if($("#sdate").val()=="")
		{
			$("#sdate").attr("value",_date_s);
		}
		if($("#edate").val()=="")
		{
			$("#edate").attr("value",_date_s);
		}
		//window.alert(_date_s);
		$(".date").datepicker({//添加日期选择功能  
			numberOfMonths:1,//显示几个月  
            showButtonPanel:true,//是否显示按钮面板  
            dateFormat: 'yy-mm-dd',//日期格式  
            clearText:"清除",//清除日期的按钮名称  
            closeText:"关闭",//关闭选择框的按钮名称  
            yearSuffix: '年', //年的后缀  
            showMonthAfterYear:true,//是否把月放在年的后面  
            //defaultDate:'2011-03-10',//默认日期  
           // minDate:'2011-03-05',//最小日期  
            maxDate: _date_s,//最大日期  
            monthNames: ['一月','二月','三月','四月','五月','六月','七月','八月','九月','十月','十一月','十二月'],  
            dayNames: ['星期日','星期一','星期二','星期三','星期四','星期五','星期六'],  
            dayNamesShort: ['周日','周一','周二','周三','周四','周五','周六'],  
            dayNamesMin: ['日','一','二','三','四','五','六'],  
            onSelect: function(selectedDate) {//选择日期后执行的操作  
               // alert(selectedDate);  
            }  
		});
		$("#query").click(function(){
			//var sdate = $("#sdate").val();
			//var edate = $("#edate").val();
			var begin=new Date($("#sdate").val().replace(/-/g,"/"));
		    var end=new Date($("#edate").val().replace(/-/g,"/"));
		    //js判断日期
		    if(begin-end>0){
		    	alert("开始日期要在截止日期之前!");  
		        return false;
		    }
		    $("#frm").submit();
		});
		$(".withdrow").click(function(){
			var id = $(this).attr("id");			
			var url = "<%=path%>/tocServlet?reqName=WITHDROWDETAIL&id="+id;
			location.href = url;
		});
	});
	var msg = '${resultMsg}';
	if(msg !=""){
		alert(msg);
	}
	</script>
</html>