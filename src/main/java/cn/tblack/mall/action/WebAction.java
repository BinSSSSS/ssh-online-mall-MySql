package cn.tblack.mall.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Random;
import java.util.Set;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import cn.tblack.mall.domain.Item;
import cn.tblack.mall.domain.MallUser;
import cn.tblack.mall.domain.MiniCart;
import cn.tblack.mall.domain.ShoppingCart;
import cn.tblack.mall.domain.Topic;
import cn.tblack.mall.service.ItemService;
import cn.tblack.mall.service.MallUserService;

public class WebAction extends ActionSupport implements ModelDriven<MallUser> {

	private static final long serialVersionUID = 1L;

	@Autowired
	private ItemService itemService;

	@Autowired
	private MallUserService userService;
	

	private MallUser user = new MallUser();

	@Action(value = "item-list", results = { @Result(name = "list", location = "/WEB-INF/jsp/item-list.jsp") })
	public String itemList() throws Exception {

		System.err.println("执行itemList 函数");

		List<Item> itemList = itemService.selectAll();

		ActionContext.getContext().put("itemList", itemList);

		return "list";
	}

	@Action(value = "user-cart", results = { @Result(name = "cart", location = "/WEB-INF/jsp/user-cart.jsp") })
	public String userCart() throws Exception {

		System.err.println("执行userCart 函数");

		MallUser user = userService.selectByUserId(1);

		System.out.println(user);

		ActionContext.getContext().put("user", user);

		return "cart";
	}

	public String home() {

		// 查询所有的商品， 并按照类别进行分组，组成键值对， 显示在主页中
		Map<String, List<Item>> itemMap = itemService.selectAllAndGroundByItemType();

		List<Topic> topicList = new ArrayList<Topic>();

		for (Entry<String, List<Item>> entry : itemMap.entrySet()) {

			topicList.add(new Topic(entry.getKey(), entry.getValue()));
		}

		/// 随机筛选出多个商品进行显示在主页中进行推荐- 按照日期当前天数作为随机数种子。并进行推荐
		Random rand = new Random(Calendar.getInstance().get(Calendar.DAY_OF_MONTH));

		Set<Item> recommendList = new HashSet<>();

		Long count = itemService.countAll();

		// 随机的查询出五个商品进行推荐
		Integer start = rand.nextInt(count.intValue() - 5) + 1;

		System.err.println(count);
		System.out.println(start);

		for (int i = start; i < start + 5; ++i) {
			recommendList.add(itemService.selectByItemId(i));

		}
		System.err.println(recommendList);

		// 请求首页的时候检查用户是否登录， 如果登录，设置该用户的购物车到 请求对象中

		HttpServletRequest req = ServletActionContext.getRequest();

		Cookie[] cookies = req.getCookies();

		String username = null;
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if ("username".equals(cookie.getName())) {
					username = cookie.getValue();
				}
			}
		}

		// 当前用户确实是登录了的时候
		if (username != null) {
			System.err.println("当前用户登录过");
			MallUser user = userService.selectByUsername(username);
				
			//将购物车列表转换为  MiniCart 列表
			Set<MiniCart> miniCarts =  new HashSet<>();
			
			for(ShoppingCart cart : user.getCartList()) {
				
				MiniCart miniCart = new MiniCart();
				miniCart.setCart(cart);
				miniCart.setItem(itemService.selectByItemId(cart.getItemId()));
				miniCarts.add(miniCart);
			}
			
			ActionContext.getContext().put("cartList", miniCarts);
		}

		ActionContext.getContext().put("topicList", topicList);
		ActionContext.getContext().put("recommendList", recommendList);

		return "home";
	}

	// 登录验证
	public void signIn() throws IOException {

		HttpServletResponse resp = ServletActionContext.getResponse();
		resp.setCharacterEncoding("UTF-8");

		/// 登录验证成功
		if (userService.login(user.getUsername(), user.getPassword()) != null) {
			// 设置 cookie 数据
			resp.addCookie(new Cookie("username", user.getUsername()));
			resp.getWriter().print("SUCCESS");
			System.err.println("登录成功");
			return ;
		}

		System.err.println("登录失败");
		resp.getWriter().print("FAILED");
	}

	// 注册
	public void signUp() {
		
	}
	
	//注销
	public void logout() throws IOException {
		
		HttpServletResponse resp = ServletActionContext.getResponse();

		Cookie cookie = new Cookie("username", null);

		cookie.setMaxAge(0);
 
		resp.addCookie(cookie);
		
		resp.getWriter().print("success");
	}


	@Override
	public MallUser getModel() {
		return user;
	}
}
