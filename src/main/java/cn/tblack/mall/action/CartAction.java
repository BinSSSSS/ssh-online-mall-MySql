package cn.tblack.mall.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import cn.tblack.mall.domain.MallUser;
import cn.tblack.mall.domain.ShoppingCart;
import cn.tblack.mall.service.ItemService;
import cn.tblack.mall.service.MallUserService;
import cn.tblack.mall.service.ShoppingCartService;

/**
 * <span>购物车操作相关</span>
 * @author TD唐登
 * @Date:2019年9月24日
 * @Version: 1.0(测试版)
 */
public class CartAction extends ActionSupport implements  ModelDriven<ShoppingCart>{

	
	private static final long serialVersionUID = 1L;

	private ShoppingCart cart = new ShoppingCart();
	
	
	@Autowired
	private ShoppingCartService cartService ;
	
	@Autowired
	private MallUserService userService;
	
	
	@Autowired
	private ItemService itemService;
	
	@Override
	public ShoppingCart getModel() {
		return cart;
	}

	
	
	@SuppressWarnings("unused")
	@Action
	public void addItem() throws IOException {
		
		HttpServletRequest req = ServletActionContext.getRequest();
		HttpServletResponse resp = ServletActionContext.getResponse();
		
		String username = req.getParameter("username");
		
		System.err.println("用户名: " + username);
		
		//查找该用户对象
		MallUser user  = userService.selectByUsername(username);
		
		cart.setUserId(user.getId());
		
		System.err.println("当前 购物车对象为: " +  cart);

		
		//根据itemId 和 userId 来查找数据库， 如果之前该商品已经添加过了， 只需要更新数据即可
		if(cartService.selectByExactOrder(user.getId(), cart.getItemId()) != null) {
			
			cartService.updateByExactOrder(cart.getUserId(), cart.getItemId(), cart);
		}else {
			
			//如果该商品之前不存在的话，那么则添加一条新的记录
			cartService.insert(cart);
		}
		
		
		if(user == null) {
			resp.getWriter().print("FAILED");
			return;
		}
		
		
		resp.getWriter().print("SUCCESS");
	}
	
	//从数据库中删除某个订单
	public void deleteCart() throws IOException {
		
		HttpServletRequest req = ServletActionContext.getRequest();
		HttpServletResponse resp =  ServletActionContext.getResponse();
		
		resp.setCharacterEncoding("utf-8");
		
		String username = req.getParameter("username");
		Integer itemId =  Integer.parseInt(req.getParameter("itemId"));
		
		//查找用户
		MallUser user = userService.selectByUsername(username);
		
		
		//进行删除操作
		if(user != null) {
			if(cartService.deleteByExactOrder(user.getId(), itemId) > 0 ) {
				resp.getWriter().print("SUCCESS");
			}
			return;
		}
			
		resp.getWriter().print("FAILED");
	}
	
}
