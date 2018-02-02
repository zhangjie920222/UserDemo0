<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../public/taglib.jsp"%>
<%@ include file="../../public/path.jsp"%>
<!DOCTYPE>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
		<meta name="viewport"
			content="width=device-width,target-densitydpi=medium-dpi,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
		<link rel=stylesheet type="text/css" href="<%=basePath%>css/1.css" title="cool">
		<title>${pageTitle}</title>
		<style type="text/css">
			#scroller {
					height:100%;
					padding-top:15px;
					width:90%;
					margin:auto;
					background-image:url(<%=basePath%>img/ban.png);
					background-size:100% 100%;
					overflow: hidden;
				}
			.content { border-bottom:1px dashed #334455; padding: 6px 0;}
		 	#content{
		 		overflow: hidden; text-align: center; 
		 	}
			#content label{
				text-align: center;
			}
			#content span{
				text-align: right;
			}
			
			.tishikuang11111{
				height:80%;
				padding-top:20px;
				width:90%;
				margin-left:5%;
				margin-top:20px;
				background-image:url(<%=basePath%>img/xinxin.png);
				background-size:100% 100%;
				text-align: center;
			}
			.leftTd{
				text-align: right;
			}
			.rightTd{
				text-align: left;
			}
		</style>
	</head>
	<body>
		<a href="gerenzhanghu.html"><div class="fanhui">
				订单详情
			</div>
		</a>
		<div class="tishikuang11111">
		<div id="content">
			<table style="width: 100%; padding: 0px 20px; font-size: 14px;">
				<tr>
					<td class="leftTd">订单号：</td>
					<td class="rightTd">3444368</td>
				</tr>
				<tr>
					<td class="leftTd">建仓时间：</td>
					<td class="rightTd">2015-02-09 09:12:48</td>
				</tr>
				<tr>
					<td class="leftTd">平仓时间：</td>
					<td class="rightTd">2015-02-09 09:12:48</td>
				</tr>
				<tr>
					<td class="content" colspan="2"></td>
				</tr>
				<tr>
					<td class="leftTd" style="padding-top: 10px;">产品：</td>
					<td class="rightTd">100g银币</td>
				</tr>
				<tr>
					<td class="leftTd">方向：</td>
					<td class="rightTd" style="color: red;">空</td>
				</tr>
				<tr>
					<td class="leftTd">入仓价：</td>
					<td class="rightTd">3306</td>
				</tr>
				<tr>
					<td class="leftTd">平仓价：</td>
					<td class="rightTd">3362</td>
				</tr>
				<tr>
					<td colspan="2" class="content"></td>
				</tr>
				<tr>
					<td class="leftTd" style="padding-top: 10px;">入仓支付金额：</td>
					<td class="rightTd">0</td>
				</tr>
				<tr>
					<td class="leftTd">入仓手续费：</td>
					<td class="rightTd">0.000</td>
				</tr>
				<tr>
					<td class="leftTd">盈亏资金：</td>
					<td class="rightTd" style="font-weight: bolder; font-size: 15px;">0.00元(0.0%)</td>
				</tr>
				<tr>
					<td colspan="2" class="content"></td>
				</tr>
				<tr>
					<td class="leftTd" style="padding-top: 10px;">平仓收入金额：</td>
					<td class="rightTd">0.00元</td>
				</tr>
				<tr>
					<td class="leftTd">本单实际盈亏：</td>
					<td class="rightTd">0.00</td>
				</tr>
				<tr>
					<td colspan="2" ><span style="margin-left: 40%;">(已使用<span></span>张8元赢家券)</span></td>
				</tr>
			</table>
		</div>
	</div>
	</body>
</html>