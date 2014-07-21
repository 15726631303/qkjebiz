package com.qkj.sche.action;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.iweb.sys.ContextHelper;
import org.iweb.sys.Parameters;
import org.iweb.sys.ToolsUtil;

import com.opensymphony.xwork2.ActionSupport;
import com.qkj.sche.dao.ScheduleDAO;
import com.qkj.sche.domain.Schedule;

public class ScheAction extends ActionSupport {
	private static final long serialVersionUID = 1L;
	private static Log log = LogFactory.getLog(ScheAction.class);
	private Map<String, Object> map = new HashMap<String, Object>();
	private ScheduleDAO dao = new ScheduleDAO();

	private Schedule sche;
	private List<Schedule> sches;
	private String message;
	private String viewFlag;
	private int recCount;
	private int pageSize;

	

	public Map<String, Object> getMap() {
		return map;
	}

	public void setMap(Map<String, Object> map) {
		this.map = map;
	}

	public Schedule getSche() {
		return sche;
	}

	public void setSche(Schedule sche) {
		this.sche = sche;
	}

	

	public List<Schedule> getSches() {
		return sches;
	}

	public void setSches(List<Schedule> sches) {
		this.sches = sches;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getViewFlag() {
		return viewFlag;
	}

	public void setViewFlag(String viewFlag) {
		this.viewFlag = viewFlag;
	}

	public int getRecCount() {
		return recCount;
	}

	public void setRecCount(int recCount) {
		this.recCount = recCount;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public void list() throws Exception {
		/*ContextHelper.isPermit("QKJ_SCHE");*/
		try {
			map.clear();
			if (sche != null)
				map.putAll(ToolsUtil.getMapByBean(sche));
			map.putAll(ContextHelper.getDefaultRequestMap4Page());
			this.setPageSize(Integer.parseInt(map.get(Parameters.Page_Size_Str).toString()));
			this.setSches(dao.list(map));
			this.setRecCount(dao.getResultCount());
		} catch (Exception e) {
			log.error(this.getClass().getName() + "!list 读取数据错误:", e);
			throw new Exception(this.getClass().getName() + "!list 读取数据错误:", e);
		}
		/*return SUCCESS;*/
	}
	
	public String leftList() throws Exception {
		ContextHelper.isPermit("QKJ_SCHE");
		try {
			map.clear();
			if (sche != null)
				map.putAll(ToolsUtil.getMapByBean(sche));
			map.putAll(ContextHelper.getDefaultRequestMap4Page());
			this.setPageSize(Integer.parseInt(map.get(Parameters.Page_Size_Str).toString()));
			this.setSches(dao.list(map));
			this.setRecCount(dao.getResultCount());
		} catch (Exception e) {
			log.error(this.getClass().getName() + "!list 读取数据错误:", e);
			throw new Exception(this.getClass().getName() + "!list 读取数据错误:", e);
		}
		return SUCCESS;
	}

	public String load() throws Exception {
		try {
			if (null == viewFlag) {
				this.setSche(null);
				setMessage("你没有选择任何操作!");
			} else if ("add".equals(viewFlag)) {
				System.out.println("load                                       add");
				this.setSche(null);
			} else if ("mdy".equals(viewFlag)) {
				map.clear();
				map.put("ssid", sche.getSsid());
				if (null == map.get("ssid"))
					this.setSche(null);
				else
					this.setSche((Schedule) dao.list(map).get(0));
			} else {
				this.setSche(null);
				setMessage("无操作类型!");
			}
		} catch (Exception e) {
			log.error(this.getClass().getName() + "!load 读取数据错误:", e);
			throw new Exception(this.getClass().getName() + "!load 读取数据错误:", e);
		}
		return SUCCESS;
	}
	

	
	public String add() throws Exception {
		ContextHelper.isPermit("QKJ_SCHE_ADDSCHE");
		try {
			System.out.println("add                              add");
			dao.add(sche);
		} catch (Exception e) {
			log.error(this.getClass().getName() + "!add 数据添加失败:", e);
			throw new Exception(this.getClass().getName() + "!add 数据添加失败:", e);
		}
		return SUCCESS;
	}

	public String save() throws Exception {
		ContextHelper.isPermit("QKJ_SCHE_LIST_UPDATE");
		try {
	/*		ware.setLm_user(ContextHelper.getUserLoginUuid());
			ware.setLm_time(new Date());*/
			dao.save(sche);
		} catch (Exception e) {
			log.error(this.getClass().getName() + "!save 数据更新失败:", e);
			throw new Exception(this.getClass().getName() + "!save 数据更新失败:", e);
		}
		return SUCCESS;
	}

	public String del() throws Exception {
		ContextHelper.isPermit("QKJ_SCHE_LIST_DEL");
		try {
			dao.delete(sche);
			setMessage("删除成功!ID=" + sche.getSsid());
		} catch (Exception e) {
			log.error(this.getClass().getName() + "!del 数据删除失败:", e);
			throw new Exception(this.getClass().getName() + "!del 数据删除失败:", e);
		}
		return SUCCESS;
	}
}
