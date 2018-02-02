<%@ page contentType="text/html;charset=GBK" %>
<div>
<table align="center" width="100%" height="10%" border="0" cellpadding="0" cellspacing="0" id="PageCtrl_Table" style="font-size:9pt;">
	<tr>
		<td id="PageCtrl_pageInfo" align="left" >&nbsp;�� <c:out value="${pageInfo.pageNo}"/>/<c:out value="${pageInfo.totalPages}"/> ҳ</td>
		<td id="PageCtrl_recordInfo" align="center" >&nbsp;�� <c:out value="${pageInfo.totalRecords}"/> ��&nbsp;
		ÿҳ<input onblur="gotoPageDrc()" type="text" style="text-align:center; border-left-style:none; border-right-style:none; border-top-style:none; border-bottom: solid 1px #333333; font-family:Verdana; font-size: 9pt; background-color:transparent;" size="3" id="PageCtrl_pageSize" value="<c:out value="${pageInfo.pageSize}"/>">��</td>
		<td id="PageCtrl_pageJump" align="center">
			ǰ����<input  onblur="gotoPageDrc()" type="text" style="text-align:center; border-left-style:none; border-right-style:none; border-top-style:none; border-bottom: solid 1px #333333; font-family:Verdana; font-size: 9pt; background-color:transparent;" size="2" id="PageCtrl_pageGoto">ҳ
		</td>
	</tr>
	<tr>
		<td colspan="2" id="PageCtrl_pageChange"align="right" style="color:black; font-family:Webdings; font-size-12px;">
			<span title="��ҳ" id="PageCtrl_pageFirst" style="cursor:hand" onclick="gotoPage(1)">��ҳ</span>
			<span title="ǰһҳ" id="PageCtrl_pagePrev" style="cursor:hand" onclick="gotoPrevPage()">ǰһҳ</span>
			<span title="��һҳ" id="PageCtrl_pageNext" style="cursor:hand" onclick="gotoNextPage()">��һҳ</span>
			<span title="ĩҳ" id="PageCtrl_pageLast" style="cursor:hand" onclick="gotoPage(<c:out value="${pageInfo.totalPages}"/>)">βҳ</span>
		</td>
	</tr>
</table>
</div>
<script>
	var vPageNo = <c:out value="${pageInfo.pageNo}" default="0"/>;
	var vPageSize = <c:out value="${pageInfo.pageSize}" default="0"/>;
	var vTotalPages = <c:out value="${pageInfo.totalPages}" default="0"/>;
	var vTotalRecords = <c:out value="${pageInfo.totalRecords}" default="0"/>;
	function gotoPrevPage(){
		if(vPageNo>1){
			return gotoPage(vPageNo - 1);
		}else {
			alert("�ѵ���һҳ��");
			return;
		}
			
	}	
	function gotoNextPage(){
		if(vPageNo < vTotalPages) {
			return gotoPage(vPageNo + 1);
		}else {
			alert("�ѵ����һҳ��");
			return;
		}
			
	}

	function gotoPageDrc(){
		var tagEvent = event.srcElement;
		if(tagEvent.id == "PageCtrl_pageGoto"){
			var pn = tagEvent.value;
			if(isNaN(pn) || pn < 1 || pn > vTotalPages){
				alert("������ 1 -- " + vTotalPages + " ֮������֣�");
				return;
			}else{
				gotoPage(pn);
			}
				
			
				
		} else if(tagEvent.id == "PageCtrl_pageSize") {
			var ps = tagEvent.value;
			if(isNaN(ps) || ps < 1 || pn > vTotalRecords){
				alert("������ 1 -- " + vTotalRecords + " ֮������֣�");
				return;
			}else {
				changePageSize(ps);
			}
				
		}
	}
	
	function gotoPage(toPage){
		if(toPage == vPageNo){
			alert("��ҳ�ɷ���");
			return;
		}
		if(frm){
			if(frm.pageNo){
				frm.pageNo.value = toPage;
				frm.submit();
			} else{
				alert("û�ҵ�pageNo�ı�������ϵ������Ա��");
				return;
			}
				
		}else{
			alert("û�ҵ�frm������ϵ������Ա��");
			return;
		}
			
	}
	
	function changePageSize(pageSize){
		if(frm){
			if(frm.pageSize){
				frm.pageSize.value = pageSize;
				frm.pageNo.value = 1;
				frm.submit();
			} else{
				alert("û�ҵ�pageSize�ı�������ϵ������Ա��");
				return;
		   }
				
		}else{
			alert("û�ҵ�frm������ϵ������Ա��");
			return;
		}
			
	}
	PageCtrl_Table.tBodies[0].onkeydown = pageCtrlKeyDown;
	
	function pageCtrlKeyDown ()
	{
		if ( event.keyCode == 13 )		// �س���
		{
			var tagEvent = event.srcElement;
			
			if(tagEvent.id == "PageCtrl_pageGoto"){
				var pn = tagEvent.value;
				if(isNaN(pn) || pn < 1 || pn > vTotalPages){
					alert("������ 1 -- " + vTotalPages + " ֮������֣�");
					return;
				}else{
					gotoPage(pn);
				}
					
			} else if(tagEvent.id == "PageCtrl_pageSize") {
				var ps = tagEvent.value;
				if(isNaN(ps) || ps < 1 || pn > vTotalRecords){
					alert("������ 1 -- " + vTotalRecords + " ֮������֣�");
					return;
				}else {
					changePageSize(ps);
					}
					
			}
		}
	}
</script>