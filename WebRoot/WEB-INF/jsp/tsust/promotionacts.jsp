<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ include file="../../public/taglib.jsp"%>
<%@ include file="../../public/path.jsp"%>
<!DOCTYPE>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="viewport"
			content="width=device-width,target-densitydpi=medium-dpi,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
		<link rel=stylesheet type="text/css" href="<%=skinPath%>css/query.css" title="cool">
		<link rel=stylesheet type="text/css" href="<%=basePath%>css/jquery-ui.min.css">
		<script type="text/javascript" src="<%=basePath%>/js/jquery-1.6.min.js"></script>
		<script type="text/javascript" src="<%=basePath%>/js/jquery-ui.min.js"></script>
		<title>${pageTitle}</title>
	</head>
	<body style="margin:0 auto;">
	<div class="bt1" style="color:white;margin:0 auto;margin-bottom:20px;"><span>体验券查询</span>
        <a id="cc_bufen_title" href="javascript:location.href='<%=basePath%>/jsp/user/userInfo.jsp'">
       <img id="cc_bufen_title" href="javascript:location.href='<%=basePath%>/jsp/user/userInfo.jsp'" style="float:right;margin-top:15px;padding-right:20px;" src="<%=basePath %>images/back.png"/></a> 
     </div>		
		<div class="tishikuang11" id="cc_bufen" style="height:auto;padding-top: 2px;">
		<div class="gao" style="height: auto;">
				<form id="frm" name="frm" action="<%=path%>/tocServlet" method="post">
				<input type="hidden" name="reqName" value="PROMOTIONACT">
				<div class="query_condition">
					开始日期<input id="sdate" class="date" name="sdate" readonly="readonly" value="${sdate}"  style="width:25%;margin-left:3%;"/></div>
				<div class="query_condition">
					结束日期<input id="edate" class="date" name="edate" readonly="readonly" value="${edate}"  style="width:25%;margin-left:3%;"/>
					<input type="button" id="query" value="查 询" style="background: #f16063;border:none;width:20%;height:20px;line-height:20px;color:white;margin-left:3%;"/>
				</div>
				<div class="query_condition">
					体验券总额: ${total.TOTALFUNDTYQ }&nbsp;&nbsp;&nbsp;&nbsp;
					已用: ${total.TOTALFUNDTYQ-total.FUNDTYQ }&nbsp;&nbsp;&nbsp;&nbsp;
					剩余: ${total.FUNDTYQ }
				</div>
				<input id="pageSize" name="pageSize" type="hidden" value="${pageInfo.pageSize}">
  				<input id="pageNo" name="pageNo" type="hidden" value="${pageInfo.pageNo}">
				</form>
		</div>
		<div class="title_div" style="width:100%;text-align: center;height:22px;">
			<div style="width:25%;float: left;" class="title_div">时间</div>
			<div style="width:25%;float: left;" class="title_div">类型</div>
			<div style="width:25%;float: left;" class="title_div">金额</div>
			<div style="width:25%;float: right;" class="title_div">有效期</div>
		</div>
		<div class="tishikuang0_221_1" style="border:0px solid red;height:350px;">
			<div id="scroller" style="border:0px solid red;width:100%;">
				<c:forEach var="_deal" items="${data}">
					<div class="gao1 withdrow" id="${_deal.ID }" style="border:0px solid red;">
						<div class="lishi-3 left" style="width: 25%">
							<fmt:formatDate value="${_deal.RESPTIME}" pattern="yyyy-MM-dd"/><br/>
							<fmt:formatDate value="${_deal.RESPTIME}" pattern="HH:mm:ss"/>
						</div>
						<div class="lishi-4 left" style="width: 25%;">
							<div class="lishi-4-1">
								<c:choose>
									<c:when test="${_deal.TYPE==1 }">注册赠送</c:when>
									<c:when test="${_deal.TYPE==2 }">活动赠送</c:when>
									<c:when test="${_deal.TYPE==8 }">消费</c:when>
									<c:when test="${_deal.TYPE==9 }">失效</c:when>
								</c:choose>
							</div>
						</div>
						<div class="lishi-5 left" style="width: 20%;">
							<fmt:formatNumber value="${_deal.AMOUNT}" pattern="##.##" minFractionDigits="2" />
						</div>
						<div class="lishi-3 right" style="width: 25%">
							<fmt:formatDate value="${_deal.DEADLINE}" pattern="yyyy-MM-dd"/><br/>
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
	});
	var msg = '${resultMsg}';
	if(msg !=""){
		alert(msg);
	}
	</script>
</html>