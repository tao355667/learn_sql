/*
 第13章 分组数据
 关键词：分组数据，GROUP BY，HAVING
 */

-- 计算供应商ID为1003的产品数量
SELECT COUNT(*) AS num_prods
FROM products
WHERE vend_id = 1003;

-- 按供应商ID分组，统计每个供应商的产品数量
SELECT vend_id, COUNT(*) AS num_prods
FROM products
GROUP BY vend_id;

-- 按客户ID分组，统计下订单次数大于等于2次的客户数量
SELECT cust_id, COUNT(*) AS orders
FROM orders
GROUP BY cust_id
HAVING COUNT(*) >= 2;

-- 统计产品价格大于等于10的供应商中，产品数量大于等于2的供应商及产品数量
SELECT vend_id, COUNT(*) AS num_prods
FROM products
WHERE prod_price >= 10
GROUP BY vend_id
HAVING COUNT(*) >= 2;

-- 统计产品数量大于等于2的供应商数量
SELECT vend_id, COUNT(*) AS num_prods
FROM products
GROUP BY vend_id
HAVING COUNT(*) >= 2;

-- 计算每个订单的总金额，并筛选总金额大于等于50的订单
SELECT order_num, SUM(quantity * item_price) AS ordertotal
FROM orderitems
GROUP BY order_num
HAVING SUM(quantity * item_price) >= 50;

-- 按订单总金额降序排列，显示总金额大于等于50的订单
SELECT order_num, SUM(quantity * item_price) AS ordertotal
FROM orderitems
GROUP BY order_num
HAVING SUM(quantity * item_price) >= 50
ORDER BY ordertotal;


/* SELECT子句的顺序
SELECT：要返回的列或表达式
FROM：要用的表
WHERE：对行进行条件过滤
GROUP BY：分组依据
HAVING：对分组进行条件过滤
ORDER BY：排序规则
LIMIT：限制显示的行数
*/

