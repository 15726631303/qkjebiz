<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>青海互助青稞酒股份有限公司送酒活动</title>
<script type="text/javascript" src="../js/form_validator.js"></script>
<script type="text/javascript" src="../include/jQuery/jquery-1.8.3.min.js"></script>
<script type="text/javascript">
var sval = '';
$(function(){
	$("#securityid").focusout(function() {
		//checkSec();
		var sval_tmp = $(this).val();
		if(sval!=sval_tmp) {
			sval = sval_tmp;
			checkSec(sval);
		}
	});
	changeTextArea();
});

function changeTextArea() {
	var initInfo = "请填写包含省/市/县的详细地址信息,以便邮寄";
	$("#cusInfoh_address").val(initInfo);
	$("#cusInfoh_address").bind({
		focus:function(){
			if($(this).val()==initInfo) {
				$(this).val('');
				$(this).removeClass('message_prompt');
			}
		},
		blur:function(){
			if($(this).val()=='') {
				$(this).val(initInfo);
				$(this).addClass('message_prompt');
			}
		}
	});
}

var checkSec = function(sec){
	if(sec.length>0) {
		$.ajax({
			type: "POST",
			url: '<s:url namespace="/iInfo" action="cus_qkjAjax" />',
			data: "cusInfoh.linkid=v02&cusInfoh.security=" + sec,
			beforeSend : function() {
				$("#securityImg").css('background','url("<s:url value="/images/loading/loading16x16_01.gif" />") no-repeat');
			},
			success: function(msg){
				var m = parseInt(msg);
				//alert( "Data Saved: " + m);
				if(m==0) {
					$("#securityImg").css('background','url("<s:url value="/images/ico_warn.png" />") no-repeat 0 0');
					$("#errMsg").empty();
					$("#errMsg").hide();
				} else {
					$("#securityImg").css({'background-image':'url("<s:url value="/images/ico_warn.png" />")','background-position':'0 -50px'});
					if(m==1) {
						$("#errMsg").text("您已经参与了这个活动并且正确提交了信息!");
					} else {
						$("#errMsg").text("请输出正确的股东深圳证券A股证券卡号(不是资金账号),或在卡号面前加0补足10位.");
					}
					$("#errMsg").show();
				}
			}
		});
	}	
};

var checkSecx = function() {
	var errMsg = $("#errMsg").text();
	if(errMsg==null || errMsg=='') {
		//$("#cusInfoh_add").unbind();
		return true;
	} else {
		alert(errMsg);
		//$("#cusInfoh_add").bind("click",function(){
		//	return false;
		//});
		return false;
	}
};
</script>
<style type="text/css">
body,td,div {
font-family: "黑体";
font-size: 14px;
}
.leftCol {
width: 90px;
text-align: right;
padding: 5px;
color:  #000;
}
.rightCol {
padding: 5px;
}
.buttonarea {
text-align: center;
padding: 5px;
}
.buttonarea input.xbutton {
width: 100px;
height: 30px;
border: none;
border-radius: 5px;
color: #333;
font-weight: bold;
}
.itable {
border-collapse: collapse;
}
.itable ,.itable td,.itable tr {
border: #666 solid 1px;
}

#securityImg {
width: 16px;height: 16px;display: inline-block;overflow: hidden;
}

#errMsg {
background-color: #C0C0C0;
margin: 5px 10px 5px 3px;
line-height: 20px;
display: none;
}

.message_prompt {
color: #999;
}
</style>
</head>
<body>
<form name="form1" action="/qkjweb/cusInfoh_add" onsubmit="return (checkSecx()&&validator(this));" method="post">
<table class="itable" cellpadding="0" cellspacing="0" border="1" width="300">
<tr>
<td class="leftCol">股东深圳证券<br />A股证券卡号:</td>
<td class="rightCol">
<input type="hidden" name="cusInfoh.linkid" value="v02" />
<input type="text" id="securityid" name="cusInfoh.security" title="股东证券账户卡号" require="required" controlName="证券号" dataLength="10,10"  />
<span id="securityImg"></span>
<div id="errMsg"></div>
</td>
</tr>
<tr>
<td class="leftCol">法人公司名称<br />/自然人姓名:</td>
<td class="rightCol"><input type="text" name="cusInfoh.fullname" title="法人公司名称/自然人姓名" require="required" controlName="姓名" /></td>
</tr>
<tr>
<td class="leftCol">手机号:</td>
<td class="rightCol"><input type="text" name="cusInfoh.mobile" title="手机号" require="required" controlName="手机号" dataType="mobile" /></td>
</tr>
<tr>
<td class="leftCol">邮寄地址:</td>
<td class="rightCol">
<textarea  id="cusInfoh_address" class="message_prompt" name="cusInfoh.address" title="邮寄地址" require="required" controlName="邮寄地址"></textarea>
</td>
</tr>
<tr>
<td class="leftCol">邮编:</td>
<td class="rightCol"><input type="text" name="cusInfoh.postno" title="邮编" require="required" controlName="邮编" dataType="zipcode" /></td>
</tr>
<tr>
    <td colspan="4" class="buttonarea">
    	<span id="message"><s:property value="message" /></span>
    	<input type="submit"  value="我要申领"  id="cusInfoh_add" name="cusInfoh_add" />
	</td>
</tr>
</table>
</form>
</body>
</html>