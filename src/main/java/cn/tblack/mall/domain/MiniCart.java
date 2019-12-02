package cn.tblack.mall.domain;

/**
 * <span>封装的购物车对象， 该对象保存了购物车和购物车保存的 item对象</span>
 * @author TD唐登
 * @Date:2019年9月24日
 * @Version: 1.0(测试版)
 */
public class MiniCart {

	private ShoppingCart cart;
	
	private Item item;

	
	public ShoppingCart getCart() {
		return cart;
	}



	public void setCart(ShoppingCart cart) {
		this.cart = cart;
	}



	public Item getItem() {
		return item;
	}



	public void setItem(Item item) {
		this.item = item;
	}



	@Override
	public String toString() {
		return "MiniCart [cart=" + cart + ", item=" + item + "]";
	}

}
