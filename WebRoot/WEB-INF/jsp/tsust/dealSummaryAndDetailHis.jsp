<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ include file="../../public/taglib.jsp"%>
<%@ include file="../../public/path.jsp"%>
<!DOCTYPE>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<meta name="viewport"
			content="width=device-width,target-densitydpi=medium-dpi,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
		<link rel=stylesheet type="text/css" href="<%=skinPath%>css/1_liuqw.css" title="cool">
                  <link rel=stylesheet type="text/css" href="<%=basePath%>css/jquery-ui.min.css">
		<script type="text/javascript" src="<%=basePath%>js/jquery-1.6.min.js"></script>
                  <script type="text/javascript" src="<%=basePath%>/js/jquery-ui.min.js"></script>
		<title>${pageTitle}</title>
	</head>
	<body style="margin:0 auto;background: #ccc;">
	<div class="bt1" style="color:white;margin:0 auto;margin-bottom:20px;"><span>历史成交</span>
        <a id="cc_bufen_title" href="javascript:location.href='<%=basePath%>/jsp/user/userInfo.jsp'">
       <img id="cc_bufen_title" href="javascript:location.href='<%=basePath%>/jsp/user/userInfo.jsp'" style="float:right;margin-top:15px;padding-right:20px;" src="<%=basePath %>images/back.png"/></a> 
     </div>
		<div class="tishikuang11" id="cc_bufen" style="height:500px;padding-top: 2px;background:#535353;">
		<div class="gao" style="height: 60px;">
				<form id="_form" name="frm" action="" method="post">
				<div class="query_condition">
					开始日期<input id="_date"  name="sdate" readonly="readonly" value="${sdate}" style="width:25%;margin-left:3%;"/></div>
				<div class="query_condition">
					结束日期<input id="edate" name="edate" readonly="readonly" value="${edate}" style="width:25%;margin-left:3%;"/>
					<input type="button" onclick="$.chengjiaxinxiHis()" style="background: #f16063;border:none;width:20%;height:20px;line-height:20px;color:white;margin-left:3%;" value="查 询"/>
				</div>
				<input id="pageSize" name="pageSize" type="hidden" value="${pageInfo.pageSize}">
  				<input id="pageNo" name="pageNo" type="hidden" value="${pageInfo.pageNo}">
				</form>
		</div>
		<div class="liuqw_div" style="width:100%;text-align: center;height:30px;background:#333"><div class="liuqw_div" style="width:15%;float: left;padding-left:30px;">时间</div><div style="width:50%;float: left;" class="liuqw_div">操作&nbsp;&nbsp;&nbsp;&nbsp;</div><div style="width:16%;float: left;" class="liuqw_div">盈亏</div></div>
		<div class="tishikuang0_221_1" style="border:0px solid red;height:350px;">
			<div id="scroller" style="border:0px solid red;width:97%;">
				<c:if test="${!empty list}">
				<c:forEach var="_deal" items="${list}">
					<div class="gao1" style="border:0px solid red;" onclick="$.chankanxiangqing('${_deal}')">
						<div class="lishi-3 left" style="width: 30%">
						<fmt:formatDate value="${_deal.TI}" pattern="yyyy-MM-dd"/><br/>
						<fmt:formatDate value="${_deal.TI}" pattern="HH:mm:ss"/>
						</div>
						<div class="lishi-4 left" style="border-left:0px solid red;text-align: center;width: 40%;">
							<div class="lishi-4-1">
							<c:if test="${_deal.SE_F==1}">订立${_deal.CO_N}<br/>(<font color="red"><c:if test="${_deal.TY==1}">买涨</c:if><c:if test="${_deal.TY==2}">买跌</c:if></font>${_deal.QTY}批)</c:if>
							<c:if test="${_deal.SE_F==2}">转让${_deal.CO_N}<br/>(<font color="red"><c:if test="${_deal.TY==1}">买涨</c:if><c:if test="${_deal.TY==2}">买跌</c:if></font>${_deal.QTY}批)</c:if>
							</div>
							<div class="lishi-4-1">
							</div> 
						</div>
						<div class="lishi-5 right" style="border-left:0px solid red;">
						<c:if test="${_deal.SE_F==1}">--</c:if>
						<c:if test="${_deal.SE_F==2}"><fmt:formatNumber value="${_deal.LIQPL}" pattern="##.##" minFractionDigits="2" ></fmt:formatNumber></c:if>
						</div>
						
					</div>
					<div class="fengexian clear"></div>
				</c:forEach>
				</c:if>
				<c:if test="${list!=null&&fn:length(list)==0}">
					没有成交记录！
				</c:if>
			</div>
		</div>
		<div style="width: 100%;">
			<%@include file="./mobilePagerInc.jsp" %>
		</div>
		</div>
		
		<%-- 持仓详情 start --%>
		<div id="cc_xiangqing" style="height:auto; margin-bottom:60px;display:none;">
			
			<div class="tishikuang011" style="height:630px;">
			<div class="tishikuang0_2" style="height:150px;">
				<div class="gao">
					<div class="zhi0-1 left">成交号</div>
					<div class="shu right" id="TR_N">123456</div>
				</div>
				<div class="gao">
					<div class="zhi0-1 left">成交时间</div>
					<div class="shu right" id="TI">2015-02-01 09:04:12</div>
				</div>
				<div class="gao">
					<div class="zhi0-1 left">成交类型</div>
					<div class="shu right" id="SE_F">1</div>
				</div> 
			</div>
			<div class="tishikuang0_2" style="height:auto;">
				<div class="gao">
					<div class="zhi0-1 left">商品</div>
					<div class="shu right" id="CO_N">白银</div>
				</div>
				<div class="gao">
					<div class="zhi0-1 left" id="TY_fangxiang">方向</div>
					<div class="shu right direction" id="TY">买入</div>
				</div>
				<div class="gao">
					<div class="zhi0-1 left">数量</div>
					<div class="shu right" id="QTY">${_deal.QTY}</div>
				</div>
				<div class="gao">
					<div class="zhi0-1 left">订立价格</div>
					<div class="shu right" id="O_PR">0元</div>
				</div>
				<div id="_zy_xuyao">
					<div class="gao">
						<div class="zhi0-1 left">持仓价格</div>
						<div class="shu right" id="H_P">0元</div>
					</div>
					<div class="gao">
						<div class="zhi0-1 left">转让价格</div>
						<div class="shu right" id="PR">0元</div>
					</div>
				</div>
			</div>
			<div class="tishikuang0_2" style="height:120px;">
					<div class="gao">
						<div class="zhi0-1 left">盈亏</div>
						<div class="shu right" id="LIQPL">0元</div>
					</div>
					<div class="gao">
						<div class="zhi0-1 left">手续费</div>
						<div class="shu right" id="COMM">0元</div>
					</div>
			</div>
			<br/>
			<div style="background:#666;color:white;width:96%;border-radius:10px;height:30px;line-height:30px;margin:0 auto;text-align:center;" onclick="javascript:$.chingjiao();">返回历史成交</div> 
		</div>
		</div>
		<%-- 持仓详情 end --%> 
	</body>
	<script type="text/javascript">
		$(function(){
			function subDate(date,days){
				date.setDate(date.getDate()-days);
				return date;
			}
			var _date_tmp = new Date();
			_date_tmp = subDate(_date_tmp,1);
			//初始化日期
			var _month = _date_tmp.getMonth()+1;
			if(_month<10){
				_month = "0"+_month;
			}
			var _day = _date_tmp.getDate();
			var _date_s = _date_tmp.getFullYear()+"-"+_month+"-"+_day;
			if($("#_date").val()=="")
			{
				$("#_date").attr("value",_date_s);
			}
			if($("#edate").val()=="")
			{
				$("#edate").attr("value",_date_s);
			}
			//window.alert(_date_s);
			$("#_date").datepicker({//添加日期选择功能  
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
			$("#edate").datepicker({//添加日期选择功能  
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

			//获取历史成交信息
			$.chengjiaxinxiHis = function()
			{
				var mobile = $('#_date').val();
				if(mobile=="")
				{
					window.alert("需要先选择日期！");
					return ;
				}
				_form.action = "<%=path%>/tocServlet?t="+new Date()+"&reqName=tradequeryHis";
				_form.submit();				
			}


			//解析字串
			$._func_analysisStr = function(_string_obj,_first_regex,_second_regex)
			{
				return _string_obj.replace("]",",").replace("["," ").split(_first_regex)[1].split(_second_regex)[0];
			}

			$.func_hold_analysis = function(holdDetail,attrName)
		    {
		      return $._func_analysisStr(holdDetail," "+attrName+"=",",");
		    }

			Date.prototype.format =function(format)
		    {
			    //window.alert(this.getHours());
		        var o = {
		        "M+" : this.getMonth()+1, //month
				"d+" : this.getDate()-1,    //day
				"h+" : (this.getHours()+10)>=24?((this.getHours()+10)-24):(this.getHours()+10),   //hour
				"m+" : this.getMinutes(), //minute
				"s+" : this.getSeconds(), //second
				"q+" : Math.floor((this.getMonth()+3)/3),  //quarter
				"S" : this.getMilliseconds() //millisecond
		        }
		        if(/(y+)/.test(format)) format=format.replace(RegExp.$1,
		        (this.getFullYear()+"").substr(4- RegExp.$1.length));
		        for(var k in o)if(new RegExp("("+ k +")").test(format))
		        format = format.replace(RegExp.$1,
		        RegExp.$1.length==1? o[k] :
		        ("00"+ o[k]).substr((""+ o[k]).length));
		        return format;
		    }

		    $.chingjiao = function()
		    {
		    	$("#cc_bufen_title").show();
				$("#cc_bufen").show();
				$("#cc_xiangqing").hide();
			}

			$.chankanxiangqing = function(value)
			{
				//window.alert(value);
				$("#TR_N").text($.func_hold_analysis(value,"TR_N"));
				var time = $.func_hold_analysis(value,"TI");
				var arry = time.split(" ");
				var monthE2N = {Jan:1,Feb:2,Mar:3,Apr:4,May:5,Jun:6,Jul:7,Aug:8,Sep:9,Oct:10,Nov:11,Dec:12};
				var year = arry[5];
				var month = monthE2N[arry[1]];
				var day = arry[2];
				var _time = arry[3];
				var date = year+"-"+month+"-"+day+" "+_time;
				$("#TI").text(date);
				//$("#TI").text(new Date($.func_hold_analysis(value,"TI")).format('yyyy-MM-dd hh:mm:ss'));
				$("#TY").text($.func_hold_analysis(value,"TY")=="1"?"买涨":"买跌");
				$("#QTY").text($.func_hold_analysis(value,"QTY"));
				$("#CO_N").text($.func_hold_analysis(value,"CO_N"));
				var tmp_SE_F = $.func_hold_analysis(value,"TR_T");
				if($.func_hold_analysis(value,"SE_F")=="2")
				{
					$("#TY_fangxiang").text("转让方向");
					$("#PR").text(Number($.func_hold_analysis(value,"PR")).toFixed(2));
					$("#LIQPL").text(Number($.func_hold_analysis(value,"LIQPL")).toFixed(2));
					$("#H_P").text(Number($.func_hold_analysis(value,"H_P")).toFixed(2));
					$("#_zy_xuyao").show();
				}else{
					$("#TY_fangxiang").text("订立方向");
					$("#_zy_xuyao").hide();
				}
				$("#TY").text($.func_hold_analysis(value,"TY")=="1"?"买涨":"买跌");
				if(tmp_SE_F=="1"||tmp_SE_F=="2"||tmp_SE_F=="3")
				{
					tmp_SE_F = "市价成交";
				}else if(tmp_SE_F=="4")
				{
					tmp_SE_F = "自动强平";
				}else if(tmp_SE_F=="5")
				{
					tmp_SE_F = "手动强平";
				}else if(tmp_SE_F=="6"||tmp_SE_F=="7")
				{
					tmp_SE_F = "指价成交";
				}else
				{
					tmp_SE_F = "----";
				}
				$("#SE_F").text(tmp_SE_F);
				$("#O_PR").text(Number($.func_hold_analysis(value,"O_PR")).toFixed(2));
				$("#COMM").text((Number($.func_hold_analysis(value,"COMM"))).toFixed(2));
				
				$("#cc_bufen_title").hide();
				$("#cc_bufen").hide();
				$("#cc_xiangqing").show();
			}
		});
		var msg = '${resultMsg}';
		if(msg !=""){
			alert(msg);
		}
 $(".tishikuang0_221_1").height("350px");

	</script>
</html>