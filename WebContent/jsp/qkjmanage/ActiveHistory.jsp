<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@taglib prefix="it" uri="http://qkjchina.com/iweb/iwebTags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>活动申请单列表--<s:text name="APP_NAME" /></title>
<s:action name="ref" namespace="/manager" executeResult="true" />
</head>
<style type="text/css">
.ship_info {
cursor: pointer;
}
</style>
<body>
<div class="main" >
 	<div class="dq_step">
		${path}
			<span class="opb lb op-area"><a onclick="location.href='javascript:history.go(-1);'">返回上一页面</a></span>
	</div>
	<s:hidden name="active.uuid" value="%{active.uuid}"></s:hidden>
 	<div class="tab_warp">
 		<table>
 		<tr id="coltr">
	    <th class="td1">编号</th>
		<th class="td1">活动编号</th>
		<th class="td2">操作人</th>
		<th class="td2">操作时间</th>
		<th class="td3">操作内容</th>
		<th class="td0">查看</th>
	  	</tr>
	  	<s:iterator value="myPros" status="sta">
	  	<tr id="showtr${uuid}">
		    <td class="td1 nw">${uuid}</td>
			<td class="td1 nw">${biz_id}</td>
			<td class="td2 nw">${uname}</td>
			<td class="td2 nw">${it:formatDate(biz_time,'yyyy-MM-dd')}</td>
			<td class="td3 nw">${biz_note}</td>
			
		    <td class="td0 op-area"><a onclick="showDetail('showtr${uuid}');" href="javascript:;" class="input-nostyle">查看</a></td>
	  	</tr>
	  	</s:iterator>
 		</table>
 	</div>
 	
</div>
 
</body>
</html>