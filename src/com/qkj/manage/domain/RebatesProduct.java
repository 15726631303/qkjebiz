package com.qkj.manage.domain;

public class RebatesProduct {
	private Integer uuid;// (int)主键ID
	private Integer rebates_id;// (int)返利申请号
	private Integer product_id;// (int)产品ID
	private Double per_price;// (decimal)单价
	private Integer num;// (int)数量
	private Double total_price;// (decimal)总价

	// 以下为非数据库字段
	private String product_name;

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public Integer getUuid() {
		return uuid;
	}

	public void setUuid(Integer uuid) {
		this.uuid = uuid;
	}

	public Integer getRebates_id() {
		return rebates_id;
	}

	public void setRebates_id(Integer rebates_id) {
		this.rebates_id = rebates_id;
	}

	public Integer getProduct_id() {
		return product_id;
	}

	public void setProduct_id(Integer product_id) {
		this.product_id = product_id;
	}

	public Double getPer_price() {
		return per_price;
	}

	public void setPer_price(Double per_price) {
		this.per_price = per_price;
	}

	public Integer getNum() {
		return num;
	}

	public void setNum(Integer num) {
		this.num = num;
	}

	public Double getTotal_price() {
		return total_price;
	}

	public void setTotal_price(Double total_price) {
		this.total_price = total_price;
	}

}
