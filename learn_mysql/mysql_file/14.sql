/*
 第14章 使用子查询
 关键词：子查询的嵌套，IN操作符
 */

-- 查找订购了产品TNT2的订单号
SELECT order_num
FROM orderitems
WHERE prod_id = 'TNT2';

-- 查找订单号为20005或20007的客户ID
SELECT cust_id
FROM orders
WHERE order_num IN (20005, 20007);

-- 查找订购了产品TNT2的客户ID
SELECT cust_id
FROM orders
WHERE order_num IN (SELECT order_num
                    FROM orderitems
                    WHERE prod_id = 'TNT2');

-- 查找客户ID为10001或10004的客户名称和联系信息
SELECT cust_name, cust_contact
FROM customers
WHERE cust_id IN (10001, 10004);

-- 查找订购了产品TNT2的客户的名称和联系信息
SELECT cust_name, cust_contact
FROM customers
WHERE cust_id IN (SELECT cust_id
                  FROM orders
                  WHERE order_num IN (SELECT order_num
                                      FROM orderitems
                                      WHERE prod_id = 'TNT2'));

-- 统计客户10001的订单数量
SELECT COUNT(*) AS orders
FROM orders
WHERE cust_id = 10001;

-- 为每个客户显示客户名称、客户州份和订单数量
SELECT cust_name,
       cust_state,
       (SELECT COUNT(*)
        FROM orders
        WHERE orders.cust_id = customers.cust_id) AS orders
FROM customers
ORDER BY cust_name;

-- 问题：不完全限定列名，导致歧义
-- 尝试为每个客户显示客户名称、客户州和订单数量（存在歧义的查询）
SELECT cust_name,
       cust_state,
       (SELECT COUNT(*)
        FROM orders
        WHERE cust_id = cust_id) AS orders
FROM customers
ORDER BY cust_name;
