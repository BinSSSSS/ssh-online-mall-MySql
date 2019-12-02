package cn.tblack.mall.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.tblack.mall.dao.ShoppingCartDao;
import cn.tblack.mall.domain.ShoppingCart;

@Service
public class ShoppingCartServiceImpl implements ShoppingCartService {

	@Autowired
	private ShoppingCartDao cartDao;

	@Override
	public Integer deleteByExactOrder(Integer userId, Integer itemId) {
		return cartDao.deleteByExactOrder(userId, itemId);
	}

	@Override
	public Integer deleteByItemId(Integer itemId) {
		return cartDao.deleteByItemId(itemId);
	}

	@Override
	public void deleteByCartId(Integer id) {
		cartDao.deleteByPrimaryKey(selectByPrimaryKey(id));
	}

	@Override
	public Integer deleteByUserId(Integer userId) {
		return cartDao.deleteByUserId(userId);
	}

	@Override
	public void insert(ShoppingCart cart) {
		cartDao.insert(cart);
	}

	@Override
	public List<ShoppingCart> selectAll() {
		return cartDao.selectAll();
	}

	@Override
	public ShoppingCart selectByExactOrder(Integer userId, Integer itemId) {
		return cartDao.selectByExactOrder(userId, itemId);
	}

	@Override
	public List<ShoppingCart> selectByItemId(Integer itemId) {
		return cartDao.selectByItemId(itemId);
	}

	@Override
	public ShoppingCart selectByPrimaryKey(Integer cartId) {
		return cartDao.selectByPrimaryKey(cartId);
	}

	@Override
	public List<ShoppingCart> selectByUserId(Integer userId) {
		return cartDao.selectByUserId(userId);
	}

	@Override
	public Integer updateByExactOrder(Integer userId, Integer itemId,ShoppingCart cart) {
		return cartDao.updateByExactOrder(userId, itemId,cart);
	}

	@Override
	public Integer updateByItemId(Integer itemId,ShoppingCart cart) {
		return cartDao.updateByItemId(itemId,cart);
	}

	@Override
	public void updateByPrimaryKey(Integer cartId) {
		cartDao.updateByPrimaryKey(selectByPrimaryKey(cartId));
	}

	@Override
	public Integer updateByUserId(Integer userId,ShoppingCart cart) {
		return cartDao.updateByUserId(userId,cart);
	}

	@Override
	public Long countAll() {
		return cartDao.countAll();
	}

	@Override
	public Long countByItemId(Integer itemId) {
		return cartDao.countByItemId(itemId);
	}

	@Override
	public Long countByUserId(Integer userId) {
		return cartDao.countByUserId(userId);
	}

}
