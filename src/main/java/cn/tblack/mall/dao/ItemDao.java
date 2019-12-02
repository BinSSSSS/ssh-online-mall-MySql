package cn.tblack.mall.dao;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import org.hibernate.query.Query;
import org.springframework.stereotype.Component;

import cn.tblack.mall.domain.Item;
import cn.tblack.mall.util.ClazzUtils;

@Component
public class ItemDao extends BaseDao {

	private final String updateSQL = "UPDATE Item SET item_name=:itemName, item_type=:itemType,ORIGINAL_PRICE=:originalPrice,"
			+ " PARSENT_PRICE=:parsentPrice,DISCOUNT=:discount,IMAGE_PATH=:imagePath,PUBLISH_TIME=:publishTime ";

	private final String[] fields = { "itemName", "itemType", "originalPrice", "parsentPrice", "discount",
			"imagePath","publishTime", };

	public boolean insert(Item item) {

		return session().save(item) != null;
	}

	public Item selectByItemId(Integer id) {

		return session().get(Item.class, id);
	}

	public void updateByPrimaryKey(Item item) {

		session().update(item);
	}

	public void deleteByPrimaryKey(Item item) {

		session().delete(item);
	}

	public Integer updateByItemName(String itemName, Item item) {

		String sql = updateSQL + "WHERE item_name=:oldName";

		Query<?> query = session().createQuery(sql);

		Map<String, Object> map = null;
		try {
			map = ClazzUtils.getFieldMap(fields, item);

		} catch (Exception e) {

			e.printStackTrace();
			return 0;
		}
		map.put("oldName", itemName);
		setParameters(map, query);

		return query.executeUpdate();
	}

	public Integer updateByItemType(String itemType, Item item) {
		String sql = updateSQL + "WHERE item_type=:oldType";

		Query<?> query = session().createQuery(sql);

		Map<String, Object> map = null;
		try {
			map = ClazzUtils.getFieldMap(fields, item);

		} catch (Exception e) {

			e.printStackTrace();
			return 0;
		}
		map.put("oldType", itemType);
		setParameters(map, query);

		return query.executeUpdate();
	}

	public Integer updateAllPrice(BigDecimal discount) {
		String sql = "UPDATE Item set PARSENT_PRICE=PARSENT_PRICE*:discount";

		Query<?> query = session().createQuery(sql);
		query.setParameter("discount", discount);

		return query.executeUpdate();
	}

	public Integer deleteByItemName(String itemName) {

		String sql = "DELETE Item WHERE item_name=:itemName";

		Query<?> query = session().createQuery(sql);

		query.setParameter("itemName", itemName);

		return query.executeUpdate();
	}

	public Integer deleteByItemType(String itemType) {
		String sql = "DELETE Item WHERE item_type=:itemType";

		Query<?> query = session().createQuery(sql);

		query.setParameter("itemType", itemType);

		return query.executeUpdate();
	}

	public Integer deleteAll() {

		String sql = "DELETE Item";

		Query<?> query = session().createQuery(sql);

		return query.executeUpdate();
	}

	@SuppressWarnings("unchecked")
	public List<Item> selectByItemName(String itemName) {

		Query<?> query = session().createQuery("FROM Item WHERE item_name=:itemName");

		query.setParameter("itemName", itemName);

		return (List<Item>) query.list();

	}

	@SuppressWarnings("unchecked")
	public List<Item> selectByItemType(String itemType) {
		Query<?> query = session().createQuery("FROM Item WHERE item_type=:itemType");

		query.setParameter("itemType", itemType);

		return (List<Item>) query.list();

	}

	@SuppressWarnings("unchecked")
	public List<Item> selectByItemPrice(BigDecimal price) {
		Query<?> query = session().createQuery("FROM Item WHERE parsent_price=:price");

		query.setParameter("price", price);

		return (List<Item>) query.list();
	}

	@SuppressWarnings("unchecked")
	public List<Item> selectByItemNameFuzzy(String fuzzyName) {
		Query<?> query = session().createQuery("FROM Item WHERE item_name LIKE :itemName");

		query.setParameter("itemName", "%" + fuzzyName + "%");

		return (List<Item>) query.list();
	}

	@SuppressWarnings("unchecked")
	public List<Item> selectAll() {

		Query<?> query = session().createQuery("FROM Item");

		return (List<Item>) query.list();

	}

	@SuppressWarnings("unchecked")
	public List<String> selectAllItemType() {

		Query<?> query = session().createQuery("SELECT itemType FROM Item ");
		return (List<String>) query.list();
	}

	public Long countAll() {

		Query<?> query = session().createQuery("SELECT COUNT(item_id) FROM Item");

		return (Long) query.uniqueResult();
	}

	public Long countByItemType(String itemType) {

		Query<?> query = session().createQuery("SELCT COUNT(item_id) FROM Item WHERE item_type=:itemType");

		query.setParameter("itemType", itemType);

		return (Long) query.uniqueResult();
	}

	public Long countByItemName(String itemName) {

		Query<?> query = session().createQuery("SELCT COUNT(item_id) FROM Item WHERE item_name=:itemName");

		query.setParameter("itemName", itemName);

		return (Long) query.uniqueResult();
	}

}
