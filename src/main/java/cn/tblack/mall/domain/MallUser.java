package cn.tblack.mall.domain;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * <span>商城用户类</span>
 * 
 * @author TD唐登
 * @Date:2019年9月18日
 * @Version: 1.0(测试版)
 */
@Entity
@Table(name = "mall_user")
public class MallUser implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id; // id
	private String username; // 用户名
	private String password; // 密码
	
	@OneToMany(fetch=FetchType.EAGER)
	@JoinColumn(name="user_id")
	private List<ShoppingCart> cartList; // 购物车列表

	public MallUser(Integer id, String username, String password, List<ShoppingCart> cartList) {
		super();
		this.id = id;
		this.username = username;
		this.password = password;
		this.cartList = cartList;
	}

	public MallUser() {
		super();
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}


	public List<ShoppingCart> getCartList() {
		return cartList;
	}

	public void setCartList(List<ShoppingCart> cartList) {
		this.cartList = cartList;
	}

	@Override
	public String toString() {
		return "MallUser [id=" + id + ", username=" + username + ", password=" + password + ", cartList=" + cartList + "]";
	}

}
