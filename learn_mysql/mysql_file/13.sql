/*
 第13章 分组数据
 关键词：分组数据，GROUP BY，HAVING
 */

SELECT COUNT(*) AS num_prods
FROM products
WHERE vend_id = 1003;


SELECT vend_id, COUNT(*) AS num_prods
FROM products
GROUP BY vend_id;

SELECT cust_id, COUNT(*) AS orders
FROM orders
GROUP BY cust_id
HAVING COUNT(*) >= 2;

SELECT vend_id, COUNT(*) AS num_prods
FROM products
WHERE prod_price >= 10
GROUP BY vend_id
HAVING COUNT(*) >= 2;

SELECT vend_id, COUNT(*) AS num_prods
FROM products
GROUP BY vend_id
HAVING COUNT(*) >= 2;

SELECT order_num, SUM(quantity * item_price) AS ordertotal
FROM orderitems
GROUP BY order_num
HAVING SUM(quantity * item_price) >= 50;

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

