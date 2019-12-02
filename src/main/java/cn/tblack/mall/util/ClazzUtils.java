package cn.tblack.mall.util;

import java.beans.BeanInfo;
import java.beans.Introspector;
import java.beans.PropertyDescriptor;
import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.Map;


public class ClazzUtils {

	/**
	 * <span>通过反射机制来将字段名与字段值关联。该方法是通过获取类中的get方法进行反射， 而不是直接访问私有的属性。</span>
	 * @param fields 类中的字段名
	 * @param src    获取数据的对象
	 * @return 返回一个 由 字段名和字段值组成的 hashMap
	 * @throws Exception
	 */
	public static Map<String, Object> getFieldMap(String[] fields, Object src) throws Exception {

		Map<String, Object> map = new HashMap<>();

		BeanInfo bi = Introspector.getBeanInfo(src.getClass());

		Map<String, Method> methodMap = new HashMap<>();

		for (PropertyDescriptor desc : bi.getPropertyDescriptors()) {
			
			Method method = desc.getReadMethod();
			if (method != null)
				methodMap.put(method.getName(), method);
		}
		for (String str : fields) {

			String methodName = "get" + Character.toUpperCase(str.charAt(0)) + str.substring(1);

			map.put(str, methodMap.get(methodName).invoke(src));
		}

		return map;
	}
}
