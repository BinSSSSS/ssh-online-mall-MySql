package cn.tblack.mall.dao;

import java.util.List;
import java.util.Map;

import javax.persistence.NoResultException;

import org.hibernate.query.Query;
import org.springframework.stereotype.Component;

import cn.tblack.mall.domain.ShoppingCart;
import cn.tblack.mall.util.ClazzUtils;

@Component
public class ShoppingCartDao extends BaseDao {

	private final String updateSQL = "UPDATE ShoppingCart SET user_id = :userId,item_id = :itemId, total=:total,amount=:amount ";

	private String[] fields = {
		"userId",	"itemId","total","amount"
	};
	
	
	public void insert(ShoppingCart cart) {

		session().save(cart);

	}

	public void deleteByPrimaryKey(ShoppingCart cart) {

		session().delete(cart);

	}

	public Integer deleteByUserId(Integer id) {

		String sql = "DELETE ShoppingCart  WHERE user_id=:userId";

		Query<?> query = session().createQuery(sql);

		query.setParameter("userId", id);

		return query.executeUpdate();
	}

	public Integer deleteByItemId(Integer id) {
		String sql = "DELETE ShoppingCart  WHERE item_id=:itemId";

		Query<?> query = session().createQuery(sql);

		query.setParameter("itemId", id);

		return query.executeUpdate();
	}

	/**
	 * <span>按照订单来进行删除</span>
	 * 
	 * @param userId
	 * @param itemId
	 * @return
	 */
	public Integer deleteByExactOrder(Integer userId, Integer itemId) {

		String sql = "DELETE ShoppingCart  WHERE user_id = :userId AND item_id=:itemId";

		Query<?> query = session().createQuery(sql);
		query.setParameter("userId", userId);
		query.setParameter("itemId", itemId);

		return query.executeUpdate();
	}

	public void updateByPrimaryKey(ShoppingCart cart) {

		session().update(cart);
	}

	public Integer updateByUserId(Integer id,ShoppingCart cart) {

		String sql = updateSQL + "WHERE user_id =:oldUserId";
	
		Query<?> query = session().createQuery(sql);
		
		try {
			Map<String,Object> map = ClazzUtils.getFieldMap(fields, cart);
			map.put("oldUserId", id);
			
			setParameters(map, query);
		} catch (Exception e) {

			return 0;
		}

		return query.executeUpdate();
	}

	public Integer updateByItemId(Integer id,ShoppingCart cart) {
		String sql = updateSQL + "WHERE itemId =:oldItemId";

		Query<?> query = session().createQuery(sql);
		
		try {
			Map<String,Object> map = ClazzUtils.getFieldMap(fields, cart);
			map.put("oldItemId", id);
			
			setParameters(map, query);
		} catch (Exception e) {

			return 0;
		}

		return query.executeUpdate();
	}

	public Integer updateByExactOrder(Integer userId, Integer itemId,ShoppingCart cart) {
		String sql = updateSQL + "WHERE user_id = :oldUserId AND itemId =:oldItemId";


		Query<?> query = session().createQuery(sql);
		
		try {
			Map<String,Object> map = ClazzUtils.getFieldMap(fields, cart);
			map.put("oldUserId", userId);
			map.put("oldItemId", itemId);
			setParameters(map, query);
		} catch (Exception e) {

			return 0;
		}

		return query.executeUpdate();
	}

	public List<ShoppingCart> selectAll() {

		@SuppressWarnings("unchecked")
		Query<ShoppingCart> query = session().createQuery("FROM ShoppingCart");

		return query.list();
	}

	public ShoppingCart selectByPrimaryKey(Integer id) {

		return session().get(ShoppingCart.class, id);
	}

	public List<ShoppingCart> selectByUserId(Integer userId) {
		@SuppressWarnings("unchecked")
		Query<ShoppingCart> query = session().createQuery("FROM ShoppingCart WHERE user_id=:userId");

		query.setParameter("userId", userId);
		return query.list();
	}

	public List<ShoppingCart> selectByItemId(Integer itemId) {
		@SuppressWarnings("unchecked")
		Query<ShoppingCart> query = session().createQuery("FROM ShoppingCart WHERE item_id=:itemId");

		query.setParameter("itemId", itemId);
		return query.list();
	}

	public ShoppingCart selectByExactOrder(Integer userId, Integer itemId) {
		@SuppressWarnings("unchecked")
		Query<ShoppingCart> query = session()
				.createQuery("FROM ShoppingCart WHERE user_id = :userId AND item_id=:itemId");

		query.setParameter("userId", userId);
		query.setParameter("itemId", itemId);
		try {
			return query.getSingleResult();
		}catch(NoResultException e) {
			return null;
		}
	}

	public Long countAll() {

		return (Long) session().createQuery("SELECT COUNT(cart_id) FROM ShoppingCart").uniqueResult();
	}

	public Long countByItemId(Integer itemId) {

		Query<?> query = session().createQuery("SELECT COUNT(id) FROM ShoppingCart WHERE item_id=:itemId");

		query.setParameter("itemId", itemId);

		return (Long) query.uniqueResult();

	}

	public Long countByUserId(Integer userId) {

		Query<?> query = session().createQuery("SELECT COUNT(id) FROM ShoppingCart WHERE user_id=:userId");

		query.setParameter("userId", userId);

		return (Long) query.uniqueResult();

	}
}
