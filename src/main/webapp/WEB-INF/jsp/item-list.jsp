<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>在线商城</title>
<style type="text/css">
table, td {
	border: 1px solid #cfd;
}
</style>
</head>
<body>
	<h1>商品列表</h1>
	<table style="margin-left:30px;">
		<s:iterator value="itemList">
			<tbody>
				<tr>
					<td><s:property value="itemName" /></td>

					<td><s:property value="itemType" /></td>

					<td><s:property value="originalPrice" /></td>

					<td><s:property value="parsentPrice" /></td>

					<td><s:property value="publishTime" /></td>
				</tr>
			</tbody>
		</s:iterator>
	</table>

</body>
</html>