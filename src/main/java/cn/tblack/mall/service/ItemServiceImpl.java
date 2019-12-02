package cn.tblack.mall.service;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.tblack.mall.dao.ItemDao;
import cn.tblack.mall.domain.Item;

@Service
public class ItemServiceImpl implements ItemService {

	@Autowired
	private ItemDao itemDao;

	@Override
	public void deleteAll() {
		itemDao.deleteAll();
	}

	@Override
	public Integer deleteByItemName(String itemName) {
		return itemDao.deleteByItemName(itemName);
	}

	@Override
	public Integer deleteByItemType(String itemType) {
		return itemDao.deleteByItemType(itemType);
	}

	@Override
	public void deleteByItemId(Integer itemId) {

		itemDao.deleteByPrimaryKey(selectByItemId(itemId));
	}

	@Override
	public boolean insert(Item item) {
		return itemDao.insert(item);
	}

	@Override
	public Item selectByItemId(Integer itemId) {
		return itemDao.selectByItemId(itemId);
	}

	@Override
	public List<Item> selectByItemName(String itemName) {
		return itemDao.selectByItemName(itemName);
	}

	@Override
	public List<Item> selectByItemNameFuzzy(String fuzzyName) {
		return itemDao.selectByItemNameFuzzy(fuzzyName);
	}

	@Override
	public List<Item> selectByItemPrice(BigDecimal price) {
		return itemDao.selectByItemPrice(price);
	}

	@Override
	public List<Item> selectByItemType(String itemType) {
		return itemDao.selectByItemType(itemType);
	}

	@Override
	public List<Item> selectAll() {
		return itemDao.selectAll();
	}

	@Override
	public Integer updateAllPrice(BigDecimal discount) {
		return itemDao.updateAllPrice(discount);
	}

	@Override
	public Integer updateByItemName(String itemName, Item item) {
		return itemDao.updateByItemName(itemName, item);
	}

	@Override
	public Integer updateByItemType(String itemType, Item item) {
		return itemDao.updateByItemType(itemType, item);
	}

	@Override
	public void updateByItemId(Integer itemId) {
		itemDao.updateByPrimaryKey(selectByItemId(itemId));
		;
	}

	@Override
	public Map<String, List<Item>> selectAllAndGroundByItemType() {
	
		//首先需要查询到数据库的所有itemType
		List<String> list =  itemDao.selectAllItemType();
		
		Map<String,List<Item>> map =  new HashMap<>();
		
		
		//之后按照每种类型进行分步查询并放置在map对象当中
		for (String type : list) {
			map.put(type, selectByItemType(type));
		}
		
		
		return map;
	}

	@Override
	public Long countAll() {
		return itemDao.countAll();
	}

	@Override
	public Long countByItemType(String itemType) {
		return itemDao.countByItemType(itemType);
	}

	@Override
	public Long countByItemName(String itemName) {
		return itemDao.countByItemName(itemName);
	}

}
