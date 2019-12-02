package cn.tblack.mall.domain;

import java.io.Serializable;
import java.math.BigDecimal;
import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * <span>商品类。</span>
 */
@Entity
@Table(name = "item")
public class Item implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "item_id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer itemId; // 商品id

	@Column(name = "item_name")
	private String itemName; // 商品名称

	@Column(name = "item_type")
	private String itemType; // 商品类别

	@Column(name = "original_price")
	private BigDecimal originalPrice; // 原价

	@Column(name = "parsent_price")
	private BigDecimal parsentPrice; // 现价
	private Float discount; // 折扣百分比

	@Column(name = "publish_time")
	private Timestamp publishTime; // 商品发布时间

	@Column(name = "image_path")
	private String imagePath; // 商品图片路径

	
	
	public Item() {
		super();
	}

	public Integer getItemId() {
		return itemId;
	}

	public void setItemId(Integer itemId) {
		this.itemId = itemId;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public String getItemType() {
		return itemType;
	}

	public void setItemType(String itemType) {
		this.itemType = itemType;
	}

	public BigDecimal getOriginalPrice() {
		return originalPrice;
	}

	public void setOriginalPrice(BigDecimal originalPrice) {
		this.originalPrice = originalPrice;
	}

	public BigDecimal getParsentPrice() {
		return parsentPrice;
	}

	public void setParsentPrice(BigDecimal parsentPrice) {
		this.parsentPrice = parsentPrice;
	}

	public Float getDiscount() {
		return discount;
	}

	public void setDiscount(Float discount) {
		this.discount = discount;
	}

	public Timestamp getPublishTime() {
		return publishTime;
	}

	public void setPublishTime(Timestamp publishTime) {
		this.publishTime = publishTime;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public String getImagePath() {
		return imagePath;
	}

	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}

	@Override
	public String toString() {
		return "Item [itemId=" + itemId + ", itemName=" + itemName + ", itemType=" + itemType + ", originalPrice="
				+ originalPrice + ", parsentPrice=" + parsentPrice + ", discount=" + discount + ", publishTime="
				+ publishTime + ", imagePath=" + imagePath + "]";
	}

}
