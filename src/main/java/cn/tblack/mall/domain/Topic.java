package cn.tblack.mall.domain;

import java.util.List;

public class Topic {

	private String topicName;
	private List<Item> items;
	
	public Topic() {
		super();
	}

	public Topic(String topicName, List<Item> items) {
		super();
		this.topicName = topicName;
		this.items = items;
	}

	public String getTopicName() {
		return topicName;
	}

	public void setTopicName(String topicName) {
		this.topicName = topicName;
	}

	public List<Item> getItems() {
		return items;
	}

	public void setItems(List<Item> items) {
		this.items = items;
	}

	@Override
	public String toString() {
		return "Topic [topicName=" + topicName + ", items=" + items + "]";
	}
	
	
}
