package cn.tblack.mall.domain;

import java.io.Serializable;
import java.math.BigDecimal;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * <span>购物车类</span>
 * 
 * @author TD唐登
 * @Date:2019年9月18日
 * @Version: 1.0(测试版)
 */
@Entity
@Table(name="shopping_cart")
public class ShoppingCart implements Serializable{

	

	private static final long serialVersionUID = 1L;
	
	@Id
	@Column(name="cart_id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id  = 1; // 购物车id
	

	@Column(name="item_id")
	private Integer itemId;// 购物车内的多个商品
	
	@Column(name="user_id")
	private Integer userId; // 用户id
	
	private Short amount ;	//商品的数量
	
	private BigDecimal total; // 购物车总价

	
	
	public ShoppingCart(Integer id, Integer items, Integer userId, BigDecimal total) {
		super();
		this.id = id;
		this.itemId = items;
		this.userId = userId;
		this.total = total;
	}

	public ShoppingCart() {
		super();
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getItems() {
		return itemId;
	}

	public void setItems(Integer items) {
		this.itemId = items;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public BigDecimal getTotal() {
		return total;
	}

	public void setTotal(BigDecimal total) {
		this.total = total;
	}

	public Integer getItemId() {
		return itemId;
	}

	public void setItemId(Integer itemId) {
		this.itemId = itemId;
	}

	public Short getAmount() {
		return amount;
	}

	public void setAmount(Short amount) {
		this.amount = amount;
	}

	@Override
	public String toString() {
		return "ShoppingCart [id=" + id + ", itemId=" + itemId + ", userId=" + userId + ", amount=" + amount
				+ ", total=" + total + "]";
	}


}
