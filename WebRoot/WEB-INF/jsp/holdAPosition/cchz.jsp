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
<title>�ֲֻ���</title>
<style type="text/css">
	body {background: #F5F5DC;border-bottom: }
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
	    top: 7%;  
	    left: 0%;  
	    width: 90%;
	    height: 70%;  
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
			<div class="center">�ֲֻ���</div>
			<div class="tuic" id="logout"><a href="#"><img src="<%=_basePath %>images/tuic.png"/></a></div>
		</div>
	</div>
	<div class="fx_neir">
		<div class="zuiwai" style="border:1px solid black;">
			<c:forEach var="_hold" items="${_cchz_list}">
			<c:set var="_hold_null" value="1"/>
			<div class="main-top">
				<input type="hidden" value="${_hold}"/>	
				<input type="hidden" value="${_hold.CO_I}"/>		
				<div class="hq">
					<div class="sp">
						<div class="tb"><img src="<%=_basePath %>images/fl.png"/></div>
						<div class="dqsp">
							<div class="name1 _change">${_hold.CO_I}</div>
							<input type="hidden" value="${_hold.TY}"/>
							<div class="name">��Ʒ</div>
						</div>
						<div class="tb"><img src="<%=_basePath %>images/sl.png"/></div>
						<div class="dqsp">
							<div class="name1">${_hold.QTY}</div>
							<div class="name">���ֲ�����</div>
						</div>
					</div>
					
				</div>
				<div class="hq">
					<div class="sp">
						<div class="tb"><img src="<%=_basePath %>images/maimai.png"/></div>
						<div class="dqsp">
							<div class="name1 "><c:if test="${_hold.TY==1}">��</c:if><c:if test="${_hold.TY==2}">��</c:if></div>
							<div class="name">��������</div>
						</div>
						<div class="tb"><img src="<%=_basePath %>images/fdyk.png"/></div>
						<div class="dqsp">
							<div class="name1 _change">${_hold.FL_P}</div>
							<div class="name">����ӯ��</div>
						</div>
					</div>
				</div>
			</div>
			</c:forEach>
			<div style="text-align: center;"><c:if test="${_hold_null==null}">δ��ѯ���������!</c:if></div>
		</div>
		
		<div class="jiangc">
			<a href="#" class="_sjpc_form">
				<div class="fx_bottom1 dl_bottom left">
					<div class="anniu">
						�м�ƽ��
					</div>
				 </div>
			</a>
			<a href="#" id="_hzxq">
				<div class="fx_bottom2 dl_bottom right">
						<div class="anniu">
							�鿴����
						</div>
				</div>
			</a>
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
			<div class="yhxx">
				<div class="xxbt">
					<div class="bt1">�ֲֻ�����ϸ</div>
					
				</div>
				<div class="shuju">
					<div class="shuju1">
						<div class="sj-bt">��Ʒ����</div>
						<div class="sj-xx tanceng_hz">��Բ��10ǧ��</div>
					</div>
					<div class="shuju2">
						<div class="sj-bt">��/��</div>
						<div class="sj-xx tanceng_hz">��</div>
					</div>
				</div>
				<div class="shuju">
					<div class="shuju1">
						<div class="sj-bt">����</div>
						<div class="sj-xx tanceng_hz">2</div>
					</div>
					<div class="shuju2">
						<div class="sj-bt">���־���</div>
						<div class="sj-xx tanceng_hz">3654</div>
					</div>
				</div>
				<div class="shuju">
					<div class="shuju1">
						<div class="sj-bt">�ֲ־���</div>
						<div class="sj-xx tanceng_hz">3654</div>
					</div>
					<div class="shuju2">
						<div class="sj-bt">ƽ�ּ�</div>
						<div class="sj-xx pc_price tanceng_hz">3654</div>
					</div>
				</div>
				<div class="shuju">
					<div class="shuju1">
						<div class="sj-bt">����ӯ��</div>
						<div class="sj-xx hz_fl_xq tanceng_hz">240</div>
					</div>
					<div class="shuju2">
						<div class="sj-bt">ռ�ñ�֤��</div>
						<div class="sj-xx tanceng_hz">3617</div>
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
			<a href="#" class="_close_hzxq">
				<div class="fx_bottom2 dl_bottom right">
						<div class="anniu">
							����
						</div>
				</div>
			</a>
		</div>
	</div>
	<%--�ֲ����鲿�� end --%>
	<script type="text/javascript">

		var _common_obj_fl = new Object();
		//�����ִ�
		var _func_analysisStr = function(_string_obj,_first_regex,_second_regex)
		{
			return _string_obj.replace("]",",").replace("["," ").split(_first_regex)[1].split(_second_regex)[0];
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
		
		//��������
		
		var _func_seat = function(attrName)//�жϵ��Ŵ��ڣ�����
		{
			if($('#'+attrName).val()=="")
			{
				window.alert("��ѡ�񵥺ţ�");
				return false;
			}
			return true;
		}

		var _bl_tmp = false;
		//ƽ�ּ� �ֲ�����
		var _func_ev = function(_ty,_co_i)
		{
			if(_bl_tmp)
			{
				//window.alert(_ty);
				//window.alert(_co_i);
				var _obj = $('#hidd_hold_mess').val();
				var _ev_price ;
				if(_ty==1)
				{
					_ev_price = eval("(quotation_tmp[0]."+_co_i+".s)");
				}else
				{
					_ev_price = eval("(quotation_tmp[0]."+_co_i+".b)");
				}
				$('.hz_fl_xq').text(eval("_common_obj_fl."+_co_i+_ty));
				$('.pc_price').text(_ev_price);
				window.setTimeout("_func_ev('"+_ty+"','"+_co_i+"')","2000");
			}
		}

		var _tmp_str ;//����ӯ��
		//���������ֲ�����
		var continueQueryHold = function()
		{
			$.ajax({
				type:"post",
				url:"<%=basePath%>/tocServlet",
				data:"reqName=holdAjax",
				success:function(result){
					
					//window.alert(result);
					//_map ����ֵ����  _map[0]._���ţ�CO_I��.attr(Model���Ӧ����)
					//_map[0]._Ag10kg.FL_P; ���ַ�ʽȡֵ
					var _map = JSON.parse(result);
					//window.alert(_map[0]._Ag10kg.FL_P);
					var _tmp_co_i ;
					var _tmp_ty ;
					$('._change').each(function(i){
						if(i%2==0)
						{
							//window.alert($(this).next().val());
							_tmp_ty = $(this).next().val();
							_tmp_co_i = $(this).text();
						}else
						{
							_tmp_str = "(_map[0]._"+_tmp_co_i+_tmp_ty+".FL_P)";
							//_common_obj_fl = {attr_co_i:"",attr_value:""};
							eval("_common_obj_fl."+_tmp_co_i+_tmp_ty+"="+"\""+eval(_tmp_str)+"\"")
							$(this).text(eval(_tmp_str));
						}
					});
				}
			});
			window.setTimeout("continueQueryHold()",3000);
		}

		$(function(){
			//�ֲֻ���ˢ��
			continueQueryHold();

			//����ˢ��
			continueQueryQuato();

			//ѡ�гֲּ��
			continueCheck();

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
			});

			$('._sjpc_form').each(function(){
				$(this).click(function(){
					if(_func_seat('hidd_hold_mess'))
					{
						_form.action = "<%=basePath%>/tocServlet?reqName=holdtz";
						_form.submit();
					}
				});
			});

			$('._hzxq').click(function(){
				if(_func_seat('hidd_hold_mess'))
				{
					$('#fx_neir').show();
					$('#bg').show();
				}
			});

			$('._close_hzxq').click(function(){
				_bl_tmp = false;
				$('#fx_neir').hide();
				$('#bg').hide();
			});

			$("#_hzxq").click(function(){
				 //window.alert($('#hidd_hold_mess').val());
				 // window.alert(func_hold_analysis("H_ID"));
				 _bl_tmp = true;
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
					var _arr_hold_attr = new Array(" CO_I"," TY"," QTY"," O_A"," A_H"
							," P"," FL_P"," MAR");
					for( var v in _arr_hold_attr )
					{
						//window.alert(_arr_hold_attr[v]+"--"+func_hold_analysis(_arr_hold_attr[v]));
						var _attr = _arr_hold_attr[v];
						var _tmp = func_hold_analysis(_attr);
						if(_arr_hold_attr[v]==" TY")
						{
							if(_tmp==1)
							{
								_arr_hold[v] = "��";
							}else
							{
								_arr_hold[v] = "��";
							}
						}else if(_arr_hold_attr[v]==" P")
						{
							_arr_hold[v] = _tmp;
							_func_ev(func_hold_analysis(" TY"),func_hold_analysis(" CO_I"));
						}else
						{
							_arr_hold[v] = _tmp;
						}
					}
					$('.tanceng_hz').each(function(i){
						$(this).text(_arr_hold[i])
					});
					$('#fx_neir').show();
					$('#bg').show();
				 }
			});
		});
	</script>
</body>
</html>
