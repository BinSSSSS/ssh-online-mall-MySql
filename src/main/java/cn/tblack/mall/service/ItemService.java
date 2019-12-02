package cn.tblack.mall.service;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import cn.tblack.mall.domain.Item;

public interface ItemService {

	public void deleteAll();

	public Integer deleteByItemName(String itemName);

	public Integer deleteByItemType(String itemType);

	public void deleteByItemId(Integer itemId);

	public boolean insert(Item item);

	public Item selectByItemId(Integer itemId);

	public List<Item> selectByItemName(String itemName);

	public List<Item> selectByItemNameFuzzy(String fuzzyName);

	public List<Item> selectByItemPrice(BigDecimal price);

	public List<Item> selectByItemType(String itemType);
	
	/**
	 * <span>查询所有的商品， 并按照商品的类型进行分类，每个商品的类型对应着一个 List 对象。</span>
	 * @return 将商品类型和属于该类型的商品组成键值对进行返回
	 */
	public Map<String,List<Item>> selectAllAndGroundByItemType();
	
	public List<Item> selectAll();

	public Integer updateAllPrice(BigDecimal discount);

	public Integer updateByItemName(String itemName, Item item);

	public Integer updateByItemType(String itemType, Item item);

	public void updateByItemId(Integer itemId);
	
	public Long countAll();
	
	
	public Long countByItemType(String itemType);
	
	public Long countByItemName(String itemName);
}
