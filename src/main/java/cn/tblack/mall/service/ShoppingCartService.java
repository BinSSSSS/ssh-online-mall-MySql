package cn.tblack.mall.service;

import java.util.List;

import cn.tblack.mall.domain.ShoppingCart;

public interface ShoppingCartService {
	public Integer deleteByExactOrder(Integer userId, Integer itemId);

	public Integer deleteByItemId(Integer itemId);

	public void deleteByCartId(Integer id);

	public Integer deleteByUserId(Integer userId);

	public void insert(ShoppingCart cart);

	public List<ShoppingCart> selectAll();

	public ShoppingCart selectByExactOrder(Integer userId, Integer itemId);

	public List<ShoppingCart> selectByItemId(Integer itemId);

	public ShoppingCart selectByPrimaryKey(Integer cartId);

	public List<ShoppingCart> selectByUserId(Integer userId);

	public Integer updateByExactOrder(Integer userId, Integer itemId,ShoppingCart cart);

	public Integer updateByItemId(Integer itemId,ShoppingCart cart);

	public void updateByPrimaryKey(Integer cartId);

	public Integer updateByUserId(Integer userId,ShoppingCart cart);

	public Long countAll();

	public Long countByItemId(Integer itemId);

	public Long countByUserId(Integer userId);

}
