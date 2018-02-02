<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ include file="../../public/taglib.jsp" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path;
	String _basePath = basePath + "/app/toc/";
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<meta name="viewport" content="width=device-width,target-densitydpi=medium-dpi,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
<link rel=stylesheet type="text/css" href="<%=_basePath %>css/1.css" title="cool">
<script type="text/javascript" src="<%=_basePath %>js/jquery-1.6.min.js"></script>
<title>�ֲ���ϸ</title>
<style type="text/css">
	#bg
	{ 	display: none;  
		position: absolute;  
		top: 0%;  
		left: 0%;  
		width: 100%;  
		height: 100%;  
		background-color: gray;  
		z-index:1001;  
		-moz-opacity: 0.7;  
		opacity:.70;  
		filter: alpha(opacity=70);
		}  
    #fx_neir
    {
	    display: none;  
	    position: absolute;  
	    top: 0%;  
	    left: 0%;  
	    width: 90%;  
	    padding: 8px;  
	    border: 8px solid #E8E9F7;  
	    background-color: white;  
	    z-index:1002;  
	    overflow: auto;
    }  
</style>
</head>

<body>
	<div class="fx_top">
		<div class="fx_bt">
			<div class="center">�ֲ���ϸ</div>
			<div class="tuic" id="logout"><a href="#"><img src="<%=_basePath %>images/tuic.png"/></a></div>
		</div>
		
	</div>
	<div class="fx_neir">
		<div class="zuiwai" style="border:1px solid black;">
			<c:forEach var="_hold" items="${_ccmx_list}" >
				<c:set var="_hold_null" value="1"/>
				<div class="main-top">		
				<input type="hidden" value="${_hold}"/>	
				<input class="_h_id_input" type="hidden" value="${_hold.h_ID}"/>
				<div class="hq">
					<div class="sp">
						<div class="tb"><img src="<%=_basePath %>images/fl.png"/></div>
						<div class="dqsp">
							<div class="name1">${_hold.CO_I}</div>
							<div class="name">��Ʒ</div>
						</div>
						<div class="tb"><img src="<%=_basePath %>images/dh.png"/></div>
						<div class="dqsp">
							<div class="name1 _change">${_hold.h_ID}</div>
							<div class="name">����</div>
						</div>
					</div>
					
				</div>
				<div class="hq">
					<div class="sp">
						<div class="tb"><img src="<%=_basePath %>images/maimai.png"/></div>
						<div class="dqsp">
							<div class="name1"><c:if test="${_hold.TY==1}">��</c:if><c:if test="${_hold.TY==2}">��</c:if></div>
							<div class="name">��������</div>
						</div>
						<div class="tb"><img src="<%=_basePath %>images/fdyk.png"/></div>
						<div class="dqsp">
							<div class="name1 _change">${_hold.FL_P}</div>
							<div class="name">����ӯ��</div>
						</div>
					</div>
					
				</div>
				<div class="hq">
					<div class="sp">
						<div class="tb"><img src="<%=_basePath %>images/chic.png"/></div>
						<div class="dqsp">
							<div class="name1">${_hold.c_QTY}</div>
							<div class="name">�ֲ�����</div>
						</div>
						
						<div class="dqsp">
							<div class="name"><img src="<%=_basePath %>images/zy.png"/>ֹӯ��<span><c:if test="${_hold.STOP_PROFIT==0}">--</c:if><c:if test="${_hold.STOP_PROFIT!=0}">${_HOLD.STOP_PROFIT}</c:if></span></div>
							<div class="name"><img src="<%=_basePath %>images/zs.png"/>ֹ��<span><c:if test="${_hold.STOP_LOSS==0}">--</c:if><c:if test="${_hold.STOP_LOSS!=0}">${_HOLD.STOP_LOSS}</c:if></span></div>
						</div>
					</div>
					
				</div>
			</div>
			</c:forEach>
			<div style="text-align: center;"><c:if test="${_hold_null==null}">δ��ѯ���������!</c:if></div>
		</div>
		<div>
			<a href="#" id="_ccxq"><%--ccxq.html --%>
				<div class="fx_bottom1-1 dl_bottom left">
					<div class="anniu">
						�ֲ�����
					</div>
				 </div>
			</a>
		</div>
		<div>
			<a href="#" class="_sjpc_form">
				<div class="fx_bottom1 dl_bottom left">
					<div class="anniu">
						�м�ƽ��
					</div>
				 </div>
			</a>
			<a href="#" class="_zjpc_form">
				<div class="fx_bottom2 dl_bottom right">
						<div class="anniu">
							ָ��ƽ��
						</div>
				</div>
			</a>
		</div>
		
		<div class="clear">
			<div class="fx_bottom1 dl_bottom left" id="_zhiying_button">
					<div class="anniu">
						����ֹӯ
					</div>
				 </div>
				<div class="fx_bottom2 dl_bottom right" id="_zhisun_button">
						<div class="anniu">
							����ֹ��
						</div>
				</div>
		</div>
		<div style="clear:both;"></div>
		<jsp:include page="../user/userInfo.jsp"/>
	</div>
	<jsp:include page="../menu/menu.jsp"/>
	<form action="" method="post" id="_form">
	<input type="hidden" id="hidd_hold_mess" name="hidd_hold_mess" value=""/>
	</form>
	<%--�ֲ����鲿�� start --%>
	<div id="bg"></div>
	<div class="fx_neir" id="fx_neir">
			<div class="yhxx1">
				<div class="xxbt">
					<div class="bt1">�ֲ���ϸ</div>
					
				</div>
				<div class="shuju">
					<div class="shuju1">
						<div class="sj-bt">�ֲֵ���</div>
						<div class="sj-xx tanceng_mx">56789</div>
					</div>
					<div class="shuju2">
						<div class="sj-bt">��Ʒ����</div>
						<div class="sj-xx tanceng_mx">��Բ��10ǧ��</div>
					</div>
				</div>
				<div class="shuju">
					<div class="shuju1">
						<div class="sj-bt">��/��</div>
						<div class="sj-xx tanceng_mx">��</div>
					</div>
					<div class="shuju2">
						<div class="sj-bt">����</div>
						<div class="sj-xx tanceng_mx">1</div>
					</div>
				</div>
				<div class="shuju">
					<div class="shuju1">
						<div class="sj-bt">�ֲ�����</div>
						<div class="sj-xx tanceng_mx">1</div>
					</div>
					<div class="shuju2">
						<div class="sj-bt">ֹ���</div>
						<div class="sj-xx tanceng_mx">--</div>
					</div>
				</div>
				<div class="shuju">
					<div class="shuju1">
						<div class="sj-bt">ֹӯ��</div>
						<div class="sj-xx tanceng_mx">--</div>
					</div>
					<div class="shuju2">
						<div class="sj-bt">�ֲּ�</div>
						<div class="sj-xx tanceng_mx">3617</div>
					</div>
				</div>
				<div class="shuju">
					<div class="shuju1">
						<div class="sj-bt">ƽ�ּ�</div>
						<div class="sj-xx pc_price tanceng_mx">0</div>
					</div>
					<div class="shuju2">
						<div class="sj-bt">���ո���ӯ��</div>
						<div class="sj-xx _xp_pl_div tanceng_mx">0</div>
					</div>
				</div>
				<div class="shuju">
					<div class="shuju1">
						<div class="sj-bt">ռ�ñ�֤��</div>
						<div class="sj-xx tanceng_mx">1008.1</div>
					</div>
					<div class="shuju2">
						<div class="sj-bt">����ʱ��</div>
						<div class="sj-xx tanceng_mx">2015-01-23 11:39:01</div>
					</div>
				</div>
				<div class="shuju">
					<div class="shuju1" style="border:0px;">
						<div class="sj-bt">�绰����Ա</div>
						<div class="sj-xx tanceng_mx"></div>
					</div>
				</div>
			</div>
			<div>
			<a href="#" class="_sjpc_form">
				<div class="fx_bottom1 dl_bottom left">
					<div class="anniu">
						�м�ƽ��
					</div>
				 </div> 
			</a>
			<a href="#" class="_zjpc_form">
				<div class="fx_bottom2 dl_bottom right">
						<div class="anniu">
							ָ��ƽ��
						</div>
				</div>
			</a>
		</div>
		
		<div class="clear">
			<div class="fx_bottom1 dl_bottom left">
					<div class="anniu">
						����ֹӯ
					</div>
				 </div>
				<div class="fx_bottom2 dl_bottom right">
						<div class="anniu">
							����ֹ��
							
						</div>
				</div>
		</div>
		<div>
			<a href="#" id="_close_ccxq">
				<div class="fx_bottom1-1 dl_bottom left">
					<div class="anniu">
						����
					</div>
				 </div>
			</a>
		</div>
	</div>
	<%--�ֲ����鲿�� end --%>
	<script type="text/javascript">
		function clickabc() {
			var xlk1 = document.getElementById('xlk1');
			xlk1.style.display="block";
		}
		function clickabc1() {
			var xlk2 = document.getElementById('xlk2');
			xlk2.style.display="block";
		}

		//�������� start
		function getSelectedCmdInfoFromSession(cmdId,_attr){
	  	  	if(cmdId != "" && cmdId != undefined){
				var cmdInfos = '${commodity_info}';
				var cmdInfosMap = eval(cmdInfos);
				var _tmp_val ;
				$(cmdInfosMap).each(function(index){
					var temp = cmdInfosMap[index];
					var cmd = temp[cmdId];
					if(cmd != undefined)
					{
						//window.alert(cmd["CT_S"]+"---"+cmd[_attr]);
						_tmp_val = cmd[_attr]
					}
				});
				return _tmp_val;
	  	  	}
  	  	}

		var quotation_tmp ;
		//����Ajax
		var continueQueryQuato = function()
		{
			$.ajax({
				type:"post",
				url:"<%=basePath%>/tocServlet",
				data:"reqName=quatotionAjax",
				success:function(result){
					quotation_tmp = JSON.parse(result);
				}
			});
			window.setTimeout("continueQueryQuato()",2000);
		}

		//�����ִ�
		var _func_analysisStr = function(_string_obj,_first_regex,_second_regex)
		{
			return _string_obj.split(_first_regex)[1].split(_second_regex)[0];
		}

		Date.prototype.format =function(format)
	    {
		    //window.alert(this.getHours());
	        var o = {
	        "M+" : this.getMonth()+1, //month
			"d+" : this.getDate(),    //day
			"h+" : (this.getHours()-2)<0?((this.getHours()-2)+24):(this.getHours()-2),   //hour
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

		//�������� end
		
		var _func_seat = function(attrName)//�жϵ��Ŵ��ڣ�����
		{
			if($('#'+attrName).val()=="")
			{
				window.alert("��ѡ�񵥺ţ�");
				return false;
			}
			return true;
		}

		var continueCheck = function()
		{
			var _tmp = $('#hidd_hold_mess').val();
			if(_tmp=="")
			{
				return ;
			}
			$('._h_id_input').each(function(){
				//window.alert($(this).val());
				if($(this).val()==_tmp.split("H_ID=")[1].split(",")[0])
				{
					$(this).parent().css("background","red");
				}
			});
			window.setTimeout("continueCheck()",500);
		}

		//���������ֲ�����
		var continueQueryDetail = function()
		{
			$.ajax({
				type:"post",
				url:"<%=basePath%>/tocServlet",
				data:"reqName=holdapositionAjax",
				success:function(result){
					
					//window.alert(result);
					//_map ����ֵ����  _map[0]._���ţ�h_ID��.attr(Model���Ӧ����)
					//_map[0]._48.TY; ���ַ�ʽȡֵ
					var _map = JSON.parse(result);
					var _tmp ;
					var _tmp_obj ;
					var _tmp_ty ;
					var _tmp_co_i ;
					var _tmp_c_qty ;
					//window.alert(_tmp_obj);
					$('._change').each(function(i){
						//window.alert($(this).text());
						if(i%2==0)
						{
							var _tt = $(this).text();
							_tmp = "(_map[0]._"+_tt+".h_P)";
							//window.alert(_tmp);
							_tmp_obj = eval(_tmp);//�ֲּ�
							_tmp_ty = eval("(_map[0]._"+_tt+".TY)");
							_tmp_co_i = eval("(_map[0]._"+_tt+".CO_I)");
							_tmp_c_qty = eval("(_map[0]._"+_tt+".c_QTY)");
						}else
						{
							var _tmp_b ;
							var _tmp_count ;
							var _tmp_price ;//����ӯ��
							if(_tmp_ty==1)
							{
								_tmp_b = eval("(quotation_tmp[0]."+_tmp_co_i.toString()+".s)");//ƽ�ּ�
								_tmp_count = _tmp_c_qty.toString();//�ֲ�����
								_tmp_price = (parseInt(_tmp_b.toString())-parseInt(_tmp_obj.toString()))
								*parseInt(_tmp_count)*
								parseInt(getSelectedCmdInfoFromSession(_tmp_co_i.toString(),"CT_S").toString());//��Լ����
								//���ո���ӯ�� =  (ƽ�ּ�-�ֲּ�)*�ֲ�����*��Լ���ӣ�
							}else
							{
								_tmp_b = eval("(quotation_tmp[0]."+_tmp_co_i.toString()+".b)");//ƽ�ּ�
								_tmp_count = _tmp_c_qty.toString();//�ֲ�����
								_tmp_price = (parseInt(_tmp_b.toString())-parseInt(_tmp_obj.toString()))
								*parseInt(_tmp_count)*
								parseInt(getSelectedCmdInfoFromSession(_tmp_co_i.toString(),"CT_S").toString());//��Լ����
								//���ո���ӯ�� =  (�ֲּ�-ƽ�ּ�)*�ֲ�����*��Լ���ӣ�
							}
							$(this).text(_tmp_price);
						}
					});
				}
			});
			window.setTimeout("continueQueryDetail()",3000);
		}

		//ƽ�ּ� �ֲ�����
		var _func_ev = function(_ty,_co_i)
		{
			//window.alert(_co_i);
			var _obj = $('#hidd_hold_mess').val();
			var _ev_price ;
			if(_ty==1)
			{
				_ev_price = eval("(quotation_tmp[0]."+_co_i+".s)");
				//���ո���ӯ�� =  (ƽ�ּ�-�ֲּ�)*�ֲ�����*��Լ���ӣ�
				$('._xp_pl_div').text(
				(parseInt(_ev_price)-parseInt(_func_analysisStr(_obj," H_P=",",").toString()))*
				parseInt(_func_analysisStr(_obj," C_QTY=",",").toString())*
				parseInt(getSelectedCmdInfoFromSession(_func_analysisStr(_obj," CO_I=",","),"CT_S").toString())
				);
			}else
			{
				_ev_price = eval("(quotation_tmp[0]."+_co_i+".b)");
				//���ո���ӯ�� =  (�ֲּ�-ƽ�ּ�)*�ֲ�����*��Լ���ӣ�
				$('._xp_pl_div').text(
				(parseInt(_func_analysisStr(_obj," H_P=",",").toString())-parseInt(_ev_price))*
				parseInt(_func_analysisStr(_obj," C_QTY=",",").toString())*
				parseInt(getSelectedCmdInfoFromSession(_func_analysisStr(_obj," CO_I=",","),"CT_S").toString())
				);
			}
			//window.alert(_ev_price);
			$('.pc_price').text(_ev_price);
			window.setTimeout("_func_ev('"+_ty+"','"+_co_i+"')","2000");
		}
		
		$(function(){
			//��������
			continueQueryQuato();
			//ѡ�гֲּ��
			continueCheck();
			//�ֲ��������ݸ���
			continueQueryDetail();

			$("#logout").click(function(){//�˳�
				if(confirm("ȷ��Ҫ�ǳ���")){
					location.href = "<%=basePath%>/tocServlet";
				};
			});
			
			$('.main-top').toggle(
				function(){
					$('.main-top').each(function(){
						$(this).css("background","");
					});
					$(this).css("background","red");
					$('#hidd_hold_mess').attr("value",$(this).find("input").first().val());
				},function(){
					$('.main-top').each(function(){
						$(this).css("background","");
					});		
					$('#hidd_hold_mess').attr("value","");
				}	
			);

			$("#_ccxq").click(function(){
				 //window.alert($('#hidd_hold_mess').val());
				 // window.alert(func_hold_analysis("H_ID"));
				 if(_func_seat('hidd_hold_mess'))
				 {
				    var _hold_string = $('#hidd_hold_mess').val();
			        var func_hold_analysis = function(attrName)
			        {
				      if(attrName==""||attrName==" P")
				  	      return "--";
				      return _func_analysisStr(_hold_string,attrName+"=",",");
			        }
					var _arr_hold = new Array();
					var _arr_hold_attr = new Array(" H_ID"," CO_I"," TY"," O_QTY"," C_QTY"," STOP_LOSS"
							," STOP_PROFIT"," H_P"," P",""," MAR"," OR_T","");
					for( var v in _arr_hold_attr )
					{
						//window.alert(_arr_hold_attr[v]+"--"+func_hold_analysis(_arr_hold_attr[v]));
						var _attr = _arr_hold_attr[v];
						var _tmp = func_hold_analysis(_attr);
						if(_arr_hold_attr[v]==" STOP_LOSS")
						{
							if(_tmp==0)
							{
								_arr_hold[v] = "--";
							}
						}else if(_arr_hold_attr[v]==" STOP_PROFIT")
						{
							if(_tmp==0)
							{
								_arr_hold[v] = "--";
							}
						}else if(_arr_hold_attr[v]==" TY")
						{
							if(_tmp==1)
							{
								_arr_hold[v] = "��";
							}else
							{
								_arr_hold[v] = "��";
							}
						}else if(_arr_hold_attr[v]==" OR_T")
						{
							//window.alert(_tmp);
							_arr_hold[v] = new Date(_tmp).format('yyyy-MM-dd hh:mm:ss');
						}else if(_arr_hold_attr[v]==" P")
						{
							//eval("(quotation_tmp[0]."+_tmp_co_i.toString()+".s)")
							_arr_hold[v] = _tmp;
							_func_ev(func_hold_analysis(" TY"),func_hold_analysis(" CO_I"));
						}else
						{
							_arr_hold[v] = _tmp;
						}
					}
					$('.tanceng_mx').each(function(i){
						$(this).text(_arr_hold[i])
					});
					$('#fx_neir').show();
					$('#bg').show();
				 }
			});

			$('#_close_ccxq').click(function(){
				$('#fx_neir').hide();
				$('#bg').hide();
			});

			$('._sjpc_form').each(function(){
				$(this).click(function(){
					if(_func_seat('hidd_hold_mess'))
					{
						_form.action = "<%=basePath%>/tocServlet?reqName=_pc_tz_1";
						_form.submit();
					}
				});
			});

			$('._zjpc_form').each(function()
			{
				$(this).click(function(){
					if(_func_seat('hidd_hold_mess'))
					{
						_form.action = "<%=basePath%>/tocServlet?reqName=_pc_tz_2";
						_form.submit();
					}
				});
			});

			$('#_zhiying_button').bind("click",function(){
				if(_func_seat('hidd_hold_mess'))
				{
					$.ajax({
						type:"post",
						url:"<%=basePath%>/tocServlet",
						data:"hidd_hold_mess="+$('#hidd_hold_mess').val()+"&reqName=_ys_type_2",
						success:function(result){
							window.alert(result);
						}
					});
				}
			});

			$('#_zhisun_button').bind("click",function(){
				if(_func_seat('hidd_hold_mess'))
				{
					$.ajax({
						type:"post",
						url:"<%=basePath%>/tocServlet",
						data:"hidd_hold_mess="+$('#hidd_hold_mess').val()+"&reqName=_ys_type_1",
						success:function(result){
							window.alert(result);
						}
					});
				}
			});
			
		});

	</script>
</body>
</html>
