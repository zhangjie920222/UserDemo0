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
		<style type="text/css">
			
		</style>
	</head>
	<body style="margin:0 auto;">
     <div class="bt1" style="color:white;margin:0 auto;margin-bottom:20px;"><span>�����</span>
       <a id="cc_bufen_title" href="javascript:location.href='<%=basePath%>/jsp/user/userInfo.jsp'">
       <img style="float:right;margin-top:15px;padding-right:20px;" src="<%=basePath %>images/back.png"/></a> 
     </div>
		<div class="tishikuang11" id="cc_bufen" style="padding-top: 2px;padding-bottom:20px;">
		<div class="gao" style="height: 60px;">
				<form id="frm" name="frm" action="<%=path%>/tocServlet" method="post">
				<input type="hidden" name="reqName" value="INOUTMONEY">
				<div class="query_condition">
					��ʼ����<input id="sdate" class="date" name="sdate" readonly="readonly" value="${sdate}" style="width:25%;margin-left:3%;"/></div>
				<div class="query_condition">
					��������<input id="edate" class="date" name="edate" readonly="readonly" value="${edate}" style="width:25%;margin-left:3%;"/>
					<input type="button" id="query" value="�� ѯ" style="background: #f16063;border:none;width:20%;height:20px;line-height:20px;color:white;margin-left:3%;"/>
				</div>
				<input id="pageSize" name="pageSize" type="hidden" value="${pageInfo.pageSize}">
  				<input id="pageNo" name="pageNo" type="hidden" value="${pageInfo.pageNo}">
				</form>
		</div>
		<div class="title_div" style="width:100%;text-align: center;height:30px;background:#333;color:white;">
		<div class="title_div" style="width:15%;float: left;padding-left:30px;height:30px;line-height:30px;">ʱ��</div>
		<div style="width:50%;float: left;height:30px;line-height:30px;" class="title_div">����&nbsp;&nbsp;&nbsp;&nbsp;</div>
		<div style="width:16%;float: left;height:30px;line-height:30px;" class="title_div">���</div></div>
		<div class="tishikuang0_221_1" style="border:0px solid red;">
			<div id="scroller" style="border:0px solid red;width:97%;">
				<c:forEach var="_deal" items="${data}">
					<div class="gao1" style="border:0px solid red;">
						<div class="lishi-3 left" style="width: 30%">
							<fmt:formatDate value="${_deal.CREATETIME}" pattern="yyyy-MM-dd"/><br/>
							<fmt:formatDate value="${_deal.CREATETIME}" pattern="HH:mm:ss"/>
						</div>
						<div class="lishi-4 left" style="border-left:0px solid red;text-align: center;width: 20%;">
							<div class="lishi-4-1">
								<c:choose>
									<c:when test="${_deal.OPRCODE=='101' }">���</c:when>
									<c:when test="${_deal.OPRCODE=='102' }">����</c:when>
									<c:when test="${_deal.OPRCODE=='108' }">���������</c:when>
									<c:when test="${_deal.OPRCODE=='109' }">����������</c:when>
								</c:choose>
							</div>
						</div>
						<div class="lishi-5 right" style="border-left:0px solid red;text-align: center;width: 40%;">
							<fmt:formatNumber value="${_deal.AMOUNT}" pattern="##.##" minFractionDigits="2" />
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
		//��ʼ������
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
		$(".date").datepicker({//�������ѡ����  
			numberOfMonths:1,//��ʾ������  
            showButtonPanel:true,//�Ƿ���ʾ��ť���  
            dateFormat: 'yy-mm-dd',//���ڸ�ʽ  
            clearText:"���",//������ڵİ�ť����  
            closeText:"�ر�",//�ر�ѡ���İ�ť����  
            yearSuffix: '��', //��ĺ�׺  
            showMonthAfterYear:true,//�Ƿ���·�����ĺ���  
            //defaultDate:'2011-03-10',//Ĭ������  
           // minDate:'2011-03-05',//��С����  
            maxDate: _date_s,//�������  
            monthNames: ['һ��','����','����','����','����','����','����','����','����','ʮ��','ʮһ��','ʮ����'],  
            dayNames: ['������','����һ','���ڶ�','������','������','������','������'],  
            dayNamesShort: ['����','��һ','�ܶ�','����','����','����','����'],  
            dayNamesMin: ['��','һ','��','��','��','��','��'],  
            onSelect: function(selectedDate) {//ѡ�����ں�ִ�еĲ���  
               // alert(selectedDate);  
            }  
		});
		$("#query").click(function(){
			//var sdate = $("#sdate").val();
			//var edate = $("#edate").val();
			var begin=new Date($("#sdate").val().replace(/-/g,"/"));
		    var end=new Date($("#edate").val().replace(/-/g,"/"));
		    //js�ж�����
		    if(begin-end>0){
		    	alert("��ʼ����Ҫ�ڽ�ֹ����֮ǰ!");  
		        return false;
		    }
		    $("#frm").submit();
		});
	});
	var msg = '${resultMsg}';
	if(msg !=""){
		alert(msg);
	}

     $(".tishikuang0_221_1").height("350px");
 </script>
</html>