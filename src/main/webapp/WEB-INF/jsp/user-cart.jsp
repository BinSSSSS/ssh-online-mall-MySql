<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
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
	<table style="margin-left: 30px;">
		<tbody>
			<tr>
			<%-- 	<td><s:property value="user" /></td>
 --%>
				<td><s:property value="user.password" /></td>

			</tr>
		</tbody>
		 
		<s:if test="user.username == ''"> 
			
				对象属性为空
			</s:if>
		<s:else>
				对象属性不为空
			</s:else>
			
			<s:property value="user.username"/>

		<s:iterator value="user.cartList">
			<td><s:property value="itemId" /></td>
			<td><s:property value="userId" /></td>
		</s:iterator>
	</table>
	
	${user.username}
</body>
</html>