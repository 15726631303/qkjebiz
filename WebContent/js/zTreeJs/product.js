$(document).ready(function(){
	$.fn.zTree.init($("#treeDemo"), setting, zNodes);
});
/* 添加酒品---分类 */
var setting = { view : { dblClickExpand : false },
data : { simpleData : { enable : true } },
callback : { beforeClick : beforeClick,
onClick : onClick } };

function beforeClick(treeId, treeNode){
	if (treeNode && (treeNode.pId == null || treeNode.pId == 0)) return false;
	else return true;
}
function onClick(e, treeId, treeNode){
	var zTree = $.fn.zTree.getZTreeObj("treeDemo"), nodes = zTree.getSelectedNodes(), v = "";
	puid = "";
	price = "";
	dc = "";
	nodes.sort(function compare(a, b){
		return a.id - b.id;
	});
	for (var i = 0, l = nodes.length; i < l; i++) {
		v += nodes[i].name + ",";
		puid += nodes[i].puuid + ",";
		price += nodes[i].mp + "#" + nodes[i].gp + "#" + nodes[i].dp + ",";
		dc += nodes[i].case_spec + ",";
	}

	if (v.length > 0) v = v.substring(0, v.length - 1);
	if (puid.length > 0) puid = puid.substring(0, puid.length - 1);
	if (price.length > 0) price = price.substring(0, price.length - 1);
	if (dc.length > 0) dc = dc.substring(0, dc.length - 1);
	var cityObj = $("#citySel");
	var puuid = $("#cityUid");
	var prices = $("#price");
	var dac = $("#datacase");
	cityObj.attr("value", v); /* 显示 */
	puuid.attr("value", puid); /* uuid */
	prices.attr("value", price);/* 三种价格 */
	dac.attr("value", dc);/* 单位 */

	if ($("#per_price_select_area").length > 0) {
		$("#per_price_select_area").hide();
		$("#per_price_select").clearAllOption();
		if (price == null || price == '') {
			$("#per_price_select_area").hide();
		} else {
			var ps = price.split("#");
			/* var ps = $(this).getSelectedAttr("data").split("#"); */
			if (ps.length >= 3) {
				$("#per_price_select").addOption("自定义", "");
				$("#per_price_select").addOption("参考价1(" + ps[0] + ")", ps[0]);
				$("#per_price_select").addOption("参考价2(" + ps[1] + ")", ps[1]);
				$("#per_price_select").addOption("参考价3(" + ps[2] + ")", ps[2]);
				if (ps[3] != '' && ps[3] != null && ps[3] != 'null') $("#per_price_select").addOption("参考价4(" + ps[3] + ")", ps[3]);
				if (ps[4] != '' && ps[4] != null && ps[3] != 'null') $("#per_price_select").addOption("参考价5(" + ps[4] + ")", ps[4]);
				if (ps[5] != '' && ps[5] != null && ps[3] != 'null') $("#per_price_select").addOption("参考价6(" + ps[5] + ")", ps[5]);
				$("#per_price_select_area").fadeIn(1000);
			}
		}
	}

	hideMenu();

}
function showMenu(){
	var cityObj = $("#citySel");
	var cityOffset = $("#citySel").offset();
	$("#menuContent").slideDown("fast");
}
function hideMenu(){
	$("#menuContent").fadeOut("fast");
}