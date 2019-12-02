package cn.tblack.mall.dao;

import java.util.List;

import javax.persistence.NoResultException;

import org.hibernate.query.Query;
import org.springframework.stereotype.Component;

import cn.tblack.mall.domain.MallUser;

@Component
public class MallUserDao extends BaseDao {

	public void insert(MallUser user) {

		session().save(user);
	}

	public void deleteByPrimaryKey(MallUser user) {
		session().delete(user);
	}

	public void updateByPrimaryKey(MallUser user) {
		session().update(user);
	}

	public MallUser selectByPrimaryKey(Integer id) {

		return session().get(MallUser.class, id);
	}

	public MallUser selectByPassword(String username, String password) {

		Query<?> query = session().createQuery("FROM MallUser WHERE username=:username AND password=:password");

		query.setParameter("username", username);
		query.setParameter("password", password);
		try {
			MallUser user =	(MallUser) query.getSingleResult();
			return user;
		}catch(NoResultException e) {
			return null;
		}
	}

	public List<MallUser> selectAll() {

		@SuppressWarnings("unchecked")
		Query<MallUser> query = session().createQuery("FROM MallUser");

		return query.list();
	}
	
	public Long countAll() {
		
		
		return (Long) session().createQuery("SELECT COUNT(id) FROM MallUser ").uniqueResult();
	}

	public MallUser selectByUsername(String username) {
		
		Query<?> query = session().createQuery("FROM MallUser WHERE username=:username ");
		
		query.setParameter("username", username);
		
		try {
			return (MallUser) query.getSingleResult();
		}catch(NoResultException e) {
			return null;
		}
		
		
	}
}
