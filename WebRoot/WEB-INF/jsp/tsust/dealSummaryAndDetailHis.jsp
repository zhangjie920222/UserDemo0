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
	<div class="bt1" style="color:white;margin:0 auto;margin-bottom:20px;"><span>��ʷ�ɽ�</span>
        <a id="cc_bufen_title" href="javascript:location.href='<%=basePath%>/jsp/user/userInfo.jsp'">
       <img id="cc_bufen_title" href="javascript:location.href='<%=basePath%>/jsp/user/userInfo.jsp'" style="float:right;margin-top:15px;padding-right:20px;" src="<%=basePath %>images/back.png"/></a> 
     </div>
		<div class="tishikuang11" id="cc_bufen" style="height:500px;padding-top: 2px;background:#535353;">
		<div class="gao" style="height: 60px;">
				<form id="_form" name="frm" action="" method="post">
				<div class="query_condition">
					��ʼ����<input id="_date"  name="sdate" readonly="readonly" value="${sdate}" style="width:25%;margin-left:3%;"/></div>
				<div class="query_condition">
					��������<input id="edate" name="edate" readonly="readonly" value="${edate}" style="width:25%;margin-left:3%;"/>
					<input type="button" onclick="$.chengjiaxinxiHis()" style="background: #f16063;border:none;width:20%;height:20px;line-height:20px;color:white;margin-left:3%;" value="�� ѯ"/>
				</div>
				<input id="pageSize" name="pageSize" type="hidden" value="${pageInfo.pageSize}">
  				<input id="pageNo" name="pageNo" type="hidden" value="${pageInfo.pageNo}">
				</form>
		</div>
		<div class="liuqw_div" style="width:100%;text-align: center;height:30px;background:#333"><div class="liuqw_div" style="width:15%;float: left;padding-left:30px;">ʱ��</div><div style="width:50%;float: left;" class="liuqw_div">����&nbsp;&nbsp;&nbsp;&nbsp;</div><div style="width:16%;float: left;" class="liuqw_div">ӯ��</div></div>
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
							<c:if test="${_deal.SE_F==1}">����${_deal.CO_N}<br/>(<font color="red"><c:if test="${_deal.TY==1}">����</c:if><c:if test="${_deal.TY==2}">���</c:if></font>${_deal.QTY}��)</c:if>
							<c:if test="${_deal.SE_F==2}">ת��${_deal.CO_N}<br/>(<font color="red"><c:if test="${_deal.TY==1}">����</c:if><c:if test="${_deal.TY==2}">���</c:if></font>${_deal.QTY}��)</c:if>
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
					û�гɽ���¼��
				</c:if>
			</div>
		</div>
		<div style="width: 100%;">
			<%@include file="./mobilePagerInc.jsp" %>
		</div>
		</div>
		
		<%-- �ֲ����� start --%>
		<div id="cc_xiangqing" style="height:auto; margin-bottom:60px;display:none;">
			
			<div class="tishikuang011" style="height:630px;">
			<div class="tishikuang0_2" style="height:150px;">
				<div class="gao">
					<div class="zhi0-1 left">�ɽ���</div>
					<div class="shu right" id="TR_N">123456</div>
				</div>
				<div class="gao">
					<div class="zhi0-1 left">�ɽ�ʱ��</div>
					<div class="shu right" id="TI">2015-02-01 09:04:12</div>
				</div>
				<div class="gao">
					<div class="zhi0-1 left">�ɽ�����</div>
					<div class="shu right" id="SE_F">1</div>
				</div> 
			</div>
			<div class="tishikuang0_2" style="height:auto;">
				<div class="gao">
					<div class="zhi0-1 left">��Ʒ</div>
					<div class="shu right" id="CO_N">����</div>
				</div>
				<div class="gao">
					<div class="zhi0-1 left" id="TY_fangxiang">����</div>
					<div class="shu right direction" id="TY">����</div>
				</div>
				<div class="gao">
					<div class="zhi0-1 left">����</div>
					<div class="shu right" id="QTY">${_deal.QTY}</div>
				</div>
				<div class="gao">
					<div class="zhi0-1 left">�����۸�</div>
					<div class="shu right" id="O_PR">0Ԫ</div>
				</div>
				<div id="_zy_xuyao">
					<div class="gao">
						<div class="zhi0-1 left">�ֲּ۸�</div>
						<div class="shu right" id="H_P">0Ԫ</div>
					</div>
					<div class="gao">
						<div class="zhi0-1 left">ת�ü۸�</div>
						<div class="shu right" id="PR">0Ԫ</div>
					</div>
				</div>
			</div>
			<div class="tishikuang0_2" style="height:120px;">
					<div class="gao">
						<div class="zhi0-1 left">ӯ��</div>
						<div class="shu right" id="LIQPL">0Ԫ</div>
					</div>
					<div class="gao">
						<div class="zhi0-1 left">������</div>
						<div class="shu right" id="COMM">0Ԫ</div>
					</div>
			</div>
			<br/>
			<div style="background:#666;color:white;width:96%;border-radius:10px;height:30px;line-height:30px;margin:0 auto;text-align:center;" onclick="javascript:$.chingjiao();">������ʷ�ɽ�</div> 
		</div>
		</div>
		<%-- �ֲ����� end --%> 
	</body>
	<script type="text/javascript">
		$(function(){
			function subDate(date,days){
				date.setDate(date.getDate()-days);
				return date;
			}
			var _date_tmp = new Date();
			_date_tmp = subDate(_date_tmp,1);
			//��ʼ������
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
			$("#_date").datepicker({//�������ѡ����  
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
			$("#edate").datepicker({//�������ѡ����  
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

			//��ȡ��ʷ�ɽ���Ϣ
			$.chengjiaxinxiHis = function()
			{
				var mobile = $('#_date').val();
				if(mobile=="")
				{
					window.alert("��Ҫ��ѡ�����ڣ�");
					return ;
				}
				_form.action = "<%=path%>/tocServlet?t="+new Date()+"&reqName=tradequeryHis";
				_form.submit();				
			}


			//�����ִ�
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
				$("#TY").text($.func_hold_analysis(value,"TY")=="1"?"����":"���");
				$("#QTY").text($.func_hold_analysis(value,"QTY"));
				$("#CO_N").text($.func_hold_analysis(value,"CO_N"));
				var tmp_SE_F = $.func_hold_analysis(value,"TR_T");
				if($.func_hold_analysis(value,"SE_F")=="2")
				{
					$("#TY_fangxiang").text("ת�÷���");
					$("#PR").text(Number($.func_hold_analysis(value,"PR")).toFixed(2));
					$("#LIQPL").text(Number($.func_hold_analysis(value,"LIQPL")).toFixed(2));
					$("#H_P").text(Number($.func_hold_analysis(value,"H_P")).toFixed(2));
					$("#_zy_xuyao").show();
				}else{
					$("#TY_fangxiang").text("��������");
					$("#_zy_xuyao").hide();
				}
				$("#TY").text($.func_hold_analysis(value,"TY")=="1"?"����":"���");
				if(tmp_SE_F=="1"||tmp_SE_F=="2"||tmp_SE_F=="3")
				{
					tmp_SE_F = "�м۳ɽ�";
				}else if(tmp_SE_F=="4")
				{
					tmp_SE_F = "�Զ�ǿƽ";
				}else if(tmp_SE_F=="5")
				{
					tmp_SE_F = "�ֶ�ǿƽ";
				}else if(tmp_SE_F=="6"||tmp_SE_F=="7")
				{
					tmp_SE_F = "ָ�۳ɽ�";
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