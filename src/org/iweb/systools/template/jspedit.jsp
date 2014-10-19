<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@taglib prefix="it" uri="http://qkjchina.com/iweb/iwebTags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>$app_name$管理--<s:text name="APP_NAME" /></title>
<s:action name="ref" namespace="/manager" executeResult="true" />
</head>
<body>
<div class="main">
	<div class="dq_step">${path}
	<span class="opb lb op-area"><a href="<s:url action="$class_alias$_list" namespace="/$name_space$"><s:param name="viewFlag">relist</s:param></s:url>" >返回列表</a></span></div>
	<s:form id="editForm" name="editForm" cssClass="validForm" action="apply_load" namespace="/qkjmanage" method="post" theme="simple">
	<div class="label_con">
	<div class="label_main">
	<s:if test="'mdy' == viewFlag">
	  $jspedit_noedit_area$
	</s:if>
	$jspedit_edit_area$
	</div>
	<div class="label_main">
        <div class="label_hang">
            <div class="label_ltit">相关操作:</div>
            <div class="label_rwbenx">
            $jspedit_hidden_area$
            <s:if test="'add' == viewFlag">
				<s:if test="@org.iweb.sys.ContextHelper@checkPermit('$action_privilege_flag$_ADD')">
				<s:submit id="add" name="add" value="确定" action="$class_alias$_add" />
				</s:if>
			</s:if>
			<s:elseif test="'mdy' == viewFlag">
				<s:if test="@org.iweb.sys.ContextHelper@checkPermit('$action_privilege_flag$_MDY')">
				<s:submit id="save" name="save" value="保存" action="$class_alias$_save" cssClass="input-blue" />
				</s:if>
				<s:if test="@org.iweb.sys.ContextHelper@checkPermit('$action_privilege_flag$_DEL')">
				<s:submit id="delete" name="delete" value="删除" action="$class_alias$_del" onclick="return isDel();"  cssClass="input-red" />
				</s:if>
			</s:elseif>
			<input type="button" value="返回" onclick="linkurl('<s:url action="$class_alias$_relist" namespace="/$name_space$"><s:param name="viewFlag">relist</s:param></s:url>');" class="input-gray" />
            </div>
		</div>
	</div>
	</div>
	</s:form>
</div>
</body>
</html>