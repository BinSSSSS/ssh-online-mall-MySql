package cn.tblack.mall.dao;

import java.util.Map;
import java.util.Map.Entry;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;

public abstract class BaseDao{

	@Autowired
	protected SessionFactory factory;

	public Session session() {
		return factory.getCurrentSession();
	}

	public void setParameters(Map<String, Object> map, Query<?> query) {

		for (Entry<String, Object> entry : map.entrySet()) {
			query.setParameter(entry.getKey(), entry.getValue());
		}
	}

}
