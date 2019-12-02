//将数据发送到后台进行处理
	function addCart(inputList){
		var map = new FormData();
		
		for(var i = 0; i < inputList.length; ++i){
			map.append($(inputList[i]).attr("name") ,$(inputList[i]).val());
		}
		
		
		//将购物车数据提交到后台
		$.ajax({
			url: "add-cart",
			method: "post",
			processData: false,  //数据不需要处理
			contentType: false,	 //类型按照表单类型提交
			data: map,
			success: function(data){
				console.log("返回的数据为: " +  data);
			}
		});
	}
	//设置总计金额
	function setSubTotal(){
		
		var $cart = $("#PPminicartk");
		
		//确定当前是否存在商品
		var itemNameList  =   $cart.find("a.minicartk-name");
		
		
		//当前不存在商品了。显示购物车为空
		if(itemNameList.length == 0){
			
			console.log("一个商品都没有@@");
			
			var $form = $cart.children("form");
			//删除ul 标签
			$form.children("ul").remove();	
			
			//删除 minicartk-footer 数据
			$form.children(".minicartk-footer").empty();
			
			//添加购物车为空信息
			$form.children(".minicartk-footer").append("<p class='minicartk-empty-text'>你的购物车为空</p>");
			
			return;
		}
		
		//拿到当前所有商品的价钱
		var allItemPrice = $cart.find("span.minicartk-price");
		
		var subTotal =  0;
		for(var i = 0; i < allItemPrice.length; ++i){
			subTotal += 1 * $(allItemPrice[i]).text();
		}
	
		$("#total-price").text("" +  Number(subTotal).toFixed(2));
		
		$cart.css("display","block");
	} 
	function itemChanged(input){
		
		$(this).attr("value",$(input).val());
		
		var $item = $(input).parents("li.minicartk-item");
	 
		
		var parsentPrice = $item.children("input[name^=parsentPrice]").val();
		var originalPrice = $item.children("input[name^=originalPrice]").val();
		var total = Number(parsentPrice * $(input).val()).toFixed(2);	//总价
		
		$item.children("div.minicartk-details-price").children("span")
			.text(total);

		//改变表单内的数量
		$item.children("input[name^=amount]").val($(input).val());
		
		//改变表单内商品的总价
		$item.children("input[name^=total]").val(total);
		
		//改变优惠的价钱
		$item.children("div.minicartk-details-name").find("span")
		.text(Number((originalPrice -  parsentPrice) * $(input).val()).toFixed(2));

		
		setSubTotal();		//重新计算出总计金额
		
		
		//拿到所有的 input
		var inputList =  $item.children("input");
		addCart(inputList);
	}

	
	//打开购物车
	function toMycart(username){
		$("#PPminicartk").css("display", "block");
	}
	
$(function() {

	var $cart = $("#PPminicartk");

	$(".minicartk-closer").click(function() {
		$("#PPminicartk").css("display", "none");
	});
   
	
	//添加到购物车按钮
	$(".cart").submit(function() {

		// 未登录状态下不能加入购物车。
		if (!isLogin()) {

			alert("请登录后再进行操作!");

			return false;
		}
		console.log("开始添加购物车");
		
		var formData = new FormData(this);
		
		//每次提交一个数据的时候，则添加一个商品到到购物车 div 中
		
		//添加到购物车中需要完成的事情为：
		//1. 如果之前没有商品在购物车中 ， 需要删除购物车为空的提示信息 
			//删除class为 minicartk-empty-text 的 p 标签
		
		//2. 如果之前该商品存在在购物车中，那么则只需要添加数量 ， 
			//如果 minicartk-name == formData.get(itemName) 添加数量
		
		//3.如果该商品没有在购物中，那么则需要添加一个新元素
			//如果之前不存在任何商品的话， 那么添加ul标签， 否则追加 li 标签
		
		//首先需要查找 ul 下的 所有   li 标签。 获取 li 标签内 minicartk-name.text 属性
		// 拿去和 formData.get(itemName) 进行比较
		// 不存在则添加 li， 存在 则将该 li 下的
			// minicartk-attributes 、 minicartk-details-quantity、 minicartk-details-price、 input.amount 进行更新
		
		//拿到所有的itemList 列表
		var itemNameList  =   $cart.find("a.minicartk-name");
		
		var amount = 1;	//商品当前在购物车内的数量
		var total = amount * formData.get("parsentPrice") ;
		var itemName = formData.get("itemName");
		var isExist =  false;	//当前商品是否存在
		
		//当前新加入购物车的商品是否是已经存在的商品， 如果是的话， 那么则直接添加数量即可
		for(var i = 0; i <  itemNameList.length; ++i){
			
			//表示该商品已经存在了
			if(itemName == $(itemNameList[i]).text()){
				
				//拿到父元素的兄弟元素， 并数量进行自增
				var $input = $($(itemNameList[i]).parent("div.minicartk-details-name").next().children("input"));
				
				$input.val( 1 * $input.val() + 1);
				
				console.log("当前商品已经存在了");	
				
				$input.change();
				isExist =  true;
				break;
			}
			  
		}
		
		//当前商品不存在
		if(!isExist)
		{
			//表示当前购物车为空
			if(itemNameList.length  == 0){
				
				console.log("当前购物车为空的");
				
				//删除元素 minicartk-empty-text
				$cart.find("p.minicartk-empty-text").remove();
				
				//添加 ul 标签
				
				$($cart.find("button.minicartk-closer")).after("<ul></ul>");
				
				//添加结算按钮功能
				
				var footer = "<div class='minicartk-subtotal'>总计:  ￥ <span id='total-price'></span></div> " 
								+"	<button class='minicartk-submit' type='submit' "
								+"		data-minicartk-alt='undefined'>"
								+"		进行结算 <img"
								+"			src='//cdnjs.cloudflare.com/ajax/libs/minicart/3.0.1/paypal_65x18.png'"
								+"			width='65' height='18' alt='paypalm'>"
								+"	</button>";
							
				$cart.find("div.minicartk-footer").append(footer);

			}
			//购物车不为空
			else{
				
				//如果当前的商品数量 大于5，则body 添加类为 minicart-showing
				if(itemNameList.length > 5){
					$("body").addClass("minicartk-showing");
				}
				
				console.log("添加成功");
			}
		
			///当前添加的商品
			var item = 	
				"<li class='minicartk-item minicartk-item-changed'>"
			+	"	<div class='minicartk-details-name'>"
			+	"		<a class='minicartk-name' "
			+	"			href=''>" + itemName + "</a>"
			+	"		<ul class='minicartk-attributes'>"
			+	"			<li>优惠: <span class='discount-amount'> " + (formData.get("originalPrice") - Number(formData.get("parsentPrice")) * amount).toFixed(2)   + "</span> <input type='hidden'"
			+	"				name='discount_amount_1' value='"+ amount +"'>"
			+	"			</li>"
			+	"		</ul>"
			+	"	</div>"
			+	"	<div class='minicartk-details-quantity'>"
			+	"		<input class='minicartk-quantity' data-minicartk-idx='0'"
			+	"			name='quantity_1' type='text' pattern='[0-9]*' value='"+ amount +"'"
			+	"			autocomplete='off' >"  
			+	"	</div>"
			+	"	<div class='minicartk-details-remove'>"
			+	"		<button type='button' class='minicartk-remove'"
			+	"			data-minicartk-idx='0'>×</button>"
			+	"	</div>"
			+	"	<div class='minicartk-details-price'>"
			+	"		<span class='minicartk-price'>"+ Number(total).toFixed(2)  + "</span>"
			+	"	</div> " 
			+	"	<input type='hidden' name='itemId' value='" + formData.get("itemId")  +"'>"
			+	"	<input type='hidden' name='amount' value='" + amount +"'> " 
			+   "   <input type='hidden' name='parsentPrice' value='" + formData.get("parsentPrice") +"'>"
			+   "	<input type='hidden' name='originalPrice' value='" + formData.get("originalPrice") +"'>"
			+   "	<input type='hidden' name='username' value='" + getUsername() +"'>"
			+	"	<input type='hidden' name='total' value='" + Number(total).toFixed(2) +"'>"
			+	"</li>";
			//添加商品到购物车内
			$cart.children("form").children("ul").append(item);
			

			setSubTotal();		//重新计算出总计金额
			
			//每次添加的都是在最后， 拿到最后的  li 元素并选择出所有的input 进行传递给后台
			var list = $cart.children("form").children("ul").children("li");
			var newItem =  list[list.length - 1];		//拿到最新添加的元素
			
			console.log(newItem);
			
			var inputList = $(newItem).children("input");
			
			addCart(inputList);
		}
		  
			
		//商品数量 input 的输入完成事件 - 需要更改
		$(".minicartk-quantity").change(function(){
			itemChanged(this);
		});  

	});
	
	//删除当前购物车商品
	$(".minicartk-remove").click(function(){
		
		//拿到该商品的父级元素
		var $item = $(this).parent().parent();
		
		var itemId =  $item.children("input[name^=itemId]").val();
		var username = $item.children("input[name^=username]").val();
		
		//从数据库中删除该商品
		$.ajax({
			url: "del-cart",
			method: "post",
			data: {
				username: username,
				itemId: itemId
			},
			success: function(data){
				
				console.log("删除状态: " + data);
				
				if(data == "SUCCESS"){
					//从前端购物车列表中删除该元素
					$item.remove();
					//更新商品总和
					setSubTotal();
				}else{
					//删除失败重新加载
					alert("删除失败!");
					
				}
			}
		});
		
		
	
		
	});
	
});